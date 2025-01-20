uint64_t sub_1000A2E14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  v5[15] = a4;
  v5[16] = a5;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  v6 = type metadata accessor for URL(0LL);
  v5[17] = v6;
  v7 = *(void *)(v6 - 8);
  v5[18] = v7;
  v5[19] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v8 = sub_100029E18(&qword_10013EF08);
  v5[20] = v8;
  v9 = *(void *)(v8 - 8);
  v5[21] = v9;
  v5[22] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  v5[23] = v10;
  v11 = *(void *)(v10 - 8);
  v5[24] = v11;
  v5[25] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v12 = type metadata accessor for JetPackAssetSession.Configuration(0LL);
  v5[26] = swift_task_alloc((*(void *)(*(void *)(v12 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = type metadata accessor for ValidatedJetPackLoadingCoordinator(0LL);
  v5[27] = v13;
  v14 = *(void *)(v13 - 8);
  v5[28] = v14;
  v5[29] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000A2F18, 0LL, 0LL);
}

uint64_t sub_1000A2F18()
{
  uint64_t v1 = type metadata accessor for JetPackAssetDiskCache(0LL);
  uint64_t v2 = JetPackAssetDiskCache.__allocating_init()();
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);
  v11[3] = v1;
  v11[4] = &protocol witness table for JetPackAssetDiskCache;
  v11[0] = v2;
  JetPackAssetSession.Configuration.init(cache:)(v11);
  uint64_t v6 = type metadata accessor for JetPackAssetSession(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = JetPackAssetSession.init(configuration:)(v3);
  sub_1000388F0(v0 + 16, v0 + 56);
  swift_unknownObjectRetain(v5);
  ValidatedJetPackLoadingCoordinator.init(session:assetLocation:bag:)(v7, v0 + 56, v5);
  uint64_t v8 = swift_task_alloc(32LL);
  *(void *)(v0 + 240) = v8;
  *(void *)(v8 + 16) = v4;
  v9 = (void *)swift_task_alloc(async function pointer to ValidatedJetPackLoadingCoordinator.getJetPackAsset<A>(unpackAsset:)[1]);
  *(void *)(v0 + 248) = v9;
  void *v9 = v0;
  v9[1] = sub_1000A30B8;
  return ValidatedJetPackLoadingCoordinator.getJetPackAsset<A>(unpackAsset:)( *(void *)(v0 + 176),  &unk_10013EF18,  v8,  *(void *)(v0 + 184),  &protocol witness table for DiskJetPackResourceBundle);
}

uint64_t sub_1000A30B8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 248);
  *(void *)(*v1 + 256) = v0;
  swift_task_dealloc(v3);
  swift_task_dealloc(*(void *)(v2 + 240));
  if (v0) {
    uint64_t v4 = sub_1000A330C;
  }
  else {
    uint64_t v4 = sub_1000A3124;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000A3124()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[20];
  ValidatedJetPackLoadingCoordinator.ValidatedJetPackResult.bundle.getter(v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = v0[5];
  sub_100029EE0(v0 + 2, v4);
  uint64_t v5 = (void *)swift_task_alloc(dword_10013EF24);
  v0[33] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000A31BC;
  return sub_1000A3664(v0[19], v4);
}

uint64_t sub_1000A31BC()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 264LL);
  *(void *)(*(void *)v1 + 272LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000A33A4;
  }
  else {
    uint64_t v3 = sub_1000A3220;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000A3220()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v11 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 184);
  uint64_t v12 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v6 = *(void *)(v0 + 152);
  uint64_t v7 = *(void *)(v0 + 136);
  uint64_t v8 = *(void *)(v0 + 96);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 224) + 8LL))(v1, *(void *)(v0 + 216));
  uint64_t v9 = v8 + *(int *)(sub_100029E18(&qword_10013EDC0) + 48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v8, v6, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v9, v3, v4);
  sub_100029F4C((void *)(v0 + 16));
  swift_task_dealloc(v1);
  swift_task_dealloc(v11);
  swift_task_dealloc(v3);
  swift_task_dealloc(v12);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000A330C()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 152);
  sub_100029F4C((void *)(v0 + 16));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000A33A4()
{
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 216);
  (*(void (**)(void, void))(*(void *)(v0 + 192) + 8LL))(*(void *)(v0 + 200), *(void *)(v0 + 184));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void *)(v0 + 232);
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 176);
  uint64_t v8 = *(void *)(v0 + 152);
  sub_100029F4C((void *)(v0 + 16));
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000A3454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  uint64_t v4 = type metadata accessor for URL(0LL);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  v3[12] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000A34B8, 0LL, 0LL);
}

uint64_t sub_1000A34B8()
{
  id v1 = [(id)objc_opt_self(NSFileManager) defaultManager];
  id v2 = [v1 temporaryDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v0[13] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_1000A3584;
  return DiskJetPackLoader.bundle(from:baseURL:automaticallyCleanUp:)(v0[7], v0 + 2, v0[12], 1LL);
}

uint64_t sub_1000A3584()
{
  uint64_t v3 = *(void *)(*v1 + 96);
  uint64_t v2 = *(void *)(*v1 + 104);
  uint64_t v4 = *(void *)(*v1 + 80);
  uint64_t v5 = *(void *)(*v1 + 88);
  uint64_t v6 = *v1;
  *(void *)(v6 + 112) = v0;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  sub_100029F4C((void *)(v6 + 16));
  if (v0) {
    return swift_task_switch(sub_1000A3630, 0LL, 0LL);
  }
  swift_task_dealloc(*(void *)(v6 + 96));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_1000A3630()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000A3664(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v5 = sub_100029E18(&qword_10013EF28);
  v3[5] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for ValidatedJetPackAssetLocations.BagKeyLocation(0LL);
  v3[6] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[7] = v7;
  v3[8] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100029E18(&qword_10013EF30);
  v3[9] = swift_task_alloc((*(void *)(*(void *)(v8 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)(a2 - 8);
  v3[10] = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[11] = swift_task_alloc(v10);
  v3[12] = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for ValidatedJetPackAssetLocations.URLLocation(0LL);
  v3[13] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[14] = v12;
  v3[15] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000A3768, 0LL, 0LL);
}

uint64_t sub_1000A3768()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[9];
  uint64_t v5 = v0[3];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[10] + 16LL);
  v6(v3, v0[4], v5);
  int v7 = swift_dynamicCast(v4, v3, v5, v1, 6LL);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
  if (v7)
  {
    uint64_t v9 = v0[13];
    uint64_t v10 = v0[14];
    uint64_t v11 = v0[9];
    v8(v11, 0LL, 1LL, v9);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1LL, v9) != 1)
    {
      uint64_t v12 = v0[14];
      uint64_t v13 = (*(uint64_t (**)(void, void, void))(v12 + 32))(v0[15], v0[9], v0[13]);
      ValidatedJetPackAssetLocations.URLLocation.url.getter(v13);
      uint64_t v14 = v0[15];
      uint64_t v15 = v0[12];
      uint64_t v16 = v0[11];
      uint64_t v18 = v0[8];
      uint64_t v17 = v0[9];
      uint64_t v19 = v0[5];
      (*(void (**)(uint64_t, void))(v12 + 8))(v14, v0[13]);
      swift_task_dealloc(v14);
      swift_task_dealloc(v15);
      swift_task_dealloc(v16);
      swift_task_dealloc(v17);
      swift_task_dealloc(v18);
      swift_task_dealloc(v19);
      v20 = (uint64_t (*)(void))v0[1];
      return v20();
    }
  }

  else
  {
    v8(v0[9], 1LL, 1LL, v0[13]);
  }

  uint64_t v21 = v0[11];
  uint64_t v22 = v0[6];
  uint64_t v23 = v0[7];
  uint64_t v25 = v0[4];
  uint64_t v24 = v0[5];
  uint64_t v26 = v0[3];
  sub_10002E92C(v0[9], &qword_10013EF30);
  v6(v21, v25, v26);
  int v27 = swift_dynamicCast(v24, v21, v26, v22, 6LL);
  v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56);
  if (v27)
  {
    uint64_t v29 = v0[6];
    uint64_t v30 = v0[7];
    uint64_t v31 = v0[5];
    v28(v31, 0LL, 1LL, v29);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v31, 1LL, v29) != 1)
    {
      (*(void (**)(void, void, void))(v0[7] + 32LL))(v0[8], v0[5], v0[6]);
      v32 = (void *)swift_task_alloc(async function pointer to ValidatedJetPackAssetLocations.BagKeyLocation.url()[1]);
      v0[16] = v32;
      void *v32 = v0;
      v32[1] = sub_1000A3A1C;
      return ValidatedJetPackAssetLocations.BagKeyLocation.url()(v0[2]);
    }
  }

  else
  {
    v28(v0[5], 1LL, 1LL, v0[6]);
  }

  sub_10002E92C(v0[5], &qword_10013EF28);
  unint64_t v34 = sub_1000A49A4();
  uint64_t v35 = swift_allocError(&type metadata for ValidatedJetPackAssetLocationError, v34, 0LL, 0LL);
  swift_willThrow(v35);
  uint64_t v37 = v0[11];
  uint64_t v36 = v0[12];
  uint64_t v39 = v0[8];
  uint64_t v38 = v0[9];
  uint64_t v40 = v0[5];
  swift_task_dealloc(v0[15]);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_1000A3A1C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 128LL);
  *(void *)(*(void *)v1 + 136LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000A3B0C;
  }
  else {
    uint64_t v3 = sub_1000A3A80;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000A3A80()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 40);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 56) + 8LL))(v1, *(void *)(v0 + 48));
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v1);
  swift_task_dealloc(v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000A3B0C()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 40);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000A3B94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100029E18(&qword_10013EF80);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v19 - v7;
  uint64_t v9 = v1 + OBJC_IVAR____TtC19appstorecomponentsd16JSJetPackFetcher____lazy_storage___indexPipeline;
  swift_beginAccess( v1 + OBJC_IVAR____TtC19appstorecomponentsd16JSJetPackFetcher____lazy_storage___indexPipeline,  v20,  0LL,  0LL);
  sub_1000A4DD8(v9, (uint64_t)v8);
  uint64_t v10 = sub_100029E18((uint64_t *)&unk_10013EDD0);
  uint64_t v11 = *(void *)(v10 - 8);
  sub_10002E92C((uint64_t)v8, &qword_10013EF80);
  uint64_t v12 = sub_100029E18((uint64_t *)&unk_10013DF10);
  uint64_t v13 = type metadata accessor for JSPackageIndex(0LL);
  uint64_t v14 = sub_100044410( &qword_10013EF88,  (uint64_t *)&unk_10013DF10,  (uint64_t)&protocol conformance descriptor for AnyPipelineTask<A>);
  uint64_t v15 = PipelineTask.mapTaskOutput<A>(_:)(sub_1000A4178, 0LL, v12, v13, v14);
  v19[0] = v15;
  uint64_t v16 = sub_100029E18(&qword_10013EF90);
  uint64_t v17 = sub_100044410( &qword_10013EF98,  &qword_10013EF90,  (uint64_t)&protocol conformance descriptor for MapPipelineTask<A, B>);
  PipelineTask.eraseToAnyPipelineTask()(v16, v17);
  swift_release(v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v6, a1, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0LL, 1LL, v10);
  swift_beginAccess(v9, v19, 33LL, 0LL);
  sub_1000A4E20((uint64_t)v6, v9);
  return swift_endAccess(v19);
}

void sub_1000A3DB4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v33 = a1;
  uint64_t v34 = a2;
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSONContext(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for JSONObject(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for JetPackPath(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  JetPackPath.init(_:)(0x2E7865646E692F2ELL, 0xEA0000000000736ALL);
  uint64_t v16 = v38;
  uint64_t v17 = DiskJetPackResourceBundle.fileData(atPath:)(v15);
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return;
  }

  uint64_t v32 = v2;
  uint64_t v38 = v17;
  unint64_t v19 = v18;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  if (v19 >> 60 == 15)
  {
    uint64_t v20 = type metadata accessor for JSError(0LL);
    uint64_t v21 = sub_100027978( (unint64_t *)&qword_10013EFA0,  (uint64_t (*)(uint64_t))&type metadata accessor for JSError,  (uint64_t)&protocol conformance descriptor for JSError);
    swift_allocError(v20, v21, 0LL, 0LL);
    uint64_t v22 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000023LL,  0x80000001000FF400LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL);
    swift_willThrow(v22);
    return;
  }

  uint64_t v23 = v38;
  sub_1000A4E68(v38, v19);
  uint64_t v24 = JSONObject.init(deserializing:)(v23, v19);
  JSONContext.init()(v24);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v33, v32);
  JSPackageIndex.init(deserializing:using:from:)(v11, v8, v5);
  if (!os_variant_has_internal_content("com.apple.appstorecomponentsd"))
  {
    sub_1000A4EAC(v38, v19);
    return;
  }

  id v25 = [(id)objc_opt_self(ASCDefaults) daemonDefaults];
  uint64_t v26 = JSPackageIndex.properties.getter();
  if (*(void *)(v26 + 16) && (unint64_t v27 = sub_10008D45C(0x6E6F6973726576LL, 0xE700000000000000LL), (v28 & 1) != 0))
  {
    sub_100060108(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&v36);
  }

  else
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
  }

  swift_bridgeObjectRelease(v26);
  if (!*((void *)&v37 + 1))
  {
    sub_10002E92C((uint64_t)&v36, &qword_10013C6F0);
    goto LABEL_15;
  }

  if ((swift_dynamicCast(v35, &v36, (char *)&type metadata for Any + 8, &type metadata for String, 6LL) & 1) == 0)
  {
LABEL_15:
    NSString v30 = 0LL;
    goto LABEL_16;
  }

  uint64_t v29 = v35[1];
  NSString v30 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v29);
LABEL_16:
  [v25 setJsVersion:v30];
  sub_1000A4EAC(v38, v19);
}

void sub_1000A4178(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_1000A41C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for JetPackPath(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100029E18(&qword_10013EE90);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  static JetPackPath.sourcePath.getter(v12);
  DiskJetPackResourceBundle.memoryMappedSource(atPath:virtualMachine:cacheURL:)(v7, a3, v10);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_10002E92C((uint64_t)v10, &qword_10013EE90);
}

uint64_t sub_1000A42E8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC19appstorecomponentsd16JSJetPackFetcher_bundlePipeline;
  uint64_t v2 = sub_100029E18((uint64_t *)&unk_10013DF10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  sub_10002E92C( v0 + OBJC_IVAR____TtC19appstorecomponentsd16JSJetPackFetcher____lazy_storage___indexPipeline,  &qword_10013EF80);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1000A4354()
{
  return type metadata accessor for JSJetPackFetcher(0LL);
}

uint64_t type metadata accessor for JSJetPackFetcher(uint64_t a1)
{
  return sub_100060F6C(a1, (uint64_t *)&unk_10013EDA8, (uint64_t)&nominal type descriptor for JSJetPackFetcher);
}

void sub_1000A4370(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    sub_1000A4428( 319LL,  &qword_10013EDC8,  (uint64_t *)&unk_10013EDD0,  (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      swift_updateClassMetadata2(a1, 256LL, 2LL, v6, a1 + 80);
    }
  }

void sub_1000A4428( uint64_t a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = sub_100029F6C(a3);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }

uint64_t type metadata accessor for JSJetPackFetcher.ScriptOrigin(uint64_t a1)
{
  return sub_100060F6C( a1,  (uint64_t *)&unk_10013F020,  (uint64_t)&nominal type descriptor for JSJetPackFetcher.ScriptOrigin);
}

uint64_t sub_1000A4494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A44DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A4520(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(type metadata accessor for DiskJetPackLoader(0LL) - 8) + 80LL);
  return sub_1000A2BE0( a1,  v1 + v4,  *(void *)(v1 + v5),  *(void **)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  v1 + ((v6 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8) & ~v6));
}

uint64_t sub_1000A45B8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000A45F8()
{
  uint64_t v1 = *(void *)(type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL) - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v15 = *(void *)(v1 + 64);
  uint64_t v4 = type metadata accessor for DiskJetPackLoader(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = *(void *)(v5 + 64);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = v2 | v6 | 7;
  unint64_t v11 = (v15 + v3 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v13 = (v6 + v12 + 8) & ~v6;
  swift_unknownObjectRelease(*(void *)(v0 + v11));

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v13, v4);
  return swift_deallocObject(v0, v13 + v7, v10);
}

uint64_t sub_1000A4708(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  unint64_t v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(type metadata accessor for DiskJetPackLoader(0LL) - 8) + 80LL);
  uint64_t v9 = v8 + v7 + 8;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = v1 + v5;
  uint64_t v12 = *(void *)(v1 + v7);
  uint64_t v13 = v1 + (v9 & ~v8);
  uint64_t v14 = (void *)swift_task_alloc(dword_10013EEEC);
  *(void *)(v2 + 16) = v14;
  *uint64_t v14 = v2;
  v14[1] = sub_100039088;
  return sub_1000A2E14(a1, v11, v10, v12, v13);
}

Swift::Int sub_1000A47D4()
{
  return Hasher._finalize()();
}

void sub_1000A4814()
{
}

Swift::Int sub_1000A4838()
{
  return Hasher._finalize()();
}

uint64_t sub_1000A4874()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000A48A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10013F324);
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10002A858;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F320
                                                                                     + dword_10013F320))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000A493C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_10013EF14);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002A858;
  return sub_1000A3454(a1, a2, v6);
}

unint64_t sub_1000A49A4()
{
  unint64_t result = qword_10013EF38;
  if (!qword_10013EF38)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0290, &type metadata for ValidatedJetPackAssetLocationError);
    atomic_store(result, (unint64_t *)&qword_10013EF38);
  }

  return result;
}

uint64_t sub_1000A49E8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_1000A4A0C(uint64_t a1, uint64_t a2)
{
  return sub_1000A2134(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000A4A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for JSJetPackFetcher.ScriptOrigin(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013F038);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_1000A4494(a1, (uint64_t)v14);
  sub_1000A4494(a2, v15);
  uint64_t v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  int v17 = v16(v14, 2LL, v4);
  if (!v17)
  {
    sub_1000A4494((uint64_t)v14, (uint64_t)v10);
    if (!v16((char *)v15, 2LL, v4))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v15, v4);
      char v18 = static URL.== infix(_:_:)(v10, v7);
      unint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
      v19(v7, v4);
      v19(v10, v4);
      sub_1000A45B8((uint64_t)v14);
      return v18 & 1;
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    goto LABEL_9;
  }

  if (v17 == 1)
  {
  }

  else if (v16((char *)v15, 2LL, v4) != 2)
  {
LABEL_9:
    sub_10002E92C((uint64_t)v14, &qword_10013F038);
    char v18 = 0;
    return v18 & 1;
  }

  sub_1000A45B8((uint64_t)v14);
  char v18 = 1;
  return v18 & 1;
}

uint64_t sub_1000A4C10(char a1)
{
  uint64_t v2 = sub_100029E18(&qword_10013EF58);
  uint64_t inited = swift_initStackObject(v2, v19);
  uint64_t v4 = inited;
  *(_OWORD *)(inited + 16) = xmmword_1000EDA10;
  *(void *)(inited + 32) = 0xD000000000000012LL;
  *(void *)(inited + 40) = 0x80000001000FF3C0LL;
  if ((a1 & 1) != 0) {
    uint64_t v5 = 0x6C616E7265746E69LL;
  }
  else {
    uint64_t v5 = 0LL;
  }
  unint64_t v6 = 0xE800000000000000LL;
  if ((a1 & 1) == 0) {
    unint64_t v6 = 0LL;
  }
  *(void *)(inited + 48) = v5;
  *(void *)(inited + 56) = v6;
  uint64_t v7 = sub_10005141C(0LL, 1LL, 1, (char *)_swiftEmptyArrayStorage);
  unint64_t v9 = *((void *)v7 + 2);
  unint64_t v8 = *((void *)v7 + 3);
  unint64_t v10 = v9 + 1;
  if (v9 >= v8 >> 1) {
    uint64_t v7 = sub_10005141C((char *)(v8 > 1), v9 + 1, 1, v7);
  }
  *((void *)v7 + 2) = v10;
  uint64_t v11 = &v7[16 * v9];
  *((void *)v11 + 4) = 0xD000000000000012LL;
  *((void *)v11 + 5) = 0x80000001000FF3C0LL;
  if ((a1 & 1) != 0)
  {
    unint64_t v12 = *((void *)v7 + 3);
    swift_bridgeObjectRetain(0xE800000000000000LL);
    if (v10 >= v12 >> 1) {
      uint64_t v7 = sub_10005141C((char *)(v12 > 1), v9 + 2, 1, v7);
    }
    *((void *)v7 + 2) = v9 + 2;
    uint64_t v13 = &v7[16 * v10];
    *((void *)v13 + 4) = 0x6C616E7265746E69LL;
    *((void *)v13 + 5) = 0xE800000000000000LL;
  }

  swift_release(v4);
  uint64_t v14 = sub_100029E18((uint64_t *)&unk_10013EF60);
  uint64_t v15 = sub_100044410( (unint64_t *)&qword_10013CF88,  (uint64_t *)&unk_10013EF60,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v16 = BidirectionalCollection<>.joined(separator:)(45LL, 0xE100000000000000LL, v14, v15);
  swift_bridgeObjectRelease(v7);
  v17._countAndFlagsBits = 0x6B63617074656A2ELL;
  v17._object = (void *)0xE800000000000000LL;
  String.append(_:)(v17);
  return v16;
}

uint64_t sub_1000A4DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013EF80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A4E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013EF80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000A4E68(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000A4EAC(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100082CE0(result, a2);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ValidatedJetPackAssetLocationError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ValidatedJetPackAssetLocationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000A4F54 + 4 * byte_1000F01A0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000A4F74 + 4 * byte_1000F01A5[v4]))();
  }
}

_BYTE *sub_1000A4F54(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000A4F74(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000A4F7C(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000A4F84(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000A4F8C(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000A4F94(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ValidatedJetPackAssetLocationError()
{
  return &type metadata for ValidatedJetPackAssetLocationError;
}

uint64_t *sub_1000A4FB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain(v9);
  }

  else
  {
    uint64_t v7 = type metadata accessor for URL(0LL);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2LL, v7))
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0LL, 2LL, v7);
    }
  }

  return a1;
}

uint64_t sub_1000A5078(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 2LL, v2);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  return result;
}

void *sub_1000A50E0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 2LL, v6);
  }

  return a1;
}

void *sub_1000A5184(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2LL, v6);
  int v10 = v8(a2, 2LL, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }

  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 2LL, v6);
  return a1;
}

void *sub_1000A5274(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 2LL, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 2LL, v6);
  }

  return a1;
}

void *sub_1000A5318(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 2LL, v6);
  int v10 = v8(a2, 2LL, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }

  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0LL, 2LL, v6);
  return a1;
}

uint64_t sub_1000A5408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000A5414);
}

uint64_t sub_1000A5414(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
  if (v5 >= 3) {
    return v5 - 2;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000A5460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000A546C);
}

uint64_t sub_1000A546C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56LL))(a1, v5, a3, v6);
}

uint64_t sub_1000A54C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48LL))(a1, 2LL, v2);
}

uint64_t sub_1000A54F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, 2LL, v4);
}

uint64_t sub_1000A5538(uint64_t a1)
{
  uint64_t result = type metadata accessor for URL(319LL);
  if (v3 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload(a1, 256LL, *(void *)(result - 8) + 64LL, 2LL);
    return 0LL;
  }

  return result;
}

unint64_t sub_1000A5590()
{
  unint64_t result = qword_10013F030;
  if (!qword_10013F030)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0268, &type metadata for ValidatedJetPackAssetLocationError);
    atomic_store(result, (unint64_t *)&qword_10013F030);
  }

  return result;
}

uint64_t sub_1000A55E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v62 = a8;
  uint64_t v63 = a5;
  uint64_t v59 = a6;
  uint64_t v60 = a7;
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v54 = a1;
  uint64_t v55 = a2;
  uint64_t v64 = a10;
  uint64_t v61 = a9;
  uint64_t v10 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for JSRequest(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  Swift::String v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v54 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v54 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v54 - v25;
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v29 = (char *)&v54 - v28;
  uint64_t v30 = __chkstk_darwin(v27);
  uint64_t v32 = (char *)&v54 - v31;
  uint64_t v33 = __chkstk_darwin(v30);
  uint64_t v35 = (char *)&v54 - v34;
  __chkstk_darwin(v33);
  v58 = (char *)&v54 - v36;
  JSRoute.init(service:function:)(0x7370756B636F6CLL, 0xE700000000000000LL, 0xD000000000000015LL, 0x80000001000FF450LL);
  JSRequest.init(route:timeoutInterval:version:)(v12, 0LL, 1LL, 0LL);
  uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v54);
  v67 = &type metadata for String;
  uint64_t v65 = v37;
  uint64_t v66 = v38;
  JSRequest.addingOption(_:withName:)(&v65, 25705LL, 0xE200000000000000LL);
  uint64_t v39 = *(void (**)(char *, uint64_t))(v14 + 8);
  v39(v17, v13);
  sub_10004C810((uint64_t)&v65);
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
  v67 = &type metadata for String;
  uint64_t v65 = v40;
  uint64_t v66 = v41;
  JSRequest.addingOption(_:withName:)(&v65, 1684957547LL, 0xE400000000000000LL);
  v39(v20, v13);
  sub_10004C810((uint64_t)&v65);
  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
  v67 = &type metadata for String;
  uint64_t v65 = v42;
  uint64_t v66 = v43;
  JSRequest.addingOption(_:withName:)(&v65, 0x747865746E6F63LL, 0xE700000000000000LL);
  v39(v23, v13);
  sub_10004C810((uint64_t)&v65);
  v67 = &type metadata for Int;
  uint64_t v65 = v57;
  JSRequest.addingOption(_:withName:)(&v65, 0x74696D696CLL, 0xE500000000000000LL);
  v39(v26, v13);
  sub_10004C810((uint64_t)&v65);
  v67 = &type metadata for String;
  uint64_t v65 = v59;
  uint64_t v66 = v60;
  swift_bridgeObjectRetain(v60);
  JSRequest.addingOption(_:withName:)(&v65, 0xD000000000000010LL, 0x80000001000FF470LL);
  v39(v29, v13);
  sub_10004C810((uint64_t)&v65);
  v67 = &type metadata for String;
  uint64_t v65 = v62;
  uint64_t v66 = v61;
  swift_bridgeObjectRetain(v61);
  JSRequest.addingOption(_:withName:)(&v65, 0x6556746E65696C63LL, 0xED00006E6F697372LL);
  v39(v32, v13);
  sub_10004C810((uint64_t)&v65);
  v67 = (void *)sub_100029E18(&qword_10013F040);
  uint64_t v65 = v63;
  swift_bridgeObjectRetain(v63);
  uint64_t v44 = (uint64_t)v58;
  JSRequest.addingOption(_:withName:)(&v65, 0xD000000000000012LL, 0x80000001000FF490LL);
  sub_10004C810((uint64_t)&v65);
  v39(v35, v13);
  id v45 = sub_1000A62E8(v44, (uint64_t)&unk_100123C78, &qword_10013F050, (uint64_t)sub_1000A7730);
  uint64_t v46 = type metadata accessor for SyncTaskScheduler(0LL);
  v67 = (void *)v46;
  v68 = &protocol witness table for SyncTaskScheduler;
  v47 = sub_10002C328(&v65);
  SyncTaskScheduler.init()(v47);
  uint64_t v48 = type metadata accessor for ASCLockupContainer();
  uint64_t v49 = Promise.map<A>(on:_:)(&v65, sub_1000A7684, 0LL, v48);
  swift_release(v45);
  sub_100029F4C(&v65);
  v67 = (void *)v46;
  v68 = &protocol witness table for SyncTaskScheduler;
  v50 = sub_10002C328(&v65);
  SyncTaskScheduler.init()(v50);
  uint64_t v51 = sub_100029E18((uint64_t *)&unk_1001403D0);
  uint64_t v52 = Promise.map<A>(on:_:)(&v65, sub_1000A5AC0, 0LL, v51);
  swift_release(v49);
  sub_100029F4C(&v65);
  v39((char *)v44, v13);
  return v52;
}

uint64_t sub_1000A5AC0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16LL);
  *a2 = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_1000A5AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v46 = a5;
  uint64_t v47 = a6;
  uint64_t v44 = a3;
  uint64_t v45 = a4;
  uint64_t v43 = a2;
  uint64_t v7 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v7);
  int v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for JSRequest(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v12);
  Swift::String v17 = (char *)&v42 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v42 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v42 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v42 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v42 - v27;
  JSRoute.init(service:function:)(0x7370756B636F6CLL, 0xE700000000000000LL, 0x656E4F646C697562LL, 0xE800000000000000LL);
  JSRequest.init(route:timeoutInterval:version:)(v9, 0LL, 1LL, 0LL);
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  *((void *)&v49 + 1) = &type metadata for String;
  *(void *)&__int128 v48 = v29;
  *((void *)&v48 + 1) = v30;
  JSRequest.addingOption(_:withName:)(&v48, 1684957547LL, 0xE400000000000000LL);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v11 + 8);
  v31(v14, v10);
  sub_10004C810((uint64_t)&v48);
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
  *((void *)&v49 + 1) = &type metadata for String;
  *(void *)&__int128 v48 = v32;
  *((void *)&v48 + 1) = v33;
  JSRequest.addingOption(_:withName:)(&v48, 0x747865746E6F63LL, 0xE700000000000000LL);
  v31(v17, v10);
  sub_10004C810((uint64_t)&v48);
  if (v44)
  {
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
    *((void *)&v49 + 1) = &type metadata for String;
    *(void *)&__int128 v48 = v34;
    *((void *)&v48 + 1) = v35;
  }

  else
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
  }

  JSRequest.addingOption(_:withName:)(&v48, 0xD000000000000010LL, 0x80000001000FF4B0LL);
  v31(v20, v10);
  sub_10004C810((uint64_t)&v48);
  uint64_t v36 = v45;
  if (v45)
  {
    *((void *)&v49 + 1) = sub_100029E18((uint64_t *)&unk_10013C6E0);
    *(void *)&__int128 v48 = v36;
  }

  else
  {
    __int128 v48 = 0u;
    __int128 v49 = 0u;
  }

  swift_bridgeObjectRetain(v36);
  JSRequest.addingOption(_:withName:)(&v48, 0x65736E6F70736572LL, 0xE800000000000000LL);
  v31(v23, v10);
  sub_10004C810((uint64_t)&v48);
  *((void *)&v49 + 1) = sub_100029E18(&qword_10013F040);
  *(void *)&__int128 v48 = v46;
  swift_bridgeObjectRetain(v46);
  JSRequest.addingOption(_:withName:)(&v48, 0xD000000000000012LL, 0x80000001000FF490LL);
  sub_10004C810((uint64_t)&v48);
  v31(v26, v10);
  id v37 = sub_1000A62E8((uint64_t)v28, (uint64_t)&unk_100123CA0, &qword_10013D0A8, (uint64_t)sub_1000A77C0);
  *((void *)&v49 + 1) = type metadata accessor for SyncTaskScheduler(0LL);
  v50 = &protocol witness table for SyncTaskScheduler;
  uint64_t v38 = sub_10002C328(&v48);
  SyncTaskScheduler.init()(v38);
  uint64_t v39 = sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
  uint64_t v40 = Promise.map<A>(on:_:)(&v48, sub_1000A7790, 0LL, v39);
  swift_release(v37);
  sub_100029F4C(&v48);
  v31(v28, v10);
  return v40;
}

uint64_t sub_1000A5EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v48 = a3;
  uint64_t v49 = a4;
  uint64_t v47 = a2;
  uint64_t v7 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v7);
  int v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for JSRequest(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __chkstk_darwin(v12);
  Swift::String v17 = (char *)&v46 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v46 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v46 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)&v46 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v46 - v27;
  JSRoute.init(service:function:)(0x7370756B636F6CLL, 0xE700000000000000LL, 0x6E614D646C697562LL, 0xE900000000000079LL);
  JSRequest.init(route:timeoutInterval:version:)(v9, 0LL, 1LL, 0LL);
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  *((void *)&v53 + 1) = &type metadata for String;
  *(void *)&__int128 v52 = v29;
  *((void *)&v52 + 1) = v30;
  JSRequest.addingOption(_:withName:)(&v52, 1684957547LL, 0xE400000000000000LL);
  uint64_t v31 = *(void (**)(char *, uint64_t))(v11 + 8);
  v31(v14, v10);
  sub_10004C810((uint64_t)&v52);
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
  *((void *)&v53 + 1) = &type metadata for String;
  *(void *)&__int128 v52 = v32;
  *((void *)&v52 + 1) = v33;
  JSRequest.addingOption(_:withName:)(&v52, 0x747865746E6F63LL, 0xE700000000000000LL);
  v31(v17, v10);
  sub_10004C810((uint64_t)&v52);
  if (v48)
  {
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v48);
    *((void *)&v53 + 1) = &type metadata for String;
    *(void *)&__int128 v52 = v34;
    *((void *)&v52 + 1) = v35;
  }

  else
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
  }

  JSRequest.addingOption(_:withName:)(&v52, 0xD000000000000010LL, 0x80000001000FF4B0LL);
  v31(v20, v10);
  sub_10004C810((uint64_t)&v52);
  uint64_t v36 = v49;
  if (v49)
  {
    *((void *)&v53 + 1) = sub_100029E18((uint64_t *)&unk_10013C6E0);
    *(void *)&__int128 v52 = v36;
  }

  else
  {
    __int128 v52 = 0u;
    __int128 v53 = 0u;
  }

  swift_bridgeObjectRetain(v36);
  JSRequest.addingOption(_:withName:)(&v52, 0x65736E6F70736572LL, 0xE800000000000000LL);
  v31(v23, v10);
  sub_10004C810((uint64_t)&v52);
  *((void *)&v53 + 1) = sub_100029E18(&qword_10013F040);
  *(void *)&__int128 v52 = v50;
  swift_bridgeObjectRetain(v50);
  JSRequest.addingOption(_:withName:)(&v52, 0xD000000000000012LL, 0x80000001000FF490LL);
  sub_10004C810((uint64_t)&v52);
  v31(v26, v10);
  id v37 = sub_1000A62E8((uint64_t)v28, (uint64_t)&unk_100123C78, &qword_10013F050, (uint64_t)sub_1000A7730);
  uint64_t v38 = type metadata accessor for SyncTaskScheduler(0LL);
  *((void *)&v53 + 1) = v38;
  uint64_t v54 = &protocol witness table for SyncTaskScheduler;
  uint64_t v39 = sub_10002C328(&v52);
  SyncTaskScheduler.init()(v39);
  uint64_t v40 = type metadata accessor for ASCLockupContainer();
  uint64_t v41 = Promise.map<A>(on:_:)(&v52, sub_1000A7684, 0LL, v40);
  swift_release(v37);
  sub_100029F4C(&v52);
  *((void *)&v53 + 1) = v38;
  uint64_t v54 = &protocol witness table for SyncTaskScheduler;
  uint64_t v42 = sub_10002C328(&v52);
  SyncTaskScheduler.init()(v42);
  uint64_t v43 = sub_100029E18((uint64_t *)&unk_1001403D0);
  uint64_t v44 = Promise.map<A>(on:_:)(&v52, sub_1000A5AC0, 0LL, v43);
  swift_release(v41);
  sub_100029F4C(&v52);
  v31(v28, v10);
  return v44;
}

id sub_1000A62E8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v48 = a2;
  uint64_t v5 = sub_100029E18((uint64_t *)&unk_10013C3A0);
  uint64_t v43 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  __chkstk_darwin(v5);
  uint64_t v42 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = type metadata accessor for JSONContext(0LL);
  uint64_t v7 = *(void *)(v50 - 8);
  uint64_t v8 = __chkstk_darwin(v50);
  uint64_t v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = v9;
  __chkstk_darwin(v8);
  uint64_t v49 = (char *)&v42 - v11;
  uint64_t v46 = a1;
  uint64_t v12 = sub_1000B0F50();
  uint64_t v13 = v12;
  uint64_t v14 = v12 + 56;
  uint64_t v15 = 1LL << v12[32];
  uint64_t v16 = -1LL;
  if (v15 < 64) {
    uint64_t v16 = ~(-1LL << v15);
  }
  unint64_t v17 = v16 & *((void *)v12 + 7);
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain(v12);
  int64_t v20 = 0LL;
  while (1)
  {
    if (v17)
    {
      unint64_t v21 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      unint64_t v22 = v21 | (v20 << 6);
      goto LABEL_5;
    }

    int64_t v23 = v20 + 1;
    if (__OFADD__(v20, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v23 >= v18) {
      goto LABEL_23;
    }
    unint64_t v24 = *(void *)&v14[8 * v23];
    ++v20;
    if (!v24)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v18) {
        goto LABEL_23;
      }
      unint64_t v24 = *(void *)&v14[8 * v20];
      if (!v24)
      {
        int64_t v20 = v23 + 2;
        if (v23 + 2 >= v18) {
          goto LABEL_23;
        }
        unint64_t v24 = *(void *)&v14[8 * v20];
        if (!v24)
        {
          int64_t v20 = v23 + 3;
          if (v23 + 3 >= v18) {
            goto LABEL_23;
          }
          unint64_t v24 = *(void *)&v14[8 * v20];
          if (!v24) {
            break;
          }
        }
      }
    }

id sub_1000A6678(uint64_t a1)
{
  uint64_t v2 = sub_100029E18((uint64_t *)&unk_10013C3A0);
  uint64_t v41 = *(void *)(v2 - 8);
  uint64_t v42 = v2;
  __chkstk_darwin(v2);
  uint64_t v40 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v47 = type metadata accessor for JSONContext(0LL);
  uint64_t v4 = *(void *)(v47 - 8);
  uint64_t v5 = __chkstk_darwin(v47);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = v6;
  __chkstk_darwin(v5);
  uint64_t v46 = (char *)&v39 - v8;
  uint64_t v44 = a1;
  uint64_t v9 = sub_1000B0F50();
  uint64_t v10 = v9;
  uint64_t v11 = v9 + 56;
  uint64_t v12 = 1LL << v9[32];
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *((void *)v9 + 7);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain(v9);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v19 = v18 | (v17 << 6);
      goto LABEL_5;
    }

    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v20 >= v15) {
      goto LABEL_23;
    }
    unint64_t v21 = *(void *)&v11[8 * v20];
    ++v17;
    if (!v21)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v15) {
        goto LABEL_23;
      }
      unint64_t v21 = *(void *)&v11[8 * v17];
      if (!v21)
      {
        int64_t v17 = v20 + 2;
        if (v20 + 2 >= v15) {
          goto LABEL_23;
        }
        unint64_t v21 = *(void *)&v11[8 * v17];
        if (!v21)
        {
          int64_t v17 = v20 + 3;
          if (v20 + 3 >= v15) {
            goto LABEL_23;
          }
          unint64_t v21 = *(void *)&v11[8 * v17];
          if (!v21) {
            break;
          }
        }
      }
    }

id sub_1000A6A0C(uint64_t a1)
{
  return sub_1000A62E8(a1, (uint64_t)&unk_100123CC8, &qword_10013C478, (uint64_t)sub_1000A77F0);
}

id sub_1000A6A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v46 = a1;
  uint64_t v47 = a3;
  uint64_t v4 = type metadata accessor for JSONContext(0LL);
  uint64_t v51 = *(void *)(v4 - 8);
  uint64_t v52 = v4;
  __chkstk_darwin(v4);
  uint64_t v49 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v54 = type metadata accessor for JSONObject(0LL);
  uint64_t v53 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v48 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100029E18(&qword_10013F058);
  uint64_t v44 = *(void *)(v7 - 8);
  uint64_t v45 = v7;
  __chkstk_darwin(v7);
  uint64_t v43 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a2 + 56;
  uint64_t v10 = 1LL << *(_BYTE *)(a2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(a2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain(a2);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v12)
    {
      unint64_t v16 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v17 = v16 | (v15 << 6);
      goto LABEL_5;
    }

    int64_t v20 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }

    if (v20 >= v13) {
      goto LABEL_21;
    }
    unint64_t v21 = *(void *)(v9 + 8 * v20);
    ++v15;
    if (!v21)
    {
      int64_t v15 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_21;
      }
      unint64_t v21 = *(void *)(v9 + 8 * v15);
      if (!v21)
      {
        int64_t v15 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_21;
        }
        unint64_t v21 = *(void *)(v9 + 8 * v15);
        if (!v21) {
          break;
        }
      }
    }

id sub_1000A6E58( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, void *a5, uint64_t (*a6)(char *, char *))
{
  uint64_t v55 = a6;
  uint64_t v50 = a4;
  uint64_t v51 = a5;
  uint64_t v47 = a1;
  uint64_t v48 = a3;
  uint64_t v56 = type metadata accessor for JSONContext(0LL);
  uint64_t v54 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v52 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v58 = type metadata accessor for JSONObject(0LL);
  uint64_t v57 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v49 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100029E18(&qword_10013F058);
  uint64_t v45 = *(void *)(v9 - 8);
  uint64_t v46 = v9;
  __chkstk_darwin(v9);
  uint64_t v44 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a2 + 56;
  uint64_t v12 = 1LL << *(_BYTE *)(a2 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(a2 + 56);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain(a2);
  int64_t v17 = 0LL;
  while (1)
  {
    if (v14)
    {
      unint64_t v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v19 = v18 | (v17 << 6);
      goto LABEL_5;
    }

    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1LL))
    {
      __break(1u);
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }

    if (v22 >= v15) {
      goto LABEL_21;
    }
    unint64_t v23 = *(void *)(v11 + 8 * v22);
    ++v17;
    if (!v23)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v15) {
        goto LABEL_21;
      }
      unint64_t v23 = *(void *)(v11 + 8 * v17);
      if (!v23)
      {
        int64_t v17 = v22 + 2;
        if (v22 + 2 >= v15) {
          goto LABEL_21;
        }
        unint64_t v23 = *(void *)(v11 + 8 * v17);
        if (!v23) {
          break;
        }
      }
    }

id sub_1000A72A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v48 = a3;
  uint64_t v49 = a4;
  uint64_t v44 = a1;
  uint64_t v47 = type metadata accessor for JSONContext(0LL);
  uint64_t v45 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  uint64_t v46 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSONObject(0LL);
  __chkstk_darwin(v6);
  int64_t v43 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100029E18(&qword_10013F058);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  __chkstk_darwin(v8);
  unint64_t v40 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a2 + 56;
  uint64_t v11 = 1LL << *(_BYTE *)(a2 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(a2 + 56);
  int64_t v14 = (unint64_t)(v11 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain(a2);
  int64_t v16 = 0LL;
  while (1)
  {
    if (v13)
    {
      unint64_t v17 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v18 = v17 | (v16 << 6);
      goto LABEL_5;
    }

    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }

    if (v21 >= v14) {
      goto LABEL_21;
    }
    unint64_t v22 = *(void *)(v10 + 8 * v21);
    ++v16;
    if (!v22)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v14) {
        goto LABEL_21;
      }
      unint64_t v22 = *(void *)(v10 + 8 * v16);
      if (!v22)
      {
        int64_t v16 = v21 + 2;
        if (v21 + 2 >= v14) {
          goto LABEL_21;
        }
        unint64_t v22 = *(void *)(v10 + 8 * v16);
        if (!v22) {
          break;
        }
      }
    }

LABEL_46:
      __break(1u);
      goto LABEL_47;
    }

    int64_t v16 = v23;
    goto LABEL_20;
  }

uint64_t sub_1000A7684@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = v2;
  return swift_retain(v2);
}

unint64_t sub_1000A76A0()
{
  unint64_t result = qword_10013F048;
  if (!qword_10013F048)
  {
    uint64_t v1 = type metadata accessor for JSInitFailureObserver(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1000F0168, v1);
    atomic_store(result, (unint64_t *)&qword_10013F048);
  }

  return result;
}

uint64_t sub_1000A76E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSDiagnostics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

id sub_1000A7730@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSONContext(0LL) - 8) + 80LL);
  id result = sub_1000A6A28(a1, *(void *)(v2 + 16), v2 + ((v6 + 24) & ~v6));
  if (!v3) {
    *a2 = result;
  }
  return result;
}

id sub_1000A7790@<X0>(void **a1@<X0>, void **a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = *a1;
  return v2;
}

id sub_1000A77C0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1000A781C(a1, &qword_10013F6D0, off_10011E4C8, (uint64_t (*)(char *, char *))sub_100053EEC, a2);
}

id sub_1000A77F0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1000A781C( a1,  (unint64_t *)&qword_10013C4F8,  off_10011E4A0,  (uint64_t (*)(char *, char *))sub_10004EB64,  a2);
}

id sub_1000A781C@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, void *a3@<X2>, uint64_t (*a4)(char *, char *)@<X3>, void *a5@<X8>)
{
  uint64_t v12 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSONContext(0LL) - 8) + 80LL);
  id result = sub_1000A6E58(a1, *(void *)(v5 + 16), v5 + ((v12 + 24) & ~v12), a2, a3, a4);
  if (!v6) {
    *a5 = result;
  }
  return result;
}

ValueMetadata *type metadata accessor for JSLockupService()
{
  return &type metadata for JSLockupService;
}

uint64_t sub_1000A78B0()
{
  uint64_t v1 = type metadata accessor for JSONContext(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_bridgeObjectRelease(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

id sub_1000A7924@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSONContext(0LL) - 8) + 80LL);
  return sub_1000A72A0(a1, *(void *)(v2 + 16), v2 + ((v5 + 24) & ~v5), a2);
}

void *sub_1000A7BD8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
    sub_1000901C4(0LL, v1, 0);
    uint64_t v2 = _swiftEmptyArrayStorage;
    uint64_t v4 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v6 = *v4++;
      uint64_t v5 = v6;
      unint64_t v13 = v2;
      unint64_t v8 = v2[2];
      unint64_t v7 = v2[3];
      if (v8 >= v7 >> 1)
      {
        sub_1000901C4((void *)(v7 > 1), v8 + 1, 1);
        uint64_t v2 = v13;
      }

      uint64_t v11 = &type metadata for Int;
      uint64_t v12 = &protocol witness table for Int;
      *(void *)&__int128 v10 = v5;
      v2[2] = v8 + 1;
      sub_10002C438(&v10, (uint64_t)&v2[5 * v8 + 4]);
      --v1;
    }

    while (v1);
  }

  return v2;
}

uint64_t sub_1000A7E6C(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  id v4 = objc_allocWithZone(&OBJC_CLASS___NSNumberFormatter);
  id v5 = a1;
  id v6 = [v4 init];
  [v6 setNumberStyle:1];
  [v6 setFormatterBehavior:1040];
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  [v6 setLocale:isa];

  [v6 setMinimumFractionDigits:a2];
  id v8 = [v6 stringFromNumber:v5];
  if (!v8)
  {

    return 0LL;
  }

  uint64_t v9 = v8;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);

  return v10;
}

void sub_1000A80B8(void *a1)
{
  if (a1)
  {
    id v1 = [a1 longLongValue];
    Class isa = Locale._bridgeToObjectiveC()().super.isa;
    id v3 = (id)JECountFormatterMakeStringFromNumber(0LL, v1, isa);

    if (v3)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
LABEL_8:

      return;
    }

    id v4 = [objc_allocWithZone(NSNumber) initWithLongLong:v1];
    if (v4)
    {
      id v5 = v4;
      id v6 = objc_allocWithZone(&OBJC_CLASS___NSNumberFormatter);
      id v7 = v5;
      id v3 = [v6 init];
      [v3 setNumberStyle:1];
      [v3 setFormatterBehavior:1040];
      Class v8 = Locale._bridgeToObjectiveC()().super.isa;
      [v3 setLocale:v8];

      [v3 setMinimumFractionDigits:0];
      id v9 = [v3 stringFromNumber:v7];
      if (v9)
      {
        uint64_t v10 = v9;
        static String._unconditionallyBridgeFromObjectiveC(_:)(v9);

        goto LABEL_8;
      }
    }

    __break(1u);
  }

void sub_1000A82D4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100029E18(&qword_10013F0E8);
  __chkstk_darwin(v4);
  id v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v43 - v11;
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v43 - v18;
  sub_1000AA850(a1, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13) == 1)
  {
    sub_10002E92C((uint64_t)v12, (uint64_t *)&unk_10013F9B0);
    return;
  }

  uint64_t v20 = (*(uint64_t (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
  Date.init()(v20);
  double v21 = Date.timeIntervalSince(_:)(v19);
  double v22 = floor(v21 / 31536000.0);
  if ((~*(void *)&v22 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_26;
  }

  if (v22 <= -9.22337204e18)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  if (v22 >= 9.22337204e18)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  uint64_t v23 = (uint64_t)v22;
  if ((uint64_t)v22 >= 1)
  {
    sub_100029EE0( (void *)(v2 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v2 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
    v24._object = (void *)0x80000001000FF700LL;
    v24._uint64_t countAndFlagsBits = 0xD000000000000012LL;
    Swift::String v25 = Localizer.string(forKey:)(v24);
    uint64_t countAndFlagsBits = v25._countAndFlagsBits;
    object = v25._object;
    uint64_t v28 = v2 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
    uint64_t v29 = type metadata accessor for Locale(0LL);
    uint64_t v30 = v29;
    uint64_t v44 = v17;
    goto LABEL_8;
  }

  double v35 = floor(v21 / 86400.0);
  if ((~*(void *)&v35 & 0x7FF0000000000000LL) == 0) {
    goto LABEL_28;
  }
  if (v35 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (v35 >= 9.22337204e18)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }

  if ((uint64_t)v35 >= 7)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v10, v19, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0LL, 1LL, v13);
    uint64_t v36 = 0x64204D4D4DLL;
    uint64_t v37 = 0xE500000000000000LL;
    goto LABEL_17;
  }

  if ((uint64_t)v35 >= 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v10, v19, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v10, 0LL, 1LL, v13);
    uint64_t v36 = 69LL;
    uint64_t v37 = 0xE100000000000000LL;
LABEL_17:
    sub_1000A8808(v36, v37, (uint64_t)v10);
    sub_10002E92C((uint64_t)v10, (uint64_t *)&unk_10013F9B0);
    unint64_t v38 = v17;
    int64_t v34 = *(void (**)(char *, uint64_t))(v14 + 8);
    v34(v38, v13);
    goto LABEL_18;
  }

  double v39 = floor(v21 / 3600.0);
  if ((~*(void *)&v39 & 0x7FF0000000000000LL) == 0) {
    goto LABEL_31;
  }
  if (v39 <= -9.22337204e18)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }

  if (v39 < 9.22337204e18)
  {
    uint64_t v44 = v17;
    uint64_t v23 = (uint64_t)v39;
    sub_100029EE0( (void *)(v2 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v2 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
    if (v23 < 1)
    {
      v42._uint64_t countAndFlagsBits = 0xD000000000000011LL;
      v42._object = (void *)0x80000001000FF660LL;
      Localizer.string(forKey:)(v42);
      goto LABEL_9;
    }

    v40._object = (void *)0x80000001000FF680LL;
    v40._uint64_t countAndFlagsBits = 0xD000000000000012LL;
    Swift::String v41 = Localizer.string(forKey:)(v40);
    uint64_t countAndFlagsBits = v41._countAndFlagsBits;
    object = v41._object;
    uint64_t v28 = v2 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
    uint64_t v29 = type metadata accessor for Locale(0LL);
    uint64_t v30 = v29;
LABEL_8:
    uint64_t v31 = *(void *)(v29 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v6, v28, v30);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v6, 0LL, 1LL, v30);
    uint64_t v32 = sub_100029E18(&qword_10013E600);
    uint64_t v33 = swift_allocObject(v32, 72LL, 7LL);
    *(_OWORD *)(v33 + 16) = xmmword_1000EDBE0;
    *(void *)(v33 + 56) = &type metadata for Int;
    *(void *)(v33 + 64) = &protocol witness table for Int;
    *(void *)(v33 + 32) = v23;
    String.init(format:locale:arguments:)(countAndFlagsBits, object, v6, v33);
    swift_bridgeObjectRelease(object);
    swift_bridgeObjectRelease(v33);
    sub_10002E92C((uint64_t)v6, &qword_10013F0E8);
LABEL_9:
    int64_t v34 = *(void (**)(char *, uint64_t))(v14 + 8);
    v34(v44, v13);
LABEL_18:
    v34(v19, v13);
    return;
  }

uint64_t sub_1000A8808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v23[1] = a2;
  uint64_t v4 = type metadata accessor for Calendar(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Date(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000AA850(a3, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11) == 1)
  {
    sub_10002E92C((uint64_t)v10, (uint64_t *)&unk_10013F9B0);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    id v16 = [objc_allocWithZone(NSDateFormatter) init];
    Locale.calendar.getter([v16 setFormattingContext:4]);
    Class isa = Calendar._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    [v16 setCalendar:isa];

    Class v18 = Locale._bridgeToObjectiveC()().super.isa;
    [v16 setLocale:v18];

    NSString v19 = String._bridgeToObjectiveC()();
    [v16 setLocalizedDateFormatFromTemplate:v19];

    Class v20 = Date._bridgeToObjectiveC()().super.isa;
    id v21 = [v16 stringFromDate:v20];

    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }

  return v15;
}

uint64_t sub_1000A8BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v30[1] = a4;
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  uint64_t v6 = type metadata accessor for Calendar(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000AA850(a5, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13) == 1)
  {
    sub_10002E92C((uint64_t)v12, (uint64_t *)&unk_10013F9B0);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    id v18 = [objc_allocWithZone(NSDateFormatter) init];
    Locale.calendar.getter([v18 setFormattingContext:1]);
    Class isa = Calendar._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    [v18 setCalendar:isa];

    Class v20 = Locale._bridgeToObjectiveC()().super.isa;
    [v18 setLocale:v20];

    NSString v21 = String._bridgeToObjectiveC()();
    [v18 setLocalizedDateFormatFromTemplate:v21];

    uint64_t v22 = sub_100029E18(&qword_10013E600);
    uint64_t v23 = swift_allocObject(v22, 72LL, 7LL);
    *(_OWORD *)(v23 + 16) = xmmword_1000EDBE0;
    Class v24 = Date._bridgeToObjectiveC()().super.isa;
    id v25 = [v18 stringFromDate:v24];

    uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
    uint64_t v28 = v27;

    *(void *)(v23 + 56) = &type metadata for String;
    *(void *)(v23 + 64) = sub_1000AA898();
    *(void *)(v23 + 32) = v26;
    *(void *)(v23 + 40) = v28;
    uint64_t v17 = String.init(format:_:)(v31, v32, v23);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }

  return v17;
}

uint64_t sub_1000A8EA4(uint64_t a1)
{
  uint64_t v2 = sub_100029E18(&qword_10013F0E8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for Calendar(0LL);
  uint64_t v82 = *(void *)(v5 - 8);
  uint64_t v83 = v5;
  __chkstk_darwin(v5);
  v81 = (char *)&v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DateComponents(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  id v18 = (char *)&v75 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v16);
  Class v20 = (char *)&v75 - v19;
  sub_1000AA850(a1, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14) != 1)
  {
    v75 = v4;
    uint64_t v77 = v8;
    uint64_t v78 = v15;
    uint64_t v79 = v7;
    uint64_t v80 = v14;
    uint64_t v22 = (*(uint64_t (**)(char *, char *, uint64_t))(v15 + 32))(v20, v13, v14);
    uint64_t v23 = Date.init()(v22);
    Class v24 = v81;
    uint64_t v76 = v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localeWithCalendarWithBagFixUp;
    Locale.calendar.getter(v23);
    uint64_t v25 = sub_100029E18(&qword_10013F0F0);
    uint64_t v26 = type metadata accessor for Calendar.Component(0LL);
    uint64_t v27 = *(void *)(v26 - 8);
    uint64_t v28 = *(void *)(v27 + 72);
    uint64_t v29 = *(unsigned __int8 *)(v27 + 80);
    uint64_t v30 = v10;
    uint64_t v31 = v18;
    uint64_t v32 = v20;
    uint64_t v33 = (v29 + 32) & ~v29;
    uint64_t v34 = swift_allocObject(v25, v33 + 6 * v28, v29 | 7);
    *(_OWORD *)(v34 + 16) = xmmword_1000EDBF0;
    uint64_t v35 = v34 + v33;
    uint64_t v36 = *(void (**)(uint64_t, void, uint64_t))(v27 + 104);
    v36(v34 + v33, enum case for Calendar.Component.year(_:), v26);
    v36(v34 + v33 + v28, enum case for Calendar.Component.month(_:), v26);
    v36(v34 + v33 + 2 * v28, enum case for Calendar.Component.weekOfYear(_:), v26);
    v36(v34 + v33 + 3 * v28, enum case for Calendar.Component.day(_:), v26);
    v36(v34 + v33 + 4 * v28, enum case for Calendar.Component.hour(_:), v26);
    uint64_t v37 = v32;
    unint64_t v38 = v31;
    double v39 = v30;
    v36(v35 + 5 * v28, enum case for Calendar.Component.second(_:), v26);
    Swift::String v40 = sub_1000CB0D8(v34);
    swift_setDeallocating(v34);
    swift_arrayDestroy(v35, 6LL, v26);
    swift_deallocClassInstance(v34, 32LL, 7LL);
    Calendar.dateComponents(_:from:to:)(v40, v37, v38);
    __n128 v41 = swift_bridgeObjectRelease(v40);
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t, __n128))(v82 + 8))(v24, v83, v41);
    uint64_t v43 = DateComponents.year.getter(v42);
    if ((v44 & 1) == 0)
    {
      uint64_t v45 = v43;
      if (v43 >= 1)
      {
        sub_100029EE0( (void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
        uint64_t v46 = "TIME_AGO_YEARS_AGO";
LABEL_6:
        unint64_t v47 = (unint64_t)(v46 - 32) | 0x8000000000000000LL;
        unint64_t v48 = 0xD000000000000012LL;
LABEL_11:
        Swift::String v52 = Localizer.string(forKey:)(*(Swift::String *)&v48);
        uint64_t v53 = type metadata accessor for Locale(0LL);
        uint64_t v54 = *(void *)(v53 - 8);
        uint64_t v55 = (uint64_t)v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v75, v76, v53);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v55, 0LL, 1LL, v53);
        uint64_t v56 = sub_100029E18(&qword_10013E600);
        uint64_t v57 = swift_allocObject(v56, 72LL, 7LL);
        *(_OWORD *)(v57 + 16) = xmmword_1000EDBE0;
        *(void *)(v57 + 56) = &type metadata for Int;
        *(void *)(v57 + 64) = &protocol witness table for Int;
        *(void *)(v57 + 32) = v45;
        uint64_t countAndFlagsBits = String.init(format:locale:arguments:)(v52._countAndFlagsBits, v52._object, v55, v57);
        swift_bridgeObjectRelease(v52._object);
        swift_bridgeObjectRelease(v57);
        sub_10002E92C(v55, &qword_10013F0E8);
        (*(void (**)(char *, uint64_t))(v77 + 8))(v39, v79);
LABEL_12:
        uint64_t v58 = *(void (**)(char *, uint64_t))(v78 + 8);
        uint64_t v59 = v80;
        v58(v38, v80);
        v58(v37, v59);
        return countAndFlagsBits;
      }
    }

    uint64_t v49 = DateComponents.month.getter(v43);
    if ((v50 & 1) != 0 || (uint64_t v45 = v49, v49 < 1))
    {
      uint64_t v61 = DateComponents.weekOfYear.getter(v49);
      if ((v62 & 1) == 0)
      {
        uint64_t v45 = v61;
        if (v61 >= 1)
        {
          sub_100029EE0( (void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
          uint64_t v46 = "TIME_AGO_WEEKS_AGO";
          goto LABEL_6;
        }
      }

      uint64_t v63 = DateComponents.day.getter(v61);
      if ((v64 & 1) != 0 || (uint64_t v45 = v63, v63 < 1))
      {
        uint64_t v65 = DateComponents.hour.getter(v63);
        if ((v66 & 1) != 0 || (uint64_t v45 = v65, v65 < 1))
        {
          uint64_t v67 = DateComponents.second.getter(v65);
          uint64_t v68 = v77;
          if ((v69 & 1) != 0 || v67 < 1)
          {
            id v71 = [objc_allocWithZone(NSDateFormatter) init];
            [v71 setDoesRelativeDateFormatting:1];
            [v71 setDateStyle:2];
            [v71 setTimeStyle:0];
            Class isa = Locale._bridgeToObjectiveC()().super.isa;
            [v71 setLocale:isa];

            Class v73 = Date._bridgeToObjectiveC()().super.isa;
            id v74 = [v71 stringFromDate:v73];

            uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v74);
          }

          else
          {
            sub_100029EE0( (void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
            v70._uint64_t countAndFlagsBits = 0xD000000000000011LL;
            v70._object = (void *)0x80000001000FF660LL;
            uint64_t countAndFlagsBits = Localizer.string(forKey:)(v70)._countAndFlagsBits;
          }

          (*(void (**)(char *, uint64_t))(v68 + 8))(v30, v79);
          goto LABEL_12;
        }

        sub_100029EE0( (void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
        uint64_t v46 = "TIME_AGO_HOURS_AGO";
        goto LABEL_6;
      }

      sub_100029EE0( (void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
      unint64_t v48 = 0xD000000000000011LL;
      uint64_t v51 = "TIME_AGO_DAYS_AGO";
    }

    else
    {
      sub_100029EE0( (void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer),  *(void *)(v84 + OBJC_IVAR____TtC19appstorecomponentsd17JSLegacyLocObject_localizer + 24));
      unint64_t v48 = 0xD000000000000013LL;
      uint64_t v51 = "TIME_AGO_MONTHS_AGO";
    }

    unint64_t v47 = (unint64_t)(v51 - 32) | 0x8000000000000000LL;
    goto LABEL_11;
  }

  sub_10002E92C((uint64_t)v13, (uint64_t *)&unk_10013F9B0);
  return 0LL;
}

id sub_1000A95FC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v7 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v10 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v9, 0LL, 1LL, v10);
  }

  else
  {
    uint64_t v11 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v9, 1LL, 1LL, v11);
  }

  id v12 = a1;
  a4(v9);
  uint64_t v14 = v13;

  sub_10002E92C((uint64_t)v9, (uint64_t *)&unk_10013F9B0);
  if (!v14) {
    return 0LL;
  }
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  return v15;
}

uint64_t sub_1000A97DC()
{
  return type metadata accessor for JSLegacyLocObject(0LL);
}

uint64_t type metadata accessor for JSLegacyLocObject(uint64_t a1)
{
  uint64_t result = qword_10013F0A8;
  if (!qword_10013F0A8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSLegacyLocObject);
  }
  return result;
}

uint64_t sub_1000A9820(uint64_t a1)
{
  uint64_t v4 = "(";
  uint64_t result = type metadata accessor for Locale(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v5 = *(void *)(result - 8) + 64LL;
    uint64_t v6 = v5;
    uint64_t v7 = v5;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 4LL, &v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

id sub_1000A998C(char *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  sub_100029EE0(&a1[*a4], *(void *)&a1[*a4 + 24]);
  uint64_t v9 = a1;
  v10._uint64_t countAndFlagsBits = v6;
  v10._object = v8;
  object = Localizer.string(forKey:)(v10)._object;

  swift_bridgeObjectRelease(v8);
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v12;
}

uint64_t sub_1000A9F30()
{
  uint64_t v0 = type metadata accessor for JSError(0LL);
  unint64_t v1 = sub_10009BBCC();
  swift_allocError(v0, v1, 0LL, 0LL);
  uint64_t v2 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000018LL,  0x80000001000FF5F0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL);
  return swift_willThrow(v2);
}

uint64_t sub_1000AA324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000AA850(a5, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14) == 1)
  {
    sub_10002E92C((uint64_t)v13, (uint64_t *)&unk_10013F9B0);
    return 0LL;
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    uint64_t v19 = *(void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 24);
    uint64_t v20 = *(void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer + 32);
    sub_100029EE0((void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd17JSModernLocObject_localizer), v19);
    uint64_t v18 = dispatch thunk of Localizer.formattedDate(format:date:inSentence:)(a3, a4, v17, a1, a2, v19, v20);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }

  return v18;
}

id sub_1000AA4A4( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, char *))
{
  uint64_t v11 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v16 = v15;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v19 = v18;
  if (a5)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
    uint64_t v20 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56LL))(v13, 0LL, 1LL, v20);
  }

  else
  {
    uint64_t v21 = type metadata accessor for Date(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v13, 1LL, 1LL, v21);
  }

  id v22 = a1;
  a6(v14, v16, v17, v19, v13);
  uint64_t v24 = v23;

  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
  sub_10002E92C((uint64_t)v13, (uint64_t *)&unk_10013F9B0);
  if (!v24) {
    return 0LL;
  }
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  return v25;
}

uint64_t type metadata accessor for JSModernLocObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd17JSModernLocObject);
}

uint64_t sub_1000AA850(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000AA898()
{
  unint64_t result = qword_10013F0F8;
  if (!qword_10013F0F8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10013F0F8);
  }

  return result;
}

uint64_t sub_1000AA990(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType(v1);
  sub_1000ABE30(a1, (uint64_t)v18);
  if (!v19)
  {
    sub_10004C810((uint64_t)v18);
    goto LABEL_14;
  }

  if ((swift_dynamicCast(&v17, v18, (char *)&type metadata for Any + 8, ObjectType, 6LL) & 1) == 0)
  {
LABEL_14:
    char v15 = 0;
    return v15 & 1;
  }

  uint64_t v4 = v17;
  uint64_t v5 = *(void *)(v1
                 + OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client);
  uint64_t v6 = *(void *)(v1
                 + OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                 + 8);
  uint64_t v7 = *(void *)(v1
                 + OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                 + 16);
  uint64_t v8 = *(void *)(v1
                 + OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                 + 24);
  uint64_t v9 = *(void *)&v17[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client];
  uint64_t v10 = *(void *)&v17[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                      + 8];
  uint64_t v11 = *(void *)&v17[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                      + 16];
  uint64_t v12 = *(void *)&v17[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client
                      + 24];
  BOOL v13 = v5 == v9 && v6 == v10;
  if (!v13 && (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v9, v10, 0LL) & 1) == 0)
  {

    goto LABEL_14;
  }

  if (v7 == v11 && v8 == v12)
  {

    char v15 = 1;
  }

  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, v11, v12, 0LL);
  }

  return v15 & 1;
}

void *sub_1000AAB6C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v34 = a1;
  uint64_t v6 = type metadata accessor for JSPromise(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = (void *)type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v11 = static RunLoopWorkerThread.current.getter();
  if (!v11)
  {
    uint64_t v24 = type metadata accessor for JSError(0LL);
    unint64_t v25 = sub_10009BBCC();
    swift_allocError(v24, v25, 0LL, 0LL);
    uint64_t v26 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000032LL,  0x80000001000FFA70LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL);
    swift_willThrow(v26);
    return v10;
  }

  uint64_t v12 = v11;
  uint64_t v33 = v4;
  uint64_t v14 = JSValue.string.getter();
  if (!v13)
  {
    uint64_t v10 = (void *)type metadata accessor for JSError(0LL);
    unint64_t v27 = sub_10009BBCC();
    swift_allocError(v10, v27, 0LL, 0LL);
    uint64_t v28 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD000000000000020LL,  0x80000001000FFAB0LL,  0LL,  1LL,  0LL,  1LL,  v14,  0LL,  v14,  0LL);
LABEL_9:
    swift_willThrow(v28);
    goto LABEL_10;
  }

  uint64_t v15 = v13;
  uint64_t v16 = JSValue.string.getter();
  if (!v17)
  {
    uint64_t v29 = v16;
    swift_bridgeObjectRelease(v15);
    uint64_t v10 = (void *)type metadata accessor for JSError(0LL);
    unint64_t v30 = sub_10009BBCC();
    swift_allocError(v10, v30, 0LL, 0LL);
    uint64_t v28 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000001DLL,  0x80000001000FFAE0LL,  0LL,  1LL,  0LL,  1LL,  v29,  0LL,  v29,  0LL);
    goto LABEL_9;
  }

  uint64_t v18 = v17;
  uint64_t v32 = v16;
  uint64_t v10 = (void *)swift_allocObject(&unk_100123D80, 64LL, 7LL);
  v10[2] = a4;
  v10[3] = v14;
  uint64_t v19 = v32;
  v10[4] = v15;
  v10[5] = v19;
  v10[6] = v18;
  v10[7] = v12;
  id v20 = v34;
  id v21 = a4;
  swift_retain(v12);
  uint64_t v22 = v33;
  uint64_t v23 = JSPromise.init(in:executor:)(v20, sub_1000ABED0, v10);
  if (v22)
  {
LABEL_10:
    swift_release(v12);
    return v10;
  }

  uint64_t v10 = (void *)JSPromise.value.getter(v23);
  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

uint64_t sub_1000AAE38( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v46 = a2;
  uint64_t v47 = a3;
  unint64_t v48 = a1;
  uint64_t v49 = a9;
  uint64_t v14 = type metadata accessor for JSCallable(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v45 = v16;
  uint64_t v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = (objc_class *)type metadata accessor for JSMediaTokensObject.CacheKey();
  uint64_t v19 = (char *)objc_allocWithZone(v18);
  id v20 = &v19[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client];
  *(void *)id v20 = a5;
  *((void *)v20 + 1) = a6;
  *((void *)v20 + 2) = a7;
  *((void *)v20 + 3) = a8;
  v51.receiver = v19;
  v51.super_class = v18;
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(a8);
  id v21 = objc_msgSendSuper2(&v51, "init");
  uint64_t v22 = *(void **)(a4 + OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_cachedServices);
  id v23 = [v22 objectForKey:v21];
  if (!v23)
  {
    uint64_t v24 = swift_bridgeObjectRetain(a6);
    uint64_t v25 = Bag.amsBag.getter(v24);
    id v26 = objc_allocWithZone(&OBJC_CLASS___AMSMediaTokenService);
    NSString v27 = String._bridgeToObjectiveC()();
    id v23 = objc_msgSend(v26, "initWithClientIdentifier:bag:", v27, v25, swift_bridgeObjectRelease(a6).n128_f64[0]);

    swift_unknownObjectRelease(v25);
    [v22 setObject:v23 forKey:v21];
  }

  sub_100029E18(&qword_10013F178);
  uint64_t v44 = Promise<A>.init(_:)([v23 fetchMediaToken]);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v28(v17, v46, v14);
  uint64_t v29 = *(unsigned __int8 *)(v15 + 80);
  uint64_t v30 = v15;
  uint64_t v31 = (v29 + 16) & ~v29;
  uint64_t v32 = v31 + v45;
  uint64_t v33 = v29 | 7;
  uint64_t v34 = swift_allocObject(&unk_100123DA8, v31 + v45, v29 | 7);
  uint64_t v35 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 32);
  v35(v34 + v31, v17, v14);
  v28(v17, v47, v14);
  unint64_t v36 = (v32 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v37 = swift_allocObject(&unk_100123DD0, v36 + 8, v33);
  v35(v37 + v31, v17, v14);
  unint64_t v38 = v48;
  *(void *)(v37 + v36) = v48;
  v50[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v50[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v39 = v49;
  v50[0] = v49;
  id v40 = v38;
  swift_retain(v39);
  uint64_t v41 = v44;
  Promise.then(perform:orCatchError:on:)(sub_1000ABF5C, v34, sub_1000AC00C, v37, v50);

  swift_release(v41);
  swift_release(v34);
  swift_release(v37);
  return sub_100029F4C(v50);
}

void sub_1000AB128(void **a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  __chkstk_darwin(v3);
  uint64_t v4 = *a1;
  uint64_t v5 = sub_100029E18(&qword_10013E5F0);
  uint64_t v6 = swift_allocObject(v5, 64LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_1000EDBE0;
  id v7 = objc_msgSend(v4, "tokenString", 1, 2);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  uint64_t v10 = v9;

  *(void *)(v6 + 56) = &type metadata for String;
  *(void *)(v6 + 32) = v8;
  *(void *)(v6 + 40) = v10;
  uint64_t v11 = (void *)JSCallable.call(_:)(v6);
  swift_bridgeObjectRelease(v6);
}

void sub_1000AB3F0(uint64_t a1, uint64_t a2, JSContext a3)
{
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  uint64_t v18 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for JSError(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013E5F0);
  uint64_t v12 = swift_allocObject(v11, 64LL, 7LL);
  __int128 v17 = xmmword_1000EDBE0;
  *(_OWORD *)(v12 + 16) = xmmword_1000EDBE0;
  swift_getErrorValue(a1, v20, v19);
  uint64_t v13 = Error.localizedDescription.getter(v19[1], v19[2]);
  JSError.init(message:line:column:sourceURL:constructorName:)(v13, v14, 0LL, 1LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL);
  Class isa = JSError.makeValue(in:)(a3).super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)(v12 + 56) = sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v12 + 32) = isa;
  uint64_t v16 = (void *)JSCallable.call(_:)(v12);
  swift_bridgeObjectRelease(v12);
}

void sub_1000AB7D4(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OSLogger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = JSValue.string.getter(v11);
  if (!v15)
  {
    if (qword_10013BC48 != -1) {
      swift_once(&qword_10013BC48, sub_1000D1558);
    }
    uint64_t v32 = sub_10002A768(v9, (uint64_t)qword_100148618);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v32, v9);
    uint64_t v33 = sub_100029E18(&qword_10013EA00);
    uint64_t v34 = type metadata accessor for LogMessage(0LL);
    uint64_t v35 = swift_allocObject( v33,  ((*(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL))
          + *(void *)(*(void *)(v34 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v35 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(34LL, 1LL);
    v36._uint64_t countAndFlagsBits = 0xD000000000000022LL;
    v36._object = (void *)0x80000001000FFA20LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v36);
    uint64_t v50 = sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
    v49[0] = a1;
    id v37 = a1;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v49);
    sub_10004C810((uint64_t)v49);
    v38._uint64_t countAndFlagsBits = 0LL;
    v38._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v38);
    LogMessage.init(stringInterpolation:)(v8);
    Logger.error(_:)(v35, v9, &protocol witness table for OSLogger);
    uint64_t v39 = v35;
    goto LABEL_12;
  }

  uint64_t v16 = v14;
  uint64_t v17 = v15;
  uint64_t v18 = JSValue.string.getter(v14);
  if (!v19)
  {
    swift_bridgeObjectRelease(v17);
    if (qword_10013BC48 != -1) {
      swift_once(&qword_10013BC48, sub_1000D1558);
    }
    uint64_t v40 = sub_10002A768(v9, (uint64_t)qword_100148618);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v40, v9);
    uint64_t v41 = sub_100029E18(&qword_10013EA00);
    uint64_t v42 = type metadata accessor for LogMessage(0LL);
    uint64_t v43 = swift_allocObject( v41,  ((*(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL))
          + *(void *)(*(void *)(v42 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v43 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(31LL, 1LL);
    v44._object = (void *)0x80000001000FFA50LL;
    v44._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v44);
    uint64_t v50 = sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
    v49[0] = a2;
    id v45 = a2;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v49);
    sub_10004C810((uint64_t)v49);
    v46._uint64_t countAndFlagsBits = 0LL;
    v46._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v46);
    LogMessage.init(stringInterpolation:)(v8);
    Logger.error(_:)(v43, v9, &protocol witness table for OSLogger);
    uint64_t v39 = v43;
LABEL_12:
    __n128 v47 = swift_bridgeObjectRelease(v39);
    (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v13, v9, v47);
    return;
  }

  uint64_t v20 = v18;
  uint64_t v21 = v19;
  uint64_t v22 = (objc_class *)type metadata accessor for JSMediaTokensObject.CacheKey();
  id v23 = (char *)objc_allocWithZone(v22);
  uint64_t v24 = &v23[OBJC_IVAR____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey_client];
  *(void *)uint64_t v24 = v16;
  *((void *)v24 + 1) = v17;
  *((void *)v24 + 2) = v20;
  *((void *)v24 + 3) = v21;
  v48.receiver = v23;
  v48.super_class = v22;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v21);
  id v25 = objc_msgSendSuper2(&v48, "init");
  id v26 = *(void **)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_cachedServices);
  id v27 = [v26 objectForKey:v25];
  if (!v27)
  {
    uint64_t v28 = swift_bridgeObjectRetain(v17);
    uint64_t v29 = Bag.amsBag.getter(v28);
    id v30 = objc_allocWithZone(&OBJC_CLASS___AMSMediaTokenService);
    NSString v31 = String._bridgeToObjectiveC()();
    id v27 = objc_msgSend(v30, "initWithClientIdentifier:bag:", v31, v29, swift_bridgeObjectRelease(v17).n128_f64[0]);

    swift_unknownObjectRelease(v29);
    [v26 setObject:v27 forKey:v25];
  }

  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v17);

  [v27 invalidateMediaToken];
}

uint64_t sub_1000ABD54()
{
  return type metadata accessor for JSMediaTokensObject(0LL);
}

uint64_t type metadata accessor for JSMediaTokensObject(uint64_t a1)
{
  uint64_t result = qword_10013F138;
  if (!qword_10013F138) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSMediaTokensObject);
  }
  return result;
}

uint64_t sub_1000ABD98(uint64_t a1)
{
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for JSMediaTokensObject.CacheKey()
{
  return objc_opt_self(&OBJC_CLASS____TtCC19appstorecomponentsd19JSMediaTokensObjectP33_E91800677D5458EF8C488C03D4ACDC6E8CacheKey);
}

uint64_t sub_1000ABE30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013C6F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void *sub_1000ABE78(void *a1)
{
  return sub_1000AAB6C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_1000ABE94()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + 48));
  swift_release(*(void *)(v0 + 56));
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_1000ABED0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000AAE38(a1, a2, a3, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
}

uint64_t sub_1000ABEFC()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1000ABF5C(void **a1)
{
}

uint64_t sub_1000ABF98()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_1000AC00C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSCallable(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5.super.Class isa = *(Class *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL));
  sub_1000AB3F0(a1, v1 + v4, v5);
}

ValueMetadata *type metadata accessor for JSMetricsEventLinter()
{
  return &type metadata for JSMetricsEventLinter;
}

id sub_1000AC06C(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v3 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v35 = type metadata accessor for JSRequest(0LL);
  uint64_t v33 = *(void *)(v35 - 8);
  uint64_t v5 = __chkstk_darwin(v35);
  uint64_t v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v31 - v8;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v17 = sub_10002A768(v13, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  uint64_t v18 = sub_100029E18(&qword_10013EA00);
  uint64_t v19 = type metadata accessor for LogMessage(0LL);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
        + *(void *)(*(void *)(v19 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v20 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(14LL, 1LL);
  v21._uint64_t countAndFlagsBits = 0x20676E69746E694CLL;
  v21._object = (void *)0xEE0020746E657665LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  uint64_t v22 = sub_100029E18(&qword_10013CD70);
  uint64_t v37 = v22;
  v36[0] = a1;
  swift_bridgeObjectRetain(a1);
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v36);
  sub_10004C810((uint64_t)v36);
  v23._uint64_t countAndFlagsBits = 0LL;
  v23._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  LogMessage.init(stringInterpolation:)(v12);
  Logger.debug(_:)(v20, v13, &protocol witness table for OSLogger);
  __n128 v24 = swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t, __n128))(v14 + 8))(v16, v13, v24);
  id v25 = v32;
  JSRoute.init(service:function:)(0x7363697274656DLL, 0xE700000000000000LL, 0x45737365636F7270LL, 0xEC000000746E6576LL);
  JSRequest.init(route:timeoutInterval:version:)(v25, 0LL, 1LL, 0LL);
  uint64_t v37 = v22;
  v36[0] = a1;
  swift_bridgeObjectRetain(a1);
  JSRequest.addingOption(_:withName:)(v36, 0x73646C656966LL, 0xE600000000000000LL);
  id v26 = *(void (**)(char *, uint64_t))(v33 + 8);
  uint64_t v27 = v35;
  v26(v7, v35);
  sub_10004C810((uint64_t)v36);
  id v28 = sub_1000A6678((uint64_t)v9);
  uint64_t v37 = type metadata accessor for SyncTaskScheduler(0LL);
  Swift::String v38 = &protocol witness table for SyncTaskScheduler;
  uint64_t v29 = sub_10002C328(v36);
  SyncTaskScheduler.init()(v29);
  Promise.then(perform:orCatchError:on:)(sub_1000AC408, 0LL, sub_1000AC600, 0LL, v36);
  v26(v9, v27);
  sub_100029F4C(v36);
  return v28;
}

uint64_t sub_1000AC408()
{
  uint64_t v0 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v7 = sub_10002A768(v3, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = sub_100029E18(&qword_10013EA00);
  uint64_t v9 = type metadata accessor for LogMessage(0LL);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL))
        + *(void *)(*(void *)(v9 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v9 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(13LL, 1LL);
  v11._uint64_t countAndFlagsBits = 0x65206465746E694CLL;
  v11._object = (void *)0xED000020746E6576LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v11);
  uint64_t v12 = LintedMetricsEvent.fields.getter();
  v16[3] = sub_100029E18(&qword_10013CD70);
  v16[0] = v12;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v16);
  sub_10004C810((uint64_t)v16);
  v13._uint64_t countAndFlagsBits = 0LL;
  v13._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v13);
  LogMessage.init(stringInterpolation:)(v2);
  Logger.debug(_:)(v10, v3, &protocol witness table for OSLogger);
  __n128 v14 = swift_bridgeObjectRelease(v10);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v4 + 8))(v6, v3, v14);
}

uint64_t sub_1000AC600(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OSLogger(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v9 = sub_10002A768(v5, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  uint64_t v10 = sub_100029E18(&qword_10013EA00);
  uint64_t v11 = type metadata accessor for LogMessage(0LL);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL))
        + *(void *)(*(void *)(v11 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(30LL, 1LL);
  v13._object = (void *)0x80000001000FFC10LL;
  v13._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v13);
  swift_getErrorValue(a1, v22, &v20);
  uint64_t v14 = v20;
  uint64_t v15 = v21;
  v23[3] = v21;
  uint64_t v16 = sub_10002C328(v23);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL))(v16, v14, v15);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v23);
  sub_10004C810((uint64_t)v23);
  v17._uint64_t countAndFlagsBits = 0LL;
  v17._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  LogMessage.init(stringInterpolation:)(v4);
  Logger.error(_:)(v12, v5, &protocol witness table for OSLogger);
  __n128 v18 = swift_bridgeObjectRelease(v12);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v18);
}

id sub_1000AC7FC(uint64_t a1)
{
  return sub_1000AC06C(a1, *v1);
}

uint64_t sub_1000AC804()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  sub_10002A728(v4, qword_10013F180);
  sub_10002A768(v4, (uint64_t)qword_10013F180);
  if (qword_10013BC30 != -1) {
    swift_once(&qword_10013BC30, sub_1000D14B4);
  }
  uint64_t v5 = sub_10002A768(v0, (uint64_t)qword_1001485D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSLogger.init(subsystem:category:)(v3, 0xD00000000000001ALL, 0x80000001000F0390LL);
}

id sub_1000AC964(void *a1, uint64_t a2, void *a3)
{
  id v77 = a1;
  id v71 = a3;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v3);
  v72 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v73 = type metadata accessor for OSLogger(0LL);
  uint64_t v75 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  id v74 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v70 = type metadata accessor for JSPromise(0LL);
  uint64_t v6 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  uint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for JSONContext(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for JSONObject(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v67 - v21;
  uint64_t v23 = (uint64_t)v76;
  JSValue.makeJSONObject()(v20);
  if (v23)
  {
    uint64_t v76 = 0LL;
    uint64_t v24 = v23;
  }

  else
  {
    uint64_t v76 = v11;
    uint64_t v68 = v6;
    char v69 = v8;
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v16 + 16))(v19, v22, v15);
    JSONContext.init()(v25);
    id v26 = (void *)sub_1000C8758((uint64_t)v19, (uint64_t)v14);
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v31 = (void *)swift_allocObject(&unk_100123ED0, 48LL, 7LL);
    id v32 = v71;
    v31[2] = v71;
    v31[3] = v26;
    v31[4] = v28;
    v31[5] = v30;
    sub_100029E18(&qword_10013F218);
    id v33 = v32;
    id v71 = v26;
    uint64_t v34 = swift_bridgeObjectRetain(v30);
    uint64_t v35 = Promise.__allocating_init()(v34);
    uint64_t v36 = type metadata accessor for TaskPriority(0LL);
    uint64_t v37 = (uint64_t)v76;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56LL))(v76, 1LL, 1LL, v36);
    Swift::String v38 = (void *)swift_allocObject(&unk_100123EF8, 56LL, 7LL);
    v38[2] = 0LL;
    v38[3] = 0LL;
    v38[4] = &unk_10013F210;
    v38[5] = v31;
    uint64_t v39 = v35;
    v38[6] = v35;
    swift_retain(v35);
    uint64_t v40 = sub_1000B3448(v37, (uint64_t)&unk_10013F220, (uint64_t)v38);
    swift_release(v40);
    type metadata accessor for RunLoopWorkerThread(0LL);
    uint64_t v41 = swift_retain(v35);
    uint64_t v42 = static RunLoopWorkerThread.current.getter(v41);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = swift_allocObject(&unk_100123F20, 56LL, 7LL);
      *(void *)(v44 + 16) = 0LL;
      *(_BYTE *)(v44 + 24) = 1;
      *(void *)(v44 + 32) = v43;
      *(void *)(v44 + 40) = sub_1000AE32C;
      *(void *)(v44 + 48) = v39;
      id v45 = v77;
      swift_retain(v39);
      Swift::String v46 = v69;
      uint64_t v47 = JSPromise.init(in:executor:)(v45, sub_1000AE164, v44);
      uint64_t v48 = JSPromise.value.getter(v47);
      swift_bridgeObjectRelease(v30);

      swift_release_n(v39, 2LL);
      (*(void (**)(char *, uint64_t))(v68 + 8))(v46, v70);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
      return (id)v48;
    }

    unint64_t v49 = sub_1000AE11C();
    uint64_t v24 = swift_allocError(&type metadata for JSPromiseBindingError, v49, 0LL, 0LL);
    _BYTE *v50 = 0;
    swift_willThrow(v24);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
    swift_release_n(v35, 2LL);
    swift_bridgeObjectRelease(v30);

    uint64_t v76 = 0LL;
  }

  if (qword_10013BC08 != -1) {
    swift_once(&qword_10013BC08, sub_1000AC804);
  }
  uint64_t v51 = v73;
  uint64_t v52 = sub_10002A768(v73, (uint64_t)qword_10013F180);
  uint64_t v54 = v74;
  uint64_t v53 = v75;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v52, v51);
  uint64_t v55 = sub_100029E18(&qword_10013EA00);
  uint64_t v56 = type metadata accessor for LogMessage(0LL);
  uint64_t v57 = swift_allocObject( v55,  ((*(unsigned __int8 *)(*(void *)(v56 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v56 - 8) + 80LL))
        + *(void *)(*(void *)(v56 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v56 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v57 + 16) = xmmword_1000EDBE0;
  uint64_t v58 = v72;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(45LL, 1LL);
  v59._object = (void *)0x80000001000FFD20LL;
  v59._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v59);
  swift_getErrorValue(v24, v81, &v78);
  uint64_t v60 = v78;
  uint64_t v61 = v79;
  v80[3] = v79;
  char v62 = sub_10002C328(v80);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v61 - 8) + 16LL))(v62, v60, v61);
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v80);
  sub_10004C810((uint64_t)v80);
  v63._uint64_t countAndFlagsBits = 0LL;
  v63._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v63);
  LogMessage.init(stringInterpolation:)(v58);
  Logger.error(_:)(v57, v51, &protocol witness table for OSLogger);
  __n128 v64 = swift_bridgeObjectRelease(v57);
  (*(void (**)(char *, uint64_t, __n128))(v53 + 8))(v54, v51, v64);
  uint64_t v65 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  id result = [v65 valueWithUndefinedInContext:v77];
  if (result)
  {
    uint64_t v48 = (uint64_t)result;
    swift_errorRelease(v24);
    return (id)v48;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000ACF48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch(sub_1000ACF68, 0LL, 0LL);
}

uint64_t sub_1000ACF68()
{
  uint64_t v1 = v0[3] + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore;
  id v3 = *(id *)v1;
  uint64_t v2 = *(void *)(v1 + 8);
  id v4 = objc_msgSend(*(id *)v1, "ams_activeiTunesAccount");
  v0[7] = v4;
  id v5 = v4;
  if (!v4) {
    id v5 = objc_msgSend(v3, "ams_activeiTunesAccount");
  }
  v0[8] = v5;
  uint64_t v6 = dword_10013FB3C;
  id v7 = v4;
  uint64_t v8 = (void *)swift_task_alloc(v6);
  v0[9] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1000AD028;
  return sub_1000C8AC4((uint64_t)v5, v0[5], v0[6], v2);
}

uint64_t sub_1000AD028(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 72);
  *(void *)(*v2 + 80) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_1000AD12C;
  }

  else
  {
    *(void *)(v4 + 88) = a1;
    uint64_t v6 = sub_1000AD09C;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000AD09C()
{
  uint64_t v1 = *(void **)(v0 + 88);
  uint64_t v2 = *(void **)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(uint64_t **)(v0 + 16);

  id v5 = [v1 identifierForKey:v3];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  uint64_t v8 = v7;

  *uint64_t v4 = v6;
  v4[1] = v8;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000AD12C()
{
  uint64_t v1 = *(void **)(v0 + 56);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000AD164(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v11 = v6;
  uint64_t v12 = v5;
  swift_bridgeObjectRetain(v5);
  id v7 = a2;
  uint64_t v8 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v11, &type metadata for String);
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  id v10 = objc_msgSend(v9, "valueWithObject:inContext:", v8, v7, v11, v12);
  swift_unknownObjectRelease(v8);

  if (v10) {
    *a3 = v10;
  }
  else {
    __break(1u);
  }
}

void sub_1000AD21C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JSONContext(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for JSONObject(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v34 - v15;
  JSValue.makeJSONObject()(v14);
  if (!v3)
  {
    uint64_t v17 = (*(uint64_t (**)(char *, char *, uint64_t))(v10 + 16))(v13, v16, v9);
    JSONContext.init()(v17);
    uint64_t v18 = (void *)sub_1000C8758((uint64_t)v13, (uint64_t)v8);
    uint64_t v20 = v19;
    id v37 = v18;
    uint64_t v21 = *(void **)(a3 + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore);
    uint64_t v34 = *(void *)(a3 + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore + 8);
    uint64_t v35 = v22;
    id v23 = objc_msgSend(v21, "ams_activeiTunesAccount");
    id v24 = v23;
    if (!v23) {
      id v24 = objc_msgSend(v21, "ams_activeiTunesAccount");
    }
    id v25 = v23;
    id v26 = sub_1000C8F2C(v24, v20, v35, v34);

    id v27 = [v26 identifierForKey:v37];
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    uint64_t v30 = v29;

    v36[0] = v28;
    v36[1] = v30;
    id v31 = a1;
    uint64_t v32 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v36, &type metadata for String);
    id v33 = [(id)objc_opt_self(JSValue) valueWithObject:v32 inContext:v31];
    swift_unknownObjectRelease(v32);

    if (v33)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v9);
      swift_bridgeObjectRelease(v35);
    }

    else
    {
      __break(1u);
    }
  }

id sub_1000AD548(void *a1, uint64_t a2, void *a3)
{
  id v71 = a1;
  uint64_t v65 = a3;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v3);
  char v66 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v67 = type metadata accessor for OSLogger(0LL);
  uint64_t v69 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v68 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = type metadata accessor for JSPromise(0LL);
  uint64_t v6 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for JSONContext(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for JSONObject(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v61 - v21;
  uint64_t v23 = (uint64_t)v70;
  JSValue.makeJSONObject()(v20);
  if (v23)
  {
    uint64_t v70 = 0LL;
    uint64_t v24 = v23;
  }

  else
  {
    uint64_t v70 = v11;
    uint64_t v62 = v6;
    Swift::String v63 = v8;
    uint64_t v25 = (*(uint64_t (**)(char *, char *, uint64_t))(v16 + 16))(v19, v22, v15);
    JSONContext.init()(v25);
    unint64_t v26 = sub_1000ADF84();
    uint64_t v27 = Array<A>.init(deserializing:using:)(v19, v14, &type metadata for MetricsIdentifierKeyContext, v26);
    uint64_t v28 = swift_allocObject(&unk_100123E30, 32LL, 7LL);
    uint64_t v29 = v65;
    *(void *)(v28 + 16) = v65;
    *(void *)(v28 + 24) = v27;
    sub_100029E18(&qword_10013F930);
    uint64_t v30 = Promise.__allocating_init()(v29);
    uint64_t v31 = type metadata accessor for TaskPriority(0LL);
    uint64_t v32 = (uint64_t)v70;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56LL))(v70, 1LL, 1LL, v31);
    id v33 = (void *)swift_allocObject(&unk_100123E58, 56LL, 7LL);
    v33[2] = 0LL;
    v33[3] = 0LL;
    v33[4] = &unk_10013F1F0;
    v33[5] = v28;
    v33[6] = v30;
    swift_retain(v30);
    uint64_t v34 = sub_1000B3448(v32, (uint64_t)&unk_10013F1F8, (uint64_t)v33);
    swift_release(v34);
    type metadata accessor for RunLoopWorkerThread(0LL);
    uint64_t v35 = swift_retain(v30);
    uint64_t v36 = static RunLoopWorkerThread.current.getter(v35);
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = swift_allocObject(&unk_100123E80, 56LL, 7LL);
      *(void *)(v38 + 16) = 0LL;
      *(_BYTE *)(v38 + 24) = 1;
      *(void *)(v38 + 32) = v37;
      *(void *)(v38 + 40) = sub_1000AE0F4;
      *(void *)(v38 + 48) = v30;
      id v39 = v71;
      swift_retain(v30);
      uint64_t v40 = v63;
      uint64_t v41 = JSPromise.init(in:executor:)(v39, sub_1000AE164, v38);
      uint64_t v42 = JSPromise.value.getter(v41);
      swift_release_n(v30, 2LL);
      (*(void (**)(char *, uint64_t))(v62 + 8))(v40, v64);
      (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
      return (id)v42;
    }

    unint64_t v43 = sub_1000AE11C();
    uint64_t v24 = swift_allocError(&type metadata for JSPromiseBindingError, v43, 0LL, 0LL);
    *uint64_t v44 = 0;
    swift_willThrow(v24);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v22, v15);
    swift_release_n(v30, 2LL);
    uint64_t v70 = 0LL;
  }

  if (qword_10013BC08 != -1) {
    swift_once(&qword_10013BC08, sub_1000AC804);
  }
  uint64_t v45 = v67;
  uint64_t v46 = sub_10002A768(v67, (uint64_t)qword_10013F180);
  uint64_t v48 = v68;
  uint64_t v47 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v46, v45);
  uint64_t v49 = sub_100029E18(&qword_10013EA00);
  uint64_t v50 = type metadata accessor for LogMessage(0LL);
  uint64_t v51 = swift_allocObject( v49,  ((*(unsigned __int8 *)(*(void *)(v50 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v50 - 8) + 80LL))
        + *(void *)(*(void *)(v50 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v50 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v51 + 16) = xmmword_1000EDBE0;
  uint64_t v52 = v66;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(41LL, 1LL);
  v53._object = (void *)0x80000001000FFCF0LL;
  v53._uint64_t countAndFlagsBits = 0xD000000000000029LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v53);
  swift_getErrorValue(v24, v75, &v72);
  uint64_t v54 = v72;
  uint64_t v55 = v73;
  v74[3] = v73;
  uint64_t v56 = sub_10002C328(v74);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v55 - 8) + 16LL))(v56, v54, v55);
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v74);
  sub_10004C810((uint64_t)v74);
  v57._uint64_t countAndFlagsBits = 0LL;
  v57._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v57);
  LogMessage.init(stringInterpolation:)(v52);
  Logger.error(_:)(v51, v45, &protocol witness table for OSLogger);
  __n128 v58 = swift_bridgeObjectRelease(v51);
  (*(void (**)(char *, uint64_t, __n128))(v47 + 8))(v48, v45, v58);
  Swift::String v59 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  id result = [v59 valueWithUndefinedInContext:v71];
  if (result)
  {
    uint64_t v42 = (uint64_t)result;
    swift_errorRelease(v24);
    return (id)v42;
  }

  __break(1u);
  return result;
}

uint64_t sub_1000ADAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch(sub_1000ADB14, 0LL, 0LL);
}

uint64_t sub_1000ADB14()
{
  uint64_t v1 = (uint64_t *)(v0[3] + OBJC_IVAR____TtC19appstorecomponentsd26JSMetricsIdentifiersObject_metricsIdStore);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v4 = (void *)swift_task_alloc(dword_10013FB54);
  v0[5] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000ADB80;
  return sub_1000C76B0(v0[4], 0LL, v3, v2);
}

uint64_t sub_1000ADB80(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 40);
  uint64_t v6 = *v2;
  swift_task_dealloc(v5);
  if (v1) {
    return (*(uint64_t (**)(void))(v6 + 8))();
  }
  *(void *)(v4 + 48) = a1;
  return swift_task_switch(sub_1000ADBFC, 0LL, 0LL);
}

uint64_t sub_1000ADBFC()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 48);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000ADC14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = swift_allocObject(a3, 24LL, 7LL);
  *(void *)(v6 + 16) = a1;
  v10[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v10[4] = &protocol witness table for SyncTaskScheduler;
  sub_10002C328(v10);
  SyncTaskScheduler.init()(a1);
  uint64_t v7 = sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
  uint64_t v8 = Promise.map<A>(on:_:)(v10, a4, v6, v7);
  swift_release(v6);
  sub_100029F4C(v10);
  return v8;
}

void sub_1000ADCE4(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = *a1;
  swift_bridgeObjectRetain(v9);
  id v5 = a2;
  uint64_t v6 = sub_100029E18(&qword_10013CD70);
  uint64_t v7 = _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(&v9, v6);
  id v8 = [(id)objc_opt_self(JSValue) valueWithObject:v7 inContext:v5];
  swift_unknownObjectRelease(v7);

  if (v8) {
    *a3 = v8;
  }
  else {
    __break(1u);
  }
}

id sub_1000ADD9C(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType(a1);
  sub_10002A030(0LL, &qword_10013EA40, &OBJC_CLASS___JSContext_ptr);
  id v8 = a3;
  id v9 = a1;
  uint64_t v10 = (void *)static JSContext.requiredCurrent.getter();
  v13[2] = v8;
  v13[3] = v9;
  v13[4] = ObjectType;
  uint64_t v11 = (void *)JSContext.propagateErrorsToExceptions(_:)(a4, v13);

  return v11;
}

uint64_t sub_1000ADEAC()
{
  return type metadata accessor for JSMetricsIdentifiersObject(0LL);
}

uint64_t type metadata accessor for JSMetricsIdentifiersObject(uint64_t a1)
{
  uint64_t result = qword_10013F1D0;
  if (!qword_10013F1D0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSMetricsIdentifiersObject);
  }
  return result;
}

uint64_t sub_1000ADEF0(uint64_t a1)
{
  v4[0] = &unk_1000F03D0;
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

id sub_1000ADF68(void *a1)
{
  return sub_1000AD548(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_1000ADF84()
{
  unint64_t result = qword_10013F1E0;
  if (!qword_10013F1E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0C7C, &type metadata for MetricsIdentifierKeyContext);
    atomic_store(result, &qword_10013F1E0);
  }

  return result;
}

uint64_t sub_1000ADFC8()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000ADFF4(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc(dword_10013F1EC);
  __int128 v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_100039088;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return swift_task_switch(sub_1000ADB14, 0LL, 0LL);
}

uint64_t sub_1000AE060(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc(dword_10013F344);
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10002A858;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F340
                                                                                     + dword_10013F340))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000AE0F4(void *a1)
{
  return sub_1000ADC14(a1, v1, (uint64_t)&unk_100123EA8, (uint64_t)sub_1000AE19C);
}

unint64_t sub_1000AE11C()
{
  unint64_t result = qword_10013F200;
  if (!qword_10013F200)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F04F0, &type metadata for JSPromiseBindingError);
    atomic_store(result, &qword_10013F200);
  }

  return result;
}

uint64_t sub_1000AE164(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000AE384(a1, a2, a3);
}

uint64_t sub_1000AE178()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000AE19C(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

void sub_1000AE1B4(void *a1)
{
}

id sub_1000AE1CC(void *a1)
{
  return sub_1000AC964(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_1000AE1E8()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_1000AE21C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 40);
  uint64_t v6 = swift_task_alloc(dword_10013F20C);
  __int128 v7 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v6;
  *(void *)uint64_t v6 = v2;
  *(void *)(v6 + 8) = sub_10002A858;
  *(void *)(v6 + 40) = v4;
  *(void *)(v6 + 48) = v5;
  *(_OWORD *)(v6 + 24) = v7;
  *(void *)(v6 + 16) = a1;
  return swift_task_switch(sub_1000ACF68, 0LL, 0LL);
}

uint64_t sub_1000AE298(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  id v9 = (void *)swift_task_alloc(dword_10013F34C);
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100039088;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F348
                                                                                     + dword_10013F348))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000AE32C(void *a1)
{
  return sub_1000ADC14(a1, v1, (uint64_t)&unk_100123F48, (uint64_t)sub_1000AE3A8);
}

uint64_t sub_1000AE358()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000AE384(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000AFEC0( a1,  a2,  a3,  *(void *)(v3 + 16),  *(_BYTE *)(v3 + 24),  *(void *)(v3 + 32),  *(uint64_t (**)(id))(v3 + 40),  *(void *)(v3 + 48));
}

void sub_1000AE3A8(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

uint64_t sub_1000AE3C4(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  id v70 = a5;
  unint64_t v69 = a3;
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8);
  uint64_t v64 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for OSLogger(0LL);
  uint64_t v66 = *(void *)(v10 - 8);
  uint64_t v67 = v10;
  __chkstk_darwin(v10);
  uint64_t v65 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for State(0LL);
  uint64_t v62 = *(void *)(v12 - 8);
  uint64_t v63 = v12;
  __chkstk_darwin(v12);
  uint64_t v61 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for JSRequest(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v61 - v22;
  __chkstk_darwin(v24);
  unint64_t v26 = (char *)&v61 - v25;
  __chkstk_darwin(v27);
  uint64_t v29 = (char *)&v61 - v28;
  JSRoute.init(service:function:)(0x7363697274656DLL, 0xE700000000000000LL, 0xD000000000000013LL, 0x80000001000FFDC0LL);
  JSRequest.init(route:timeoutInterval:version:)(v16, 0LL, 1LL, 0LL);
  uint64_t v73 = &type metadata for String;
  unint64_t v71 = a1;
  uint64_t v72 = a2;
  swift_bridgeObjectRetain(a2);
  JSRequest.addingOption(_:withName:)(&v71, 0x6E676961706D6163LL, 0xED00006E656B6F54LL);
  uint64_t v68 = v18;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v18 + 8);
  v30(v20, v17);
  sub_10004C810((uint64_t)&v71);
  uint64_t v73 = &type metadata for String;
  unint64_t v71 = v69;
  uint64_t v72 = a4;
  swift_bridgeObjectRetain(a4);
  JSRequest.addingOption(_:withName:)(&v71, 0x72656469766F7270LL, 0xED00006E656B6F54LL);
  v30(v23, v17);
  sub_10004C810((uint64_t)&v71);
  id v31 = v70;
  id v32 = [v70 id];
  id v33 = [v32 stringValue];

  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
  uint64_t v36 = v35;

  uint64_t v73 = &type metadata for String;
  uint64_t v37 = v31;
  unint64_t v71 = v34;
  uint64_t v72 = v36;
  JSRequest.addingOption(_:withName:)(&v71, 0x44496D616461LL, 0xE600000000000000LL);
  v30(v26, v17);
  sub_10004C810((uint64_t)&v71);
  id v38 = [v31 offer];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = objc_opt_self(&OBJC_CLASS___ASCAppOffer);
    if (swift_dynamicCastObjCClass(v39, v40))
    {
      (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v23, v29, v17);
      uint64_t v41 = v61;
      uint64_t v42 = v62;
      uint64_t v43 = v63;
      (*(void (**)(char *, void, uint64_t))(v62 + 104))(v61, enum case for State.unknown(_:), v63);
      unint64_t v44 = sub_100050130();
      (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
      uint64_t v73 = (void *)sub_100029E18(&qword_10013CD70);
      unint64_t v71 = v44;
      JSRequest.addingOption(_:withName:)(&v71, 0x726566666FLL, 0xE500000000000000LL);
      swift_unknownObjectRelease(v39);
      v30(v23, v17);
      v30(v29, v17);
      sub_10004C810((uint64_t)&v71);
      (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v29, v26, v17);
      goto LABEL_8;
    }

    swift_unknownObjectRelease(v39);
  }

  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v45 = v67;
  uint64_t v46 = sub_10002A768(v67, (uint64_t)qword_100148630);
  uint64_t v48 = v65;
  uint64_t v47 = v66;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v65, v46, v45);
  uint64_t v49 = sub_100029E18(&qword_10013EA00);
  uint64_t v50 = type metadata accessor for LogMessage(0LL);
  uint64_t v51 = swift_allocObject( v49,  ((*(unsigned __int8 *)(*(void *)(v50 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v50 - 8) + 80LL))
        + *(void *)(*(void *)(v50 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v50 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v51 + 16) = xmmword_1000EDBE0;
  uint64_t v52 = v64;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(40LL, 1LL);
  v53._object = (void *)0x80000001000FFDE0LL;
  v53._uint64_t countAndFlagsBits = 0xD000000000000010LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v53);
  id v54 = [v37 id];
  uint64_t v73 = (void *)sub_10005462C();
  unint64_t v71 = (unint64_t)v54;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(&v71);
  sub_10004C810((uint64_t)&v71);
  v55._uint64_t countAndFlagsBits = 0xD000000000000018LL;
  v55._object = (void *)0x80000001000FFE00LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v55);
  LogMessage.init(stringInterpolation:)(v52);
  Logger.warning(_:)(v51, v45, &protocol witness table for OSLogger);
  __n128 v56 = swift_bridgeObjectRelease(v51);
  (*(void (**)(char *, uint64_t, __n128))(v47 + 8))(v48, v45, v56);
LABEL_8:
  uint64_t v57 = sub_1000B5430((uint64_t)v29);
  uint64_t v73 = (void *)type metadata accessor for SyncTaskScheduler(0LL);
  id v74 = &protocol witness table for SyncTaskScheduler;
  __n128 v58 = sub_10002C328(&v71);
  SyncTaskScheduler.init()(v58);
  uint64_t v59 = Promise.map<A>(on:_:)(&v71, sub_1000AF214, 0LL, &type metadata for Bool);
  swift_release(v57);
  sub_100029F4C(&v71);
  v30(v29, v17);
  return v59;
}

uint64_t sub_1000AEA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v41 = a7;
  uint64_t v39 = a5;
  uint64_t v40 = a6;
  uint64_t v37 = a4;
  uint64_t v38 = a3;
  uint64_t v36 = a1;
  uint64_t v8 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for JSRequest(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v36 - v16;
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v36 - v19;
  __chkstk_darwin(v21);
  uint64_t v23 = (char *)&v36 - v22;
  __chkstk_darwin(v24);
  unint64_t v26 = (char *)&v36 - v25;
  JSRoute.init(service:function:)(0x7363697274656DLL, 0xE700000000000000LL, 0x545164726F636572LL, 0xEC0000006E656B6FLL);
  JSRequest.init(route:timeoutInterval:version:)(v10, 0LL, 1LL, 0LL);
  unint64_t v44 = &type metadata for String;
  uint64_t v42 = v36;
  uint64_t v43 = a2;
  swift_bridgeObjectRetain(a2);
  JSRequest.addingOption(_:withName:)(&v42, 0x6E656B6F5471LL, 0xE600000000000000LL);
  uint64_t v27 = *(void (**)(char *, uint64_t))(v12 + 8);
  v27(v14, v11);
  sub_10004C810((uint64_t)&v42);
  unint64_t v44 = &type metadata for String;
  uint64_t v42 = v38;
  uint64_t v43 = v37;
  swift_bridgeObjectRetain(v37);
  JSRequest.addingOption(_:withName:)(&v42, 0x6E676961706D6163LL, 0xED00006E656B6F54LL);
  v27(v17, v11);
  sub_10004C810((uint64_t)&v42);
  unint64_t v44 = &type metadata for String;
  uint64_t v42 = v39;
  uint64_t v43 = v40;
  swift_bridgeObjectRetain(v40);
  JSRequest.addingOption(_:withName:)(&v42, 0x7369747265766461LL, 0xEF6449746E656D65LL);
  v27(v20, v11);
  sub_10004C810((uint64_t)&v42);
  id v28 = [v41 stringValue];
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  uint64_t v31 = v30;

  unint64_t v44 = &type metadata for String;
  uint64_t v42 = v29;
  uint64_t v43 = v31;
  JSRequest.addingOption(_:withName:)(&v42, 0x64496D616461LL, 0xE600000000000000LL);
  v27(v23, v11);
  sub_10004C810((uint64_t)&v42);
  uint64_t v32 = sub_1000B5430((uint64_t)v26);
  unint64_t v44 = (void *)type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v45 = &protocol witness table for SyncTaskScheduler;
  id v33 = sub_10002C328(&v42);
  SyncTaskScheduler.init()(v33);
  uint64_t v34 = Promise.map<A>(on:_:)(&v42, sub_1000AED74, 0LL, &type metadata for Bool);
  swift_release(v32);
  sub_100029F4C(&v42);
  v27(v26, v11);
  return v34;
}

void sub_1000AED74(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1000AED80(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for JSRequest(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v28 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v28 - v17;
  JSRoute.init(service:function:)(0x7363697274656DLL, 0xE700000000000000LL, 0xD000000000000020LL, 0x80000001000FFE20LL);
  JSRequest.init(route:timeoutInterval:version:)(v8, 0LL, 1LL, 0LL);
  if (a2)
  {
    *((void *)&v30 + 1) = &type metadata for String;
    *(void *)&__int128 v29 = a1;
    *((void *)&v29 + 1) = a2;
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
  }

  swift_bridgeObjectRetain(a2);
  JSRequest.addingOption(_:withName:)(&v29, 0x6574656D61726170LL, 0xEA00000000007372LL);
  uint64_t v19 = *(void (**)(char *, uint64_t))(v10 + 8);
  v19(v13, v9);
  sub_10004C810((uint64_t)&v29);
  id v20 = [a3 stringValue];
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  uint64_t v23 = v22;

  *((void *)&v30 + 1) = &type metadata for String;
  *(void *)&__int128 v29 = v21;
  *((void *)&v29 + 1) = v23;
  JSRequest.addingOption(_:withName:)(&v29, 0x64496D616461LL, 0xE600000000000000LL);
  v19(v16, v9);
  sub_10004C810((uint64_t)&v29);
  uint64_t v24 = sub_1000B5430((uint64_t)v18);
  *((void *)&v30 + 1) = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v31 = &protocol witness table for SyncTaskScheduler;
  uint64_t v25 = sub_10002C328(&v29);
  SyncTaskScheduler.init()(v25);
  uint64_t v26 = Promise.map<A>(on:_:)(&v29, sub_1000AF214, 0LL, &type metadata for Bool);
  swift_release(v24);
  sub_100029F4C(&v29);
  v19(v18, v9);
  return v26;
}

void destroy for JSMetricsService(uint64_t a1)
{
}

uint64_t initializeWithCopy for JSMetricsService(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  uint64_t v5 = a2 + 1;
  __int128 v6 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 32) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v6 - 8);
  swift_retain(v4);
  v8(a1 + 8, v5, v7);
  uint64_t v9 = (void *)a2[6];
  *(void *)(a1 + 48) = v9;
  id v10 = v9;
  return a1;
}

uint64_t *assignWithCopy for JSMetricsService(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  sub_10002AEBC(a1 + 1, a2 + 1);
  __int128 v6 = (void *)a2[6];
  uint64_t v7 = (void *)a1[6];
  a1[6] = (uint64_t)v6;
  id v8 = v6;

  return a1;
}

uint64_t *assignWithTake for JSMetricsService(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  sub_100029F4C(a1 + 1);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  uint64_t v5 = a2[6];
  __int128 v6 = (void *)a1[6];
  a1[5] = a2[5];
  a1[6] = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for JSMetricsService(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSMetricsService(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 56) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JSMetricsService()
{
  return &type metadata for JSMetricsService;
}

void sub_1000AF214(_BYTE *a1@<X8>)
{
}

uint64_t sub_1000AF228(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v45 = a4;
  uint64_t v46 = a5;
  id v43 = a3;
  uint64_t v5 = type metadata accessor for JSRoute(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for JSRequest(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v42 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v42 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  id v20 = (char *)&v42 - v19;
  __chkstk_darwin(v18);
  unint64_t v44 = (char *)&v42 - v21;
  JSRoute.init(service:function:)(0x73726566666FLL, 0xE600000000000000LL, 0x657461726F636564LL, 0xE800000000000000LL);
  JSRequest.init(route:timeoutInterval:version:)(v7, 0LL, 1LL, 0LL);
  unint64_t v22 = sub_100050130();
  uint64_t v48 = sub_100029E18(&qword_10013CD70);
  v47[0] = v22;
  JSRequest.addingOption(_:withName:)(v47, 0x726566666FLL, 0xE500000000000000LL);
  uint64_t v23 = *(void (**)(char *, uint64_t))(v9 + 8);
  v23((char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL), v8);
  sub_10004C810((uint64_t)v47);
  id v24 = [v43 fields];
  uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v24,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);

  uint64_t v26 = sub_100029E18(&qword_10013C720);
  uint64_t v48 = v26;
  v47[0] = v25;
  JSRequest.addingOption(_:withName:)(v47, 0x654D65766974616ELL, 0xED00007363697274LL);
  v23(v14, v8);
  sub_10004C810((uint64_t)v47);
  unint64_t v27 = sub_1000D17E4();
  uint64_t v48 = v26;
  v47[0] = v27;
  JSRequest.addingOption(_:withName:)(v47, 0x63697274654D736FLL, 0xE900000000000073LL);
  v23(v17, v8);
  sub_10004C810((uint64_t)v47);
  unint64_t v28 = sub_100065848();
  uint64_t v48 = sub_100029E18(&qword_10013F228);
  v47[0] = v28;
  __int128 v29 = v44;
  JSRequest.addingOption(_:withName:)(v47, 0x747865746E6F63LL, 0xE700000000000000LL);
  v23(v20, v8);
  sub_10004C810((uint64_t)v47);
  uint64_t v30 = sub_100029E18(&qword_10013CBE0);
  uint64_t v31 = Promise.__allocating_init()(v30);
  swift_retain(v31);
  static MetricsPipeline.unstable_scheduleBarrier(_:)(j___s9JetEngine7PromiseC7resolveyyxF, v31);
  swift_release(v31);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v20, v29, v8);
  uint64_t v32 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v33 = (v32 + 24) & ~v32;
  uint64_t v34 = swift_allocObject(&unk_100124028, v33 + v10, v32 | 7);
  uint64_t v35 = v46;
  *(void *)(v34 + 16) = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v34 + v33, v20, v8);
  uint64_t v36 = swift_allocObject(&unk_100124050, 32LL, 7LL);
  *(void *)(v36 + 16) = sub_1000AF768;
  *(void *)(v36 + 24) = v34;
  uint64_t v48 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v49 = &protocol witness table for SyncTaskScheduler;
  sub_10002C328(v47);
  uint64_t v37 = swift_retain(v35);
  SyncTaskScheduler.init()(v37);
  uint64_t v38 = sub_100029E18(&qword_10013C908);
  unint64_t v39 = sub_1000AF7BC();
  uint64_t v40 = Promise.flatMap<A>(on:_:)(v47, sub_100099A38, v36, v38, v39);
  swift_release(v31);
  swift_release(v36);
  sub_100029F4C(v47);
  v23(v29, v8);
  return v40;
}

uint64_t sub_1000AF668(uint64_t a1, uint64_t a2)
{
  id v2 = sub_1000A6A0C(a2);
  v7[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v7[4] = &protocol witness table for SyncTaskScheduler;
  uint64_t v3 = sub_10002C328(v7);
  SyncTaskScheduler.init()(v3);
  unint64_t v4 = sub_100055CFC();
  uint64_t v5 = Promise.map<A>(on:_:)(v7, sub_1000A7790, 0LL, v4);
  swift_release(v2);
  sub_100029F4C(v7);
  return v5;
}

uint64_t sub_1000AF6F4()
{
  uint64_t v1 = type metadata accessor for JSRequest(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000AF768()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSRequest(0LL) - 8) + 80LL);
  return sub_1000AF668(*(void *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_1000AF798()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

unint64_t sub_1000AF7BC()
{
  unint64_t result = qword_10013CB90;
  if (!qword_10013CB90)
  {
    uint64_t v1 = sub_100029F6C(&qword_10013C908);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10013CB90);
  }

  return result;
}

ValueMetadata *type metadata accessor for JSOfferService()
{
  return &type metadata for JSOfferService;
}

uint64_t JSONObject.intEnum<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Optional(0LL, a1);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = JSONObject.int.getter(v8);
  if ((v12 & 1) != 0)
  {
    uint64_t v21 = type metadata accessor for JSONError(0LL);
    unint64_t v22 = sub_100029F04();
    swift_allocError(v21, v22, 0LL, 0LL);
    *uint64_t v23 = 0x65756C6156776172LL;
    v23[1] = 0xE800000000000000LL;
    void v23[2] = a1;
    v23[3] = _swiftEmptyArrayStorage;
    uint64_t v20 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v21 - 8) + 104LL))( v23,  enum case for JSONError.malformedProperty(_:),  v21);
    return swift_willThrow(v20);
  }

  uint64_t v13 = v11;
  uint64_t v26 = v11;
  dispatch thunk of RawRepresentable.init(rawValue:)(&v26, a1, a2);
  uint64_t v14 = *(void *)(a1 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1LL, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    uint64_t v15 = type metadata accessor for JSONError(0LL);
    unint64_t v16 = sub_100029F04();
    swift_allocError(v15, v16, 0LL, 0LL);
    uint64_t v18 = v17;
    uint64_t v26 = v13;
    *uint64_t v17 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    v18[1] = v19;
    v18[2] = a1;
    uint64_t v20 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v15 - 8) + 104LL))( v18,  enum case for JSONError.unknownCase(_:),  v15);
    return swift_willThrow(v20);
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a3, v10, a1);
}

uint64_t JSONObject.intEnum<A>(or:)@<X0>( uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v8 = type metadata accessor for Optional(0LL, a2);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  char v12 = (char *)&v17 - v11;
  uint64_t v13 = JSONObject.int.getter(v10);
  if ((v14 & 1) != 0) {
    return a1(v13);
  }
  uint64_t v18 = v13;
  dispatch thunk of RawRepresentable.init(rawValue:)(&v18, a2, a3);
  uint64_t v15 = *(void *)(a2 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1LL, a2) == 1)
  {
    uint64_t v13 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return a1(v13);
  }

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(a4, v12, a2);
}

uint64_t JSONObject.intEnumOrNil<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = JSONObject.int.getter(a1);
  if ((v7 & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 56LL))( a3,  1LL,  1LL,  a1);
  }
  uint64_t v9 = v6;
  return dispatch thunk of RawRepresentable.init(rawValue:)(&v9, a1, a2);
}

void *sub_1000AFBB8(void *a1)
{
  uint64_t v3 = type metadata accessor for JSPromise(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = JSPromise.init(in:executor:)(a1, sub_1000AFC6C, 0LL);
  if (!v1)
  {
    a1 = (void *)JSPromise.value.getter(v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  return a1;
}

void sub_1000AFC6C(uint64_t a1)
{
  uint64_t v3 = sub_100029E18(&qword_10013E5F0);
  uint64_t v4 = swift_allocObject(v3, 64LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_1000EDBE0;
  id v5 = [(id)objc_opt_self(JSValue) valueWithNullInContext:a1];
  if (v5)
  {
    id v6 = v5;
    *(void *)(v4 + 56) = sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
    *(void *)(v4 + 32) = v6;
    uint64_t v7 = JSCallable.call(_:)(v4);
    if (v1)
    {
      swift_bridgeObjectRelease(v4);
      if (qword_10013BC48 != -1) {
        swift_once(&qword_10013BC48, sub_1000D1558);
      }
      uint64_t v8 = type metadata accessor for OSLogger(0LL);
      sub_10002A768(v8, (uint64_t)qword_100148618);
      uint64_t v9 = sub_100029E18(&qword_10013EA00);
      uint64_t v10 = type metadata accessor for LogMessage(0LL);
      uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
            + *(void *)(*(void *)(v10 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v11 + 16) = xmmword_1000EDBE0;
      LogMessage.init(stringLiteral:)(0xD00000000000001FLL, 0x80000001000FE100LL);
      Logger.error(_:)(v11, v8, &protocol witness table for OSLogger);
      swift_bridgeObjectRelease(v11);
      swift_errorRelease(v1);
    }

    else
    {
      char v12 = (void *)v7;
      swift_bridgeObjectRelease(v4);
    }
  }

  else
  {
    __break(1u);
  }

uint64_t type metadata accessor for JSPersonalizationStoreObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd28JSPersonalizationStoreObject);
}

uint64_t sub_1000AFEC0( id a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t (*a7)(id), uint64_t a8)
{
  id v54 = a7;
  double v52 = *(double *)&a4;
  uint64_t v53 = a8;
  uint64_t v49 = a2;
  uint64_t v50 = a6;
  uint64_t v56 = a3;
  uint64_t v10 = type metadata accessor for JSCallable(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v48 = type metadata accessor for RunLoopWorkerThread.PendingTask(0LL);
  uint64_t v14 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  unint64_t v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = swift_allocObject(&unk_1001240B8, 17LL, 7LL);
  *(_BYTE *)(v17 + 16) = 0;
  if ((a5 & 1) == 0)
  {
    double v18 = v52;
    if (v52 > COERCE_DOUBLE(1LL))
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))( (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v56,  v10);
      uint64_t v19 = *(unsigned __int8 *)(v11 + 80);
      id v51 = a1;
      uint64_t v20 = (v19 + 32) & ~v19;
      unint64_t v47 = (v12 + v20 + 7) & 0xFFFFFFFFFFFFFFF8LL;
      uint64_t v21 = swift_allocObject(&unk_100124130, v47 + 8, v19 | 7);
      double v22 = v52;
      *(void *)(v21 + 16) = v17;
      *(double *)(v21 + 24) = v22;
      (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))( v21 + v20,  (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v10);
      *(void *)(v21 + v47) = v51;
      swift_retain(v17);
      id v23 = v51;
      dispatch thunk of RunLoopWorkerThread.scheduleAfter(delay:execute:)(sub_1000B0DF4, v21, v18);
      a1 = v51;
      swift_release(v21);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v48);
    }
  }

  id v24 = a1;
  uint64_t v25 = v55;
  uint64_t v26 = v54(a1);
  if (v25)
  {
    swift_release(v17);
    uint64_t v27 = sub_100029E18(&qword_10013E5F0);
    uint64_t v28 = swift_allocObject(v27, 64LL, 7LL);
    *(_OWORD *)(v28 + 16) = xmmword_1000EDBE0;
    unint64_t v29 = sub_1000B0268();
    uint64_t v30 = static JSValue.makeError(from:in:)(v25, v24);
    *(void *)(v28 + 56) = v29;
    *(void *)(v28 + 32) = v30;
    uint64_t v31 = (void *)JSCallable.call(_:)(v28);
    swift_bridgeObjectRelease(v28);

    return swift_errorRelease(0LL);
  }

  else
  {
    uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    id v54 = (uint64_t (*)(id))v26;
    v33((char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), v49, v10);
    uint64_t v34 = *(unsigned __int8 *)(v11 + 80);
    id v51 = v24;
    uint64_t v35 = (v34 + 24) & ~v34;
    uint64_t v55 = 0LL;
    uint64_t v36 = v35 + v12;
    uint64_t v37 = v34 | 7;
    uint64_t v38 = swift_allocObject(&unk_1001240E0, v35 + v12, v34 | 7);
    *(void *)(v38 + 16) = v17;
    unint64_t v39 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
    v39(v38 + v35, v13, v10);
    v33(v13, v56, v10);
    unint64_t v40 = (v36 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v41 = swift_allocObject(&unk_100124108, v40 + 8, v37);
    *(void *)(v41 + 16) = v17;
    v39(v41 + v35, v13, v10);
    id v42 = v51;
    *(void *)(v41 + v40) = v51;
    v57[3] = type metadata accessor for RunLoopWorkerThread(0LL);
    v57[4] = &protocol witness table for RunLoopWorkerThread;
    uint64_t v43 = v50;
    v57[0] = v50;
    swift_retain_n(v17, 2LL);
    id v44 = v42;
    swift_retain(v43);
    uint64_t v45 = v54;
    Promise.then(perform:orCatchError:on:)(sub_1000B0994, v38, sub_1000B0D10, v41, v57);
    swift_release(v45);
    swift_release(v38);
    swift_release(v41);
    sub_100029F4C(v57);
    return swift_release(v17);
  }

uint64_t sub_1000B0258()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

unint64_t sub_1000B0268()
{
  unint64_t result = qword_10013EAE8;
  if (!qword_10013EAE8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___JSValue);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10013EAE8);
  }

  return result;
}

void sub_1000B02A4(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (_BYTE *)(a1 + 16);
  swift_beginAccess(a1 + 16, v40, 0LL, 0LL);
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
  {
    uint64_t v36 = a3;
    uint64_t v37 = a2;
    if (qword_10013BC38 != -1) {
      swift_once(&qword_10013BC38, sub_1000D1514);
    }
    uint64_t v13 = sub_10002A768(v8, (uint64_t)qword_1001485E8);
    uint64_t v14 = *(void (**)(void))(v9 + 16);
    uint64_t v34 = v13;
    uint64_t v35 = v14;
    v14(v11);
    uint64_t v15 = sub_100029E18(&qword_10013EA00);
    uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v17 = *(void *)(v16 + 72);
    uint64_t v18 = *(unsigned __int8 *)(v16 + 80);
    uint64_t v32 = v15;
    uint64_t v31 = ((v18 + 32) & ~v18) + 3 * v17;
    uint64_t v30 = v18 | 7;
    uint64_t v19 = swift_allocObject(v15, v31, v18 | 7);
    __int128 v29 = xmmword_1000EF270;
    *(_OWORD *)(v19 + 16) = xmmword_1000EF270;
    LogMessage.init(stringLiteral:)(0xD00000000000002FLL, 0x80000001000FFF00LL);
    LogMessage.init(stringLiteral:)(0xD000000000000020LL, 0x80000001000FFF30LL);
    v39[3] = &type metadata for Double;
    *(double *)unint64_t v39 = a4;
    static LogMessage.safe(_:)(v39);
    sub_10004C810((uint64_t)v39);
    Logger.error(_:)(v19, v8, &protocol witness table for OSLogger);
    __n128 v20 = swift_bridgeObjectRelease(v19);
    uint64_t v33 = *(void (**)(char *, uint64_t, __n128))(v9 + 8);
    v33(v11, v8, v20);
    swift_beginAccess(v12, v38, 1LL, 0LL);
    *uint64_t v12 = 1;
    uint64_t v21 = sub_100029E18(&qword_10013E5F0);
    uint64_t v22 = swift_allocObject(v21, 64LL, 7LL);
    *(_OWORD *)(v22 + 16) = xmmword_1000EDBE0;
    unint64_t v23 = sub_1000B0268();
    unint64_t v24 = sub_1000AE11C();
    uint64_t v25 = swift_allocError(&type metadata for JSPromiseBindingError, v24, 0LL, 0LL);
    *uint64_t v26 = 1;
    uint64_t v27 = static JSValue.makeError(from:in:)(v25, v36);
    swift_errorRelease(v25);
    *(void *)(v22 + 56) = v23;
    *(void *)(v22 + 32) = v27;
    uint64_t v28 = (void *)JSCallable.call(_:)(v22);
    swift_bridgeObjectRelease(v22);
  }

void sub_1000B0684(void **a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  __chkstk_darwin(v4);
  id v5 = *a1;
  id v6 = (_BYTE *)(a2 + 16);
  swift_beginAccess(a2 + 16, v12, 0LL, 0LL);
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess(v6, v11, 1LL, 0LL);
    *id v6 = 1;
    uint64_t v7 = sub_100029E18(&qword_10013E5F0);
    uint64_t v8 = swift_allocObject(v7, 64LL, 7LL);
    *(_OWORD *)(v8 + 16) = xmmword_1000EDBE0;
    *(void *)(v8 + 56) = sub_1000B0268();
    *(void *)(v8 + 32) = v5;
    id v9 = v5;
    uint64_t v10 = (void *)JSCallable.call(_:)(v8);
    swift_bridgeObjectRelease(v8);
  }

uint64_t sub_1000B0920()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1000B0994(void **a1)
{
}

void sub_1000B09D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for OSLogger(0LL);
  __chkstk_darwin(v7);
  uint64_t v8 = (_BYTE *)(a2 + 16);
  swift_beginAccess(a2 + 16, v15, 0LL, 0LL);
  if ((*(_BYTE *)(a2 + 16) & 1) == 0)
  {
    swift_beginAccess(v8, v14, 1LL, 0LL);
    *uint64_t v8 = 1;
    uint64_t v9 = sub_100029E18(&qword_10013E5F0);
    uint64_t v10 = swift_allocObject(v9, 64LL, 7LL);
    *(_OWORD *)(v10 + 16) = xmmword_1000EDBE0;
    unint64_t v11 = sub_1000B0268();
    uint64_t v12 = static JSValue.makeError(from:in:)(a1, a4);
    *(void *)(v10 + 56) = v11;
    *(void *)(v10 + 32) = v12;
    uint64_t v13 = (void *)JSCallable.call(_:)(v10);
    swift_bridgeObjectRelease(v10);
  }

uint64_t sub_1000B0C80()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_1000B0D10(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSCallable(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  sub_1000B09D4( a1,  *(void *)(v1 + 16),  v1 + v4,  *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_1000B0D64()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  swift_release(*(void *)(v0 + 16));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_1000B0DF4()
{
  uint64_t v1 = *(void *)(type metadata accessor for JSCallable(0LL) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_1000B02A4( *(void *)(v0 + 16),  v0 + v2,  *(void *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8LL)),  *(double *)(v0 + 24));
}

uint64_t storeEnumTagSinglePayload for JSPromiseBindingError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000B0E88 + 4 * byte_1000F0465[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000B0EBC + 4 * asc_1000F0460[v4]))();
}

uint64_t sub_1000B0EBC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000B0EC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000B0ECCLL);
  }
  return result;
}

uint64_t sub_1000B0ED8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000B0EE0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1000B0EE4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000B0EEC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JSPromiseBindingError()
{
  return &type metadata for JSPromiseBindingError;
}

unint64_t sub_1000B0F0C()
{
  unint64_t result = qword_10013F258;
  if (!qword_10013F258)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F04C8, &type metadata for JSPromiseBindingError);
    atomic_store(result, (unint64_t *)&qword_10013F258);
  }

  return result;
}

void *sub_1000B0F50()
{
  uint64_t v0 = JSRequest.options.getter();
  if (!*(void *)(v0 + 16) || (unint64_t v1 = sub_10008D45C(0xD000000000000012LL, 0x80000001000FF490LL), (v2 & 1) == 0))
  {
    __int128 v7 = 0u;
    __int128 v8 = 0u;
    swift_bridgeObjectRelease(v0);
    goto LABEL_7;
  }

  sub_100060108(*(void *)(v0 + 56) + 32 * v1, (uint64_t)&v7);
  swift_bridgeObjectRelease(v0);
  if (!*((void *)&v8 + 1))
  {
LABEL_7:
    sub_10004C810((uint64_t)&v7);
    return &_swiftEmptySetSingleton;
  }

  sub_1000445E4(&v7, v9);
  sub_100060108((uint64_t)v9, (uint64_t)&v7);
  uint64_t v3 = sub_100029E18(&qword_10013F040);
  if (!swift_dynamicCast(&v6, &v7, (char *)&type metadata for Any + 8, v3, 6LL))
  {
    sub_100029F4C(v9);
    return &_swiftEmptySetSingleton;
  }

  uint64_t v4 = v6;
  sub_100029F4C(v9);
  return (void *)v4;
}

uint64_t *initializeBufferWithCopyOfBuffer for JSStackBootstrap(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = (uint64_t)v4;
  swift_retain(v3);
  id v5 = v4;
  return a1;
}

void destroy for JSStackBootstrap(uint64_t a1)
{
}

uint64_t *assignWithCopy for JSStackBootstrap(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  uint64_t v6 = (void *)a2[1];
  __int128 v7 = (void *)a1[1];
  a1[1] = (uint64_t)v6;
  id v8 = v6;

  return a1;
}

void *assignWithTake for JSStackBootstrap(void *a1, _OWORD *a2)
{
  uint64_t v4 = (void *)a1[1];
  *(_OWORD *)a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for XPCConnectionOwner.ActiveConnection(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCConnectionOwner.ActiveConnection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)unint64_t result = a2 ^ 0x80000000;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JSStackBootstrap()
{
  return &type metadata for JSStackBootstrap;
}

uint64_t destroy for JSStackBootstrap.Result(void *a1)
{
  unint64_t v1 = a1 + 1;
  swift_release(*a1);
  return sub_100029F4C(v1);
}

uint64_t initializeWithCopy for JSStackBootstrap.Result(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)a1 = *a2;
  uint64_t v4 = a2 + 1;
  __int128 v5 = *((_OWORD *)a2 + 2);
  *(_OWORD *)(a1 + 32) = v5;
  uint64_t v6 = v5;
  __int128 v7 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v5 - 8);
  swift_retain(v3);
  v7(a1 + 8, v4, v6);
  return a1;
}

uint64_t *assignWithCopy for JSStackBootstrap.Result(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 + 1;
  uint64_t v3 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_retain(v3);
  swift_release(v5);
  sub_10002AEBC(a1 + 1, v4);
  return a1;
}

uint64_t *assignWithTake for JSStackBootstrap.Result(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  sub_100029F4C(a1 + 1);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  a1[5] = a2[5];
  return a1;
}

uint64_t getEnumTagSinglePayload for JSStackBootstrap.Result(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSStackBootstrap.Result(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for JSStackBootstrap.Result()
{
  return &type metadata for JSStackBootstrap.Result;
}

uint64_t sub_1000B13A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1 + *(int *)(sub_100029E18(&qword_10013EDC0) + 48);
  uint64_t v4 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, v3, v4);
}

uint64_t sub_1000B1408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v26 = a1;
  uint64_t v3 = sub_100029E18(&qword_10013F308);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v28 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v25 - v7;
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - v9;
  uint64_t v11 = a1 + *(int *)(sub_100029E18(&qword_10013F310) + 48);
  uint64_t v12 = *(int *)(v3 + 48);
  uint64_t v13 = v11 + v12;
  uint64_t v14 = (__int128 *)&v10[v12];
  uint64_t v15 = type metadata accessor for JSPackageIndex(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v17(v10, v11, v15);
  sub_1000388F0(v13, (uint64_t)v14);
  uint64_t v18 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  uint64_t v19 = v27;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16LL))(v27, v26, v18);
  __n128 v20 = &v8[*(int *)(v3 + 48)];
  v17(v8, (uint64_t)v10, v15);
  sub_1000388F0((uint64_t)v14, (uint64_t)v20);
  uint64_t v21 = (__int128 *)&v28[*(int *)(v3 + 48)];
  uint64_t v22 = *(void (**)(void))(v16 + 32);
  v22();
  sub_10002C438(v14, (uint64_t)v21);
  uint64_t v23 = type metadata accessor for JSStackBootstrap.JSPackage(0LL);
  ((void (*)(uint64_t, char *, uint64_t))v22)(v19 + *(int *)(v23 + 20), v8, v15);
  sub_10002C438(v21, v19 + *(int *)(v23 + 24));
  (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v15);
  return sub_100029F4C(v20);
}

void sub_1000B15D4(void *a1)
{
  id v1 = [a1 virtualMachine];
  if (v1)
  {
    id v2 = v1;
    [v1 shrinkFootprintWhenIdle];
  }

  else
  {
    __break(1u);
  }

uint64_t sub_1000B161C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[31] = a2;
  v3[32] = a3;
  v3[30] = a1;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  v3[33] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OSLogger(0LL);
  v3[34] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[35] = v6;
  v3[36] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for AppleServicesLocalizer.Configuration(0LL);
  v3[37] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v3[38] = v8;
  unint64_t v9 = (*(void *)(v8 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[39] = swift_task_alloc(v9);
  v3[40] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for Bag(0LL);
  v3[41] = v10;
  v3[42] = swift_task_alloc((*(void *)(*(void *)(v10 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for BagLanguageSource(0LL);
  v3[43] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[44] = v12;
  v3[45] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for JetPackPath(0LL);
  v3[46] = swift_task_alloc((*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for LocalizedStringsBundle(0LL);
  v3[47] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[48] = v15;
  v3[49] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000B176C, 0LL, 0LL);
}

uint64_t sub_1000B176C()
{
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[31];
  uint64_t v3 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  v0[5] = v3;
  v0[6] = &protocol witness table for DiskJetPackResourceBundle;
  uint64_t v4 = sub_10002C328(v0 + 2);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(v4, v2, v3);
  JetPackPath.init(_:)(0x736A2E7865646E69LL, 0xE800000000000000LL);
  LocalizedStringsBundle.init(resourceBundle:indexPath:)(v0 + 2, v1);
  uint64_t v5 = v0[48];
  uint64_t v6 = v0[47];
  uint64_t v7 = v0[45];
  uint64_t v17 = v0[49];
  uint64_t v18 = v0[44];
  unint64_t v9 = (void *)v0[42];
  uint64_t v8 = v0[43];
  uint64_t v10 = v0[41];
  uint64_t v11 = v0[32];
  uint64_t v12 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v9, v10, v11, v10, v12);
  BagLanguageSource.init(bag:)(v9);
  v0[15] = v6;
  v0[16] = &protocol witness table for LocalizedStringsBundle;
  uint64_t v13 = sub_10002C328(v0 + 12);
  (*(void (**)(void *, uint64_t, uint64_t))(v5 + 16))(v13, v17, v6);
  v0[10] = v8;
  v0[11] = &protocol witness table for BagLanguageSource;
  uint64_t v14 = sub_10002C328(v0 + 7);
  (*(void (**)(void *, uint64_t, uint64_t))(v18 + 16))(v14, v7, v8);
  swift_retain(v11);
  AppleServicesLocalizer.Configuration.init(dataSource:languageSource:objectGraph:)(v0 + 12, v0 + 7, v11);
  v0[50] = objc_msgSend((id)objc_opt_self(NSBundle), "asc_frameworkBundle");
  uint64_t v15 = (void *)swift_task_alloc(async function pointer to BagLanguageSource.fetchLanguages()[1]);
  v0[51] = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_1000B1B4C;
  return BagLanguageSource.fetchLanguages()();
}

uint64_t sub_1000B1B4C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  uint64_t v5 = *(void *)(*(void *)v2 + 408LL);
  *(void *)(*(void *)v2 + 416LL) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = (void *)v4[50];
    (*(void (**)(void, void))(v4[38] + 8LL))(v4[39], v4[37]);

    uint64_t v7 = sub_1000B1E28;
  }

  else
  {
    v4[53] = a1;
    uint64_t v7 = sub_1000B1BD8;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_1000B1BD8()
{
  uint64_t v1 = v0[53];
  uint64_t v2 = v0[50];
  uint64_t v3 = v0[39];
  uint64_t v4 = v0[37];
  uint64_t v5 = v0[38];
  v0[20] = type metadata accessor for LocalizedStringTable(0LL);
  v0[21] = &protocol witness table for LocalizedStringTable;
  sub_10002C328(v0 + 17);
  LocalizedStringTable.init(targetBundle:languageCodes:)(v2, v1);
  AppleServicesLocalizer.Configuration.withNativeStringsDataSource(_:)(v0 + 17);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v0[54] = v6;
  v6(v3, v4);
  sub_100029F4C(v0 + 17);
  v0[55] = type metadata accessor for AppleServicesLocalizer(0LL);
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to static AppleServicesLocalizer.load(using:)[1]);
  v0[56] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_1000B1CBC;
  return static AppleServicesLocalizer.load(using:)(v0[40]);
}

uint64_t sub_1000B1CBC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 448);
  *(void *)(*v2 + 456) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_1000B208C;
  }

  else
  {
    *(void *)(v4 + 464) = a1;
    uint64_t v6 = sub_1000B1D30;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000B1D30()
{
  uint64_t v1 = *(void *)(v0 + 464);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(v0 + 432);
  uint64_t v4 = *(void *)(v0 + 384);
  uint64_t v3 = *(void *)(v0 + 392);
  uint64_t v6 = *(void *)(v0 + 368);
  uint64_t v5 = *(void *)(v0 + 376);
  uint64_t v8 = *(void *)(v0 + 352);
  uint64_t v7 = *(void *)(v0 + 360);
  uint64_t v10 = *(void *)(v0 + 336);
  uint64_t v9 = *(void *)(v0 + 344);
  uint64_t v11 = *(void *)(v0 + 320);
  uint64_t v15 = *(void *)(v0 + 312);
  uint64_t v12 = *(void *)(v0 + 296);
  uint64_t v16 = *(void *)(v0 + 288);
  uint64_t v17 = *(void *)(v0 + 264);
  uint64_t v13 = *(void **)(v0 + 240);
  v13[3] = *(void *)(v0 + 440);
  v13[4] = &protocol witness table for AppleServicesLocalizer;
  *uint64_t v13 = v1;
  v2(v11, v12);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(v3);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B1E28()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  (*(void (**)(void, void))(*(void *)(v0 + 352) + 8LL))(*(void *)(v0 + 360), *(void *)(v0 + 344));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void *)(v0 + 416);
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v22 = *(void *)(v0 + 392);
  uint64_t v23 = *(void *)(v0 + 368);
  uint64_t v24 = *(void *)(v0 + 360);
  uint64_t v25 = *(void *)(v0 + 336);
  uint64_t v26 = *(void *)(v0 + 320);
  uint64_t v27 = *(void *)(v0 + 312);
  uint64_t v5 = *(void *)(v0 + 280);
  uint64_t v6 = *(void *)(v0 + 288);
  uint64_t v21 = v5;
  uint64_t v8 = *(void *)(v0 + 264);
  uint64_t v7 = *(void *)(v0 + 272);
  uint64_t v9 = sub_10002A768(v7, (uint64_t)qword_1001485E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v9, v7);
  uint64_t v10 = sub_100029E18(&qword_10013EA00);
  uint64_t v11 = type metadata accessor for LogMessage(0LL);
  uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL))
        + *(void *)(*(void *)(v11 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(60LL, 1LL);
  v13._object = (void *)0x8000000100100020LL;
  v13._uint64_t countAndFlagsBits = 0xD00000000000003CLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v13);
  swift_getErrorValue(v4, v0 + 232, v0 + 208);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v15 = *(void *)(v0 + 216);
  *(void *)(v0 + 200) = v15;
  uint64_t v16 = sub_10002C328((void *)(v0 + 176));
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16LL))(v16, v14, v15);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 + 176);
  sub_10002E92C(v0 + 176, &qword_10013C6F0);
  v17._uint64_t countAndFlagsBits = 0LL;
  v17._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  LogMessage.init(stringInterpolation:)(v8);
  Logger.error(_:)(v12, v7, &protocol witness table for OSLogger);
  __n128 v18 = swift_bridgeObjectRelease(v12);
  uint64_t v19 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v21 + 8))(v6, v7, v18);
  swift_willThrow(v19);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v6);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B208C()
{
  uint64_t v2 = *(void *)(v0 + 384);
  uint64_t v1 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 376);
  uint64_t v5 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 344);
  (*(void (**)(void, void))(v0 + 432))(*(void *)(v0 + 320), *(void *)(v0 + 296));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v7 = *(void *)(v0 + 456);
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v25 = *(void *)(v0 + 392);
  uint64_t v26 = *(void *)(v0 + 368);
  uint64_t v27 = *(void *)(v0 + 360);
  uint64_t v28 = *(void *)(v0 + 336);
  uint64_t v29 = *(void *)(v0 + 320);
  uint64_t v30 = *(void *)(v0 + 312);
  uint64_t v8 = *(void *)(v0 + 280);
  uint64_t v9 = *(void *)(v0 + 288);
  uint64_t v24 = v8;
  uint64_t v11 = *(void *)(v0 + 264);
  uint64_t v10 = *(void *)(v0 + 272);
  uint64_t v12 = sub_10002A768(v10, (uint64_t)qword_1001485E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v9, v12, v10);
  uint64_t v13 = sub_100029E18(&qword_10013EA00);
  uint64_t v14 = type metadata accessor for LogMessage(0LL);
  uint64_t v15 = swift_allocObject( v13,  ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL))
        + *(void *)(*(void *)(v14 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(60LL, 1LL);
  v16._object = (void *)0x8000000100100020LL;
  v16._uint64_t countAndFlagsBits = 0xD00000000000003CLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v16);
  swift_getErrorValue(v7, v0 + 232, v0 + 208);
  uint64_t v17 = *(void *)(v0 + 208);
  uint64_t v18 = *(void *)(v0 + 216);
  *(void *)(v0 + 200) = v18;
  uint64_t v19 = sub_10002C328((void *)(v0 + 176));
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16LL))(v19, v17, v18);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 + 176);
  sub_10002E92C(v0 + 176, &qword_10013C6F0);
  v20._uint64_t countAndFlagsBits = 0LL;
  v20._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v20);
  LogMessage.init(stringInterpolation:)(v11);
  Logger.error(_:)(v15, v10, &protocol witness table for OSLogger);
  __n128 v21 = swift_bridgeObjectRelease(v15);
  uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v24 + 8))(v9, v10, v21);
  swift_willThrow(v22);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v9);
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1000B2308(uint64_t a1, void *a2)
{
  unint64_t v31 = ASCSignpostTagUnique();
  [(id)objc_opt_self(ASCViewRender) jsStackBootstrapDidBeginWithTag:v31];
  id result = [objc_allocWithZone(JSVirtualMachine) init];
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = sub_1000B3784(result, a1);
    unint64_t v7 = sub_100032130();
    unint64_t v33 = v7;
    uint64_t v34 = &protocol witness table for OS_dispatch_queue;
    v32[0] = a2;
    uint64_t v8 = swift_allocObject(&unk_100124348, 32LL, 7LL);
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 24) = a2;
    id v9 = a2;
    swift_retain(a1);
    uint64_t v10 = sub_100029E18(&qword_10013F260);
    uint64_t v11 = sub_100044410(&qword_10013F268, &qword_10013F260, (uint64_t)&protocol conformance descriptor for Promise<A>);
    uint64_t v30 = v6;
    uint64_t v29 = Promise.flatMap<A>(on:_:)(v32, sub_1000B3B4C, v8, v10, v11);
    swift_release(v8);
    sub_100029F4C(v32);
    uint64_t v12 = Promise.join<A>(with:)(v29, v10, v11);
    unint64_t v33 = v7;
    uint64_t v34 = &protocol witness table for OS_dispatch_queue;
    v32[0] = v9;
    uint64_t v13 = swift_allocObject(&unk_100124370, 32LL, 7LL);
    *(void *)(v13 + 16) = a1;
    *(void *)(v13 + 24) = v9;
    uint64_t v14 = swift_allocObject(&unk_100124398, 32LL, 7LL);
    *(void *)(v14 + 16) = sub_1000B3B84;
    *(void *)(v14 + 24) = v13;
    id v15 = v9;
    swift_retain(a1);
    uint64_t v16 = sub_100029E18(&qword_10013F270);
    uint64_t v17 = Promise.map<A>(on:_:)(v32, sub_1000B3BCC, v14, v16);
    swift_release(v14);
    swift_release(v12);
    sub_100029F4C(v32);
    unint64_t v33 = v7;
    uint64_t v34 = &protocol witness table for OS_dispatch_queue;
    v32[0] = v15;
    uint64_t v18 = (void *)swift_allocObject(&unk_1001243C0, 40LL, 7LL);
    v18[2] = a1;
    v18[3] = v15;
    v18[4] = v5;
    id v19 = v15;
    swift_retain(a1);
    id v20 = v5;
    uint64_t v21 = sub_100029E18(&qword_10013F278);
    uint64_t v22 = sub_100044410(&qword_10013F280, &qword_10013F278, (uint64_t)&protocol conformance descriptor for Promise<A>);
    uint64_t v23 = Promise.flatMap<A>(on:_:)(v32, sub_1000B3C5C, v18, v21, v22);
    swift_release(v18);
    swift_release(v17);
    sub_100029F4C(v32);
    uint64_t v24 = swift_allocObject(&unk_1001243E8, 24LL, 7LL);
    *(void *)(v24 + 16) = v31;
    uint64_t v25 = static OS_dispatch_queue.main.getter();
    unint64_t v33 = v7;
    uint64_t v34 = &protocol witness table for OS_dispatch_queue;
    v32[0] = v25;
    Promise.always(on:perform:)(v32, sub_1000B3C7C, v24);
    swift_release(v24);
    sub_100029F4C(v32);
    uint64_t v26 = Promise.join<A>(with:)(v29, v10, v11);
    unint64_t v33 = v7;
    uint64_t v34 = &protocol witness table for OS_dispatch_queue;
    v32[0] = v19;
    id v27 = v19;
    uint64_t v28 = Promise.map<A>(on:_:)(v32, sub_1000B282C, 0LL, &type metadata for JSStackBootstrap.Result);
    swift_release(v30);
    swift_release(v29);
    swift_release(v23);
    swift_release(v26);

    sub_100029F4C(v32);
    return (id)v28;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1000B268C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (v11 + 16) & ~v11;
  unint64_t v13 = (v9 + v12 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v14 = swift_allocObject(&unk_100124410, v13 + 8, v11 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v14 + v12, v10, v7);
  *(void *)(v14 + v13) = a2;
  sub_100029E18(&qword_10013F260);
  uint64_t v15 = swift_retain(a2);
  uint64_t v16 = Promise.__allocating_init()(v15);
  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v6, 1LL, 1LL, v17);
  uint64_t v18 = (void *)swift_allocObject(&unk_100124438, 56LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_10013F2A0;
  v18[5] = v14;
  v18[6] = v16;
  swift_retain(v16);
  uint64_t v19 = sub_1000B3448((uint64_t)v6, (uint64_t)&unk_10013F2B0, (uint64_t)v18);
  swift_release(v19);
  return v16;
}

uint64_t sub_1000B282C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  sub_1000388F0((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  *a2 = v3;
  return swift_retain(v3);
}

uint64_t sub_1000B2870(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  void v6[2] = a6;
  uint64_t v8 = type metadata accessor for ActionOutcome(0LL);
  v6[3] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v6[4] = v9;
  uint64_t v10 = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v6[5] = v10;
  unint64_t v13 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v11 = (void *)swift_task_alloc(a4[1]);
  v6[6] = v11;
  *uint64_t v11 = v6;
  v11[1] = sub_1000B2908;
  return v13(v10);
}

uint64_t sub_1000B2908()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 48LL);
  *(void *)(*(void *)v1 + 56LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B29C4;
  }
  else {
    uint64_t v3 = sub_1000B296C;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B296C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 24);
  Promise.resolve(_:)(v1);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc(*(void *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B29C4()
{
  uint64_t v1 = *(void *)(v0 + 56);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  swift_task_dealloc(*(void *)(v0 + 40));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2A0C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 16) = a6;
  uint64_t v9 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 24) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B2A64;
  return v9();
}

uint64_t sub_1000B2A64()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 24LL);
  *(void *)(*(void *)v1 + 32LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B2AF8;
  }
  else {
    uint64_t v3 = sub_1000B2AC8;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B2AC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000B2AF8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2B38(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 32) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B2BA0;
  return v9(v6 + 16);
}

uint64_t sub_1000B2BA0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B2C40;
  }
  else {
    uint64_t v3 = sub_1000B2C04;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B2C04()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2C40()
{
  uint64_t v1 = *(void *)(v0 + 40);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2C80(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 32) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B2CE8;
  return v9(v6 + 16);
}

uint64_t sub_1000B2CE8()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B4AC4;
  }
  else {
    uint64_t v3 = sub_1000B4ACC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B2D4C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  void v6[2] = a6;
  uint64_t v8 = sub_100029E18(&qword_10013EDC0);
  uint64_t v9 = swift_task_alloc((*(void *)(*(void *)(v8 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v6[3] = v9;
  uint64_t v12 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v10 = (void *)swift_task_alloc(a4[1]);
  v6[4] = v10;
  *uint64_t v10 = v6;
  v10[1] = sub_1000B2DE0;
  return v12(v9);
}

uint64_t sub_1000B2DE0()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B2E90;
  }
  else {
    uint64_t v3 = sub_1000B2E44;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B2E44()
{
  uint64_t v1 = *(void *)(v0 + 24);
  Promise.resolve(_:)(v1);
  sub_10002E92C(v1, &qword_10013EDC0);
  swift_task_dealloc(*(void *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2E90()
{
  uint64_t v1 = *(void *)(v0 + 40);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  swift_task_dealloc(*(void *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2ED8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 32) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 40) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B2F40;
  return v9(v6 + 16);
}

uint64_t sub_1000B2F40()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 40LL);
  *(void *)(*(void *)v1 + 48LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B2FE0;
  }
  else {
    uint64_t v3 = sub_1000B2FA4;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B2FA4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B2FE0()
{
  uint64_t v1 = *(void *)(v0 + 48);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B3020(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 32) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B3088;
  return v9(v6 + 16);
}

uint64_t sub_1000B3088()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B4AC4;
  }
  else {
    uint64_t v3 = sub_1000B30EC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B30EC()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B3128(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 56) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 64) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B3190;
  return v9(v6 + 16);
}

uint64_t sub_1000B3190()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64LL);
  *(void *)(*(void *)v1 + 72LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B4AC8;
  }
  else {
    uint64_t v3 = sub_1000B4ABC;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B31F4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 24) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 32) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B325C;
  return v9(v6 + 16);
}

uint64_t sub_1000B325C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 32LL);
  *(void *)(*(void *)v1 + 40LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B4AC4;
  }
  else {
    uint64_t v3 = sub_1000B32C0;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B32C0()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B32FC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  *(void *)(v6 + 56) = a6;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  uint64_t v7 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v6 + 64) = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_1000B3364;
  return v9(v6 + 16);
}

uint64_t sub_1000B3364()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 64LL);
  *(void *)(*(void *)v1 + 72LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000B3408;
  }
  else {
    uint64_t v3 = sub_1000B33C8;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000B33C8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B3408()
{
  uint64_t v1 = *(void *)(v0 + 72);
  Promise.reject(_:)(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000B3448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10002E92C(a1, &qword_10013CE40);
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
  uint64_t v16 = swift_allocObject(&unk_100124460, 32LL, 7LL);
  *(void *)(v16 + Promise.resolve(_:)(v0 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    void v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10013F2C0, v16);
}

uint64_t sub_1000B3594(uint64_t a1)
{
  uint64_t v20 = a1;
  uint64_t v2 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100032130();
  uint64_t v13 = swift_retain(a1);
  static DispatchQoS.userInitiated.getter(v13);
  uint64_t v14 = sub_100029E18(&qword_10013D2F0);
  uint64_t v15 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
        + *(void *)(v7 + 72),
          *(unsigned __int8 *)(v7 + 80) | 7LL);
  *(_OWORD *)(v15 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  static OS_dispatch_queue.Attributes.concurrent.getter();
  uint64_t v21 = v15;
  unint64_t v16 = sub_100097F9C();
  uint64_t v17 = sub_100029E18(&qword_10013D2F8);
  uint64_t v18 = sub_100044410( (unint64_t *)&qword_10013DDA0,  &qword_10013D2F8,  (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v17, v18, v6, v16);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v2);
  OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD00000000000001ALL,  0x8000000100100060LL,  v12,  v9,  v5,  0LL);
  return v20;
}

uint64_t sub_1000B3784(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013F2C8);
  uint64_t v43 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100029E18((uint64_t *)&unk_10013EDD0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for JSJetPackFetcher(0LL);
  uint64_t v12 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v44, v11, a2, v11, v12);
  uint64_t v13 = v44[0];
  uint64_t v14 = sub_100029E18((uint64_t *)&unk_10013DF10);
  uint64_t v15 = ((uint64_t (*)(void))AnyPipelineTask.run())();
  uint64_t v42 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v45 = v42;
  uint64_t v46 = &protocol witness table for SyncTaskScheduler;
  unint64_t v16 = sub_10002C328(v44);
  SyncTaskScheduler.init()(v16);
  uint64_t v17 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  uint64_t v41 = Promise.map<A>(on:_:)(v44, sub_1000B13A4, 0LL, v17);
  swift_release(v15);
  sub_100029F4C(v44);
  sub_1000A3B94((uint64_t)v10);
  uint64_t v40 = AnyPipelineTask.run()(v7);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v18 = swift_allocObject(&unk_100124488, 24LL, 7LL);
  *(void *)(v18 + Promise.resolve(_:)(v0 + 16) = a1;
  uint64_t v19 = swift_allocObject(&unk_1001244B0, 32LL, 7LL);
  *(void *)(v19 + Promise.resolve(_:)(v0 + 16) = sub_1000B4480;
  *(void *)(v19 + 24) = v18;
  id v20 = a1;
  uint64_t v21 = sub_100029E18(&qword_10013F2D0);
  uint64_t v22 = sub_100044410( &qword_10013EF88,  (uint64_t *)&unk_10013DF10,  (uint64_t)&protocol conformance descriptor for AnyPipelineTask<A>);
  uint64_t v23 = PipelineTask.mapTaskOutput<A>(_:)(sub_1000B4498, v19, v14, v21, v22);
  swift_release(v19);
  v44[0] = v23;
  uint64_t v24 = sub_100029E18(&qword_10013F2D8);
  uint64_t v25 = sub_100044410( &qword_10013F2E0,  &qword_10013F2D8,  (uint64_t)&protocol conformance descriptor for MapPipelineTask<A, B>);
  PipelineTask.eraseToAnyPipelineTask()(v24, v25);
  swift_release(v23);
  uint64_t v26 = AnyPipelineTask.run()(v4);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v4);
  uint64_t v27 = sub_100029E18(&qword_10013F2E8);
  uint64_t v28 = sub_100044410(&qword_10013F2F0, &qword_10013F2E8, (uint64_t)&protocol conformance descriptor for Promise<A>);
  uint64_t v29 = v40;
  uint64_t v30 = Promise.join<A>(with:)(v26, v27, v28);
  uint64_t v31 = sub_100029E18(&qword_10013F2F8);
  uint64_t v32 = sub_100044410(&qword_10013F300, &qword_10013F2F8, (uint64_t)&protocol conformance descriptor for Promise<A>);
  uint64_t v33 = v41;
  uint64_t v34 = Promise.join<A>(with:)(v30, v31, v32);
  swift_release(v30);
  uint64_t v45 = v42;
  uint64_t v46 = &protocol witness table for SyncTaskScheduler;
  uint64_t v35 = sub_10002C328(v44);
  SyncTaskScheduler.init()(v35);
  uint64_t v36 = type metadata accessor for JSStackBootstrap.JSPackage(0LL);
  uint64_t v37 = Promise.map<A>(on:_:)(v44, sub_1000B1408, 0LL, v36);
  swift_release(v13);
  swift_release(v33);
  swift_release(v29);
  swift_release(v26);
  swift_release(v34);
  sub_100029F4C(v44);
  return v37;
}

uint64_t sub_1000B3B4C(uint64_t a1)
{
  return sub_1000B268C(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000B3B58()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000B3B84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + 16);
  uint64_t v6 = type metadata accessor for JSStackBootstrap.JSPackage(0LL);
  return sub_1000B3CB0(a2, a1 + *(int *)(v6 + 20), a1 + *(int *)(v6 + 24), v5);
}

uint64_t sub_1000B3BCC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v6 = sub_100029E18(&qword_10013F288);
  uint64_t result = v5(a1, a1 + *(int *)(v6 + 48));
  *a2 = result;
  return result;
}

uint64_t sub_1000B3C28()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000B3C5C(uint64_t *a1)
{
  return sub_1000B3FE8(*a1, *(void **)(v1 + 32), *(void *)(v1 + 16));
}

uint64_t sub_1000B3C6C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_1000B3C7C()
{
  return [(id)objc_opt_self(ASCViewRender) jsStackBootstrapDidEndWithTag:*(void *)(v0 + 16)];
}

uint64_t sub_1000B3CB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v44 = a3;
  uint64_t v6 = type metadata accessor for Bag(0LL);
  uint64_t v43 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (uint64_t *)((char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v9 = type metadata accessor for Dependency(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = JSPackageIndex.properties.getter(v11);
  uint64_t v15 = sub_10009E668(v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v16 = sub_100029E18(&qword_10013C6B0);
  sub_1000388F0(a1, (uint64_t)v46);
  Dependency.init<A>(satisfying:with:)(v16, v46, v16);
  uint64_t v17 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v13);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  uint64_t v18 = swift_retain(v17);
  id v41 = sub_10009CC30(v18, v15);
  uint64_t v19 = swift_retain(a4);
  id v42 = sub_10009DF24(v19);
  swift_release(a4);
  id v20 = (objc_class *)type metadata accessor for JSMediaTokensObject(0LL);
  uint64_t v21 = (char *)objc_allocWithZone(v20);
  uint64_t v22 = OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_cachedServices;
  id v23 = objc_allocWithZone(&OBJC_CLASS___NSCache);
  swift_retain(a4);
  uint64_t v24 = v21;
  *(void *)&v21[v22] = [v23 init];
  uint64_t v25 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v8, v6, a4, v6, v25);
  (*(void (**)(char *, void *, uint64_t))(v43 + 32))( &v24[OBJC_IVAR____TtC19appstorecomponentsd19JSMediaTokensObject_bag],  v8,  v6);

  v45.receiver = v24;
  v45.super_class = v20;
  id v26 = objc_msgSendSuper2(&v45, "init");
  swift_release(a4);
  uint64_t v27 = sub_100029E18(&qword_10013F290);
  uint64_t v28 = type metadata accessor for JSStack.Prerequisite(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  uint64_t v30 = *(void *)(v29 + 72);
  uint64_t v31 = *(unsigned __int8 *)(v29 + 80);
  uint64_t v32 = (v31 + 32) & ~v31;
  uint64_t v33 = swift_allocObject(v27, v32 + 4 * v30, v31 | 7);
  *(_OWORD *)(v33 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EEB80;
  uint64_t v34 = (void *)(v33 + v32);
  *uint64_t v34 = 7041889LL;
  v34[1] = 0xE300000000000000LL;
  v34[2] = v41;
  uint64_t v35 = *(void (**)(void))(v29 + 104);
  ((void (*)(uint64_t, void, uint64_t))v35)( v33 + v32,  enum case for JSStack.Prerequisite.globalObject(_:),  v28);
  uint64_t v36 = (void *)(v33 + v32 + v30);
  *uint64_t v36 = 0xD00000000000001ALL;
  v36[1] = 0x8000000100100000LL;
  void v36[2] = v42;
  v35();
  uint64_t v37 = (void *)(v33 + v32 + 2 * v30);
  *uint64_t v37 = 0x6B6F54616964656DLL;
  v37[1] = 0xEB00000000736E65LL;
  v37[2] = v26;
  v35();
  uint64_t v38 = v33 + v32 + 3 * v30;
  sub_1000388F0(v44, v38);
  ((void (*)(uint64_t, void, uint64_t))v35)(v38, enum case for JSStack.Prerequisite.source(_:), v28);
  swift_release(v17);
  return v33;
}

uint64_t sub_1000B3FE8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for JSStack.StandardGlobalConfiguration(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v20 - v12;
  static JSStack.StandardGlobalConfiguration.default.getter(v11);
  JSStack.StandardGlobalConfiguration.isProtocolHandlingEnabled.setter(0LL);
  type metadata accessor for JSStack(0LL);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v13, v6);
  swift_retain(a3);
  id v14 = a2;
  swift_bridgeObjectRetain(a1);
  uint64_t v15 = JSStack.__allocating_init(asPartOf:virtualMachine:configuration:customPrerequisites:)(a3, v14, v10, a1);
  JSStack.withUnsafeContext(_:)(sub_1000B15D4, 0LL);
  if (os_variant_has_internal_content("com.apple.appstorecomponentsd"))
  {
    id v16 = [(id)objc_opt_self(ASCDefaults) daemonDefaults];
    unsigned int v17 = [v16 enableWebInspector];

    if (v17)
    {
      JSStack.makeRemoteInspectable()();
      sub_10001E5DC((uint64_t)"JSStack created");
    }
  }

  sub_100029E18(&qword_10013F278);
  v20[0] = v15;
  uint64_t v18 = Promise.__allocating_init(value:)(v20);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v18;
}

uint64_t type metadata accessor for JSStackBootstrap.JSPackage(uint64_t a1)
{
  uint64_t result = qword_10013F3C0;
  if (!qword_10013F3C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSStackBootstrap.JSPackage);
  }
  return result;
}

uint64_t sub_1000B41FC()
{
  uint64_t v1 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_1000B4270(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for DiskJetPackResourceBundle(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1 + v5;
  uint64_t v7 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v8 = (void *)swift_task_alloc(dword_10013F29C);
  *(void *)(v2 + Promise.resolve(_:)(v0 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10002A858;
  return sub_1000B161C(a1, v6, v7);
}

uint64_t sub_1000B4300()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000B4334(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10013F2AC);
  *(void *)(v2 + Promise.resolve(_:)(v0 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10002A858;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F2A8
                                                                                     + dword_10013F2A8))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000B43C8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000B43EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_10013F2BC);
  *(void *)(v2 + Promise.resolve(_:)(v0 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100039088;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10013F2B8 + dword_10013F2B8))(a1, v4);
}

uint64_t sub_1000B445C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000B4480(uint64_t a1, uint64_t a2)
{
  return sub_1000A41C8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000B4498(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = sub_100029E18(&qword_10013EDC0);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t *sub_1000B44F4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = type metadata accessor for DiskJetPackResourceBundle(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for JSPackageIndex(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    __int128 v13 = *(_OWORD *)((char *)a2 + v12 + 24);
    *(_OWORD *)((char *)a1 + v12 + 24) = v13;
    (**(void (***)(void))(v13 - 8))();
  }

  return a1;
}

uint64_t sub_1000B45C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for JSPackageIndex(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
  return sub_100029F4C((void *)(a1 + *(int *)(a2 + 24)));
}

uint64_t sub_1000B4638(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for JSPackageIndex(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  __int128 v12 = *(_OWORD *)(a2 + v11 + 24);
  *(_OWORD *)(a1 + v11 + 24) = v12;
  (**(void (***)(void))(v12 - 8))();
  return a1;
}

uint64_t sub_1000B46E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for JSPackageIndex(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  sub_10002AEBC((void *)(a1 + *(int *)(a3 + 24)), (void *)(a2 + *(int *)(a3 + 24)));
  return a1;
}

uint64_t sub_1000B4774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for JSPackageIndex(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  __int128 v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + Promise.resolve(_:)(v0 + 16) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  return a1;
}

uint64_t sub_1000B4814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for JSPackageIndex(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  sub_100029F4C((void *)(a1 + v11));
  __int128 v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + Promise.resolve(_:)(v0 + 16) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  return a1;
}

uint64_t sub_1000B48BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000B48C8);
}

uint64_t sub_1000B48C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
    return v9(v10, a2, v8);
  }

  uint64_t v11 = type metadata accessor for JSPackageIndex(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v11;
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }

  unint64_t v14 = *(void *)(a1 + *(int *)(a3 + 24) + 24);
  if (v14 >= 0xFFFFFFFF) {
    LODWORD(v14) = -1;
  }
  return (v14 + 1);
}

uint64_t sub_1000B4974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000B4980);
}

uint64_t sub_1000B4980(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DiskJetPackResourceBundle(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
    return v11(v12, a2, a2, v10);
  }

  uint64_t result = type metadata accessor for JSPackageIndex(0LL);
  uint64_t v14 = *(void *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }

  *(void *)(a1 + *(int *)(a4 + 24) + 24) = (a2 - 1);
  return result;
}

uint64_t sub_1000B4A28(uint64_t a1)
{
  uint64_t result = type metadata accessor for DiskJetPackResourceBundle(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for JSPackageIndex(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      v5[2] = "(";
      swift_initStructMetadata(a1, 256LL, 3LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000B4AD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for DispatchTime(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v28 - v11;
  uint64_t v13 = *(void *)(v0 + 64);
  if (v13)
  {
    uint64_t v14 = swift_retain(v13);
    dispatch thunk of DispatchWorkItem.cancel()(v14);
    uint64_t result = swift_release(v13);
  }

  if (!*(void *)(v1 + 48))
  {
    static DispatchTime.now()(result);
    + infix(_:_:)(v9, *(double *)(v1 + 16));
    uint64_t v15 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
    uint64_t v16 = v15(v9, v5);
    static DispatchTime.distantFuture.getter(v16);
    char v17 = static DispatchTime.< infix(_:_:)(v12, v9);
    uint64_t result = v15(v9, v5);
    if ((v17 & 1) != 0)
    {
      uint64_t v18 = swift_allocObject(&unk_100124540, 24LL, 7LL);
      swift_weakInit(v18 + 16, v1);
      aBlock[4] = sub_1000B6E88;
      uint64_t v31 = v18;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256LL;
      aBlock[2] = sub_10008A71C;
      aBlock[3] = &unk_100124558;
      uint64_t v19 = _Block_copy(aBlock);
      uint64_t v28 = (void (*)(char *, uint64_t))v15;
      id v20 = v19;
      uint64_t v29 = _swiftEmptyArrayStorage;
      uint64_t v21 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
      swift_retain(v18);
      uint64_t v22 = sub_100029E18((uint64_t *)&unk_10013DBD0);
      uint64_t v23 = sub_100044410( (unint64_t *)&qword_10013D270,  (uint64_t *)&unk_10013DBD0,  (uint64_t)&protocol conformance descriptor for [A]);
      dispatch thunk of SetAlgebra.init<A>(_:)(&v29, v22, v23, v2, v21);
      uint64_t v24 = type metadata accessor for DispatchWorkItem(0LL);
      swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
      uint64_t v25 = DispatchWorkItem.init(flags:block:)(v4, v20);
      uint64_t v26 = v31;
      swift_release(v18);
      swift_release(v26);
      OS_dispatch_queue.asyncAfter(deadline:execute:)(v12, v25);
      v28(v12, v5);
      uint64_t v27 = *(void *)(v1 + 64);
      *(void *)(v1 + 64) = v25;
      return swift_release(v27);
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_1000B4D6C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = result;
    sub_1000B4DC0();
    return swift_release(v3);
  }

  return result;
}

uint64_t sub_1000B4DC0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  unint64_t v4 = &v22[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v5 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v22[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v9 = (void *)v1[5];
  *uint64_t v8 = v9;
  (*(void (**)(void *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  id v10 = v9;
  LOBYTE(v9) = _dispatchPreconditionTest(_:)(v8);
  (*(void (**)(void *, uint64_t))(v6 + 8))(v8, v5);
  if ((v9 & 1) == 0)
  {
    __break(1u);
    goto LABEL_5;
  }

  swift_beginAccess(v1 + 7, v22, 1LL, 0LL);
  uint64_t v11 = v1[7];
  v1[7] = 0LL;
  swift_release(v11);
  uint64_t v12 = v1[8];
  v1[8] = 0LL;
  swift_release(v12);
  uint64_t v13 = v1[9];
  void v1[9] = 0LL;
  swift_unknownObjectRelease(v13);
  if (qword_10013BC48 != -1) {
LABEL_5:
  }
    swift_once(&qword_10013BC48, sub_1000D1558);
  uint64_t v14 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v14, (uint64_t)qword_100148618);
  uint64_t v15 = sub_100029E18(&qword_10013EA00);
  uint64_t v16 = type metadata accessor for LogMessage(0LL);
  uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL))
        + *(void *)(*(void *)(v16 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v17 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(34LL, 1LL);
  v18._uint64_t countAndFlagsBits = 0LL;
  v18._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v18);
  LogMessage.StringInterpolation.appendInterpolation(identity:)(v1);
  v19._object = (void *)0x80000001000FDCB0LL;
  v19._uint64_t countAndFlagsBits = 0xD000000000000022LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v19);
  LogMessage.init(stringInterpolation:)(v4);
  Logger.debug(_:)(v17, v14, &protocol witness table for OSLogger);
  return swift_bridgeObjectRelease(v17);
}

uint64_t sub_1000B4FE4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = __CFADD__(v5, 1LL);
  uint64_t v7 = v5 + 1;
  if (v6)
  {
    __break(1u);
LABEL_7:
    swift_once(&qword_10013BC48, sub_1000D1558);
    goto LABEL_5;
  }

  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8)
  {
    uint64_t v9 = swift_retain(*(void *)(a1 + 64));
    dispatch thunk of DispatchWorkItem.cancel()(v9);
    swift_release(v8);
  }

  if (qword_10013BC48 != -1) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v10 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v10, (uint64_t)qword_100148618);
  uint64_t v11 = sub_100029E18(&qword_10013EA00);
  uint64_t v12 = type metadata accessor for LogMessage(0LL);
  uint64_t v13 = swift_allocObject( v11,  ((*(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL))
        + *(void *)(*(void *)(v12 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v13 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(30LL, 1LL);
  v14._uint64_t countAndFlagsBits = 0LL;
  v14._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v14);
  LogMessage.StringInterpolation.appendInterpolation(identity:)(a1);
  v15._object = (void *)0x80000001000FDCE0LL;
  v15._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v15);
  LogMessage.init(stringInterpolation:)(v4);
  Logger.debug(_:)(v13, v10, &protocol witness table for OSLogger);
  return swift_bridgeObjectRelease(v13);
}

void sub_1000B5184(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  unint64_t v4 = &v21[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5)
  {
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v6 = qword_10013BC48;
  uint64_t v7 = v5 - 1;
  *(void *)(a1 + 48) = v7;
  if (v7)
  {
    if (v6 == -1)
    {
LABEL_4:
      uint64_t v8 = type metadata accessor for OSLogger(0LL);
      sub_10002A768(v8, (uint64_t)qword_100148618);
      uint64_t v9 = sub_100029E18(&qword_10013EA00);
      uint64_t v10 = type metadata accessor for LogMessage(0LL);
      uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
            + *(void *)(*(void *)(v10 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v11 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(33LL, 1LL);
      v12._uint64_t countAndFlagsBits = 0LL;
      v12._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v12);
      LogMessage.StringInterpolation.appendInterpolation(identity:)(a1);
      v13._object = (void *)0x80000001000FDC50LL;
      v13._uint64_t countAndFlagsBits = 0xD000000000000021LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v13);
      LogMessage.init(stringInterpolation:)(v4);
      Logger.debug(_:)(v11, v8, &protocol witness table for OSLogger);
      swift_bridgeObjectRelease(v11);
      return;
    }

uint64_t sub_1000B5430(uint64_t a1)
{
  uint64_t v27 = a1;
  uint64_t v2 = type metadata accessor for JSRoute(0LL);
  uint64_t v28 = *(void *)(v2 - 8);
  uint64_t v29 = v2;
  __chkstk_darwin(v2);
  unint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for JSRequest(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - v10;
  JSRequest.removingOption(withName:)(0xD000000000000012LL, 0x80000001000FF490LL);
  uint64_t v12 = *(void *)(v1 + 24);
  uint64_t v13 = sub_100029E18(&qword_10013DE80);
  OS_dispatch_queue.sync<A>(execute:)(v30, sub_1000B712C, v12, v13);
  uint64_t v14 = v30[0];
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  uint64_t v15 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v17 = swift_allocObject(&unk_100124630, v16 + v7, v15 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v17 + v16, v9, v5);
  uint64_t v18 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v31 = v18;
  uint64_t v32 = &protocol witness table for SyncTaskScheduler;
  Swift::String v19 = sub_10002C328(v30);
  SyncTaskScheduler.init()(v19);
  uint64_t v20 = sub_100029E18(&qword_10013F4D8);
  uint64_t v21 = sub_100044410(&qword_10013F4E0, &qword_10013F4D8, (uint64_t)&protocol conformance descriptor for Promise<A>);
  uint64_t v22 = Promise.flatMap<A>(on:_:)(v30, sub_1000B71A4, v17, v20, v21);
  swift_release(v14);
  swift_release(v17);
  uint64_t v23 = sub_100029F4C(v30);
  JSRequest.route.getter(v23);
  sub_1000B5CAC(v22, (uint64_t)v4);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v29);
  uint64_t v31 = v18;
  uint64_t v32 = &protocol witness table for SyncTaskScheduler;
  uint64_t v24 = sub_10002C328(v30);
  SyncTaskScheduler.init()(v24);
  uint64_t v25 = swift_allocObject(&unk_100124658, 24LL, 7LL);
  swift_weakInit(v25 + 16, v12);
  Promise.always(on:perform:)(v30, sub_1000B71E4, v25);
  swift_release(v25);
  sub_100029F4C(v30);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v22;
}

void *sub_1000B56E0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v42 = a1;
  uint64_t v45 = *v2;
  uint64_t v5 = type metadata accessor for MetricsLogger.Configuration(0LL);
  uint64_t v46 = *(void *)(v5 - 8);
  uint64_t v47 = v5;
  __chkstk_darwin(v5);
  uint64_t v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100029E18((uint64_t *)&unk_10013DCA0);
  uint64_t v43 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for JSONTimeUnit(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for Bag(0LL);
  uint64_t v40 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (void **)((char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  v3[2] = a2;
  uint64_t v17 = type metadata accessor for BaseObjectGraph(0LL);
  id v48 = a2;
  uint64_t v18 = v42;
  uint64_t v41 = v14;
  inject<A, B>(_:from:)(v16, v14, v42, v14, v17);
  NSString v19 = String._bridgeToObjectiveC()();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for JSONTimeUnit.seconds(_:), v10);
  uint64_t v39 = v16;
  Bag.subscript.getter(v19, v13);

  uint64_t v20 = v18;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v50 = v45;
  Bag.Value.current(or:)(aBlock, sub_1000B6EA8, v49, v7);
  uint64_t v21 = v46;
  uint64_t v22 = v47;
  uint64_t v23 = v7;
  uint64_t v24 = v44;
  (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v23);
  double v25 = *(double *)aBlock;
  uint64_t v26 = sub_100029E18(&qword_10013F4D0);
  swift_allocObject(v26, 80LL, 7LL);
  swift_retain(v20);
  uint64_t v27 = sub_1000B6F20((uint64_t)sub_1000B6EB4, (uint64_t)v20, v25);
  swift_release(v20);
  v3[3] = v27;
  uint64_t v28 = sub_100027978( (unint64_t *)&unk_10013DD80,  (uint64_t (*)(uint64_t))&type metadata accessor for MetricsLogger.Configuration,  (uint64_t)&protocol conformance descriptor for MetricsLogger.Configuration);
  inject<A>(_:from:)(v22, v20, v22, v28);
  uint64_t v29 = v21;
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 16))( (uint64_t)v3 + OBJC_IVAR____TtC19appstorecomponentsd14JSStackManager_diagnostics,  v24,  v22);
  uint64_t v30 = qword_10013BBE0;
  swift_retain(v3);
  if (v30 != -1) {
    swift_once(&qword_10013BBE0, sub_100088B0C);
  }
  id v31 = v48;
  [v48 addObserver:v3 selector:"didReceiveMemoryWarning:" name:qword_100148578 object:0];
  swift_release(v3);
  id v32 = [(id)objc_opt_self(ASCDefaults) daemonDefaults];
  unsigned int v33 = [v32 enableWebInspector];

  if (!v33) {
    goto LABEL_7;
  }
  uint64_t v34 = v3[3];
  uint64_t v35 = *(dispatch_queue_s **)(v34 + 40);
  uint64_t v36 = swift_allocObject(&unk_1001245E0, 32LL, 7LL);
  *(void *)(v36 + Promise.resolve(_:)(v0 + 16) = sub_1000B6E90;
  *(void *)(v36 + 24) = v34;
  aBlock[4] = sub_1000B7414;
  uint64_t v52 = v36;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_1000994C4;
  aBlock[3] = &unk_1001245F8;
  id v31 = v20;
  uint64_t v20 = _Block_copy(aBlock);
  uint64_t v37 = v52;
  swift_retain(v34);
  swift_retain(v36);
  swift_release(v37);
  dispatch_sync(v35, v20);
  _Block_release(v20);
  LOBYTE(v35) = swift_isEscapingClosureAtFileLocation(v36, "", 110LL, 157LL, 24LL, 1LL);
  swift_release(v31);

  swift_release(v34);
  swift_release(v36);
  if ((v35 & 1) != 0)
  {
    __break(1u);
LABEL_7:
    swift_release(v20);
  }

  (*(void (**)(char *, uint64_t))(v29 + 8))(v24, v22);
  (*(void (**)(void *, uint64_t))(v40 + 8))(v39, v41);
  return v3;
}

uint64_t sub_1000B5B80@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = swift_retain(a1);
  uint64_t v5 = sub_1000B3594(v4);
  uint64_t v7 = v6;
  swift_release(a1);
  id v8 = sub_1000B2308(v5, v7);

  uint64_t result = swift_release(v5);
  *a2 = v8;
  return result;
}

uint64_t sub_1000B5BE0()
{
  uint64_t v1 = (void *)v0[2];
  [v1 removeObserver:v0];

  swift_release(v0[3]);
  sub_1000B73D8((uint64_t)v0 + OBJC_IVAR____TtC19appstorecomponentsd14JSStackManager_diagnostics);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_1000B5C3C()
{
  return type metadata accessor for JSStackManager(0LL);
}

uint64_t type metadata accessor for JSStackManager(uint64_t a1)
{
  uint64_t result = qword_10013F438;
  if (!qword_10013F438) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for JSStackManager);
  }
  return result;
}

uint64_t sub_1000B5C80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000388F0(a1 + 8, a2);
}

uint64_t sub_1000B5CAC(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a2;
  uint64_t v27 = a1;
  uint64_t v4 = type metadata accessor for JSDiagnostics(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for JSRoute(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = v2 + OBJC_IVAR____TtC19appstorecomponentsd14JSStackManager_diagnostics;
  uint64_t v25 = v12;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v13(v11, a2, v8);
  sub_1000A76E8(v12, (uint64_t)v7);
  uint64_t v14 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = (v14 + 16) & ~v14;
  uint64_t v16 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v17 = (v10 + v16 + v15) & ~v16;
  uint64_t v18 = v17 + v6;
  uint64_t v19 = v14 | v16 | 7;
  uint64_t v20 = swift_allocObject(&unk_100124680, v17 + v6, v19);
  uint64_t v21 = *(void (**)(uint64_t, char *, uint64_t))(v9 + 32);
  v21(v20 + v15, v11, v8);
  sub_1000B7208((uint64_t)v7, v20 + v17);
  v13(v11, v26, v8);
  sub_1000A76E8(v25, (uint64_t)v7);
  uint64_t v22 = swift_allocObject(&unk_1001246A8, v18, v19);
  v21(v22 + v15, v11, v8);
  sub_1000B7208((uint64_t)v7, v22 + v17);
  v28[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v28[4] = &protocol witness table for SyncTaskScheduler;
  uint64_t v23 = sub_10002C328(v28);
  SyncTaskScheduler.init()(v23);
  Promise.then(perform:orCatchError:on:)(sub_1000B724C, v20, sub_1000B7370, v22, v28);
  swift_release(v20);
  swift_release(v22);
  return sub_100029F4C(v28);
}

uint64_t sub_1000B5EA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v29 - v9;
  uint64_t v11 = type metadata accessor for OSLogger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = JSResponse.incidents.getter(v13);
  uint64_t v17 = v16;
  if (!*(void *)(v16 + 16)) {
    return swift_bridgeObjectRelease(v16);
  }
  v29[0] = a2;
  v29[1] = a3;
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v18 = sub_10002A768(v11, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v18, v11);
  uint64_t v19 = sub_100029E18(&qword_10013EA00);
  uint64_t v20 = type metadata accessor for LogMessage(0LL);
  uint64_t v21 = swift_allocObject( v19,  ((*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL))
        + 2LL * *(void *)(*(void *)(v20 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v21 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDA10;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(23LL, 1LL);
  v22._uint64_t countAndFlagsBits = 0xD000000000000017LL;
  v22._object = (void *)0x80000001001001C0LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  uint64_t v23 = type metadata accessor for JSRoute(0LL);
  uint64_t v31 = v23;
  uint64_t v24 = sub_10002C328(v30);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v23 - 8) + 16LL))(v24, v29[0], v23);
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v30);
  sub_10004C810((uint64_t)v30);
  v25._uint64_t countAndFlagsBits = 0LL;
  v25._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v25);
  LogMessage.init(stringInterpolation:)(v10);
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(18LL, 1LL);
  v26._object = (void *)0x80000001001001E0LL;
  v26._uint64_t countAndFlagsBits = 0xD000000000000012LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v26);
  uint64_t v31 = sub_100029E18(&qword_10013F4F0);
  v30[0] = v17;
  swift_bridgeObjectRetain(v17);
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v30);
  sub_10004C810((uint64_t)v30);
  v27._uint64_t countAndFlagsBits = 0LL;
  v27._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v27);
  LogMessage.init(stringInterpolation:)(v8);
  Logger.warning(_:)(v21, v11, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
  sub_1000A0944(v17);
  return swift_bridgeObjectRelease(v17);
}

uint64_t sub_1000B6194(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v37 = a1;
  uint64_t v38 = a3;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v34 - v8;
  uint64_t v10 = type metadata accessor for OSLogger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v14 = sub_10002A768(v10, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  uint64_t v15 = sub_100029E18(&qword_10013EA00);
  uint64_t v16 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v36 = v11;
  uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))
        + 2LL * *(void *)(v16 + 72),
          *(unsigned __int8 *)(v16 + 80) | 7LL);
  *(_OWORD *)(v17 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDA10;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(33LL, 1LL);
  v18._object = (void *)0x8000000100100190LL;
  v18._uint64_t countAndFlagsBits = 0xD000000000000020LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v18);
  uint64_t v19 = type metadata accessor for JSRoute(0LL);
  uint64_t v44 = v19;
  uint64_t v20 = sub_10002C328(v43);
  uint64_t v21 = *(void (**)(void *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16LL);
  v21(v20, a2, v19);
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v43);
  sub_10004C810((uint64_t)v43);
  v22._uint64_t countAndFlagsBits = 44LL;
  v22._object = (void *)0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  LogMessage.init(stringInterpolation:)(v9);
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(8LL, 1LL);
  v23._uint64_t countAndFlagsBits = 0x203A6E6F73616572LL;
  v23._object = (void *)0xE800000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  uint64_t v35 = a2;
  uint64_t v24 = v37;
  swift_getErrorValue(v37, v42, &v40);
  uint64_t v26 = v40;
  uint64_t v25 = v41;
  uint64_t v44 = v41;
  Swift::String v27 = sub_10002C328(v43);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16LL))(v27, v26, v25);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v43);
  sub_10004C810((uint64_t)v43);
  v28._uint64_t countAndFlagsBits = 0LL;
  v28._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v28);
  LogMessage.init(stringInterpolation:)(v7);
  Logger.error(_:)(v17, v10, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v13, v10);
  uint64_t v29 = sub_100029E18(&qword_10013F670);
  uint64_t inited = swift_initStackObject(v29, v39);
  *(_OWORD *)(inited + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  *(void *)(inited + 32) = 0x6574756F72LL;
  *(void *)(inited + 40) = 0xE500000000000000LL;
  *(void *)(inited + 72) = v19;
  uint64_t v31 = sub_10002C328((void *)(inited + 48));
  v21(v31, v35, v19);
  size_t v32 = sub_100044F60(inited);
  sub_10009F8A8(v24, v32);
  return swift_bridgeObjectRelease(v32);
}

uint64_t sub_1000B64CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v9, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v2);
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = sub_100029E18(&qword_10013F4E8);
    OS_dispatch_queue.sync<A>(execute:)(v8, sub_1000B71EC, v4, v5);
    uint64_t result = swift_release(v4);
    uint64_t v6 = v8[0];
    if (v8[0])
    {
      v8[3] = type metadata accessor for SyncTaskScheduler(0LL);
      v8[4] = &protocol witness table for SyncTaskScheduler;
      uint64_t v7 = sub_10002C328(v8);
      SyncTaskScheduler.init()(v7);
      Promise.then(perform:orCatchError:on:)(sub_1000B65AC, 0LL, sub_1000B669C, 0LL, v8);
      swift_release(v6);
      return sub_100029F4C(v8);
    }
  }

  return result;
}

uint64_t sub_1000B65AC()
{
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v0 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v0, (uint64_t)qword_100148618);
  uint64_t v1 = sub_100029E18(&qword_10013EA00);
  uint64_t v2 = type metadata accessor for LogMessage(0LL);
  uint64_t v3 = swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL))
       + *(void *)(*(void *)(v2 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v3 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000029LL, 0x8000000100100160LL);
  Logger.debug(_:)(v3, v0, &protocol witness table for OSLogger);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_1000B669C(uint64_t a1)
{
  return sub_1000B68AC(a1, 57LL, 0xD000000000000039LL, (void *)0x8000000100100120LL);
}

void *sub_1000B66BC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = sub_100029E18(&qword_10013F4E8);
  uint64_t result = OS_dispatch_queue.sync<A>(execute:)(v7, sub_1000B71EC, v1, v2);
  uint64_t v4 = v7[0];
  if (v7[0])
  {
    unint64_t v5 = sub_100032130();
    uint64_t v6 = static OS_dispatch_queue.main.getter(v5);
    v7[3] = v5;
    v7[4] = &protocol witness table for OS_dispatch_queue;
    v7[0] = v6;
    Promise.then(perform:orCatchError:on:)(sub_1000B6770, 0LL, sub_1000B688C, 0LL, v7);
    swift_release(v4);
    return (void *)sub_100029F4C(v7);
  }

  return result;
}

double sub_1000B6770()
{
  uint64_t v0 = JSStack.notify(withName:)(0xD00000000000001DLL, 0x8000000100100240LL);
  swift_release(v0);
  JSStack.requestGarbageCollection()();
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v1 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v1, (uint64_t)qword_1001485E8);
  uint64_t v2 = sub_100029E18(&qword_10013EA00);
  uint64_t v3 = type metadata accessor for LogMessage(0LL);
  uint64_t v4 = swift_allocObject( v2,  ((*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL))
       + *(void *)(*(void *)(v3 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v3 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v4 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD00000000000001FLL, 0x8000000100100260LL);
  Logger.info(_:)(v4, v1, &protocol witness table for OSLogger);
  *(void *)&double result = swift_bridgeObjectRelease(v4).n128_u64[0];
  return result;
}

uint64_t sub_1000B688C(uint64_t a1)
{
  return sub_1000B68AC(a1, 49LL, 0xD000000000000031LL, (void *)0x8000000100100200LL);
}

uint64_t sub_1000B68AC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for OSLogger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v15 = sub_10002A768(v11, (uint64_t)qword_1001485E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v16 = sub_100029E18(&qword_10013EA00);
  uint64_t v17 = type metadata accessor for LogMessage(0LL);
  uint64_t v18 = swift_allocObject( v16,  ((*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL))
        + *(void *)(*(void *)(v17 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v18 + Promise.resolve(_:)(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(a2, 1LL);
  v19._uint64_t countAndFlagsBits = a3;
  v19._object = a4;
  LogMessage.StringInterpolation.appendLiteral(_:)(v19);
  swift_getErrorValue(a1, v27, &v25);
  uint64_t v20 = v25;
  uint64_t v21 = v26;
  v28[3] = v26;
  Swift::String v22 = sub_10002C328(v28);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16LL))(v22, v20, v21);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v28);
  sub_10004C810((uint64_t)v28);
  v23._uint64_t countAndFlagsBits = 0LL;
  v23._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  LogMessage.init(stringInterpolation:)(v10);
  Logger.error(_:)(v18, v11, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_1000B6B4C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for MetricsLogger.Configuration(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000B6BD4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 40);
  uint64_t v3 = swift_allocObject(&unk_100124590, 32LL, 7LL);
  *(void *)(v3 + Promise.resolve(_:)(v0 + 16) = sub_1000B6E90;
  *(void *)(v3 + 24) = v1;
  v7[4] = sub_1000B7414;
  uint64_t v8 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256LL;
  v7[2] = sub_1000994C4;
  v7[3] = &unk_1001245A8;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = v8;
  swift_retain(v1);
  swift_retain(v3);
  swift_release(v5);
  dispatch_sync(v2, v4);
  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v3, "", 110LL, 157LL, 24LL, 1LL);
  swift_release(v1);
  uint64_t result = swift_release(v3);
  return result;
}

uint64_t sub_1000B6CE0()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(dispatch_queue_s **)(v1 + 40);
  uint64_t v3 = swift_allocObject(&unk_1001244F0, 32LL, 7LL);
  *(void *)(v3 + Promise.resolve(_:)(v0 + 16) = sub_1000B6E2C;
  *(void *)(v3 + 24) = v1;
  v7[4] = sub_1000B6E44;
  uint64_t v8 = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256LL;
  v7[2] = sub_1000994C4;
  v7[3] = &unk_100124508;
  uint64_t v4 = _Block_copy(v7);
  uint64_t v5 = v8;
  swift_retain(v1);
  swift_retain(v3);
  swift_release(v5);
  dispatch_sync(v2, v4);
  _Block_release(v4);
  LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v3, "", 110LL, 170LL, 24LL, 1LL);
  swift_release(v1);
  uint64_t result = swift_release(v3);
  return result;
}

uint64_t sub_1000B6DEC()
{
  return sub_1000B6BD4();
}

uint64_t sub_1000B6E0C()
{
  return sub_1000B6CE0();
}

void sub_1000B6E2C()
{
}

uint64_t sub_1000B6E34()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000B6E44()
{
  return sub_1000994A4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000B6E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000B6E5C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000B6E64()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000B6E88()
{
  return sub_1000B4D6C(v0);
}

uint64_t sub_1000B6E90()
{
  return sub_1000B4FE4(v0);
}

uint64_t sub_1000B6E98()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_1000B6EA8(void *a1@<X8>)
{
  *a1 = 0x4024000000000000LL;
}

uint64_t sub_1000B6EB4@<X0>(void *a1@<X8>)
{
  return sub_1000B5B80(v1, a1);
}

uint64_t sub_1000B6EBC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    swift_retain(*(void *)(a1 + 56));
  }
  uint64_t result = sub_1000B4AD0();
  *a2 = v4;
  return result;
}

uint64_t sub_1000B6F20(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t result = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 56) = 0LL;
  *(void *)(v4 + 64) = 0LL;
  *(void *)(v4 + 72) = 0LL;
  if (a3 <= 0.0)
  {
    __break(1u);
  }

  else
  {
    *(double *)(v4 + swift_weakDestroy(v0 + 16) = a3;
    *(void *)(v4 + 24) = a1;
    *(void *)(v4 + 32) = a2;
    sub_100032130();
    (*(void (**)(char *, void, uint64_t))(v15 + 104))( v18,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v14);
    uint64_t v19 = swift_retain(a2);
    static DispatchQoS.unspecified.getter(v19);
    uint64_t v24 = _swiftEmptyArrayStorage;
    uint64_t v20 = sub_100027978( (unint64_t *)&qword_10013DD90,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
    uint64_t v21 = sub_100029E18(&qword_10013D2F8);
    uint64_t v22 = sub_100044410( (unint64_t *)&qword_10013DDA0,  &qword_10013D2F8,  (uint64_t)&protocol conformance descriptor for [A]);
    dispatch thunk of SetAlgebra.init<A>(_:)(&v24, v21, v22, v8, v20);
    *(void *)(v4 + 40) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000026LL,  0x80000001001000F0LL,  v13,  v10,  v18,  0LL);
    *(void *)(v4 + 48) = 0LL;
    return v4;
  }

  return result;
}

uint64_t sub_1000B711C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000B712C@<X0>(uint64_t *a1@<X8>)
{
  return sub_10007D65C(v1, a1);
}

uint64_t sub_1000B7144()
{
  uint64_t v1 = type metadata accessor for JSRequest(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000B71A4()
{
  uint64_t v1 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSRequest(0LL) - 8) + 80LL);
  return JSStack.performRequest(_:)(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_1000B71E4(uint64_t a1)
{
  return sub_1000B64CC(a1, v1);
}

uint64_t sub_1000B71EC@<X0>(void *a1@<X8>)
{
  return sub_1000B6EBC(v1, a1);
}

uint64_t sub_1000B7208(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for JSDiagnostics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000B724C(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSRoute(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSDiagnostics(0LL) - 8) + 80LL);
  return sub_1000B5EA0(a1, v1 + v4, v1 + ((v4 + v5 + v6) & ~v6));
}

uint64_t sub_1000B72B8()
{
  uint64_t v1 = type metadata accessor for JSRoute(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = *(void *)(type metadata accessor for JSDiagnostics(0LL) - 8);
  uint64_t v7 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v8 = (v4 + v5 + v7) & ~v7;
  uint64_t v9 = v8 + *(void *)(v6 + 64);
  uint64_t v10 = v3 | v7 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  uint64_t v11 = type metadata accessor for MetricsLogger.Configuration(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8LL))(v0 + v8, v11);
  return swift_deallocObject(v0, v9, v10);
}

uint64_t sub_1000B7370(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSRoute(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void *)(v3 + 64);
  uint64_t v6 = *(unsigned __int8 *)(*(void *)(type metadata accessor for JSDiagnostics(0LL) - 8) + 80LL);
  return sub_1000B6194(a1, v1 + v4, v1 + ((v4 + v5 + v6) & ~v6));
}

uint64_t sub_1000B73D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for JSDiagnostics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

id sub_1000B7434(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v38 = a4;
  uint64_t v7 = type metadata accessor for LintedMetricsEvent(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = JSValue.string.getter(v9);
  if (!v13)
  {
    uint64_t v32 = type metadata accessor for JSError(0LL);
    unint64_t v33 = sub_10009BBCC();
    swift_allocError(v32, v33, 0LL, 0LL);
    id v25 = v34;
    id v29 = a2;
    uint64_t v30 = 0x676E69727473LL;
    unint64_t v31 = 0xE600000000000000LL;
    goto LABEL_8;
  }

  uint64_t v14 = v12;
  uint64_t v15 = v13;
  uint64_t v37 = a1;
  id v16 = [a3 toDictionary];
  if (!v16
    || (uint64_t v17 = v16,
        uint64_t v18 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v16,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable),  v17,  v19 = sub_1000B768C(v18),  v20 = swift_bridgeObjectRelease(v18),  !v19))
  {
    swift_bridgeObjectRelease(v15);
    uint64_t v26 = type metadata accessor for JSError(0LL);
    unint64_t v27 = sub_10009BBCC();
    swift_allocError(v26, v27, 0LL, 0LL);
    id v25 = v28;
    id v29 = a3;
    uint64_t v30 = 0x467363697274654DLL;
    unint64_t v31 = 0xED000073646C6569LL;
LABEL_8:
    uint64_t v35 = JSError.init(badValue:expected:)(v29, v30, v31);
    swift_willThrow(v35);
    return v25;
  }

  LintedMetricsEvent.init(fields:issues:)(v19, _swiftEmptyArrayStorage, v20);
  uint64_t v21 = *(void *)(v38 + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder + 24);
  uint64_t v22 = *(void *)(v38 + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder + 32);
  sub_100029EE0((void *)(v38 + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder), v21);
  dispatch thunk of MetricsEventRecorder.record(_:on:)(v11, v14, v15, v21, v22);
  swift_bridgeObjectRelease(v15);
  uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___JSValue);
  id result = [v23 valueWithUndefinedInContext:v37];
  if (result)
  {
    id v25 = result;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    return v25;
  }

  __break(1u);
  return result;
}

unint64_t sub_1000B768C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100029E18(&qword_10013CC58);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = _swiftEmptyDictionarySingleton;
  }

  uint64_t v26 = a1 + 64;
  uint64_t v4 = -1LL;
  uint64_t v5 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(63 - v5) >> 6;
  unint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v8 = 0LL;
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v8 << 6);
      int64_t v13 = v8;
    }

    else
    {
      int64_t v14 = v8 + 1;
      if (__OFADD__(v8, 1LL)) {
        goto LABEL_37;
      }
      if (v14 >= v25)
      {
LABEL_33:
        sub_10002EB74(a1);
        return (unint64_t)v3;
      }

      unint64_t v15 = *(void *)(v26 + 8 * v14);
      int64_t v13 = v8 + 1;
      if (!v15)
      {
        int64_t v13 = v8 + 2;
        if (v8 + 2 >= v25) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v26 + 8 * v13);
        if (!v15)
        {
          int64_t v13 = v8 + 3;
          if (v8 + 3 >= v25) {
            goto LABEL_33;
          }
          unint64_t v15 = *(void *)(v26 + 8 * v13);
          if (!v15)
          {
            int64_t v13 = v8 + 4;
            if (v8 + 4 >= v25) {
              goto LABEL_33;
            }
            unint64_t v15 = *(void *)(v26 + 8 * v13);
            if (!v15)
            {
              int64_t v16 = v8 + 5;
              if (v8 + 5 >= v25) {
                goto LABEL_33;
              }
              unint64_t v15 = *(void *)(v26 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  int64_t v13 = v16 + 1;
                  if (__OFADD__(v16, 1LL)) {
                    goto LABEL_38;
                  }
                  if (v13 >= v25) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = *(void *)(v26 + 8 * v13);
                  ++v16;
                  if (v15) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v8 + 5;
            }
          }
        }
      }

uint64_t sub_1000B7B08(void *a1, void *a2)
{
  uint64_t v5 = type metadata accessor for JSPromise(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for RunLoopWorkerThread(0LL);
  uint64_t v10 = static RunLoopWorkerThread.current.getter(v9);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v9 = swift_allocObject(&unk_1001246D8, 32LL, 7LL);
    *(void *)(v9 + swift_weakDestroy(v0 + 16) = a2;
    *(void *)(v9 + 24) = v11;
    id v12 = a1;
    id v13 = a2;
    swift_retain(v11);
    uint64_t v14 = JSPromise.init(in:executor:)(v12, sub_1000B8598, v9);
    if (v2)
    {
      swift_release(v11);
    }

    else
    {
      uint64_t v9 = JSPromise.value.getter(v14);
      swift_release(v11);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
  }

  else
  {
    uint64_t v15 = type metadata accessor for JSError(0LL);
    unint64_t v16 = sub_10009BBCC();
    swift_allocError(v15, v16, 0LL, 0LL);
    uint64_t v17 = JSError.init(message:line:column:sourceURL:constructorName:)( 0xD00000000000003CLL,  0x8000000100100300LL,  0LL,  1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL);
    swift_willThrow(v17);
  }

  return v9;
}

uint64_t sub_1000B7C98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v28 = a1;
  uint64_t v29 = a5;
  uint64_t v26 = a3;
  uint64_t v7 = type metadata accessor for JSCallable(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = *(void *)(a4 + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder + 24);
  uint64_t v11 = *(void *)(a4 + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder + 32);
  sub_100029EE0((void *)(a4 + OBJC_IVAR____TtC19appstorecomponentsd20JSStoreMetricsObject_eventRecorder), v10);
  uint64_t v27 = dispatch thunk of MetricsEventRecorder.flush()(v10, v11);
  id v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v12((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), a2, v7);
  uint64_t v13 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v14 = (v13 + 16) & ~v13;
  uint64_t v15 = v13 | 7;
  uint64_t v16 = swift_allocObject(&unk_100124700, v14 + v9, v13 | 7);
  uint64_t v17 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v17(v16 + v14, (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), v7);
  v12((char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), v26, v7);
  unint64_t v18 = (v14 + v9 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v19 = swift_allocObject(&unk_100124728, v18 + 8, v15);
  v17(v19 + v14, (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL), v7);
  unint64_t v20 = v28;
  *(void *)(v19 + v18) = v28;
  void v30[3] = type metadata accessor for RunLoopWorkerThread(0LL);
  v30[4] = &protocol witness table for RunLoopWorkerThread;
  uint64_t v21 = v29;
  v30[0] = v29;
  id v22 = v20;
  swift_retain(v21);
  uint64_t v23 = v27;
  Promise.then(perform:orCatchError:on:)(sub_1000B8610, v16, sub_1000B86C0, v19, v30);
  swift_release(v23);
  swift_release(v16);
  swift_release(v19);
  return sub_100029F4C(v30);
}

void sub_1000B7E5C(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  __chkstk_darwin(v3);
  uint64_t v4 = *a1;
  uint64_t v5 = sub_100029E18(&qword_10013E5F0);
  uint64_t v6 = swift_allocObject(v5, 64LL, 7LL);
  *(_OWORD *)(v6 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  *(void *)(v6 + 56) = &type metadata for Int;
  *(void *)(v6 + 32) = v4;
  uint64_t v7 = (void *)JSCallable.call(_:)(v6);
  swift_bridgeObjectRelease(v6);
}

void sub_1000B80FC(uint64_t a1, uint64_t a2, JSContext a3)
{
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  uint64_t v18 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for JSError(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013E5F0);
  uint64_t v12 = swift_allocObject(v11, 64LL, 7LL);
  __int128 v17 = xmmword_1000EDBE0;
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  swift_getErrorValue(a1, v20, v19);
  uint64_t v13 = Error.localizedDescription.getter(v19[1], v19[2]);
  JSError.init(message:line:column:sourceURL:constructorName:)(v13, v14, 0LL, 1LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL);
  Class isa = JSError.makeValue(in:)(a3).super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(void *)(v12 + 56) = sub_10002A030(0LL, (unint64_t *)&qword_10013EAE8, &OBJC_CLASS___JSValue_ptr);
  *(void *)(v12 + 32) = isa;
  uint64_t v16 = (void *)JSCallable.call(_:)(v12);
  swift_bridgeObjectRelease(v12);
}

id sub_1000B84E4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for JSStoreMetricsObject();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for JSStoreMetricsObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd20JSStoreMetricsObject);
}

uint64_t sub_1000B8554(void *a1)
{
  return sub_1000B7B08(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000B856C()
{
  swift_release(*(void *)(v0 + 24));
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000B8598(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000B7C98(a1, a2, a3, *(void *)(v3 + 16), *(void *)(v3 + 24));
}

uint64_t sub_1000B85B0()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1000B8610(uint64_t *a1)
{
}

uint64_t sub_1000B864C()
{
  uint64_t v1 = type metadata accessor for JSCallable(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return swift_deallocObject(v0, v6 + 8, v5);
}

void sub_1000B86C0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for JSCallable(0LL) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5.super.Class isa = *(Class *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL));
  sub_1000B80FC(a1, v1 + v4, v5);
}

id sub_1000B8710(uint64_t a1)
{
  return sub_1000B7434(a1, *(void **)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000B8744(uint64_t a1)
{
  uint64_t v3 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v3);
  JSContext v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 24);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 32);
  sub_100029EE0((void *)(v1 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts), v6);
  dispatch thunk of AccountProvider.activeAccount.getter(v6, v7);
  uint64_t v8 = type metadata accessor for Account(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1LL, v8) == 1)
  {
    sub_10002E92C((uint64_t)v5, &qword_10013C6D0);
    return 0LL;
  }

  else
  {
    uint64_t KeyPath = swift_getKeyPath(a1);
    Account.subscript.getter(&v13);
    swift_release(KeyPath);
    uint64_t v10 = v13;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }

  return v10;
}

id sub_1000B886C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4 = a1;
  sub_1000B8744(a3);
  uint64_t v6 = v5;

  if (v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }

  else
  {
    NSString v7 = 0LL;
  }

  return v7;
}

void sub_1000B88D8(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

  *a3 = v6;
  a3[1] = v8;
}

void sub_1000B8938(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v6 = *a2;
  if (*(void *)(a1 + 8)) {
    NSString v7 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v7 = 0LL;
  }
  id v8 = v7;
  [v6 *a5];
}

uint64_t sub_1000B89F8()
{
  uint64_t v1 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 24);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 32);
  sub_100029EE0((void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts), v4);
  dispatch thunk of AccountProvider.activeAccount.getter(v4, v5);
  uint64_t v6 = type metadata accessor for Account(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v3, 1LL, v6) == 1)
  {
    sub_10002E92C((uint64_t)v3, &qword_10013C6D0);
    return 0LL;
  }

  else
  {
    uint64_t KeyPath = swift_getKeyPath(&unk_1000F0640);
    Account.subscript.getter(&v14);
    swift_release(KeyPath);
    uint64_t v10 = v14;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v3, v6);
    if (v10)
    {
      id v11 = [v10 stringValue];

      uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    }

    else
    {
      return 0LL;
    }
  }

  return v8;
}

uint64_t sub_1000B8CB0()
{
  uint64_t v1 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v1);
  uint64_t v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v4 = type metadata accessor for Account(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 24);
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 32);
  sub_100029EE0((void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts), v8);
  dispatch thunk of AccountProvider.activeAccount.getter(v8, v9);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1LL, v4) == 1)
  {
    uint64_t v10 = &qword_10013C6D0;
    id v11 = v3;
LABEL_7:
    sub_10002E92C((uint64_t)v11, v10);
    return 0LL;
  }

  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
  Account.value(forFlag:)(v15, AMSAccountFlagUnderThirteen);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  if (!v15[3])
  {
    uint64_t v10 = &qword_10013C6F0;
    id v11 = v15;
    goto LABEL_7;
  }

  return 0LL;
}

void *sub_1000B8E40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v6);
  uint64_t v8 = &v29[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v9 = sub_100029E18(&qword_10013EE90);
  __chkstk_darwin(v9);
  id v11 = &v29[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = &v29[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  URL.init(string:)(a1, a2);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12) == 1)
  {
    uint64_t v16 = &qword_10013EE90;
    uint64_t v17 = (uint64_t)v11;
  }

  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v13 + 32))(v15, v11, v12);
    sub_10002A030(0LL, &qword_10013EA40, &OBJC_CLASS___JSContext_ptr);
    uint64_t v18 = (void *)static JSContext.requiredCurrent.getter();
    uint64_t v19 = (void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts);
    uint64_t v20 = *(void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 24);
    uint64_t v21 = v19[4];
    sub_100029EE0(v19, v20);
    dispatch thunk of AccountProvider.activeAccount.getter(v20, v21);
    uint64_t v22 = type metadata accessor for Account(0LL);
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v23 + 48))(v8, 1LL, v22) != 1)
    {
      uint64_t v25 = Account.cookies(for:)(v15);
      (*(void (**)(_BYTE *, uint64_t))(v23 + 8))(v8, v22);
      uint64_t v26 = v18;
      v27.super.Class isa = v26;
      uint64_t v24 = sub_1000B9490(v25, v27);
      swift_bridgeObjectRelease(v25);

      (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);
      return v24;
    }

    (*(void (**)(_BYTE *, uint64_t))(v13 + 8))(v15, v12);

    uint64_t v16 = &qword_10013C6D0;
    uint64_t v17 = (uint64_t)v8;
  }

  sub_10002E92C(v17, v16);
  return 0LL;
}

Class sub_1000B9124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_100029E18(&qword_10013EE90);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for URL(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  URL.init(string:)(a1, a2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16) == 1)
  {
    uint64_t v20 = &qword_10013EE90;
    uint64_t v21 = (uint64_t)v15;
LABEL_5:
    sub_10002E92C(v21, v20);
    return 0LL;
  }

  v33[0] = a3;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v15, v16);
  sub_10002A030(0LL, &qword_10013EA40, &OBJC_CLASS___JSContext_ptr);
  uint64_t v22 = (void *)static JSContext.requiredCurrent.getter();
  uint64_t v23 = (void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts);
  uint64_t v24 = *(void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd12JSUserObject_accounts + 24);
  uint64_t v25 = v23[4];
  sub_100029EE0(v23, v24);
  dispatch thunk of AccountProvider.activeAccount.getter(v24, v25);
  uint64_t v26 = type metadata accessor for Account(0LL);
  uint64_t v27 = *(void *)(v26 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v12, 1LL, v26) == 1)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);

    uint64_t v20 = &qword_10013C6D0;
    uint64_t v21 = (uint64_t)v12;
    goto LABEL_5;
  }

  unint64_t v29 = Account.cookies(for:)(v19);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v26);
  swift_bridgeObjectRetain(a4);
  uint64_t v30 = sub_1000B95C8(v29, v33[0], a4);
  swift_bridgeObjectRelease(v29);
  swift_bridgeObjectRelease(a4);
  if (v30)
  {
    id v31 = v30;
    Class isa = NSHTTPCookie.makeValue(in:)((JSContext)v22).super.isa;
  }

  else
  {
    Class isa = 0LL;
  }

  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);

  return isa;
}

uint64_t type metadata accessor for JSUserObject()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd12JSUserObject);
}

void *sub_1000B9490(uint64_t a1, JSContext a2)
{
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    unint64_t result = _swiftEmptyArrayStorage;
    if (!v4) {
      break;
    }
    unint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v4);
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }

    uint64_t v6 = 0LL;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, a1);
      }
      else {
        id v7 = *(id *)(a1 + 8 * v6 + 32);
      }
      uint64_t v8 = v7;
      ++v6;
      Class isa = NSHTTPCookie.makeValue(in:)(a2).super.isa;

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v10);
      uint64_t v11 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v11);
      uint64_t v12 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v11, isa);
      specialized ContiguousArray._endMutation()(v12);
      if (v4 == v6) {
        return _swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_14:
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }

  return result;
}

void *sub_1000B95C8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = a1;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v8)
  {
    uint64_t v23 = v4;
    uint64_t v24 = v7;
    unint64_t v25 = v7 & 0xC000000000000001LL;
    uint64_t v4 = 4LL;
    while (1)
    {
      uint64_t v9 = v4 - 4;
      if (!v25) {
        break;
      }
      id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v7);
      uint64_t v11 = v4 - 3;
      if (__OFADD__(v9, 1LL)) {
        goto LABEL_20;
      }
LABEL_9:
      uint64_t v12 = v8;
      uint64_t v13 = v10;
      uint64_t v14 = a3;
      id v15 = objc_msgSend(v10, "name", v23);
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      uint64_t v18 = v17;

      a3 = v14;
      BOOL v19 = v16 == a2 && v18 == v14;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
LABEL_19:
        swift_bridgeObjectRelease(a3);
        return v13;
      }

      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, a2, v14, 0LL);
      swift_bridgeObjectRelease(v18);
      if ((v20 & 1) != 0)
      {
        a3 = v24;
        goto LABEL_19;
      }

      ++v4;
      uint64_t v8 = v12;
      BOOL v19 = v11 == v12;
      uint64_t v7 = v24;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
        return 0LL;
      }
    }

    id v10 = *(id *)(v7 + 8 * v4);
    uint64_t v11 = v4 - 3;
    if (!__OFADD__(v9, 1LL)) {
      goto LABEL_9;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    if (v7 < 0) {
      uint64_t v21 = v7;
    }
    else {
      uint64_t v21 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v21);
  }

  swift_bridgeObjectRelease(v7);
  return 0LL;
}

const char *sub_1000B976C()
{
  return "ams_isManagedAppleID";
}

const char *sub_1000B9788()
{
  return "username";
}

void sub_1000B9794(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1000B97B0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

const char *sub_1000B97CC()
{
  return "ams_lastName";
}

void sub_1000B97D8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1000B97F4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

const char *sub_1000B9810()
{
  return "ams_firstName";
}

void sub_1000B981C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_1000B9838(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1000B9854(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v7 = type metadata accessor for OSLogger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t result = __chkstk_darwin(v7);
  uint64_t v11 = &v20[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  int v12 = *(unsigned __int8 *)(v2 + 16);
  *(_BYTE *)(v2 + swift_weakDestroy(v0 + 16) = a1;
  if (v12 != (a1 & 1))
  {
    v20[0] = a1 & 1;
    AsyncEvent.post(_:)(v20);
    if (qword_10013BC58 != -1) {
      swift_once(&qword_10013BC58, sub_1000D1598);
    }
    uint64_t v13 = sub_10002A768(v7, (uint64_t)qword_100148648);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, v13, v7);
    uint64_t v14 = sub_100029E18(&qword_10013EA00);
    uint64_t v15 = type metadata accessor for LogMessage(0LL);
    uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
          + *(void *)(*(void *)(v15 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(35LL, 1LL);
    v17._object = (void *)0x8000000100100630LL;
    v17._uint64_t countAndFlagsBits = 0xD000000000000023LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v17);
    char v18 = *(_BYTE *)(v2 + 16);
    uint64_t v21 = &type metadata for Bool;
    v20[0] = v18;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v20);
    sub_10004C810((uint64_t)v20);
    v19._uint64_t countAndFlagsBits = 0LL;
    v19._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v19);
    LogMessage.init(stringInterpolation:)(v6);
    Logger.info(_:)(v16, v7, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  }

  return result;
}

void sub_1000B9A5C(uint64_t a1, uint64_t a2)
{
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(a1);
    if (v4) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease(a1);
    return;
  }

  if (a1 < 0) {
    uint64_t v11 = a1;
  }
  else {
    uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(a1);
  if (!_CocoaArrayWrapper.endIndex.getter(v11)) {
    goto LABEL_14;
  }
LABEL_3:
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a1);
  }

  else
  {
    if (!*(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
      return;
    }

    id v5 = *(id *)(a1 + 32);
  }

  uint64_t v6 = v5;
  uint64_t v7 = a2 + 16;
  swift_bridgeObjectRelease(a1);
  swift_beginAccess(v7, v12, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(v7);
  if (Strong)
  {
    uint64_t v9 = Strong;
    uint64_t v10 = *(os_unfair_lock_s **)(Strong + 48);
    swift_retain(v10);
    os_unfair_lock_lock(v10 + 4);
    sub_1000B9854((char)[v6 isInstalled]);
    os_unfair_lock_unlock(v10 + 4);
    swift_release(v10);

    swift_release(v9);
  }

  else
  {
  }

uint64_t sub_1000B9BAC()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t type metadata accessor for LegacyAppStoreInstallStateMonitor()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd33LegacyAppStoreInstallStateMonitor);
}

uint64_t initializeBufferWithCopyOfBuffer for LegacyArcadeState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_100048450(*(id *)a2, v4);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for LegacyArcadeState(uint64_t a1)
{
}

uint64_t assignWithCopy for LegacyArcadeState(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_100048450(*(id *)a2, v4);
  id v5 = *(void **)a1;
  *(void *)a1 = v3;
  char v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_100048470(v5, v6);
  return a1;
}

uint64_t assignWithTake for LegacyArcadeState(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 8);
  char v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_100048470(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyArcadeState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LegacyArcadeState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1000B9D6C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LegacyArcadeState()
{
  return &type metadata for LegacyArcadeState;
}

void sub_1000B9D84(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_1000B9DD8()
{
  v4[0] = 0LL;
  v4[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(33LL);
  v1._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  v1._object = (void *)0x80000001001006A0LL;
  String.append(_:)(v1);
  char v3 = v0;
  ((void (*)(char *, void *, ValueMetadata *, void *, void *))_print_unlocked<A, B>(_:_:))( &v3,  v4,  &type metadata for ArcadeIntroOfferState,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  return v4[0];
}

void sub_1000B9EEC(uint64_t a1, char a2)
{
  __asm { BR              X10 }

BOOL sub_1000B9F24(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  BOOL v6 = v4 == v5;
  if (a4) {
    return 0;
  }
  return v6;
}

void sub_1000BA060(uint64_t a1)
{
}

uint64_t sub_1000BA07C()
{
  return 1000LL;
}

void *sub_1000BA084(uint64_t a1)
{
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v2);
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }

    uint64_t v4 = 0LL;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      BOOL v6 = v5;
      ++v4;
      id v7 = [v5 id];

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      uint64_t v8 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
      uint64_t v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v7);
      specialized ContiguousArray._endMutation()(v9);
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_14:
    if (a1 < 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a1);
  }

  return result;
}

uint64_t sub_1000BA1C4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100029E18(&qword_10013F700);
  unint64_t inited = swift_initStackObject(v5, v39);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EEBC0;
  *(void *)(inited + 32) = [a1 id];
  v36[0] = inited;
  specialized Array._endMutation()();
  if (inited >> 62)
  {
    if (v36[0] < 0LL) {
      uint64_t v9 = v36[0];
    }
    else {
      uint64_t v9 = inited & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v36[0]);
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(inited);
    if (v10) {
      goto LABEL_3;
    }
  }

  else if (*(void *)((inited & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_3:
    sub_1000CA67C(inited);
    uint64_t v8 = v7;
    goto LABEL_9;
  }

  uint64_t v8 = &_swiftEmptySetSingleton;
LABEL_9:
  id v11 = objc_msgSend(a1, "kind", swift_bridgeObjectRelease(inited).n128_f64[0]);
  id v12 = [a1 context];
  id v13 = [a1 mediaQueryParams];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v13,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  id v16 = [a1 clientID];
  if (v16)
  {
    Swift::String v17 = v16;
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v20 = v19;
  }

  else
  {
    uint64_t v18 = 0LL;
    uint64_t v20 = 0LL;
  }

  [a1 enableAppDistribution];
  id v21 = [a1 platformOverride];
  sub_1000BDC58((uint64_t)v8, v11, v12, v15, v18, v20, v21);
  uint64_t v23 = v22;
  swift_bridgeObjectRelease(v8);

  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v15);
  uint64_t v37 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v38 = &protocol witness table for SyncTaskScheduler;
  uint64_t v24 = sub_10002C328(v36);
  SyncTaskScheduler.init()(v24);
  uint64_t v25 = sub_100029E18(&qword_10013F6E8);
  uint64_t v26 = sub_100039030(&qword_10013F6F8, &qword_10013F6E8);
  uint64_t v27 = Promise.flatMap<A>(on:_:)(v36, sub_1000BA580, 0LL, v25, v26);
  swift_release(v23);
  sub_100029F4C(v36);
  uint64_t v28 = swift_allocObject(&unk_100124CB8, 32LL, 7LL);
  *(void *)(v28 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v28 + 24) = a3;
  uint64_t v29 = swift_allocObject(&unk_100124CE0, 49LL, 7LL);
  *(void *)(v29 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v29 + 24) = v28;
  *(void *)(v29 + 32) = "getLockupWith(_:withReplyHandler:)";
  *(void *)(v29 + 40) = 34LL;
  *(_BYTE *)(v29 + 48) = 2;
  uint64_t v30 = swift_allocObject(&unk_100124D08, 49LL, 7LL);
  *(void *)(v30 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v30 + 24) = v28;
  *(void *)(v30 + 32) = "getLockupWith(_:withReplyHandler:)";
  *(void *)(v30 + 40) = 34LL;
  *(_BYTE *)(v30 + 48) = 2;
  uint64_t v31 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v28, 2LL);
  uint64_t v32 = swift_retain(a3);
  uint64_t v33 = static OS_dispatch_queue.main.getter(v32);
  uint64_t v37 = v31;
  uint64_t v38 = &protocol witness table for OS_dispatch_queue;
  v36[0] = v33;
  Promise.then(perform:orCatchError:on:)(sub_1000BE7A8, v29, sub_1000BE5BC, v30, v36);
  swift_release(v29);
  swift_release(v30);
  sub_100029F4C(v36);
  swift_release(v27);
  return swift_release(v28);
}

uint64_t sub_1000BA580(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >> 62)
  {
    if (v1 < 0) {
      uint64_t v6 = *a1;
    }
    else {
      uint64_t v6 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*a1);
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(v6);
    if (result) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease(v1);
    sub_100029E18(&qword_10013F6E8);
    unint64_t v7 = sub_1000BEF7C();
    uint64_t v8 = swift_allocError(&type metadata for LockupFetcherClientError, v7, 0LL, 0LL);
    _BYTE *v9 = 0;
    return Promise.__allocating_init(error:)(v8);
  }

  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  uint64_t result = swift_bridgeObjectRetain(*a1);
  if (!v2) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v1 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v1);
    goto LABEL_6;
  }

  if (*(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    id v4 = *(id *)(v1 + 32);
LABEL_6:
    id v5 = v4;
    swift_bridgeObjectRelease(v1);
    sub_100029E18(&qword_10013F6E8);
    id v10 = v5;
    return Promise.__allocating_init(value:)(&v10);
  }

  __break(1u);
  return result;
}

uint64_t sub_1000BA69C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = [a1 ids];
  uint64_t v6 = sub_10002A030(0LL, (unint64_t *)&qword_10013CB40, off_10011E488);
  uint64_t v7 = sub_10005FFC4((unint64_t *)&qword_10013F740, (unint64_t *)&qword_10013CB40, off_10011E488);
  uint64_t v8 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v5, v6, v7);

  id v9 = [a1 kind];
  id v10 = [a1 context];
  id v11 = [a1 mediaQueryParams];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v11,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  id v14 = [a1 clientID];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v18 = v17;
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v18 = 0LL;
  }

  [a1 enableAppDistribution];
  id v19 = [a1 platformOverride];
  sub_1000BDC58(v8, v9, v10, v13, v16, v18, v19);
  uint64_t v21 = v20;
  swift_bridgeObjectRelease(v8);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v13);
  uint64_t v22 = swift_allocObject(&unk_100124B78, 24LL, 7LL);
  *(void *)(v22 + swift_weakDestroy(v0 + 16) = a1;
  uint64_t v34 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v35 = &protocol witness table for SyncTaskScheduler;
  sub_10002C328(v33);
  SyncTaskScheduler.init()(a1);
  uint64_t v23 = sub_100029E18((uint64_t *)&unk_1001403E0);
  uint64_t v24 = Promise.map<A>(on:_:)(v33, sub_1000BECF0, v22, v23);
  swift_release(v21);
  swift_release(v22);
  sub_100029F4C(v33);
  uint64_t v25 = swift_allocObject(&unk_100124BA0, 32LL, 7LL);
  *(void *)(v25 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v25 + 24) = a3;
  uint64_t v26 = swift_allocObject(&unk_100124BC8, 49LL, 7LL);
  *(void *)(v26 + swift_weakDestroy(v0 + 16) = sub_100092718;
  *(void *)(v26 + 24) = v25;
  *(void *)(v26 + 32) = "getLockupsWith(_:withReplyHandler:)";
  *(void *)(v26 + 40) = 35LL;
  *(_BYTE *)(v26 + 48) = 2;
  uint64_t v27 = swift_allocObject(&unk_100124BF0, 49LL, 7LL);
  *(void *)(v27 + swift_weakDestroy(v0 + 16) = sub_100092718;
  *(void *)(v27 + 24) = v25;
  *(void *)(v27 + 32) = "getLockupsWith(_:withReplyHandler:)";
  *(void *)(v27 + 40) = 35LL;
  *(_BYTE *)(v27 + 48) = 2;
  uint64_t v28 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v25, 2LL);
  uint64_t v29 = swift_retain(a3);
  uint64_t v30 = static OS_dispatch_queue.main.getter(v29);
  uint64_t v34 = v28;
  uint64_t v35 = &protocol witness table for OS_dispatch_queue;
  v33[0] = v30;
  Promise.then(perform:orCatchError:on:)(sub_1000BED2C, v26, sub_1000BE5BC, v27, v33);
  swift_release(v26);
  swift_release(v27);
  sub_100029F4C(v33);
  swift_release(v24);
  return swift_release(v25);
}

void sub_1000BAA18(uint64_t *a1@<X0>, void *a2@<X1>, Swift::Int a3@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(*a1);
  uint64_t v29 = (void *)a3;
  if (v6)
  {
    while (1)
    {
      if (v6 < 1)
      {
        __break(1u);
        return;
      }

      uint64_t v7 = 0LL;
      unint64_t v31 = v5 & 0xC000000000000001LL;
      a3 = (Swift::Int)_swiftEmptyDictionarySingleton;
      uint64_t v30 = v5;
      while (1)
      {
        if (v31) {
          id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, v5);
        }
        else {
          id v11 = *(id *)(v5 + 8 * v7 + 32);
        }
        id v12 = v11;
        id v13 = [v11 id];
        id v14 = [a2 kind];
        id v15 = [a2 context];
        id v16 = [objc_allocWithZone((Class)ASCLockupRequest) initWithID:v13 kind:v14 context:v15];

        id v17 = [a2 clientID];
        id v18 = [v16 lockupRequestWithClientID:v17];

        id v19 = (objc_class *)[a2 mediaQueryParams];
        Class isa = v19;
        if (v19)
        {
          uint64_t v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v19,  &type metadata for String,  &type metadata for String,  &protocol witness table for String);

          Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          *(void *)&double v20 = swift_bridgeObjectRelease(v22).n128_u64[0];
        }

        id v23 = objc_msgSend(v18, "lockupRequestWithMediaQueryParams:", isa, v20);

        id v24 = [a2 platformOverride];
        uint64_t v5 = (uint64_t)[v23 lockupRequestWithPlatformOverride:v24];

        if ((a3 & 0xC000000000000001LL) != 0) {
          break;
        }
        id v8 = (id)v5;
        id v9 = v12;
LABEL_6:
        ++v7;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a3);
        sub_10008FF34((uint64_t)v12, (void *)v5, isUniquelyReferenced_nonNull_native);

        swift_bridgeObjectRelease(0x8000000000000000LL);
        uint64_t v5 = v30;
        if (v6 == v7) {
          goto LABEL_23;
        }
      }

      if (a3 >= 0) {
        a3 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      id v25 = (id)v5;
      id v26 = v12;
      uint64_t v27 = __CocoaDictionary.count.getter(a3);
      if (!__OFADD__(v27, 1LL)) {
        break;
      }
      __break(1u);
LABEL_18:
      if (v5 < 0) {
        uint64_t v28 = v5;
      }
      else {
        uint64_t v28 = v5 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v5);
      uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v28);
      uint64_t v29 = (void *)a3;
      if (!v6) {
        goto LABEL_22;
      }
    }

    a3 = sub_1000BD84C(a3, v27 + 1);
    goto LABEL_6;
  }

void sub_1000BAD64(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    sub_10002A030(0LL, &qword_10013E5F8, off_10011E538);
    sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
    sub_10005FFC4(&qword_10013F780, &qword_10013E5F8, off_10011E538);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  }

  if (a2) {
    uint64_t v6 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

uint64_t sub_1000BAE4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 168) = v13;
  *(void *)(v8 + 176) = v14;
  *(_OWORD *)(v8 + 152) = v12;
  *(_OWORD *)(v8 + 136) = v11;
  *(void *)(v8 + 120) = a7;
  *(void *)(v8 + 128) = a8;
  *(void *)(v8 + 104) = a5;
  *(void *)(v8 + 112) = a6;
  *(void *)(v8 + 88) = a3;
  *(void *)(v8 + 96) = a4;
  *(void *)(v8 + 72) = a1;
  *(void *)(v8 + 80) = a2;
  uint64_t v9 = sub_100029E18(&qword_10013CE40);
  *(void *)(v8 + 184) = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000BAEC8, 0LL, 0LL);
}

uint64_t sub_1000BAEC8()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[11];
  uint64_t v3 = v1[3];
  uint64_t v4 = v1[4];
  sub_100029EE0(v1, v3);
  uint64_t v5 = sub_100045F9C(v2);
  uint64_t v19 = v0[19];
  uint64_t v17 = v0[17];
  uint64_t v18 = v0[18];
  uint64_t v6 = v0[15];
  uint64_t v15 = v0[20];
  id v16 = (char *)v0[16];
  uint64_t v8 = v0[13];
  uint64_t v7 = v0[14];
  uint64_t v10 = v0[11];
  uint64_t v9 = (void *)v0[12];
  dispatch thunk of AppStateController.preloadState(forApps:)(v5, v3, v4);
  swift_bridgeObjectRelease(v5);
  sub_100029EE0(v9, v9[3]);
  v0[24] = sub_10002D4E4(v10, v8, v7, v6, v16, v17, v18, v19, v15, 0);
  uint64_t v11 = sub_100029E18(&qword_10013C700);
  uint64_t v12 = sub_100039030((unint64_t *)&qword_10013C708, &qword_10013C700);
  uint64_t v13 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  v0[25] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1000BB040;
  return dispatch thunk of Future.then()(v0 + 7, v11, v12);
}

uint64_t sub_1000BB040()
{
  uint64_t v2 = *(void *)(*v1 + 200);
  uint64_t v3 = *v1;
  swift_task_dealloc(v2);
  swift_release(*(void *)(v3 + 192));
  if (v0)
  {
    swift_task_dealloc(*(void *)(v3 + 184));
    return (*(uint64_t (**)(void))(v3 + 8))();
  }

  else
  {
    *(void *)(v3 + 208) = *(void *)(v3 + 56);
    return swift_task_switch(sub_1000BB0C0, 0LL, 0LL);
  }

uint64_t sub_1000BB0C0()
{
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 104);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v6 = sub_100029EE0(*(void **)(v0 + 168), *(void *)(*(void *)(v0 + 168) + 24LL));
  *(void *)(v0 + 2swift_weakDestroy(v0 + 16) = sub_1000A5EC0(v5, v4, v2, v1, v3, *v6);
  swift_bridgeObjectRelease(v1);
  uint64_t v7 = sub_100029E18(&qword_10013F6A0);
  uint64_t v8 = sub_100039030(&qword_10013F6B8, &qword_10013F6A0);
  uint64_t v9 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  *(void *)(v0 + 224) = v9;
  void *v9 = v0;
  v9[1] = sub_1000BB19C;
  return dispatch thunk of Future.then()(v0 + 64, v7, v8);
}

uint64_t sub_1000BB19C()
{
  uint64_t v2 = *(void *)(*v1 + 224);
  uint64_t v3 = *v1;
  swift_task_dealloc(v2);
  swift_release(*(void *)(v3 + 216));
  if (v0)
  {
    swift_task_dealloc(*(void *)(v3 + 184));
    return (*(uint64_t (**)(void))(v3 + 8))();
  }

  else
  {
    *(void *)(v3 + 232) = *(void *)(v3 + 64);
    return swift_task_switch(sub_1000BB21C, 0LL, 0LL);
  }

uint64_t sub_1000BB21C()
{
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v4 = *(void **)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v5 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v2, 1LL, 1LL, v5);
  sub_1000388F0(v3, v0 + 16);
  uint64_t v6 = (void *)swift_allocObject(&unk_100124C68, 80LL, 7LL);
  void v6[2] = 0LL;
  v6[3] = 0LL;
  v6[4] = v1;
  sub_10002C438((__int128 *)(v0 + 16), (uint64_t)(v6 + 5));
  swift_bridgeObjectRetain(v1);
  uint64_t v7 = sub_100079A04(v2, (uint64_t)&unk_10013F778, (uint64_t)v6);
  swift_release(v7);
  *uint64_t v4 = v1;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000BB2F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 200) = v12;
  *(void *)(v8 + 208) = v13;
  *(_OWORD *)(v8 + 184) = v11;
  *(void *)(v8 + 168) = a7;
  *(void *)(v8 + 176) = a8;
  *(void *)(v8 + 152) = a5;
  *(void *)(v8 + 160) = a6;
  *(void *)(v8 + 136) = a3;
  *(void *)(v8 + 144) = a4;
  *(void *)(v8 + 120) = a1;
  *(void *)(v8 + 128) = a2;
  uint64_t v9 = sub_100029E18(&qword_10013CE40);
  *(void *)(v8 + 2swift_weakDestroy(v0 + 16) = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000BB368, 0LL, 0LL);
}

uint64_t sub_1000BB368()
{
  uint64_t v15 = *(void *)(v0 + 192);
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v14 = *(void *)(v0 + 184);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v6 = *(void *)(v0 + 136);
  sub_100029EE0(*(void **)(v0 + 128), *(void *)(*(void *)(v0 + 128) + 24LL));
  uint64_t v7 = sub_100029E18(&qword_10013CCD0);
  uint64_t inited = swift_initStackObject(v7, v0 + 16);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  *(void *)(inited + 32) = v6;
  *(void *)(inited + 40) = v5;
  swift_bridgeObjectRetain(v5);
  Swift::Int v9 = sub_1000CAA18(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  *(void *)(v0 + 224) = @"app";
  *(void *)(v0 + 232) = sub_10002DD20(v9, (uint64_t)@"app", v4, v3, v2, v1, v14, v15, 0);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = sub_100029E18(&qword_10013C700);
  uint64_t v11 = sub_100039030((unint64_t *)&qword_10013C708, &qword_10013C700);
  uint64_t v12 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  *(void *)(v0 + 240) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_1000BB4D8;
  return dispatch thunk of Future.then()(v0 + 104, v10, v11);
}

uint64_t sub_1000BB4D8()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 232);
  uint64_t v3 = *(void *)(*v1 + 240);
  uint64_t v5 = *v1;
  swift_task_dealloc(v3);
  swift_release(v4);
  if (v0)
  {
    swift_task_dealloc(v2[27]);
    return (*(uint64_t (**)(void))(v5 + 8))();
  }

  else
  {
    v2[31] = v2[13];
    return swift_task_switch(sub_1000BB564, 0LL, 0LL);
  }

uint64_t sub_1000BB564()
{
  uint64_t v1 = *(void *)(v0 + 248);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 160);
  uint64_t v5 = sub_100029EE0(*(void **)(v0 + 200), *(void *)(*(void *)(v0 + 200) + 24LL));
  *(void *)(v0 + 256) = sub_1000A5AE0(v2, v4, 0LL, v1, v3, *v5);
  swift_bridgeObjectRelease(v1);
  uint64_t v6 = sub_100029E18(&qword_10013F6E8);
  uint64_t v7 = sub_100039030(&qword_10013F6F8, &qword_10013F6E8);
  uint64_t v8 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  *(void *)(v0 + 264) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1000BB640;
  return dispatch thunk of Future.then()(v0 + 112, v6, v7);
}

uint64_t sub_1000BB640()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 256);
  uint64_t v3 = *(void *)(*v1 + 264);
  uint64_t v5 = *v1;
  swift_task_dealloc(v3);
  swift_release(v4);
  if (v0)
  {
    swift_task_dealloc(v2[27]);
    return (*(uint64_t (**)(void))(v5 + 8))();
  }

  else
  {
    v2[34] = v2[14];
    return swift_task_switch(sub_1000BB6CC, 0LL, 0LL);
  }

uint64_t sub_1000BB6CC()
{
  uint64_t v1 = *(void **)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 208);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v4 = *(void **)(v0 + 120);
  Set<>.nsNumbers.getter(*(void *)(v0 + 160));
  uint64_t v6 = v5;
  sub_10002A030(0LL, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
  sub_10005FFC4((unint64_t *)&qword_10013D310, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  id v8 = objc_msgSend(v1, "lockupWithSignpostTags:", isa, swift_bridgeObjectRelease(v6).n128_f64[0]);

  uint64_t v9 = sub_100029E18(&qword_10013F700);
  uint64_t v10 = swift_allocObject(v9, 40LL, 7LL);
  *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_1000EEBC0;
  *(void *)(v10 + 32) = v8;
  uint64_t v16 = v10;
  specialized Array._endMutation()();
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v2, 1LL, 1LL, v11);
  sub_1000388F0(v3, v0 + 64);
  uint64_t v12 = (void *)swift_allocObject(&unk_100124B28, 80LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = v16;
  sub_10002C438((__int128 *)(v0 + 64), (uint64_t)(v12 + 5));
  id v13 = v8;
  swift_bridgeObjectRetain(v16);
  uint64_t v14 = sub_100079A04(v2, (uint64_t)&unk_10013F730, (uint64_t)v12);
  swift_release(v14);

  swift_bridgeObjectRelease(v16);
  *uint64_t v4 = v13;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000BB930(uint64_t a1, void *a2, void (*a3)(void, void *), uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v49 = a4;
  id v48 = a3;
  uint64_t v47 = a1;
  uint64_t ObjectType = swift_getObjectType(v4);
  uint64_t v7 = type metadata accessor for CocoaError.Code(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&ObjectType - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for CocoaError(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (uint64_t *)((char *)&ObjectType - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&ObjectType - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = v4 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service;
  uint64_t v18 = *(void *)(*sub_100029EE0( (void *)(v4 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service),  *(void *)(v4 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service + 24))
                  + 24LL);
  uint64_t v19 = sub_100029E18(&qword_10013DE80);
  OS_dispatch_queue.sync<A>(execute:)(&v51, sub_1000B712C, v18, v19);
  swift_release(v51);
  id v20 = [(id)objc_opt_self(NSXPCConnection) currentConnection];
  if (v20 && (uint64_t v21 = v20, v22 = sub_1000CB630(), v21, (v22 & 1) != 0))
  {
    uint64_t v23 = v5 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appStateController;
    sub_1000388F0(v17, (uint64_t)&v51);
    sub_1000388F0(v23, (uint64_t)v50);
    id v24 = (void *)swift_allocObject(&unk_100124948, 120LL, 7LL);
    sub_10002C438(&v51, (uint64_t)(v24 + 2));
    uint64_t v25 = v47;
    v24[7] = a2;
    v24[8] = v25;
    sub_10002C438(v50, (uint64_t)(v24 + 9));
    v24[14] = ObjectType;
    sub_100029E18(&qword_10013F6E8);
    id v26 = a2;
    uint64_t v27 = swift_bridgeObjectRetain(v25);
    uint64_t v28 = Promise.__allocating_init()(v27);
    uint64_t v29 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v16, 1LL, 1LL, v29);
    uint64_t v30 = (void *)swift_allocObject(&unk_100124970, 56LL, 7LL);
    _OWORD v30[2] = 0LL;
    void v30[3] = 0LL;
    v30[4] = &unk_10013F6E0;
    void v30[5] = v24;
    v30[6] = v28;
    swift_retain(v28);
    uint64_t v31 = sub_1000B3448((uint64_t)v16, (uint64_t)&unk_10013F6F0, (uint64_t)v30);
    swift_release(v31);
    uint64_t v32 = swift_allocObject(&unk_100124998, 32LL, 7LL);
    uint64_t v33 = v49;
    *(void *)(v32 + swift_weakDestroy(v0 + 16) = v48;
    *(void *)(v32 + 24) = v33;
    uint64_t v34 = swift_allocObject(&unk_1001249C0, 49LL, 7LL);
    *(void *)(v34 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
    *(void *)(v34 + 24) = v32;
    *(void *)(v34 + 32) = "buildLockup(fromMediaAPIResponse:withContext:withReplyHandler:)";
    *(void *)(v34 + 40) = 63LL;
    *(_BYTE *)(v34 + 48) = 2;
    uint64_t v35 = swift_allocObject(&unk_1001249E8, 49LL, 7LL);
    *(void *)(v35 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
    *(void *)(v35 + 24) = v32;
    *(void *)(v35 + 32) = "buildLockup(fromMediaAPIResponse:withContext:withReplyHandler:)";
    *(void *)(v35 + 40) = 63LL;
    *(_BYTE *)(v35 + 48) = 2;
    uint64_t v36 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    swift_retain_n(v32, 2LL);
    uint64_t v37 = swift_retain(v33);
    uint64_t v38 = static OS_dispatch_queue.main.getter(v37);
    uint64_t v52 = v36;
    uint64_t v53 = &protocol witness table for OS_dispatch_queue;
    *(void *)&__int128 v51 = v38;
    Promise.then(perform:orCatchError:on:)(sub_1000BE7A8, v34, sub_1000BE5BC, v35, &v51);
    swift_release(v34);
    swift_release(v35);
    sub_100029F4C(&v51);
    swift_release(v28);
    swift_release(v32);
  }

  else
  {
    static CocoaError.Code.featureUnsupported.getter();
    uint64_t v39 = sub_100029E18(&qword_10013F670);
    uint64_t inited = swift_initStackObject(v39, v54);
    *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v41;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD000000000000062LL;
    *(void *)(inited + 56) = 0x80000001001007F0LL;
    unint64_t v42 = sub_100044F60(inited);
    unint64_t v43 = sub_1000BD804();
    uint64_t v44 = _BridgedStoredNSError.init(_:userInfo:)(v13, v9, v42, v10, v43);
    uint64_t v45 = (void *)CocoaError._nsError.getter(v44);
    (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
    v48(0LL, v45);
  }

uint64_t sub_1000BBDC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  uint64_t v6 = sub_100029E18(&qword_10013CE40);
  v5[13] = swift_task_alloc((*(void *)(*(void *)(v6 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000BBE24, 0LL, 0LL);
}

uint64_t sub_1000BBE24()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = sub_100029EE0(*(void **)(v0 + 72), *(void *)(*(void *)(v0 + 72) + 24LL));
  *(void *)(v0 + 112) = sub_1000A5AE0((uint64_t)@"app", v2, 0LL, v1, (uint64_t)&_swiftEmptySetSingleton, *v3);
  uint64_t v4 = sub_100029E18(&qword_10013F6E8);
  uint64_t v5 = sub_100039030(&qword_10013F6F8, &qword_10013F6E8);
  uint64_t v6 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  *(void *)(v0 + 120) = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_1000BBEF8;
  return dispatch thunk of Future.then()(v0 + 56, v4, v5);
}

uint64_t sub_1000BBEF8()
{
  uint64_t v2 = (void *)*v1;
  uint64_t v4 = *(void *)(*v1 + 112);
  uint64_t v3 = *(void *)(*v1 + 120);
  uint64_t v5 = *v1;
  swift_task_dealloc(v3);
  swift_release(v4);
  if (v0)
  {
    swift_task_dealloc(v2[13]);
    return (*(uint64_t (**)(void))(v5 + 8))();
  }

  else
  {
    v2[16] = v2[7];
    return swift_task_switch(sub_1000BBF84, 0LL, 0LL);
  }

uint64_t sub_1000BBF84()
{
  uint64_t v1 = *(void **)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  uint64_t v4 = *(void **)(v0 + 64);
  uint64_t v5 = sub_100029E18(&qword_10013F700);
  uint64_t v6 = swift_allocObject(v5, 40LL, 7LL);
  *(_OWORD *)(v6 + swift_weakDestroy(v0 + 16) = xmmword_1000EEBC0;
  *(void *)(v6 + 32) = v1;
  uint64_t v12 = v6;
  specialized Array._endMutation()();
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v2, 1LL, 1LL, v7);
  sub_1000388F0(v3, v0 + 16);
  uint64_t v8 = (void *)swift_allocObject(&unk_100124A10, 80LL, 7LL);
  v8[2] = 0LL;
  v8[3] = 0LL;
  v8[4] = v12;
  sub_10002C438((__int128 *)(v0 + 16), (uint64_t)(v8 + 5));
  id v9 = v1;
  swift_bridgeObjectRetain(v12);
  uint64_t v10 = sub_100079A04(v2, (uint64_t)&unk_10013F708, (uint64_t)v8);
  swift_release(v10);
  swift_bridgeObjectRelease(v12);
  *uint64_t v4 = v9;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000BC168(void *a1, void (*a2)(void, void *), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v92 = a3;
  v93 = a2;
  id v89 = a1;
  uint64_t ObjectType = swift_getObjectType(v3);
  uint64_t v5 = type metadata accessor for CocoaError.Code(0LL);
  __chkstk_darwin(v5);
  v90 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for CocoaError(0LL);
  uint64_t v91 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v9 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_100029E18(&qword_10013DEB8);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NSString v17 = String._bridgeToObjectiveC()();
  Bag.subscript.getter();

  Bag.Value.current(or:)(&v95, sub_1000AED74, 0LL, v13);
  uint64_t v18 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v95 != 1)
  {
    uint64_t v27 = v90;
    static CocoaError.Code.featureUnsupported.getter(v18);
    uint64_t v28 = sub_100029E18(&qword_10013F670);
    uint64_t inited = swift_initStackObject(v28, v100);
    *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v30;
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = 0xD00000000000001FLL;
    *(void *)(inited + 56) = 0x8000000100100780LL;
    unint64_t v31 = sub_100044F60(inited);
    unint64_t v32 = sub_1000BD804();
    uint64_t v33 = v9;
    uint64_t v34 = v27;
    goto LABEL_10;
  }

  v87 = v12;
  id v19 = v89;
  id v20 = [v89 kind];
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  uint64_t v23 = v22;
  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"app");
  uint64_t v26 = v24;
  if (v21 != v25 || v23 != v24)
  {
    char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v23, v25, v24, 0LL);

    swift_bridgeObjectRelease(v23);
    swift_bridgeObjectRelease(v26);
    if ((v35 & 1) != 0) {
      goto LABEL_7;
    }
    uint64_t v50 = v90;
    static CocoaError.Code.featureUnsupported.getter(v36);
    uint64_t v51 = sub_100029E18(&qword_10013F670);
    uint64_t v52 = v19;
    uint64_t v53 = swift_initStackObject(v51, &v99);
    *(_OWORD *)(v53 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    *(void *)(v53 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(v53 + 40) = v54;
    *(void *)&__int128 v95 = 0LL;
    *((void *)&v95 + 1) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    *(void *)&double v55 = swift_bridgeObjectRelease(*((void *)&v95 + 1)).n128_u64[0];
    strcpy((char *)&v95, "Lockup kind ");
    BYTE13(v95) = 0;
    HIWORD(v95) = -5120;
    id v56 = objc_msgSend(v52, "kind", v55);
    uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
    uint64_t v59 = v58;

    v60._uint64_t countAndFlagsBits = v57;
    v60._object = v59;
    String.append(_:)(v60);
    swift_bridgeObjectRelease(v59);
    v61._object = (void *)0x80000001001007A0LL;
    v61._uint64_t countAndFlagsBits = 0xD000000000000018LL;
    String.append(_:)(v61);
    unint64_t v63 = *((void *)&v95 + 1);
    unint64_t v62 = v95;
    *(void *)(v53 + 72) = &type metadata for String;
    *(_OWORD *)(v53 + 48) = __PAIR128__(v63, v62);
    unint64_t v31 = sub_100044F60(v53);
    unint64_t v32 = sub_1000BD804();
    uint64_t v33 = v9;
    uint64_t v34 = v50;
LABEL_10:
    uint64_t v64 = _BridgedStoredNSError.init(_:userInfo:)(v33, v34, v31, v7, v32);
    uint64_t v65 = (void *)CocoaError._nsError.getter(v64);
    (*(void (**)(char *, uint64_t))(v91 + 8))(v9, v7);
    v93(0LL, v65);

    return;
  }

  swift_bridgeObjectRelease_n(v23, 2LL);
LABEL_7:
  uint64_t v37 = v4;
  uint64_t v38 = v4 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service;
  uint64_t v39 = *(void *)(*sub_100029EE0( (void *)(v4 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service),  *(void *)(v4 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service + 24))
                  + 24LL);
  uint64_t v40 = sub_100029E18(&qword_10013DE80);
  OS_dispatch_queue.sync<A>(execute:)(&v95, sub_1000B712C, v39, v40);
  swift_release(v95);
  uint64_t v41 = sub_100029E18(&qword_10013F688);
  uint64_t v42 = swift_initStackObject(v41, &v98);
  *(_OWORD *)(v42 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  *(void *)(v42 + 32) = ASCSignpostTagUnique();
  uint64_t v43 = sub_1000CB340(v42);
  swift_setDeallocating(v42);
  id v44 = [(id)objc_opt_self(NSXPCConnection) currentConnection];
  id v45 = [v19 clientID];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
    uint64_t v49 = v48;
  }

  else
  {
    uint64_t v47 = 0LL;
    uint64_t v49 = 0LL;
  }

  uint64_t v66 = v92;
  unint64_t v67 = sub_1000C0238(v44, v47, v49, [v19 context]);
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v73 = v72;
  uint64_t v74 = v37 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appStateController;
  sub_1000388F0(v38, (uint64_t)&v95);
  sub_1000388F0(v74, (uint64_t)v94);
  uint64_t v75 = (void *)swift_allocObject(&unk_100124830, 152LL, 7LL);
  sub_10002C438(&v95, (uint64_t)(v75 + 2));
  v75[7] = v19;
  char v75[8] = v43;
  v75[9] = v67;
  v75[10] = v69;
  v75[11] = v71;
  v75[12] = v73;
  sub_10002C438(v94, (uint64_t)(v75 + 13));
  v75[18] = ObjectType;
  sub_100029E18(&qword_10013F6A0);
  uint64_t v76 = Promise.__allocating_init()(v19);
  uint64_t v77 = type metadata accessor for TaskPriority(0LL);
  uint64_t v78 = (uint64_t)v87;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56LL))(v87, 1LL, 1LL, v77);
  uint64_t v79 = (void *)swift_allocObject(&unk_100124858, 56LL, 7LL);
  v79[2] = 0LL;
  v79[3] = 0LL;
  v79[4] = &unk_10013F698;
  v79[5] = v75;
  v79[6] = v76;
  swift_retain(v76);
  uint64_t v80 = sub_1000B3448(v78, (uint64_t)&unk_10013F6A8, (uint64_t)v79);
  swift_release(v80);
  uint64_t v81 = swift_allocObject(&unk_100124880, 32LL, 7LL);
  *(void *)(v81 + swift_weakDestroy(v0 + 16) = v93;
  *(void *)(v81 + 24) = v66;
  uint64_t v82 = swift_allocObject(&unk_1001248A8, 49LL, 7LL);
  *(void *)(v82 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v82 + 24) = v81;
  *(void *)(v82 + 32) = "getLockupCollection(with:withReplyHandler:)";
  *(void *)(v82 + 40) = 43LL;
  *(_BYTE *)(v82 + 48) = 2;
  uint64_t v83 = swift_allocObject(&unk_1001248D0, 49LL, 7LL);
  *(void *)(v83 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v83 + 24) = v81;
  *(void *)(v83 + 32) = "getLockupCollection(with:withReplyHandler:)";
  *(void *)(v83 + 40) = 43LL;
  *(_BYTE *)(v83 + 48) = 2;
  uint64_t v84 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v81, 2LL);
  uint64_t v85 = swift_retain(v66);
  uint64_t v86 = static OS_dispatch_queue.main.getter(v85);
  uint64_t v96 = v84;
  v97 = &protocol witness table for OS_dispatch_queue;
  *(void *)&__int128 v95 = v86;
  Promise.then(perform:orCatchError:on:)(sub_1000BE5B0, v82, sub_1000BE5BC, v83, &v95);
  swift_release(v82);
  swift_release(v83);
  sub_100029F4C(&v95);
  swift_release(v76);
  swift_release(v81);
}

uint64_t sub_1000BC8EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[16] = a8;
  v8[17] = v11;
  v8[14] = a6;
  v8[15] = a7;
  v8[12] = a4;
  v8[13] = a5;
  v8[10] = a2;
  v8[11] = a3;
  v8[9] = a1;
  uint64_t v9 = sub_100029E18(&qword_10013CE40);
  v8[18] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000BC95C, 0LL, 0LL);
}

uint64_t sub_1000BC95C()
{
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v14 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v5 = *(void **)(v0 + 88);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v6 = sub_100029EE0(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24LL));
  id v7 = [v5 id];
  id v8 = [v5 kind];
  id v9 = [v5 context];
  *(void *)(v0 + 152) = sub_1000A55E0( (uint64_t)v7,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)[v5 limit],  v4,  v3,  v2,  v14,  v1,  *v6);

  uint64_t v10 = sub_100029E18(&qword_10013F6A0);
  uint64_t v11 = sub_100039030(&qword_10013F6B8, &qword_10013F6A0);
  uint64_t v12 = (void *)swift_task_alloc(async function pointer to dispatch thunk of Future.then()[1]);
  *(void *)(v0 + 160) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_1000BCAC8;
  return dispatch thunk of Future.then()(v0 + 56, v10, v11);
}

uint64_t sub_1000BCAC8()
{
  uint64_t v2 = *(void *)(*v1 + 160);
  uint64_t v3 = *v1;
  *(void *)(v3 + 168) = v0;
  swift_task_dealloc(v2);
  uint64_t v4 = *(void *)(v3 + 152);
  if (v0)
  {
    uint64_t v5 = *(void *)(v3 + 144);
    swift_release(v4);
    swift_task_dealloc(v5);
    return (*(uint64_t (**)(void))(v3 + 8))();
  }

  else
  {
    swift_release(v4);
    *(void *)(v3 + 176) = *(void *)(v3 + 56);
    return swift_task_switch(sub_1000BCB54, 0LL, 0LL);
  }

uint64_t sub_1000BCB54()
{
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v3 = *(void *)(v0 + 136);
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v5 = *(void **)(v0 + 72);
  swift_bridgeObjectRetain(v4);
  uint64_t v6 = sub_1000BDA9C(v1, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v1);
  uint64_t v7 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v2, 1LL, 1LL, v7);
  sub_1000388F0(v3, v0 + 16);
  id v8 = (void *)swift_allocObject(&unk_1001248F8, 80LL, 7LL);
  v8[2] = 0LL;
  v8[3] = 0LL;
  v8[4] = v6;
  sub_10002C438((__int128 *)(v0 + 16), (uint64_t)(v8 + 5));
  swift_bridgeObjectRetain(v6);
  uint64_t v9 = sub_100079A04(v2, (uint64_t)&unk_10013F6C8, (uint64_t)v8);
  swift_release(v9);
  *uint64_t v5 = v6;
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000BCC88( void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = swift_allocObject(a5, 24LL, 7LL);
  *(void *)(v13 + swift_weakDestroy(v0 + 16) = v12;
  id v14 = a3;
  id v15 = a1;
  a7(v14, a6, v13);

  return swift_release(v13);
}

void sub_1000BCD18(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa = a1;
  if (a1)
  {
    sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
  }

  if (a2) {
    uint64_t v6 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);
}

uint64_t sub_1000BCDAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[3] = a4;
  v5[4] = a5;
  uint64_t v6 = type metadata accessor for AppOffer(0LL);
  v5[5] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[6] = v7;
  unint64_t v8 = (*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v5[7] = swift_task_alloc(v8);
  v5[8] = swift_task_alloc(v8);
  uint64_t v9 = type metadata accessor for App.Kind(0LL);
  v5[9] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v5[10] = v10;
  v5[11] = swift_task_alloc((*(void *)(v10 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for AdamID(0LL);
  v5[12] = swift_task_alloc((*(void *)(*(void *)(v11 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for App(0LL);
  v5[13] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v5[14] = v13;
  v5[15] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000BCE8C, 0LL, 0LL);
}

uint64_t sub_1000BCE8C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if ((unint64_t)v1 >> 62)
  {
    if (v1 < 0) {
      uint64_t v20 = *(void *)(v0 + 24);
    }
    else {
      uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v20);
    *(void *)(v0 + 128) = v21;
    if (v21) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v22 = *(void *)(v0 + 24);
    swift_bridgeObjectRelease(v22);
    uint64_t v23 = sub_1000BA084(v22);
    uint64_t v24 = sub_10005F0DC((uint64_t)v23);
    swift_bridgeObjectRelease(v23);
    uint64_t v25 = sub_100045F9C(v24);
    *(void *)(v0 + 136) = v25;
    uint64_t v26 = v25;
    uint64_t v27 = *(void **)(v0 + 32);
    swift_bridgeObjectRelease(v24);
    uint64_t v28 = v27[3];
    uint64_t v29 = v27[4];
    sub_100029EE0(v27, v28);
    uint64_t v30 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AppStateController.reloadState(forApps:synchronizing:)[1]);
    *(void *)(v0 + 176) = v30;
    *uint64_t v30 = v0;
    v30[1] = sub_1000BD51C;
    return dispatch thunk of AppStateController.reloadState(forApps:synchronizing:)(v26, 1LL, v28, v29);
  }

  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(v1);
  *(void *)(v0 + 128) = v2;
  if (!v2) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t v3 = *(void *)(v0 + 24);
  *(_DWORD *)(v0 + 192) = enum case for App.Kind.store(_:);
  if ((v3 & 0xC000000000000001LL) != 0) {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v3);
  }
  else {
    id v4 = *(id *)(v3 + 32);
  }
  uint64_t v5 = v4;
  *(void *)(v0 + 144) = v4;
  *(void *)(v0 + 152) = 1LL;
  uint64_t v6 = *(void **)(v0 + 32);
  uint64_t v7 = v6[3];
  uint64_t v8 = v6[4];
  sub_100029EE0(v6, v7);
  id v9 = [v5 id];
  AdamID.init(value:)([v9 int64value]);
  *(void *)(v0 + 160) = 0LL;
  uint64_t v11 = *(void *)(v0 + 88);
  uint64_t v10 = *(void *)(v0 + 96);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 80) + 104LL))( v11,  *(unsigned int *)(v0 + 192),  *(void *)(v0 + 72));
  App.init(id:kind:)(v10, v11);

  id v12 = [v5 offer];
  uint64_t v13 = *(void *)(v0 + 64);
  if (v12)
  {
    id v14 = v12;
    uint64_t v16 = *(void *)(v0 + 48);
    uint64_t v15 = *(void *)(v0 + 56);
    uint64_t v17 = *(void *)(v0 + 40);
    swift_getObjectType(v12);
    sub_100045AF0();
    swift_unknownObjectRelease(v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v13, v15, v17);
  }

  else
  {
    static AppOffer.standard.getter();
  }

  uint64_t v18 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AppStateController.refreshUpdateRegistry(forApp:with:)[1]);
  *(void *)(v0 + 168) = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_1000BD1A4;
  return dispatch thunk of AppStateController.refreshUpdateRegistry(forApp:with:)( *(void *)(v0 + 120),  *(void *)(v0 + 64),  v7,  v8);
}

uint64_t sub_1000BD1A4()
{
  uint64_t v2 = *(void *)(*(void *)v0 + 112LL);
  uint64_t v1 = *(void *)(*(void *)v0 + 120LL);
  uint64_t v3 = *(void *)(*(void *)v0 + 104LL);
  uint64_t v4 = *(void *)(*(void *)v0 + 64LL);
  uint64_t v5 = *(void *)(*(void *)v0 + 40LL);
  uint64_t v6 = *(void *)(*(void *)v0 + 48LL);
  swift_task_dealloc(*(void *)(*(void *)v0 + 168LL));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch(sub_1000BD238, 0LL, 0LL);
}

id sub_1000BD238()
{
  uint64_t v1 = *(void *)(v0 + 152);
  uint64_t v2 = *(void *)(v0 + 128);

  uint64_t v3 = *(void *)(v0 + 24);
  if (v1 == v2)
  {
    uint64_t v4 = *(void *)(v0 + 160);
    swift_bridgeObjectRelease(*(void *)(v0 + 24));
    uint64_t v5 = sub_1000BA084(v3);
    uint64_t v6 = sub_10005F0DC((uint64_t)v5);
    swift_bridgeObjectRelease(v5);
    uint64_t v7 = sub_100045F9C(v6);
    *(void *)(v0 + 136) = v7;
    if (!v4)
    {
      uint64_t v11 = v7;
      id v12 = *(void **)(v0 + 32);
      swift_bridgeObjectRelease(v6);
      uint64_t v13 = v12[3];
      uint64_t v14 = v12[4];
      sub_100029EE0(v12, v13);
      uint64_t v15 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AppStateController.reloadState(forApps:synchronizing:)[1]);
      *(void *)(v0 + 176) = v15;
      *uint64_t v15 = v0;
      v15[1] = sub_1000BD51C;
      return (id)dispatch thunk of AppStateController.reloadState(forApps:synchronizing:)(v11, 1LL, v13, v14);
    }

    swift_bridgeObjectRelease(v6);
    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(v0 + 152);
  uint64_t v9 = *(void *)(v0 + 160);
  if ((v3 & 0xC000000000000001LL) != 0) {
    id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(*(void *)(v0 + 152), *(void *)(v0 + 24));
  }
  else {
    id result = *(id *)(v3 + 8 * v8 + 32);
  }
  uint64_t v16 = result;
  *(void *)(v0 + 144) = result;
  *(void *)(v0 + 152) = v8 + 1;
  if (__OFADD__(v8, 1LL))
  {
    __break(1u);
  }

  else
  {
    uint64_t v17 = *(void **)(v0 + 32);
    uint64_t v18 = v17[3];
    uint64_t v19 = v17[4];
    sub_100029EE0(v17, v18);
    id v20 = [v16 id];
    AdamID.init(value:)([v20 int64value]);
    *(void *)(v0 + 160) = v9;
    if (v9)
    {
      swift_bridgeObjectRelease(*(void *)(v0 + 24));

LABEL_11:
      uint64_t v21 = *(void *)(v0 + 88);
      uint64_t v22 = *(void *)(v0 + 96);
      uint64_t v24 = *(void *)(v0 + 56);
      uint64_t v23 = *(void *)(v0 + 64);
      swift_task_dealloc(*(void *)(v0 + 120));
      swift_task_dealloc(v22);
      swift_task_dealloc(v21);
      swift_task_dealloc(v23);
      swift_task_dealloc(v24);
      return (id)(*(uint64_t (**)(void))(v0 + 8))();
    }

    uint64_t v26 = *(void *)(v0 + 88);
    uint64_t v25 = *(void *)(v0 + 96);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 80) + 104LL))( v26,  *(unsigned int *)(v0 + 192),  *(void *)(v0 + 72));
    App.init(id:kind:)(v25, v26);

    id v27 = [v16 offer];
    uint64_t v28 = *(void *)(v0 + 64);
    if (v27)
    {
      id v29 = v27;
      uint64_t v31 = *(void *)(v0 + 48);
      uint64_t v30 = *(void *)(v0 + 56);
      uint64_t v32 = *(void *)(v0 + 40);
      swift_getObjectType(v27);
      sub_100045AF0();
      swift_unknownObjectRelease(v29);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 32))(v28, v30, v32);
    }

    else
    {
      static AppOffer.standard.getter();
    }

    uint64_t v33 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AppStateController.refreshUpdateRegistry(forApp:with:)[1]);
    *(void *)(v0 + 168) = v33;
    *uint64_t v33 = v0;
    v33[1] = sub_1000BD1A4;
    return (id)dispatch thunk of AppStateController.refreshUpdateRegistry(forApp:with:)( *(void *)(v0 + 120),  *(void *)(v0 + 64),  v18,  v19);
  }

  return result;
}

uint64_t sub_1000BD51C()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 176LL);
  *(void *)(*(void *)v1 + 184LL) = v0;
  swift_task_dealloc(v2);
  if (v0) {
    uint64_t v3 = sub_1000BD5F8;
  }
  else {
    uint64_t v3 = sub_1000BD580;
  }
  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_1000BD580()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v4 = *(void *)(v0 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + 136));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000BD5F8()
{
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  swift_task_dealloc(*(void *)(v0 + 120));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000BD718()
{
  return type metadata accessor for LockupFetcherClient(0LL);
}

uint64_t type metadata accessor for LockupFetcherClient(uint64_t a1)
{
  uint64_t result = qword_10013F660;
  if (!qword_10013F660) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for LockupFetcherClient);
  }
  return result;
}

uint64_t sub_1000BD75C(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = "(";
  void v4[2] = "(";
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(result - 8) + 64LL;
    v4[4] = "(";
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000BD7D8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000BD7FC(objc_class *a1, uint64_t a2)
{
}

unint64_t sub_1000BD804()
{
  unint64_t result = qword_10013F678;
  if (!qword_10013F678)
  {
    uint64_t v1 = type metadata accessor for CocoaError(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CocoaError, v1);
    atomic_store(result, (unint64_t *)&qword_10013F678);
  }

  return result;
}

Swift::Int sub_1000BD84C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100029E18((uint64_t *)&unk_10013F750);
    uint64_t v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    uint64_t v30 = v4;
    uint64_t v5 = __CocoaDictionary.makeIterator()(a1);
    uint64_t v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      uint64_t v10 = sub_10002A030(0LL, &qword_10013E5F8, off_10011E538);
      do
      {
        uint64_t v28 = v8;
        swift_dynamicCast(&v29, &v28, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
        uint64_t v27 = v9;
        uint64_t v21 = sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
        swift_dynamicCast(&v28, &v27, (char *)&type metadata for Swift.AnyObject + 8, v21, 7LL);
        uint64_t v4 = v30;
        unint64_t v22 = *(void *)(v30 + 16);
        if (*(void *)(v30 + 24) <= v22)
        {
          sub_10008F410(v22 + 1, 1LL);
          uint64_t v4 = v30;
        }

        uint64_t v12 = v28;
        uint64_t v11 = v29;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v14 = v4 + 64;
        uint64_t v15 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v16 = result & ~v15;
        unint64_t v17 = v16 >> 6;
        if (((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6))) != 0)
        {
          unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v4 + 64 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v23 = 0;
          unint64_t v24 = (unint64_t)(63 - v15) >> 6;
          do
          {
            if (++v17 == v24 && (v23 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v25 = v17 == v24;
            if (v17 == v24) {
              unint64_t v17 = 0LL;
            }
            v23 |= v25;
            uint64_t v26 = *(void *)(v14 + 8 * v17);
          }

          while (v26 == -1);
          unint64_t v18 = __clz(__rbit64(~v26)) + (v17 << 6);
        }

        *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
        uint64_t v19 = 8 * v18;
        *(void *)(*(void *)(v4 + 48) + v19) = v11;
        *(void *)(*(void *)(v4 + 56) + v19) = v12;
        ++*(void *)(v4 + 16);
        uint64_t v8 = __CocoaDictionary.Iterator.next()();
        uint64_t v9 = v20;
      }

      while (v8);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)_swiftEmptyDictionarySingleton;
  }

  return v4;
}

void *sub_1000BDA9C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    Swift::Int result = _swiftEmptyArrayStorage;
    if (!v3) {
      break;
    }
    Swift::Int result = (void *)specialized ContiguousArray.reserveCapacity(_:)(v3);
    if (v3 < 0)
    {
      __break(1u);
      return result;
    }

    uint64_t v5 = 0LL;
    while (v3 != v5)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
      }
      else {
        id v6 = *(id *)(a1 + 8 * v5 + 32);
      }
      uint64_t v7 = v6;
      ++v5;
      Set<>.nsNumbers.getter(a2);
      uint64_t v9 = v8;
      sub_10002A030(0LL, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
      sub_10005FFC4( (unint64_t *)&qword_10013D310,  (unint64_t *)&qword_10013CB50,  &OBJC_CLASS___NSNumber_ptr);
      Class isa = Set._bridgeToObjectiveC()().super.isa;
      id v11 = objc_msgSend(v7, "lockupWithSignpostTags:", isa, swift_bridgeObjectRelease(v9).n128_f64[0]);

      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v12);
      uint64_t v13 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
      uint64_t v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v11);
      specialized ContiguousArray._endMutation()(v14);
      if (v3 == v5) {
        return _swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_14:
    if (a1 < 0) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(a1);
  }

  return result;
}

void sub_1000BDC58(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v107 = a7;
  uint64_t v104 = a5;
  uint64_t v105 = a6;
  id v103 = a3;
  uint64_t v109 = a1;
  uint64_t ObjectType = swift_getObjectType(v7);
  uint64_t v10 = type metadata accessor for CocoaError.Code(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v98 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for CocoaError(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  unint64_t v16 = (void *)((char *)v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v17);
  v108 = (char *)v98 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = a2;
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v22 = v21;
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"app");
  if (v20 == v23 && v22 == v24)
  {
    swift_bridgeObjectRelease_n(v22, 2LL);
  }

  else
  {
    uint64_t v26 = v24;
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, v23, v24, 0LL);
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v26);
    if ((v27 & 1) == 0)
    {
      sub_100029E18(&qword_10013F6A0);
      static CocoaError.Code.featureUnsupported.getter();
      uint64_t v28 = sub_100029E18(&qword_10013F670);
      uint64_t inited = swift_initStackObject(v28, v118);
      *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
      *(void *)(inited + 40) = v30;
      *(void *)atoken.val = 0LL;
      *(void *)&atoken.val[2] = 0xE000000000000000LL;
      _StringGuts.grow(_:)(38LL);
      swift_bridgeObjectRelease(*(void *)&atoken.val[2]);
      strcpy((char *)&atoken, "Lockup kind ");
      BYTE1(atoken.val[3]) = 0;
      HIWORD(atoken.val[3]) = -5120;
      v31._uint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
      object = v31._object;
      String.append(_:)(v31);
      swift_bridgeObjectRelease(object);
      v33._object = (void *)0x80000001001007A0LL;
      v33._uint64_t countAndFlagsBits = 0xD000000000000018LL;
      String.append(_:)(v33);
      uint64_t v34 = *(void *)atoken.val;
      uint64_t v35 = *(void *)&atoken.val[2];
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 48) = v34;
      *(void *)(inited + 56) = v35;
      unint64_t v36 = sub_100044F60(inited);
      unint64_t v37 = sub_1000BD804();
      uint64_t v38 = _BridgedStoredNSError.init(_:userInfo:)(v16, v12, v36, v13, v37);
      uint64_t v39 = CocoaError._nsError.getter(v38);
      (*(void (**)(void *, uint64_t))(v14 + 8))(v16, v13);
      Promise.__allocating_init(error:)(v39);
      return;
    }
  }

  uint64_t v101 = a4;
  uint64_t v40 = v110 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service;
  uint64_t v41 = *(void *)(*sub_100029EE0( (void *)(v110 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service),  *(void *)(v110 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service + 24))
                  + 24LL);
  uint64_t v42 = sub_100029E18(&qword_10013DE80);
  OS_dispatch_queue.sync<A>(execute:)(&atoken, sub_1000B712C, v41, v42);
  swift_release(*(void *)atoken.val);
  uint64_t v43 = &_swiftEmptySetSingleton;
  v117 = &_swiftEmptySetSingleton;
  id v44 = (void *)objc_opt_self(&OBJC_CLASS___NSXPCConnection);
  id v45 = [v44 currentConnection];
  v102 = v19;
  if (!v45)
  {
LABEL_42:
    id v73 = [v44 currentConnection];
    uint64_t v74 = v105;
    swift_bridgeObjectRetain(v105);
    id v75 = v103;
    unint64_t v76 = sub_1000C0238(v73, v104, v74, v75);
    uint64_t v78 = v77;
    uint64_t v113 = v79;
    uint64_t v81 = v80;
    uint64_t v82 = v110 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_fetcher;
    sub_1000388F0(v110 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appStateController, (uint64_t)v116);
    sub_1000388F0(v82, (uint64_t)v115);
    sub_1000388F0(v40, (uint64_t)v114);
    uint64_t v83 = (void *)swift_allocObject(&unk_100124C18, 224LL, 7LL);
    sub_10002C438(v116, (uint64_t)(v83 + 2));
    uint64_t v84 = v109;
    v83[7] = v109;
    sub_10002C438(v115, (uint64_t)(v83 + 8));
    uint64_t v86 = v101;
    uint64_t v85 = v102;
    v83[13] = v102;
    v83[14] = v75;
    v83[15] = v86;
    v83[16] = v43;
    v83[17] = v76;
    v83[18] = v78;
    v83[19] = v113;
    v83[20] = v81;
    sub_10002C438(v114, (uint64_t)(v83 + 21));
    uint64_t v87 = ObjectType;
    v88 = v107;
    v83[26] = v107;
    v83[27] = v87;
    sub_100029E18(&qword_10013F6A0);
    id v89 = v88;
    swift_bridgeObjectRetain(v84);
    id v90 = v75;
    id v91 = v85;
    uint64_t v92 = swift_bridgeObjectRetain(v86);
    uint64_t v93 = Promise.__allocating_init()(v92);
    uint64_t v94 = type metadata accessor for TaskPriority(0LL);
    uint64_t v95 = (uint64_t)v108;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v94 - 8) + 56LL))(v108, 1LL, 1LL, v94);
    uint64_t v96 = (void *)swift_allocObject(&unk_100124C40, 56LL, 7LL);
    v96[2] = 0LL;
    v96[3] = 0LL;
    v96[4] = &unk_10013F768;
    v96[5] = v83;
    v96[6] = v93;
    swift_retain(v93);
    uint64_t v97 = sub_1000B3448(v95, (uint64_t)&unk_10013F770, (uint64_t)v96);
    swift_release(v97);
    return;
  }

  uint64_t v46 = v45;
  [v45 auditToken];
  pid_t v47 = audit_token_to_pid(&atoken);

  uint64_t v99 = v44;
  uint64_t v100 = v40;
  if ((v109 & 0xC000000000000001LL) != 0)
  {
    if (v109 < 0) {
      uint64_t v48 = v109;
    }
    else {
      uint64_t v48 = v109 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v109);
    uint64_t v49 = __CocoaSet.makeIterator()(v48);
    uint64_t v50 = sub_10002A030(0LL, (unint64_t *)&qword_10013CB40, off_10011E488);
    uint64_t v51 = sub_10005FFC4((unint64_t *)&qword_10013F740, (unint64_t *)&qword_10013CB40, off_10011E488);
    uint64_t v52 = Set.Iterator.init(_cocoa:)(&atoken, v49, v50, v51);
    uint64_t v53 = *(void *)atoken.val;
    uint64_t v113 = *(void *)&atoken.val[2];
    uint64_t v54 = *(void *)&atoken.val[4];
    uint64_t v55 = *(void *)&atoken.val[6];
    unint64_t v56 = v120;
  }

  else
  {
    uint64_t v57 = -1LL << *(_BYTE *)(v109 + 32);
    uint64_t v58 = *(void *)(v109 + 56);
    uint64_t v113 = v109 + 56;
    uint64_t v54 = ~v57;
    uint64_t v59 = -v57;
    if (v59 < 64) {
      uint64_t v60 = ~(-1LL << v59);
    }
    else {
      uint64_t v60 = -1LL;
    }
    unint64_t v56 = v60 & v58;
    uint64_t v52 = (void *)swift_bridgeObjectRetain(v109);
    uint64_t v55 = 0LL;
    uint64_t v53 = (uint64_t)v52;
  }

  uint64_t v112 = v53 & 0x7FFFFFFFFFFFFFFFLL;
  v98[1] = v54;
  int64_t v61 = (unint64_t)(v54 + 64) >> 6;
  v111 = (char *)&type metadata for Swift.AnyObject + 8;
  if (v53 < 0) {
    goto LABEL_21;
  }
  while (1)
  {
    if (v56)
    {
      uint64_t v62 = (v56 - 1) & v56;
      unint64_t v63 = __clz(__rbit64(v56)) | (v55 << 6);
      uint64_t v64 = v55;
      goto LABEL_38;
    }

    int64_t v69 = v55 + 1;
    if (__OFADD__(v55, 1LL)) {
      break;
    }
    if (v69 >= v61) {
      goto LABEL_41;
    }
    unint64_t v70 = *(void *)(v113 + 8 * v69);
    uint64_t v64 = v55 + 1;
    if (!v70)
    {
      uint64_t v64 = v55 + 2;
      if (v55 + 2 >= v61) {
        goto LABEL_41;
      }
      unint64_t v70 = *(void *)(v113 + 8 * v64);
      if (!v70)
      {
        uint64_t v64 = v55 + 3;
        if (v55 + 3 >= v61) {
          goto LABEL_41;
        }
        unint64_t v70 = *(void *)(v113 + 8 * v64);
        if (!v70)
        {
          uint64_t v64 = v55 + 4;
          if (v55 + 4 >= v61) {
            goto LABEL_41;
          }
          unint64_t v70 = *(void *)(v113 + 8 * v64);
          if (!v70)
          {
            uint64_t v71 = v55 + 5;
            while (v61 != v71)
            {
              unint64_t v70 = *(void *)(v113 + 8 * v71++);
              if (v70)
              {
                uint64_t v64 = v71 - 1;
                goto LABEL_37;
              }
            }

LABEL_37:
    uint64_t v62 = (v70 - 1) & v70;
    unint64_t v63 = __clz(__rbit64(v70)) + (v64 << 6);
LABEL_38:
    id v68 = *(id *)(*(void *)(v53 + 48) + 8 * v63);
    if (!v68) {
      goto LABEL_41;
    }
    while (1)
    {
      unint64_t v72 = ASCSignpostTagFromIDInProcess(v68, v47);
      sub_10006CA74((uint64_t *)v116, v72);

      uint64_t v55 = v64;
      unint64_t v56 = v62;
      if ((v53 & 0x8000000000000000LL) == 0) {
        break;
      }
LABEL_21:
      uint64_t v65 = __CocoaSet.Iterator.next()(v52);
      if (v65)
      {
        uint64_t v66 = v65;
        *(void *)&v115[0] = v65;
        uint64_t v67 = sub_10002A030(0LL, (unint64_t *)&qword_10013CB40, off_10011E488);
        swift_unknownObjectRetain(v66);
        swift_dynamicCast(v116, v115, v111, v67, 7LL);
        id v68 = *(id *)&v116[0];
        swift_unknownObjectRelease(v66);
        uint64_t v64 = v55;
        uint64_t v62 = v56;
        if (v68) {
          continue;
        }
      }

      goto LABEL_41;
    }
  }

  __break(1u);
}

    a3 = v55;
    uint64_t v52 = v21;
    uint64_t v53 = String.UTF8View._foreignCount()();
    uint64_t v30 = v52 + v53;
    if (!__OFADD__(v52, v53))
    {
LABEL_23:
      if (!__OFADD__(v30, v29))
      {
        String.reserveCapacity(_:)(v30 + v29);
        a1 = v54;
LABEL_25:
        uint64_t v32 = String.subscript.getter(15LL, a1, a5, a6);
        uint64_t v34 = v33;
        unint64_t v56 = v32;
        uint64_t v57 = v35;
        uint64_t v58 = v36;
        uint64_t v59 = v33;
        unint64_t v37 = sub_1000C62E8();
        String.append<A>(contentsOf:)(&v56, &type metadata for Substring, v37);
        swift_bridgeObjectRelease(v34);
        unint64_t v56 = a3;
        uint64_t v57 = a4;
        String.append<A>(contentsOf:)(&v56, &type metadata for String, &protocol witness table for String);
        uint64_t v38 = sub_1000C0D98(a2, a5, a6);
        uint64_t v40 = v39;
        unint64_t v56 = v38;
        uint64_t v57 = v41;
        uint64_t v58 = v42;
        uint64_t v59 = v39;
        String.append<A>(contentsOf:)(&v56, &type metadata for Substring, v37);
        swift_bridgeObjectRelease(v40);
        return;
      }

      goto LABEL_40;
    }

    a3 = v55;
    uint64_t v52 = v21;
    uint64_t v53 = String.UTF8View._foreignCount()();
    uint64_t v30 = v52 + v53;
    if (!__OFADD__(v52, v53))
    {
LABEL_23:
      if (!__OFADD__(v30, v29))
      {
        String.reserveCapacity(_:)(v30 + v29);
        a1 = v54;
LABEL_25:
        uint64_t v32 = String.subscript.getter(15LL, a1, a5, a6);
        uint64_t v34 = v33;
        unint64_t v56 = v32;
        uint64_t v57 = v35;
        uint64_t v58 = v36;
        uint64_t v59 = v33;
        unint64_t v37 = sub_1000C62E8();
        String.append<A>(contentsOf:)(&v56, &type metadata for Substring, v37);
        swift_bridgeObjectRelease(v34);
        unint64_t v56 = a3;
        uint64_t v57 = a4;
        String.append<A>(contentsOf:)(&v56, &type metadata for String, &protocol witness table for String);
        uint64_t v38 = sub_1000C0D98(v11, a5, a6);
        uint64_t v40 = v39;
        unint64_t v56 = v38;
        uint64_t v57 = v41;
        uint64_t v58 = v42;
        uint64_t v59 = v39;
        String.append<A>(contentsOf:)(&v56, &type metadata for Substring, v37);
        swift_bridgeObjectRelease(v40);
        return;
      }

      goto LABEL_40;
    }

  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_1000BE3FC()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  swift_bridgeObjectRelease(*(void *)(v0 + 80));
  swift_bridgeObjectRelease(*(void *)(v0 + 96));
  sub_100029F4C((void *)(v0 + 104));
  return swift_deallocObject(v0, 152LL, 7LL);
}

uint64_t sub_1000BE448(uint64_t a1)
{
  uint64_t v4 = v1[7];
  uint64_t v5 = v1[8];
  uint64_t v6 = v1[9];
  uint64_t v7 = v1[10];
  uint64_t v8 = v1[11];
  uint64_t v9 = v1[12];
  uint64_t v10 = (void *)swift_task_alloc(dword_10013F694);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_100039088;
  return sub_1000BC8EC(a1, (uint64_t)(v1 + 2), v4, v5, v6, v7, v8, v9);
}

uint64_t sub_1000BE4F8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10013F334);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100039088;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F330
                                                                                     + dword_10013F330))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000BE58C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000BE5B0(void *a1)
{
  return sub_1000BEF50(a1, (uint64_t (*)(void, void, void, void, void, void))sub_1000D8B04);
}

uint64_t sub_1000BE5BC(uint64_t a1)
{
  return sub_1000BEF68(a1, (uint64_t (*)(uint64_t, void, void, void, void, void))sub_1000D9010);
}

uint64_t sub_1000BE5CC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_10013F6C4);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100039088;
  return sub_1000BCDAC(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

void sub_1000BE648(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_1000BE650()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  sub_100029F4C((void *)(v0 + 72));
  return swift_deallocObject(v0, 120LL, 7LL);
}

uint64_t sub_1000BE68C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 56);
  uint64_t v5 = *(void *)(v1 + 64);
  uint64_t v6 = (void *)swift_task_alloc(dword_10013F6DC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100039088;
  return sub_1000BBDC0(a1, v1 + 16, v4, v5, v1 + 72);
}

uint64_t sub_1000BE714(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10013F33C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100039088;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F338
                                                                                     + dword_10013F338))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000BE7A8(void *a1)
{
  return sub_1000BEF50(a1, (uint64_t (*)(void, void, void, void, void, void))sub_1000D8860);
}

uint64_t sub_1000BE7B8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v48 = a5;
  uint64_t v47 = a4;
  uint64_t v45 = a2;
  uint64_t v44 = a1;
  uint64_t ObjectType = swift_getObjectType(v5);
  uint64_t v8 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = v5 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service;
  uint64_t v12 = *(void *)(*sub_100029EE0( (void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service),  *(void *)(v5 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_service + 24))
                  + 24LL);
  uint64_t v13 = sub_100029E18(&qword_10013DE80);
  OS_dispatch_queue.sync<A>(execute:)(&v51, sub_1000B712C, v12, v13);
  swift_release(v51);
  uint64_t v14 = sub_100029E18(&qword_10013F688);
  uint64_t inited = swift_initStackObject(v14, v54);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  *(void *)(inited + 32) = ASCSignpostTagUnique();
  uint64_t v16 = sub_1000CB340(inited);
  swift_setDeallocating(inited);
  id v17 = [(id)objc_opt_self(NSXPCConnection) currentConnection];
  id v18 = a3;
  unint64_t v19 = sub_1000C0238(v17, 0LL, 0LL, v18);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v26 = v6 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_appStateController;
  sub_1000388F0(v6 + OBJC_IVAR____TtC19appstorecomponentsd19LockupFetcherClient_fetcher, (uint64_t)&v51);
  sub_1000388F0(v11, (uint64_t)v50);
  sub_1000388F0(v26, (uint64_t)v49);
  char v27 = (void *)swift_allocObject(&unk_100124A60, 208LL, 7LL);
  sub_10002C438(&v51, (uint64_t)(v27 + 2));
  uint64_t v28 = v45;
  v27[7] = v44;
  _BYTE v27[8] = v28;
  v27[9] = v18;
  v27[10] = v16;
  v27[11] = v19;
  v27[12] = v21;
  v27[13] = v23;
  v27[14] = v25;
  sub_10002C438(v50, (uint64_t)(v27 + 15));
  sub_10002C438(v49, (uint64_t)(v27 + 20));
  v27[25] = ObjectType;
  sub_100029E18(&qword_10013F6E8);
  id v29 = v18;
  uint64_t v30 = swift_bridgeObjectRetain(v28);
  uint64_t v31 = Promise.__allocating_init()(v30);
  uint64_t v32 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56LL))(v10, 1LL, 1LL, v32);
  Swift::String v33 = (void *)swift_allocObject(&unk_100124A88, 56LL, 7LL);
  uint64_t v33[2] = 0LL;
  void v33[3] = 0LL;
  v33[4] = &unk_10013F718;
  v33[5] = v27;
  v33[6] = v31;
  swift_retain(v31);
  uint64_t v34 = sub_1000B3448((uint64_t)v10, (uint64_t)&unk_10013F720, (uint64_t)v33);
  swift_release(v34);
  uint64_t v35 = swift_allocObject(&unk_100124AB0, 32LL, 7LL);
  uint64_t v36 = v48;
  *(void *)(v35 + swift_weakDestroy(v0 + 16) = v47;
  *(void *)(v35 + 24) = v36;
  uint64_t v37 = swift_allocObject(&unk_100124AD8, 49LL, 7LL);
  *(void *)(v37 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v37 + 24) = v35;
  *(void *)(v37 + 32) = "getLockup(forBundleID:withContext:enableAppDistribution:withReplyHandler:)";
  *(void *)(v37 + 40) = 74LL;
  *(_BYTE *)(v37 + 48) = 2;
  uint64_t v38 = swift_allocObject(&unk_100124B00, 49LL, 7LL);
  *(void *)(v38 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v38 + 24) = v35;
  *(void *)(v38 + 32) = "getLockup(forBundleID:withContext:enableAppDistribution:withReplyHandler:)";
  *(void *)(v38 + 40) = 74LL;
  *(_BYTE *)(v38 + 48) = 2;
  uint64_t v39 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v35, 2LL);
  uint64_t v40 = swift_retain(v36);
  uint64_t v41 = static OS_dispatch_queue.main.getter(v40);
  uint64_t v52 = v39;
  uint64_t v53 = &protocol witness table for OS_dispatch_queue;
  *(void *)&__int128 v51 = v41;
  Promise.then(perform:orCatchError:on:)(sub_1000BE7A8, v37, sub_1000BE5BC, v38, &v51);
  swift_release(v37);
  swift_release(v38);
  sub_100029F4C(&v51);
  swift_release(v31);
  return swift_release(v35);
}

uint64_t sub_1000BEB9C()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 80));
  swift_bridgeObjectRelease(*(void *)(v0 + 96));
  swift_bridgeObjectRelease(*(void *)(v0 + 112));
  sub_100029F4C((void *)(v0 + 120));
  sub_100029F4C((void *)(v0 + 160));
  return swift_deallocObject(v0, 208LL, 7LL);
}

uint64_t sub_1000BEBF8(uint64_t a1)
{
  uint64_t v10 = v1[8];
  uint64_t v11 = v1[7];
  uint64_t v4 = v1[10];
  uint64_t v9 = v1[9];
  uint64_t v5 = v1[11];
  uint64_t v6 = v1[12];
  uint64_t v7 = (void *)swift_task_alloc(dword_10013F714);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10002A858;
  return sub_1000BB2F0(a1, (uint64_t)(v1 + 2), v11, v10, v9, v4, v5, v6);
}

void sub_1000BECC4(objc_class *a1, uint64_t a2)
{
}

uint64_t sub_1000BECCC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_1000BECF0(uint64_t *a1@<X0>, Swift::Int a2@<X8>)
{
}

uint64_t sub_1000BED08()
{
  return swift_deallocObject(v0, 49LL, 7LL);
}

uint64_t sub_1000BED2C(void *a1)
{
  return sub_1000BEF50(a1, (uint64_t (*)(void, void, void, void, void, void))sub_1000D8ACC);
}

uint64_t sub_1000BED38()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 120));
  swift_bridgeObjectRelease(*(void *)(v0 + 128));
  swift_bridgeObjectRelease(*(void *)(v0 + 144));
  swift_bridgeObjectRelease(*(void *)(v0 + 160));
  sub_100029F4C((void *)(v0 + 168));

  return swift_deallocObject(v0, 224LL, 7LL);
}

uint64_t sub_1000BEDAC(uint64_t a1)
{
  uint64_t v10 = v1[7];
  uint64_t v9 = v1[13];
  uint64_t v4 = v1[15];
  uint64_t v8 = v1[14];
  uint64_t v5 = v1[16];
  uint64_t v6 = (void *)swift_task_alloc(dword_10013F764);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100039088;
  return sub_1000BAE4C(a1, (uint64_t)(v1 + 2), v10, (uint64_t)(v1 + 8), v9, v8, v4, v5);
}

uint64_t sub_1000BEE84(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10013F334);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10002A858;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F330
                                                                                     + dword_10013F330))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000BEF1C()
{
  return swift_deallocObject(v0, 80LL, 7LL);
}

uint64_t sub_1000BEF50(void *a1, uint64_t (*a2)(void, void, void, void, void, void))
{
  return a2( *a1,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(unsigned __int8 *)(v2 + 48));
}

uint64_t sub_1000BEF68(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2( a1,  *(void *)(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(unsigned __int8 *)(v2 + 48));
}

unint64_t sub_1000BEF7C()
{
  unint64_t result = qword_10013F788;
  if (!qword_10013F788)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0904, &type metadata for LockupFetcherClientError);
    atomic_store(result, (unint64_t *)&qword_10013F788);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for LockupFetcherClientError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000BF00C + 4 * byte_1000F0845[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000BF040 + 4 * asc_1000F0840[v4]))();
}

uint64_t sub_1000BF040(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000BF048(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000BF050LL);
  }
  return result;
}

uint64_t sub_1000BF05C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000BF064LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1000BF068(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000BF070(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LockupFetcherClientError()
{
  return &type metadata for LockupFetcherClientError;
}

unint64_t sub_1000BF090()
{
  unint64_t result = qword_10013F790;
  if (!qword_10013F790)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F08DC, &type metadata for LockupFetcherClientError);
    atomic_store(result, (unint64_t *)&qword_10013F790);
  }

  return result;
}

id sub_1000BF120@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result = objc_msgSend(*a1, "ams_isManagedAppleID");
  *a2 = (_BYTE)result;
  return result;
}

id sub_1000BF150(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, "ams_setManagedAppleID:", *a1);
}

uint64_t *sub_1000BF164(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v4;
  uint64_t v9 = sub_100029E18(&qword_10013D300);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v26[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = (char *)v4 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_accountsSubscription;
  uint64_t v13 = sub_100029E18(&qword_10013D308);
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL);
  v25(v12, 1LL, 1LL, v13);
  sub_1000388F0((uint64_t)a1, (uint64_t)(v4 + 2));
  *(uint64_t *)((char *)v4 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_profile) = (uint64_t)a2;
  *(uint64_t *)((char *)v4 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_notificationCenter) = (uint64_t)a3;
  uint64_t v14 = sub_100029E18(&qword_10013F890);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  id v15 = a2;
  id v16 = a3;
  *(uint64_t *)((char *)v4 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_onRestrictionsChange) = AsyncEvent.init()(v16);
  [v16 addObserver:v4 selector:"effectiveSettingsChanged:" name:MCEffectiveSettingsChangedNotification object:v15];
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  sub_100029EE0(a1, v17);
  uint64_t active = dispatch thunk of AccountProvider.onActiveAccountChange.getter(v17, v18);
  uint64_t v21 = v20;
  uint64_t ObjectType = swift_getObjectType(active);
  sub_100057FA0();
  EventEmitter.addObserver<A>(on:target:method:)(v26, v4, sub_1000BF52C, 0LL, ObjectType, v8, v21);

  swift_unknownObjectRelease(active);
  sub_100029F4C(v26);
  v25(v11, 0LL, 1LL, v13);
  uint64_t v23 = (uint64_t)v4 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_accountsSubscription;
  swift_beginAccess( (char *)v4 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_accountsSubscription,  v26,  33LL,  0LL);
  sub_1000BFD9C((uint64_t)v11, v23);
  swift_endAccess(v26);
  sub_100029F4C(a1);
  return v4;
}

uint64_t sub_1000BF394(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC40 != -1) {
    swift_once(&qword_10013BC40, sub_1000D1538);
  }
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v6, (uint64_t)qword_100148600);
  uint64_t v7 = sub_100029E18(&qword_10013EA00);
  uint64_t v8 = type metadata accessor for LogMessage(0LL);
  uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
       + *(void *)(*(void *)(v8 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(34LL, 1LL);
  v10._uint64_t countAndFlagsBits = 0LL;
  v10._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v10);
  LogMessage.StringInterpolation.appendInterpolation(identity:)(a2);
  v11._object = (void *)0x80000001001009C0LL;
  v11._uint64_t countAndFlagsBits = 0xD000000000000022LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v11);
  LogMessage.init(stringInterpolation:)(v5);
  Logger.info(_:)(v9, v6, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v9);
  v13[0] = a2;
  v13[1] = &off_100124E10;
  swift_retain(a2);
  AsyncEvent.post(_:)(v13);
  return swift_release(a2);
}

uint64_t (*sub_1000BF52C(uint64_t a1))(uint64_t a1)
{
  return sub_1000BFDE4;
}

void *sub_1000BF55C()
{
  __int16 v1 = v0;
  uint64_t v2 = sub_100029E18(&qword_10013D300);
  __chkstk_darwin(v2);
  uint64_t v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v5 = sub_100029E18(&qword_10013D308);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v9 = OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_notificationCenter;
  [*(id *)((char *)v1 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_notificationCenter) removeObserver:v1];
  uint64_t v10 = (uint64_t)v1 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_accountsSubscription;
  swift_beginAccess( (char *)v1 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_accountsSubscription,  v19,  0LL,  0LL);
  sub_1000BFDEC(v10, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    sub_10002E92C((uint64_t)v4, &qword_10013D300);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    uint64_t v11 = v1[5];
    uint64_t v12 = v1[6];
    sub_100029EE0(v1 + 2, v11);
    uint64_t active = dispatch thunk of AccountProvider.onActiveAccountChange.getter(v11, v12);
    uint64_t v15 = v14;
    uint64_t ObjectType = swift_getObjectType(active);
    dispatch thunk of EventEmitter.removeObserver(_:)(v8, ObjectType, v15);
    swift_unknownObjectRelease(active);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }

  sub_100029F4C(v1 + 2);
  sub_10002E92C(v10, &qword_10013D300);

  swift_release(*(void *)((char *)v1 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_onRestrictionsChange));
  return v1;
}

uint64_t sub_1000BF738()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1000BF75C()
{
  return type metadata accessor for ManagedRestrictions(0LL);
}

uint64_t type metadata accessor for ManagedRestrictions(uint64_t a1)
{
  uint64_t result = qword_10013F7E0;
  if (!qword_10013F7E0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ManagedRestrictions);
  }
  return result;
}

uint64_t sub_1000BF7A0()
{
  uint64_t v1 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v1);
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v4 = type metadata accessor for Account(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = v0[5];
  uint64_t v9 = v0[6];
  sub_100029EE0(v0 + 2, v8);
  dispatch thunk of AccountProvider.activeAccount.getter(v8, v9);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1LL, v4) == 1)
  {
    sub_10002E92C((uint64_t)v3, &qword_10013C6D0);
    return 0LL;
  }

  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
    uint64_t KeyPath = swift_getKeyPath(&unk_1000F09C8);
    Account.subscript.getter(&v13);
    swift_release(KeyPath);
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
    return v13;
  }

uint64_t sub_1000BF8EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC40 != -1) {
    swift_once(&qword_10013BC40, sub_1000D1538);
  }
  uint64_t v5 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v5, (uint64_t)qword_100148600);
  uint64_t v6 = sub_100029E18(&qword_10013EA00);
  uint64_t v7 = type metadata accessor for LogMessage(0LL);
  uint64_t v8 = swift_allocObject( v6,  ((*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL))
       + *(void *)(*(void *)(v7 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v7 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v8 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(42LL, 1LL);
  v9._uint64_t countAndFlagsBits = 0LL;
  v9._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v9);
  LogMessage.StringInterpolation.appendInterpolation(identity:)(v1);
  v10._object = (void *)0x80000001001009F0LL;
  v10._uint64_t countAndFlagsBits = 0xD00000000000002ALL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v10);
  LogMessage.init(stringInterpolation:)(v4);
  Logger.info(_:)(v8, v5, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v8);
  v12[0] = v1;
  v12[1] = &off_100124E10;
  swift_retain(v1);
  AsyncEvent.post(_:)(v12);
  return swift_release(v1);
}

void sub_1000BFB24(uint64_t a1)
{
  v4[0] = "(";
  sub_1000BFBB8(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    void v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    void v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 5LL, v4, a1 + 80);
  }

void sub_1000BFBB8(uint64_t a1)
{
  if (!qword_10013F7F0)
  {
    uint64_t v2 = sub_100029F6C(&qword_10013D308);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_10013F7F0);
    }
  }

uint64_t sub_1000BFC10()
{
  id v1 =  [*(id *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_profile) effectiveValueForSetting:MCFeatureMaximumAppsRating];
  if (!v1) {
    return sub_1000BA07C();
  }
  uint64_t v2 = v1;
  id v3 = [v1 integerValue];

  return (uint64_t)v3;
}

id sub_1000BFC8C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result = objc_msgSend(*a1, "ams_isManagedAppleID");
  *a2 = (_BYTE)result;
  return result;
}

id sub_1000BFCBC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, "ams_setManagedAppleID:", *a1);
}

BOOL sub_1000BFCD0()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t v0 = (__CFString *)String._bridgeToObjectiveC()();
  id v1 = (__CFString *)String._bridgeToObjectiveC()();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, &keyExistsAndHasValidFormat);

  if (AppBooleanValue) {
    BOOL v3 = keyExistsAndHasValidFormat == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

uint64_t sub_1000BFD9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013D300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000BFDE4(uint64_t a1)
{
  return sub_1000BF394(a1, v1);
}

uint64_t sub_1000BFDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013D300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t destroy for MediaClient(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 24));
}

void *initializeWithCopy for MediaClient(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

void *assignWithCopy for MediaClient(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for MediaClient(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for MediaClient(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for MediaClient(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MediaClient(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + swift_weakDestroy(v0 + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
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

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MediaClient()
{
  return &type metadata for MediaClient;
}

Swift::Int sub_1000BFFEC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  Hasher.init(_seed:)(v6);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v6, v1, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v6, v4, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1000C0070(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(a1, v6, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_1000C00E0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  Hasher.init(_seed:)(v6);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v6, v1, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v6, v4, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_1000C0160(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = a2[3];
  BOOL v11 = v4 == *a2 && v5 == v8;
  if (v11 || (char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v8, 0LL), result = 0LL, (v12 & 1) != 0))
  {
    if (v6 == v9 && v7 == v10) {
      return 1LL;
    }
    else {
      return _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, v9, v10, 0LL);
    }
  }

  return result;
}

unint64_t sub_1000C01F4()
{
  unint64_t result = qword_10013F898;
  if (!qword_10013F898)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0A10, &type metadata for MediaClient);
    atomic_store(result, (unint64_t *)&qword_10013F898);
  }

  return result;
}

unint64_t sub_1000C0238(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (!a1 || (id v8 = a1, v9 = sub_1000CB710(a2, a3), v11 = v10, v8, !v11))
  {
    swift_bridgeObjectRelease(a3);
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"gameCenter");
    uint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    if (v13 != v16 || v15 != v17)
    {
      uint64_t v19 = v17;
      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16, v17, 0LL);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v19);
      if ((v20 & 1) != 0) {
        goto LABEL_18;
      }
      uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"gameCenterArcade");
      uint64_t v15 = v22;
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
      if (v21 != v23 || v15 != v24)
      {
        uint64_t v26 = v24;
        char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v15, v23, v24, 0LL);
        swift_bridgeObjectRelease(v15);
        swift_bridgeObjectRelease(v26);
        if ((v27 & 1) == 0)
        {
          uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"overlay");
          uint64_t v30 = v29;
          uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
          uint64_t v33 = v31;
          if (v28 != v32 || v30 != v31)
          {
            char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v30, v32, v31, 0LL);
            swift_bridgeObjectRelease(v30);
            swift_bridgeObjectRelease(v33);
            if ((v35 & 1) != 0) {
              goto LABEL_24;
            }
            uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"overlayClip");
            uint64_t v30 = v37;
            uint64_t v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
            uint64_t v40 = v38;
            if (v36 != v39 || v30 != v38)
            {
              _stringCompareWithSmolCheck(_:_:expecting:)(v36, v30, v39, v38, 0LL);
              swift_bridgeObjectRelease(v30);
              swift_bridgeObjectRelease(v40);
              goto LABEL_24;
            }
          }

          swift_bridgeObjectRelease_n(v30, 2LL);
LABEL_24:
          id v9 = (id)0xD00000000000001ELL;

          return (unint64_t)v9;
        }

void *sub_1000C0500(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for LogMessage(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v7 = *(void *)(a1 + 16);
  id v8 = _swiftEmptyArrayStorage;
  if (v7)
  {
    v13[1] = v1;
    uint64_t v15 = _swiftEmptyArrayStorage;
    sub_1000901E0(0LL, v7, 0);
    uint64_t v9 = a1 + 32;
    do
    {
      sub_100060108(v9, (uint64_t)v14);
      static LogMessage.safe(_:)(v14);
      sub_10002E92C((uint64_t)v14, &qword_10013C6F0);
      id v8 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
      {
        sub_1000901E0(0LL, v8[2] + 1LL, 1);
        id v8 = v15;
      }

      unint64_t v11 = v8[2];
      unint64_t v10 = v8[3];
      if (v11 >= v10 >> 1)
      {
        sub_1000901E0(v10 > 1, v11 + 1, 1);
        id v8 = v15;
      }

      v8[2] = v11 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))( (unint64_t)v8 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
      + *(void *)(v4 + 72) * v11,
        v6,
        v3);
      uint64_t v15 = v8;
      v9 += 32LL;
      --v7;
    }

    while (v7);
  }

  return v8;
}

uint64_t sub_1000C0684(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(a2);
  uint64_t v8 = a2;
  sub_1000C42DC(a1, (uint64_t)sub_1000C429C, 0LL, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  uint64_t v6 = v8;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  if (v2) {
    swift_bridgeObjectRelease(v6);
  }
  return v6;
}

void sub_1000C0700( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v60 = 0LL;
  unint64_t v61 = 0xE000000000000000LL;
  unint64_t v56 = a5;
  unint64_t v57 = a6;
  swift_bridgeObjectRetain(a6);
  Substring.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease(v12);
  if ((v13 & 0x1000000000000000LL) != 0) {
    goto LABEL_25;
  }
  unint64_t v56 = a3;
  unint64_t v57 = a4;
  swift_bridgeObjectRetain(a4);
  Substring.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease(v14);
  if ((v15 & 0x1000000000000000LL) != 0) {
    goto LABEL_25;
  }
  uint64_t v16 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000LL) == 0) {
    LOBYTE(vswift_weakDestroy(v0 + 16) = 1;
  }
  uint64_t v17 = 4LL << v16;
  unint64_t v18 = a1;
  if ((a1 & 0xC) == 4LL << v16) {
    unint64_t v18 = sub_100051114(a1, a5, a6);
  }
  unint64_t v54 = a1;
  unint64_t v55 = a3;
  unint64_t v19 = a2;
  unint64_t v20 = a5 & 0x800000000000000LL;
  if ((a6 & 0x1000000000000000LL) != 0)
  {
    uint64_t v22 = a6 & 0x2000000000000000LL;
    uint64_t v24 = a5 & 0xFFFFFFFFFFFFLL;
    unint64_t v23 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000LL) != 0) {
      unint64_t v43 = HIBYTE(a6) & 0xF;
    }
    else {
      unint64_t v43 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v43 < v18 >> 16) {
      goto LABEL_43;
    }
    uint64_t v21 = String.UTF8View._foreignDistance(from:to:)(15LL, v18, a5, a6);
    if (v20) {
      uint64_t v25 = 7LL;
    }
    else {
      uint64_t v25 = 11LL;
    }
  }

  else
  {
    uint64_t v21 = v18 >> 16;
    uint64_t v22 = a6 & 0x2000000000000000LL;
    unint64_t v23 = HIBYTE(a6) & 0xF;
    uint64_t v24 = a5 & 0xFFFFFFFFFFFFLL;
    uint64_t v25 = 7LL;
  }

  if (!v22) {
    unint64_t v23 = v24;
  }
  uint64_t v26 = 4LL << (v20 >> 59);
  unint64_t v27 = v25 | (v23 << 16);
  a2 = v19;
  if ((a6 & 0x1000000000000000LL) == 0) {
    uint64_t v26 = 8LL;
  }
  unint64_t v28 = v19;
  if ((v19 & 0xC) == v26)
  {
    unint64_t v44 = v19;
    uint64_t v45 = v21;
    uint64_t v46 = sub_100051114(v44, a5, a6);
    uint64_t v21 = v45;
    unint64_t v28 = v46;
  }

  if ((v25 & 0xC) == v17)
  {
    unint64_t v47 = v25 | (v23 << 16);
    uint64_t v48 = v21;
    uint64_t v49 = sub_100051114(v47, a5, a6);
    uint64_t v21 = v48;
    unint64_t v27 = v49;
    if ((a6 & 0x1000000000000000LL) == 0)
    {
LABEL_17:
      uint64_t v29 = (v27 >> 16) - (v28 >> 16);
      if ((a4 & 0x1000000000000000LL) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }

  else if ((a6 & 0x1000000000000000LL) == 0)
  {
    goto LABEL_17;
  }

  if (v23 < v28 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }

  if (v23 >= v27 >> 16)
  {
    uint64_t v50 = v21;
    uint64_t v51 = String.UTF8View._foreignDistance(from:to:)(v28, v27, a5, a6);
    uint64_t v21 = v50;
    uint64_t v29 = v51;
    if ((a4 & 0x1000000000000000LL) == 0)
    {
LABEL_18:
      a3 = v55;
      if ((a4 & 0x2000000000000000LL) != 0)
      {
        uint64_t v31 = HIBYTE(a4) & 0xF;
        uint64_t v30 = v21 + v31;
        if (!__OFADD__(v21, v31)) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t v30 = v21 + (v55 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v21, v55 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_23;
        }
      }

      goto LABEL_39;
    }

void sub_1000C0A44( unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v60 = 0LL;
  unint64_t v61 = 0xE000000000000000LL;
  unint64_t v11 = String.index(after:)(a2, a5, a6);
  unint64_t v56 = a5;
  unint64_t v57 = a6;
  swift_bridgeObjectRetain(a6);
  Substring.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease(v12);
  if ((v13 & 0x1000000000000000LL) != 0) {
    goto LABEL_25;
  }
  unint64_t v56 = a3;
  unint64_t v57 = a4;
  swift_bridgeObjectRetain(a4);
  Substring.init<A>(_:)(&v56, &type metadata for String, &protocol witness table for String);
  uint64_t v15 = v14;
  swift_bridgeObjectRelease(v14);
  if ((v15 & 0x1000000000000000LL) != 0) {
    goto LABEL_25;
  }
  uint64_t v16 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000LL) == 0) {
    LOBYTE(vswift_weakDestroy(v0 + 16) = 1;
  }
  uint64_t v17 = 4LL << v16;
  unint64_t v18 = a1;
  if ((a1 & 0xC) == 4LL << v16) {
    unint64_t v18 = sub_100051114(a1, a5, a6);
  }
  unint64_t v54 = a1;
  unint64_t v55 = a3;
  unint64_t v19 = v11;
  unint64_t v20 = a5 & 0x800000000000000LL;
  if ((a6 & 0x1000000000000000LL) != 0)
  {
    uint64_t v22 = a6 & 0x2000000000000000LL;
    uint64_t v24 = a5 & 0xFFFFFFFFFFFFLL;
    unint64_t v23 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000LL) != 0) {
      unint64_t v43 = HIBYTE(a6) & 0xF;
    }
    else {
      unint64_t v43 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v43 < v18 >> 16) {
      goto LABEL_43;
    }
    uint64_t v21 = String.UTF8View._foreignDistance(from:to:)(15LL, v18, a5, a6);
    if (v20) {
      uint64_t v25 = 7LL;
    }
    else {
      uint64_t v25 = 11LL;
    }
  }

  else
  {
    uint64_t v21 = v18 >> 16;
    uint64_t v22 = a6 & 0x2000000000000000LL;
    unint64_t v23 = HIBYTE(a6) & 0xF;
    uint64_t v24 = a5 & 0xFFFFFFFFFFFFLL;
    uint64_t v25 = 7LL;
  }

  if (!v22) {
    unint64_t v23 = v24;
  }
  uint64_t v26 = 4LL << (v20 >> 59);
  unint64_t v27 = v25 | (v23 << 16);
  unint64_t v11 = v19;
  if ((a6 & 0x1000000000000000LL) == 0) {
    uint64_t v26 = 8LL;
  }
  unint64_t v28 = v19;
  if ((v19 & 0xC) == v26)
  {
    unint64_t v44 = v19;
    uint64_t v45 = v21;
    uint64_t v46 = sub_100051114(v44, a5, a6);
    uint64_t v21 = v45;
    unint64_t v28 = v46;
  }

  if ((v25 & 0xC) == v17)
  {
    unint64_t v47 = v25 | (v23 << 16);
    uint64_t v48 = v21;
    uint64_t v49 = sub_100051114(v47, a5, a6);
    uint64_t v21 = v48;
    unint64_t v27 = v49;
    if ((a6 & 0x1000000000000000LL) == 0)
    {
LABEL_17:
      uint64_t v29 = (v27 >> 16) - (v28 >> 16);
      if ((a4 & 0x1000000000000000LL) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }

  else if ((a6 & 0x1000000000000000LL) == 0)
  {
    goto LABEL_17;
  }

  if (v23 < v28 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }

  if (v23 >= v27 >> 16)
  {
    uint64_t v50 = v21;
    uint64_t v51 = String.UTF8View._foreignDistance(from:to:)(v28, v27, a5, a6);
    uint64_t v21 = v50;
    uint64_t v29 = v51;
    if ((a4 & 0x1000000000000000LL) == 0)
    {
LABEL_18:
      a3 = v55;
      if ((a4 & 0x2000000000000000LL) != 0)
      {
        uint64_t v31 = HIBYTE(a4) & 0xF;
        uint64_t v30 = v21 + v31;
        if (!__OFADD__(v21, v31)) {
          goto LABEL_23;
        }
      }

      else
      {
        uint64_t v30 = v21 + (v55 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v21, v55 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_23;
        }
      }

      goto LABEL_39;
    }

unint64_t sub_1000C0D98(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000LL) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return String.subscript.getter();
  }
  __break(1u);
  return result;
}

void sub_1000C0DE4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v32 = a6;
  uint64_t v33 = a4;
  uint64_t v10 = sub_100029E18(&qword_10013F990);
  __n128 v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DateInterval(0LL, v11);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10006B418(v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14) == 1)
  {
    sub_10002E92C((uint64_t)v13, &qword_10013F990);
    unint64_t v18 = sub_10006A070();
    uint64_t v19 = swift_allocError(&type metadata for ASCSignpostGroupError, v18, 0LL, 0LL);
    *(_OWORD *)uint64_t v20 = 0u;
    *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = 0u;
    *(_BYTE *)(v20 + 32) = 7;
    swift_willThrow(v19);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
    id v21 = [a2 tags];
    uint64_t v22 = sub_10002A030(0LL, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
    unint64_t v23 = sub_1000C6334();
    uint64_t v24 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v21, v22, v23);

    uint64_t v25 = sub_100058668(v24, (uint64_t)sub_100068718, 0LL);
    uint64_t v26 = v25;
    if (*(void *)(v25 + 16))
    {
      unint64_t v27 = objc_autoreleasePoolPush();
      sub_1000C1054(a1, (uint64_t)v17, v26, a5, v32, a3, v33);
      objc_autoreleasePoolPop(v27);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      swift_bridgeObjectRelease(v26);
    }

    else
    {
      swift_bridgeObjectRelease(v25);
      unint64_t v28 = sub_10006A070();
      uint64_t v29 = swift_allocError(&type metadata for ASCSignpostGroupError, v28, 0LL, 0LL);
      *(void *)uint64_t v30 = 1LL;
      *(void *)(v30 + 8) = 0LL;
      *(void *)(v30 + swift_weakDestroy(v0 + 16) = 0LL;
      *(void *)(v30 + 24) = 0LL;
      *(_BYTE *)(v30 + 32) = 7;
      swift_willThrow(v29);
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    }
  }

double sub_1000C1054( uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v37 = &_swiftEmptySetSingleton;
  __n128 v11 = (void *)objc_opt_self(&OBJC_CLASS___ASCViewRender);
  id v12 = [v11 subsystem];
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  uint64_t v15 = v14;

  id v16 = [v11 category];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v19 = v18;

  uint64_t v20 = a4;
  uint64_t v31 = a3;
  uint64_t v32 = (void **)&v37;
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  sub_1000D1F84(a2, v13, v15, v17, v19, (uint64_t)sub_1000C638C, (uint64_t)v30);
  if (v29)
  {
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v19);
    id v21 = v37;
  }

  else
  {
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v19);
    uint64_t v22 = v37;
    if (v37[2])
    {
      unint64_t v23 = sub_10006A070();
      uint64_t v24 = swift_allocError(&type metadata for ASCSignpostGroupError, v23, 0LL, 0LL);
      *(void *)uint64_t v25 = v22;
      *(void *)(v25 + 8) = 0LL;
      *(void *)(v25 + swift_weakDestroy(v0 + 16) = 0LL;
      *(void *)(v25 + 24) = 0LL;
      *(_BYTE *)(v25 + 32) = 6;
      swift_bridgeObjectRetain(v22);
      v20(v24);
      swift_errorRelease(v24);
      uint64_t v22 = v37;
    }

    id v21 = v22;
  }

  *(void *)&double result = swift_bridgeObjectRelease(v21).n128_u64[0];
  return result;
}

void sub_1000C11FC(uint64_t a1, void *a2)
{
  uint64_t v5 = type metadata accessor for CharacterSet(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v39[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v45 = _swiftEmptyDictionarySingleton;
  uint64_t v40 = &v45;
  sub_1000C0DE4(a1, a2, (uint64_t)sub_1000C632C, (uint64_t)v39, (void (*)(uint64_t))sub_1000C1558, 0LL);
  uint64_t v9 = v45;
  if (v2) {
    goto LABEL_2;
  }
  if (!v45[2])
  {
    unint64_t v28 = sub_10006A070();
    uint64_t v29 = swift_allocError(&type metadata for ASCSignpostGroupError, v28, 0LL, 0LL);
    *(void *)uint64_t v30 = 2LL;
    *(void *)(v30 + 8) = 0LL;
    *(void *)(v30 + swift_weakDestroy(v0 + 16) = 0LL;
    *(void *)(v30 + 24) = 0LL;
    *(_BYTE *)(v30 + 32) = 7;
    swift_willThrow(v29);
    uint64_t v9 = v45;
LABEL_2:
    swift_bridgeObjectRelease(v9);
    return;
  }

  id v10 = [(id)objc_opt_self(ASCViewRender) category];
  unint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v13 = v12;

  *(void *)&__int128 v43 = countAndFlagsBits;
  *((void *)&v43 + 1) = v13;
  static CharacterSet.lowercaseLetters.getter();
  unint64_t v14 = sub_10006A134();
  uint64_t v15 = StringProtocol.rangeOfCharacter(from:options:range:)(v8, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v14);
  char v17 = v16;
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  if ((v17 & 1) != 0)
  {
    Swift::String v31 = String.lowercased()();
    unint64_t countAndFlagsBits = v31._countAndFlagsBits;
    object = v31._object;
LABEL_10:
    swift_bridgeObjectRelease(v13);
    uint64_t v13 = object;
    goto LABEL_11;
  }

  unint64_t v18 = String.index(_:offsetBy:limitedBy:)(v15, -1LL, 15LL, countAndFlagsBits, v13);
  if ((v19 & 1) == 0)
  {
    unint64_t v20 = v18;
    if (v18 >= 0x4000)
    {
      String.subscript.getter(15LL, v18, countAndFlagsBits, v13);
      uint64_t v35 = v34;
      Swift::String v36 = Substring.lowercased()();
      swift_bridgeObjectRelease(v35);
      sub_1000C0700( 0xFuLL,  v20,  v36._countAndFlagsBits,  (unint64_t)v36._object,  countAndFlagsBits,  (unint64_t)v13);
      unint64_t countAndFlagsBits = v37;
      object = v38;
      swift_bridgeObjectRelease(v13);
      uint64_t v13 = v36._object;
    }

    else
    {
      swift_bridgeObjectRetain(v13);
      uint64_t v21 = String.index(after:)(v20, countAndFlagsBits, v13);
      String.subscript.getter(15LL, v21, countAndFlagsBits, v13);
      uint64_t v23 = v22;
      swift_bridgeObjectRelease(v13);
      Swift::String v24 = Substring.lowercased()();
      swift_bridgeObjectRelease(v23);
      sub_1000C0A44( 0xFuLL,  v20,  v24._countAndFlagsBits,  (unint64_t)v24._object,  countAndFlagsBits,  (unint64_t)v13);
      unint64_t countAndFlagsBits = v25;
      object = v26;
      swift_bridgeObjectRelease(v13);
      uint64_t v13 = v24._object;
    }

    goto LABEL_10;
  }

uint64_t sub_1000C1558(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = a1;
  swift_errorRetain(a1);
  uint64_t v10 = sub_100029E18((uint64_t *)&unk_10013E900);
  if (swift_dynamicCast(&v29, &v34, v10, &type metadata for ASCSignpostGroupError, 0LL))
  {
    if (v33 == 7 && (!(v31 | v30 | v29 | v32) || v29 == 1 && !(v31 | v30 | v32)))
    {
      uint64_t v11 = swift_errorRelease(v34);
      swift_willThrow(v11);
      return swift_errorRetain(a1);
    }

    sub_10006A234(v29, v30, v31, v32, v33);
  }

  uint64_t v25 = v1;
  swift_errorRelease(v34);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v13 = sub_10002A768(v6, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  uint64_t v14 = sub_100029E18(&qword_10013EA00);
  uint64_t v15 = type metadata accessor for LogMessage(0LL);
  uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
        + *(void *)(*(void *)(v15 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(32LL, 2LL);
  v17._unint64_t countAndFlagsBits = 0LL;
  v17._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  uint64_t v18 = sub_10002A030(0LL, &qword_10013F998, &off_10011E590);
  uint64_t v32 = sub_100029E18(&qword_10013F9A0);
  uint64_t v29 = v18;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(&v29);
  sub_10002E92C((uint64_t)&v29, &qword_10013C6F0);
  v19._object = (void *)0x8000000100100DA0LL;
  v19._unint64_t countAndFlagsBits = 0xD000000000000020LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v19);
  swift_getErrorValue(a1, v28, &v26);
  uint64_t v20 = v26;
  uint64_t v21 = v27;
  uint64_t v32 = v27;
  uint64_t v22 = sub_10002C328(&v29);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 16LL))(v22, v20, v21);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(&v29);
  sub_10002E92C((uint64_t)&v29, &qword_10013C6F0);
  v23._unint64_t countAndFlagsBits = 0LL;
  v23._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  LogMessage.init(stringInterpolation:)(v5);
  Logger.error(_:)(v16, v6, &protocol witness table for OSLogger);
  __n128 v24 = swift_bridgeObjectRelease(v16);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v7 + 8))(v9, v6, v24);
}

uint64_t sub_1000C185C(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = a2;
  uint64_t v42 = a1;
  uint64_t v2 = type metadata accessor for CharacterSet(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for PreferenceNamespace(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = sub_100029E18((uint64_t *)&unk_10013F970);
  uint64_t v45 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013CCD0);
  uint64_t v12 = swift_allocObject(v11, 48LL, 7LL);
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  id v13 = [(id)objc_opt_self(ASCViewRender) category];
  unint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  unint64_t v16 = v15;

  v46[0] = countAndFlagsBits;
  v46[1] = v16;
  static CharacterSet.lowercaseLetters.getter();
  unint64_t v17 = sub_10006A134();
  uint64_t v18 = StringProtocol.rangeOfCharacter(from:options:range:)(v5, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v17);
  char v20 = v19;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((v20 & 1) != 0)
  {
    Swift::String v32 = String.lowercased()();
    unint64_t countAndFlagsBits = v32._countAndFlagsBits;
    object = v32._object;
    uint64_t v24 = v42;
LABEL_9:
    swift_bridgeObjectRelease(v16);
    unint64_t v16 = (unint64_t)object;
    goto LABEL_10;
  }

  unint64_t v21 = String.index(_:offsetBy:limitedBy:)(v18, -1LL, 15LL, countAndFlagsBits, v16);
  if ((v22 & 1) == 0)
  {
    unint64_t v23 = v21;
    uint64_t v24 = v42;
    if (v21 >= 0x4000)
    {
      String.subscript.getter(15LL, v21, countAndFlagsBits, v16);
      uint64_t v35 = v34;
      Swift::String v36 = Substring.lowercased()();
      uint64_t v29 = v36._object;
      swift_bridgeObjectRelease(v35);
      sub_1000C0700(0xFuLL, v23, v36._countAndFlagsBits, (unint64_t)v36._object, countAndFlagsBits, v16);
    }

    else
    {
      swift_bridgeObjectRetain(v16);
      uint64_t v25 = String.index(after:)(v23, countAndFlagsBits, v16);
      v41[1] = String.subscript.getter(15LL, v25, countAndFlagsBits, v16);
      uint64_t v27 = v26;
      swift_bridgeObjectRelease(v16);
      Swift::String v28 = Substring.lowercased()();
      uint64_t v29 = v28._object;
      swift_bridgeObjectRelease(v27);
      sub_1000C0A44(0xFuLL, v23, v28._countAndFlagsBits, (unint64_t)v28._object, countAndFlagsBits, v16);
    }

    unint64_t countAndFlagsBits = v30;
    object = v31;
    swift_bridgeObjectRelease(v16);
    unint64_t v16 = (unint64_t)v29;
    goto LABEL_9;
  }

  uint64_t v24 = v42;
LABEL_10:
  uint64_t v38 = v43;
  uint64_t v37 = v44;
  uint64_t ObjectType = swift_getObjectType(v24);
  *(void *)(v12 + 32) = countAndFlagsBits;
  *(void *)(v12 + 40) = v16;
  PreferenceNamespace.init(components:)(v12);
  PreferenceKey.init(_:in:)(0x646563726F467369LL, 0xE800000000000000LL, v8, &type metadata for Bool);
  Preferences.subscript.getter(v46, v10, ObjectType, &type metadata for Bool, v37);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v10, v38);
  return v46[0] & 1;
}

uint64_t sub_1000C1BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v56 = a2;
  uint64_t v57 = a1;
  uint64_t v54 = a3;
  uint64_t v5 = type metadata accessor for CharacterSet(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for PreferenceNamespace(0LL);
  __chkstk_darwin(v9);
  uint64_t v58 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013F9A8);
  uint64_t v60 = *(void *)(v11 - 8);
  uint64_t v61 = v11;
  __chkstk_darwin(v11);
  id v13 = (char *)&v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  __chkstk_darwin(v14);
  uint64_t v59 = (uint64_t *)((char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v16 = type metadata accessor for Date(0LL);
  uint64_t v55 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  Swift::Int v53 = (char *)&v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_100029E18(&qword_10013CCD0);
  uint64_t v19 = swift_allocObject(v18, 48LL, 7LL);
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  id v20 = [(id)objc_opt_self(ASCViewRender) category];
  unint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
  unint64_t v23 = v22;

  unint64_t v62 = countAndFlagsBits;
  unint64_t v63 = v23;
  static CharacterSet.lowercaseLetters.getter();
  unint64_t v24 = sub_10006A134();
  uint64_t v25 = StringProtocol.rangeOfCharacter(from:options:range:)(v8, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v24);
  char v27 = v26;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((v27 & 1) != 0)
  {
    Swift::String v39 = String.lowercased()();
    unint64_t countAndFlagsBits = v39._countAndFlagsBits;
    object = v39._object;
    uint64_t v31 = v54;
  }

  else
  {
    unint64_t v28 = String.index(_:offsetBy:limitedBy:)(v25, -1LL, 15LL, countAndFlagsBits, v23);
    if ((v29 & 1) != 0)
    {
      uint64_t v31 = v54;
      goto LABEL_10;
    }

    unint64_t v30 = v28;
    uint64_t v31 = v54;
    if (v28 >= 0x4000)
    {
      String.subscript.getter(15LL, v28, countAndFlagsBits, v23);
      uint64_t v42 = v41;
      Swift::String v43 = Substring.lowercased()();
      Swift::String v36 = v43._object;
      swift_bridgeObjectRelease(v42);
      sub_1000C0700(0xFuLL, v30, v43._countAndFlagsBits, (unint64_t)v43._object, countAndFlagsBits, v23);
    }

    else
    {
      swift_bridgeObjectRetain(v23);
      uint64_t v32 = String.index(after:)(v30, countAndFlagsBits, v23);
      uint64_t v52 = String.subscript.getter(15LL, v32, countAndFlagsBits, v23);
      uint64_t v34 = v33;
      swift_bridgeObjectRelease(v23);
      Swift::String v35 = Substring.lowercased()();
      Swift::String v36 = v35._object;
      swift_bridgeObjectRelease(v34);
      sub_1000C0A44(0xFuLL, v30, v35._countAndFlagsBits, (unint64_t)v35._object, countAndFlagsBits, v23);
    }

    unint64_t countAndFlagsBits = v37;
    object = v38;
    swift_bridgeObjectRelease(v23);
    unint64_t v23 = (unint64_t)v36;
  }

  swift_bridgeObjectRelease(v23);
  unint64_t v23 = (unint64_t)object;
LABEL_10:
  uint64_t v44 = v56;
  uint64_t v45 = v55;
  uint64_t ObjectType = swift_getObjectType(v57);
  *(void *)(v19 + 32) = countAndFlagsBits;
  *(void *)(v19 + 40) = v23;
  unint64_t v47 = v58;
  PreferenceNamespace.init(components:)(v19);
  PreferenceKey.init(_:in:)(0x536E6F6973736573LL, 0xEC00000074726174LL, v47, v16);
  uint64_t v48 = v59;
  Preferences.subscript.getter(v59, v13, ObjectType, v16, v44);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v13, v61);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v45 + 48))(v48, 1LL, v16) == 1)
  {
    sub_10002E92C((uint64_t)v48, (uint64_t *)&unk_10013F9B0);
    uint64_t v49 = 1LL;
  }

  else
  {
    uint64_t v50 = v53;
    (*(void (**)(char *, void *, uint64_t))(v45 + 32))(v53, v48, v16);
    static Date.+ infix(_:_:)(v50, a4);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v50, v16);
    uint64_t v49 = 0LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v31, v49, 1LL, v16);
}

unint64_t sub_1000C2038(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = sub_100029E18(&qword_10013F670);
  uint64_t inited = swift_initStackObject(v8, &v14);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EF270;
  *(void *)(inited + 32) = 0xD000000000000011LL;
  *(void *)(inited + 40) = 0x8000000100100D40LL;
  id v10 = [objc_allocWithZone(NSNumber) initWithDouble:a3];
  uint64_t v11 = sub_10002A030(0LL, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
  *(void *)(inited + 48) = v10;
  *(void *)(inited + 72) = v11;
  *(void *)(inited + 80) = 0xD000000000000010LL;
  *(void *)(inited + 88) = 0x8000000100100D60LL;
  *(void *)(inited + 96) = objc_msgSend( objc_allocWithZone(NSNumber),  "initWithBool:",  sub_1000C185C(a1, a2) & 1);
  *(void *)(inited + 120) = v11;
  *(void *)(inited + 128) = 0xD000000000000019LL;
  *(void *)(inited + 136) = 0x8000000100100D80LL;
  id v12 = [objc_allocWithZone(NSNumber) initWithDouble:a4];
  *(void *)(inited + 168) = v11;
  *(void *)(inited + 144) = v12;
  return sub_100044F60(inited);
}

uint64_t sub_1000C21A4(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v83 = a2;
  uint64_t v82 = type metadata accessor for CharacterSet(0LL);
  uint64_t v80 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v81 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for PreferenceNamespace(0LL);
  __chkstk_darwin(v8);
  id v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013F9A8);
  __chkstk_darwin(v11);
  id v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100029E18((uint64_t *)&unk_10013F9B0);
  uint64_t v15 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v14);
  uint64_t v17 = (char *)&v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v74 - v18;
  uint64_t v20 = type metadata accessor for Date(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v20);
  unint64_t v24 = (char *)&v74 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v22);
  char v26 = (char *)&v74 - v25;
  uint64_t v27 = a1;
  uint64_t v28 = a1;
  uint64_t v29 = v83;
  if ((sub_1000C185C(v28, v83) & 1) != 0) {
    return 1LL;
  }
  uint64_t v78 = v27;
  uint64_t v79 = v21;
  id v75 = v17;
  unint64_t v76 = v10;
  uint64_t v77 = v13;
  if (a4 <= 0.0) {
    return 0LL;
  }
  if (a4 < 1.0)
  {
    uint64_t v31 = v29;
    sub_1000C1BC4(v78, v29, (uint64_t)v19, a3);
    uint64_t v32 = v79;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v79 + 48))(v19, 1LL, v20) == 1)
    {
      sub_10002E92C((uint64_t)v19, (uint64_t *)&unk_10013F9B0);
      uint64_t v34 = v81;
      uint64_t v33 = v82;
      uint64_t v35 = v80;
      goto LABEL_8;
    }

    uint64_t v36 = (*(uint64_t (**)(char *, char *, uint64_t))(v32 + 32))(v26, v19, v20);
    Date.init()(v36);
    char v37 = static Date.< infix(_:_:)(v24, v26);
    uint64_t v38 = *(void (**)(char *, uint64_t))(v32 + 8);
    v38(v24, v20);
    v38(v26, v20);
    uint64_t v34 = v81;
    uint64_t v33 = v82;
    uint64_t v35 = v80;
    if ((v37 & 1) == 0)
    {
LABEL_8:
      double v39 = (double)sub_1000C4630(0x20000000000001uLL) * 1.11022302e-16 + 0.0;
      if (fabs(v39)) {
        BOOL v40 = v39 > a4;
      }
      else {
        BOOL v40 = 1;
      }
      if (!v40)
      {
        uint64_t v42 = sub_100029E18(&qword_10013CCD0);
        uint64_t v82 = swift_allocObject(v42, 48LL, 7LL);
        *(_OWORD *)(v82 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
        id v43 = [(id)objc_opt_self(ASCViewRender) category];
        unint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
        unint64_t v46 = v45;

        unint64_t v84 = v44;
        unint64_t v85 = v46;
        static CharacterSet.lowercaseLetters.getter();
        unint64_t v47 = sub_10006A134();
        uint64_t v48 = StringProtocol.rangeOfCharacter(from:options:range:)( v34,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  v47);
        char v50 = v49;
        (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v33);
        if ((v50 & 1) != 0)
        {
          Swift::String v62 = String.lowercased()();
          uint64_t countAndFlagsBits = v62._countAndFlagsBits;
          object = v62._object;
          uint64_t v54 = v78;
        }

        else
        {
          unint64_t v51 = String.index(_:offsetBy:limitedBy:)(v48, -1LL, 15LL, v44, v46);
          if ((v52 & 1) != 0)
          {
            uint64_t countAndFlagsBits = v44;
            uint64_t v54 = v78;
LABEL_24:
            id v68 = v76;
            int64_t v69 = v77;
            unint64_t v70 = v75;
            uint64_t v71 = v82;
            uint64_t ObjectType = swift_getObjectType(v54);
            *(void *)(v71 + 32) = countAndFlagsBits;
            *(void *)(v71 + 40) = v46;
            PreferenceNamespace.init(components:)(v71);
            uint64_t v73 = PreferenceKey.init(_:in:)(0x536E6F6973736573LL, 0xEC00000074726174LL, v68, v20);
            Date.init()(v73);
            uint64_t v30 = 1LL;
            (*(void (**)(char *, void, uint64_t, uint64_t))(v79 + 56))(v70, 0LL, 1LL, v20);
            Preferences.subscript.setter(v70, v69, ObjectType, v20, v31);
            return v30;
          }

          unint64_t v53 = v51;
          uint64_t v54 = v78;
          if (v51 >= 0x4000)
          {
            String.subscript.getter(15LL, v51, v44, v46);
            uint64_t v66 = v65;
            Swift::String v67 = Substring.lowercased()();
            uint64_t v59 = v67._object;
            swift_bridgeObjectRelease(v66);
            sub_1000C0700(0xFuLL, v53, v67._countAndFlagsBits, (unint64_t)v67._object, v44, v46);
          }

          else
          {
            swift_bridgeObjectRetain(v46);
            uint64_t v55 = String.index(after:)(v53, v44, v46);
            String.subscript.getter(15LL, v55, v44, v46);
            uint64_t v57 = v56;
            swift_bridgeObjectRelease(v46);
            Swift::String v58 = Substring.lowercased()();
            uint64_t v59 = v58._object;
            swift_bridgeObjectRelease(v57);
            sub_1000C0A44(0xFuLL, v53, v58._countAndFlagsBits, (unint64_t)v58._object, v44, v46);
          }

          uint64_t countAndFlagsBits = v60;
          object = v61;
          swift_bridgeObjectRelease(v46);
          unint64_t v46 = (unint64_t)v59;
        }

        swift_bridgeObjectRelease(v46);
        unint64_t v46 = (unint64_t)object;
        goto LABEL_24;
      }

      return 0LL;
    }
  }

  return 1LL;
}

uint64_t sub_1000C2718(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v75 = a5;
  uint64_t v71 = a4;
  uint64_t v64 = a2;
  id v65 = a3;
  uint64_t v6 = type metadata accessor for MetricsData(0LL);
  int64_t v69 = *(char **)(v6 - 8);
  unint64_t v70 = (char *)v6;
  __chkstk_darwin(v6);
  id v68 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_100029E18((uint64_t *)&unk_10013F9C0);
  uint64_t v62 = *(void *)(v8 - 8);
  uint64_t v63 = v8;
  __chkstk_darwin(v8);
  id v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v76 = type metadata accessor for MetricsFieldsContext(0LL);
  uint64_t v74 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v72 = *(void *)(v13 - 8);
  uint64_t v73 = v13;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v66 = v15;
  Swift::String v67 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v62 - v16;
  uint64_t v18 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)&v62 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for OSLogger(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  unint64_t v24 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v25 = sub_10002A768(v21, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, v25, v21);
  uint64_t v26 = sub_100029E18(&qword_10013EA00);
  uint64_t v27 = type metadata accessor for LogMessage(0LL);
  uint64_t v28 = swift_allocObject( v26,  ((*(unsigned __int8 *)(*(void *)(v27 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v27 - 8) + 80LL))
        + *(void *)(*(void *)(v27 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v27 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v28 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(24LL, 1LL);
  v29._object = (void *)0x8000000100100E30LL;
  v29._uint64_t countAndFlagsBits = 0xD000000000000018LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v29);
  uint64_t v78 = sub_10002A030(0LL, (unint64_t *)&qword_10013C7E8, off_10011E550);
  v77[0] = a1;
  a1;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v77);
  sub_10002E92C((uint64_t)v77, &qword_10013C6F0);
  v30._uint64_t countAndFlagsBits = 0LL;
  v30._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v30);
  LogMessage.init(stringInterpolation:)(v20);
  Logger.info(_:)(v28, v21, &protocol witness table for OSLogger);
  __n128 v31 = swift_bridgeObjectRelease(v28);
  (*(void (**)(char *, uint64_t, __n128))(v22 + 8))(v24, v21, v31);
  sub_10002A030(0LL, (unint64_t *)&unk_10013DBB0, &OBJC_CLASS___OS_os_log_ptr);
  uint64_t v32 = static OS_os_log.default.getter();
  uint64_t v33 = OSSignpostID.init(log:)(v32);
  uint64_t v34 = static os_signpost_type_t.begin.getter(v33);
  uint64_t v35 = (void *)static OS_os_log.default.getter();
  os_signpost(_:dso:log:name:signpostID:)(v34, &_mh_execute_header, v35, "Metrics.processMetricsData", 26LL, 2LL, v17);

  uint64_t v37 = MetricsFieldsContext.init()(v36);
  uint64_t v38 = v17;
  if (v64)
  {
    v77[0] = v64;
    static MetricsFieldsContext.Property<A>.pageFields.getter(v37);
    uint64_t v39 = sub_100029E18(&qword_10013CD70);
    MetricsFieldsContext.addValue<A>(_:forProperty:)(v77, v10, v39);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v10, v63);
  }

  if (v65)
  {
    v77[0] = v65;
    uint64_t v40 = qword_10013BB90;
    id v41 = v65;
    if (v40 != -1) {
      swift_once(&qword_10013BB90, sub_10002A650);
    }
    uint64_t v42 = sub_100029E18((uint64_t *)&unk_10013F9D0);
    uint64_t v43 = sub_10002A768(v42, (uint64_t)qword_1001484E8);
    uint64_t v44 = sub_10002A030(0LL, (unint64_t *)&qword_10013FD90, off_10011E548);
    MetricsFieldsContext.addValue<A>(_:forProperty:)(v77, v43, v44);
  }

  unint64_t v45 = v68;
  sub_1000576C0();
  uint64_t v46 = MetricsPipeline.process(_:using:)(v45, v12);
  (*((void (**)(char *, char *))v69 + 1))(v45, v70);
  uint64_t v78 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v79 = &protocol witness table for SyncTaskScheduler;
  unint64_t v47 = sub_10002C328(v77);
  SyncTaskScheduler.init()(v47);
  unint64_t v70 = v12;
  uint64_t v49 = v72;
  uint64_t v48 = v73;
  char v50 = v67;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v67, v38, v73);
  uint64_t v51 = *(unsigned __int8 *)(v49 + 80);
  uint64_t v52 = (v51 + 16) & ~v51;
  uint64_t v53 = swift_allocObject(&unk_100125140, v52 + v66, v51 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v53 + v52, v50, v48);
  Promise.always(on:perform:)(v77, sub_1000C641C, v53);
  swift_release(v53);
  sub_100029F4C(v77);
  uint64_t v54 = swift_allocObject(&unk_100125168, 49LL, 7LL);
  uint64_t v55 = v71;
  uint64_t v56 = v75;
  *(void *)(v54 + swift_weakDestroy(v0 + 16) = v71;
  *(void *)(v54 + 24) = v56;
  int64_t v69 = v38;
  *(void *)(v54 + 32) = "processMetricsData(_:pageFields:activity:withReplyHandler:)";
  *(void *)(v54 + 40) = 59LL;
  *(_BYTE *)(v54 + 48) = 2;
  uint64_t v57 = swift_allocObject(&unk_100125190, 49LL, 7LL);
  *(void *)(v57 + swift_weakDestroy(v0 + 16) = v55;
  *(void *)(v57 + 24) = v56;
  *(void *)(v57 + 32) = "processMetricsData(_:pageFields:activity:withReplyHandler:)";
  *(void *)(v57 + 40) = 59LL;
  *(_BYTE *)(v57 + 48) = 2;
  uint64_t v58 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v59 = swift_retain_n(v56, 2LL);
  uint64_t v60 = static OS_dispatch_queue.main.getter(v59);
  uint64_t v78 = v58;
  uint64_t v79 = &protocol witness table for OS_dispatch_queue;
  v77[0] = v60;
  Promise.then(perform:orCatchError:on:)(sub_1000C5EC8, v54, sub_1000C53E4, v57, v77);
  swift_release(v54);
  swift_release(v57);
  sub_100029F4C(v77);
  swift_release(v46);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v70, v76);
  return (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v69, v48);
}

uint64_t sub_1000C2E38(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  uint64_t v65 = a4;
  uint64_t v63 = a3;
  uint64_t v62 = a2;
  uint64_t v67 = type metadata accessor for CharacterSet(0LL);
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  id v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = type metadata accessor for MetricsData(0LL);
  uint64_t v11 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for MetricsFieldsContext(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = *a1;
  uint64_t v19 = (void *)objc_opt_self(&OBJC_CLASS___ASCViewRender);
  id v20 = [v19 requiredFieldNames];
  uint64_t v21 = static Set._unconditionallyBridgeFromObjectiveC(_:)( v20,  &type metadata for String,  &protocol witness table for String);

  swift_bridgeObjectRetain(v18);
  uint64_t v22 = sub_1000C60DC(v21, v18);
  swift_bridgeObjectRelease(v18);
  if (*(void *)(v22 + 16))
  {
    v70[0] = 2LL;
    uint64_t v23 = sub_100029E18(&qword_10013F670);
    uint64_t inited = swift_initStackObject(v23, v69);
    *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDA10;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(@"ASCMetricsErrorEventTypeKey");
    *(void *)(inited + 40) = v25;
    id v26 = [v19 category];
    unint64_t countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
    Swift::String v29 = v28;

    v68[0] = countAndFlagsBits;
    v68[1] = v29;
    static CharacterSet.lowercaseLetters.getter();
    unint64_t v30 = sub_10006A134();
    uint64_t v31 = StringProtocol.rangeOfCharacter(from:options:range:)(v10, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v30);
    char v33 = v32;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v10, v67);
    if ((v33 & 1) != 0)
    {
      Swift::String v47 = String.lowercased()();
      unint64_t countAndFlagsBits = v47._countAndFlagsBits;
      object = v47._object;
    }

    else
    {
      unint64_t v34 = String.index(_:offsetBy:limitedBy:)(v31, -1LL, 15LL, countAndFlagsBits, v29);
      if ((v35 & 1) != 0)
      {
LABEL_10:
        type metadata accessor for ASCMetricsError(0LL);
        uint64_t v54 = v53;
        *(void *)(inited + 72) = &type metadata for String;
        *(void *)(inited + 48) = countAndFlagsBits;
        *(void *)(inited + 56) = v29;
        *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(@"ASCMetricsErrorFieldsKey");
        *(void *)(inited + 88) = v55;
        uint64_t v56 = sub_100047618(v22);
        swift_release(v22);
        *(void *)(inited + 120) = sub_100029E18((uint64_t *)&unk_10013EF60);
        *(void *)(inited + 96) = v56;
        unint64_t v57 = sub_100044F60(inited);
        unint64_t v58 = sub_1000C62A0();
        _BridgedStoredNSError.init(_:userInfo:)(v68, v70, v57, v54, v58);
        uint64_t v59 = v68[0];
        sub_100029E18(&qword_10013F938);
        return Promise.__allocating_init(error:)(v59);
      }

      unint64_t v36 = v34;
      if (v34 >= 0x4000)
      {
        String.subscript.getter(15LL, v34, countAndFlagsBits, v29);
        uint64_t v49 = v48;
        Swift::String v50 = Substring.lowercased()();
        swift_bridgeObjectRelease(v49);
        sub_1000C0700( 0xFuLL,  v36,  v50._countAndFlagsBits,  (unint64_t)v50._object,  countAndFlagsBits,  (unint64_t)v29);
        unint64_t countAndFlagsBits = v51;
        object = v52;
        swift_bridgeObjectRelease(v29);
        Swift::String v29 = v50._object;
      }

      else
      {
        swift_bridgeObjectRetain(v29);
        uint64_t v37 = String.index(after:)(v36, countAndFlagsBits, v29);
        String.subscript.getter(15LL, v37, countAndFlagsBits, v29);
        uint64_t v39 = v38;
        swift_bridgeObjectRelease(v29);
        Swift::String v40 = Substring.lowercased()();
        swift_bridgeObjectRelease(v39);
        sub_1000C0A44( 0xFuLL,  v36,  v40._countAndFlagsBits,  (unint64_t)v40._object,  countAndFlagsBits,  (unint64_t)v29);
        unint64_t countAndFlagsBits = v41;
        object = v42;
        swift_bridgeObjectRelease(v29);
        Swift::String v29 = v40._object;
      }
    }

    swift_bridgeObjectRelease(v29);
    Swift::String v29 = object;
    goto LABEL_10;
  }

  swift_release(v22);
  swift_bridgeObjectRetain(v18);
  unint64_t v44 = sub_1000C2038(v62, v63, a5, a6);
  uint64_t v45 = sub_1000C0684(v44, v18);
  MetricsFieldsContext.init()(v45);
  MetricsData.init(topic:shouldFlush:fields:includingFields:excludingFields:)( 0xD000000000000011LL,  0x8000000100100D20LL,  0LL,  v45,  &_swiftEmptySetSingleton,  &_swiftEmptySetSingleton);
  uint64_t v46 = MetricsPipeline.process(_:using:)(v13, v17);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v64);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  return v46;
}

void sub_1000C3338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = static os_signpost_type_t.end.getter(a1);
  sub_10002A030(0LL, (unint64_t *)&unk_10013DBB0, &OBJC_CLASS___OS_os_log_ptr);
  id v8 = (id)static OS_os_log.default.getter();
  os_signpost(_:dso:log:name:signpostID:)(v7, &_mh_execute_header, v8, a3, a4, 2LL, a2);
}

uint64_t sub_1000C3440( unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v36 = a7;
  uint64_t v38 = a4;
  uint64_t v39 = a6;
  unint64_t v37 = a3;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v17 = sub_10002A768(v13, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v17, v13);
  uint64_t v18 = sub_100029E18(&qword_10013EA00);
  uint64_t v19 = type metadata accessor for LogMessage(0LL);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
        + *(void *)(*(void *)(v19 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(38LL, 2LL);
  v21._object = (void *)0x8000000100100C00LL;
  v21._unint64_t countAndFlagsBits = 0xD00000000000001ALL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  unint64_t v41 = &type metadata for String;
  v40[0] = a1;
  v40[1] = a2;
  swift_bridgeObjectRetain(a2);
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v40);
  sub_10002E92C((uint64_t)v40, &qword_10013C6F0);
  v22._unint64_t countAndFlagsBits = 0x636F6C20726F6620LL;
  v22._object = (void *)0xEC0000002070756BLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  unint64_t v41 = (void *)sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
  v40[0] = a5;
  id v23 = a5;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v40);
  sub_10002E92C((uint64_t)v40, &qword_10013C6F0);
  v24._unint64_t countAndFlagsBits = 0LL;
  v24._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v24);
  LogMessage.init(stringInterpolation:)(v12);
  Logger.info(_:)(v20, v13, &protocol witness table for OSLogger);
  __n128 v25 = swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t, __n128))(v14 + 8))(v16, v13, v25);
  sub_100029EE0( (void *)(v35 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsService),  *(void *)(v35 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsService + 24));
  uint64_t v26 = sub_1000AE3C4(a1, a2, v37, v38, v23);
  uint64_t v27 = swift_allocObject(&unk_100124FB0, 49LL, 7LL);
  uint64_t v28 = v39;
  uint64_t v29 = v36;
  *(void *)(v27 + swift_weakDestroy(v0 + 16) = v39;
  *(void *)(v27 + 24) = v29;
  *(void *)(v27 + 32) = "recordCampaignToken(_:providerToken:with:withReplyHandler:)";
  *(void *)(v27 + 40) = 59LL;
  *(_BYTE *)(v27 + 48) = 2;
  uint64_t v30 = swift_allocObject(&unk_100124FD8, 49LL, 7LL);
  *(void *)(v30 + swift_weakDestroy(v0 + 16) = v28;
  *(void *)(v30 + 24) = v29;
  *(void *)(v30 + 32) = "recordCampaignToken(_:providerToken:with:withReplyHandler:)";
  *(void *)(v30 + 40) = 59LL;
  *(_BYTE *)(v30 + 48) = 2;
  uint64_t v31 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v32 = swift_retain_n(v29, 2LL);
  uint64_t v33 = static OS_dispatch_queue.main.getter(v32);
  unint64_t v41 = (void *)v31;
  uint64_t v42 = &protocol witness table for OS_dispatch_queue;
  v40[0] = v33;
  Promise.then(perform:orCatchError:on:)(sub_1000C53E0, v27, sub_1000C53E4, v30, v40);
  swift_release(v27);
  swift_release(v30);
  sub_100029F4C(v40);
  return swift_release(v26);
}

uint64_t sub_1000C3894( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v43 = a6;
  uint64_t v44 = a8;
  uint64_t v41 = a4;
  uint64_t v42 = a5;
  uint64_t v40 = a3;
  uint64_t v39 = a9;
  uint64_t v12 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for OSLogger(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v19 = sub_10002A768(v15, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v19, v15);
  uint64_t v20 = sub_100029E18(&qword_10013EA00);
  uint64_t v21 = type metadata accessor for LogMessage(0LL);
  uint64_t v22 = swift_allocObject( v20,  ((*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL))
        + *(void *)(*(void *)(v21 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v21 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v22 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(31LL, 2LL);
  v23._object = (void *)0x8000000100100B90LL;
  v23._unint64_t countAndFlagsBits = 0xD000000000000013LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  uint64_t v46 = &type metadata for String;
  v45[0] = a1;
  v45[1] = a2;
  swift_bridgeObjectRetain(a2);
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v45);
  sub_10002E92C((uint64_t)v45, &qword_10013C6F0);
  v24._unint64_t countAndFlagsBits = 0x636F6C20726F6620LL;
  v24._object = (void *)0xEC0000002070756BLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v24);
  uint64_t v46 = (void *)sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
  v45[0] = a7;
  id v25 = a7;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v45);
  sub_10002E92C((uint64_t)v45, &qword_10013C6F0);
  v26._unint64_t countAndFlagsBits = 0LL;
  v26._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v26);
  LogMessage.init(stringInterpolation:)(v14);
  Logger.info(_:)(v22, v15, &protocol witness table for OSLogger);
  __n128 v27 = swift_bridgeObjectRelease(v22);
  (*(void (**)(char *, uint64_t, __n128))(v16 + 8))(v18, v15, v27);
  sub_100029EE0( (void *)(v38 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsService),  *(void *)(v38 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsService + 24));
  id v28 = [v25 id];
  uint64_t v29 = sub_1000AEA1C(a1, a2, v40, v41, v42, v43, v28);

  uint64_t v30 = swift_allocObject(&unk_100124F38, 49LL, 7LL);
  uint64_t v31 = v44;
  uint64_t v32 = v39;
  *(void *)(v30 + swift_weakDestroy(v0 + 16) = v44;
  *(void *)(v30 + 24) = v32;
  *(void *)(v30 + 32) = "recordQToken(_:campaignToken:advertisementID:with:withReplyHandler:)";
  *(void *)(v30 + 40) = 68LL;
  *(_BYTE *)(v30 + 48) = 2;
  uint64_t v33 = swift_allocObject(&unk_100124F60, 49LL, 7LL);
  *(void *)(v33 + swift_weakDestroy(v0 + 16) = v31;
  *(void *)(v33 + 24) = v32;
  *(void *)(v33 + 32) = "recordQToken(_:campaignToken:advertisementID:with:withReplyHandler:)";
  *(void *)(v33 + 40) = 68LL;
  *(_BYTE *)(v33 + 48) = 2;
  uint64_t v34 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v35 = swift_retain_n(v32, 2LL);
  uint64_t v36 = static OS_dispatch_queue.main.getter(v35);
  uint64_t v46 = (void *)v34;
  Swift::String v47 = &protocol witness table for OS_dispatch_queue;
  v45[0] = v36;
  Promise.then(perform:orCatchError:on:)(sub_1000C53E0, v30, sub_1000C53E4, v33, v45);
  swift_release(v30);
  swift_release(v33);
  sub_100029F4C(v45);
  return swift_release(v29);
}

uint64_t sub_1000C3D44(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LogMessageLevel(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  id v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OSLogger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC50 != -1) {
    swift_once(&qword_10013BC50, sub_1000D1578);
  }
  uint64_t v13 = sub_10002A768(v9, (uint64_t)qword_100148630);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v14 = sub_100029E18(&qword_10013EA00);
  uint64_t v15 = type metadata accessor for LogMessage(0LL);
  uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
        + *(void *)(*(void *)(v15 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(38LL, 1LL);
  v17._object = (void *)0x8000000100100B60LL;
  v17._unint64_t countAndFlagsBits = 0xD000000000000026LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  v27[3] = sub_100029E18((uint64_t *)&unk_10013F910);
  v27[0] = a1;
  swift_bridgeObjectRetain(a1);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v27);
  sub_10002E92C((uint64_t)v27, &qword_10013C6F0);
  v18._unint64_t countAndFlagsBits = 0LL;
  v18._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v18);
  LogMessage.init(stringInterpolation:)(v8);
  Logger.info(_:)(v16, v9, &protocol witness table for OSLogger);
  __n128 v19 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v19);
  uint64_t v20 = sub_1000C0500(a1);
  uint64_t v21 = *(void *)(v26 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsLogger + 24);
  uint64_t v22 = *(void *)(v26 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsLogger + 32);
  sub_100029EE0((void *)(v26 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsLogger), v21);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for LogMessageLevel.error(_:), v2);
  dispatch thunk of Logger.log(contentsOf:withLevel:)(v20, v5, v21, v22);
  __n128 v23 = swift_bridgeObjectRelease(v20);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v3 + 8))(v5, v2, v23);
}

uint64_t sub_1000C4118()
{
  return type metadata accessor for MetricsClient(0LL);
}

uint64_t type metadata accessor for MetricsClient(uint64_t a1)
{
  uint64_t result = qword_10013F8F8;
  if (!qword_10013F8F8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MetricsClient);
  }
  return result;
}

uint64_t sub_1000C415C(uint64_t a1)
{
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for MetricsPipeline(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      v5[2] = "(";
      void v5[3] = "(";
      v5[4] = "(";
      v5[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
      uint64_t result = swift_updateClassMetadata2(a1, 256LL, 6LL, v5, a1 + 80);
      if (!result) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_1000C4200(void (*a1)(uint64_t *__return_ptr))
{
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_1000C4278()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000C429C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  sub_100060108((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain(v3);
}

uint64_t sub_1000C42DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v9 = -1LL << *(_BYTE *)(a1 + 32);
  uint64_t v10 = ~v9;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = -v9;
  uint64_t v52 = a1;
  uint64_t v53 = a1 + 64;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  else {
    uint64_t v13 = -1LL;
  }
  uint64_t v54 = v10;
  uint64_t v55 = 0LL;
  uint64_t v56 = v13 & v11;
  uint64_t v57 = a2;
  uint64_t v58 = a3;
  swift_bridgeObjectRetain(a1);
  swift_retain(a3);
  sub_1000C4F08(&v50);
  uint64_t v14 = *((void *)&v50 + 1);
  if (!*((void *)&v50 + 1)) {
    goto LABEL_27;
  }
  uint64_t v15 = v50;
  sub_1000445E4(v51, v49);
  uint64_t v16 = *(void **)a5;
  unint64_t v18 = sub_10008D45C(v15, v14);
  uint64_t v19 = v16[2];
  BOOL v20 = (v17 & 1) == 0;
  uint64_t v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }

  char v22 = v17;
  if (v16[3] >= v21)
  {
    if ((a4 & 1) != 0)
    {
      if ((v17 & 1) != 0) {
        goto LABEL_12;
      }
    }

    else
    {
      sub_10005CA74();
      if ((v22 & 1) != 0) {
        goto LABEL_12;
      }
    }

unint64_t sub_1000C4630(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0LL;
    swift_stdlib_random(&v3, 8LL);
    uint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0LL;
          swift_stdlib_random(&v3, 8LL);
        }

        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1000C46B8()
{
  void (*v14)(uint64_t *__return_ptr, void *);
  uint64_t result;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  uint64_t v22;
  void v23[4];
  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v7 = 16 * v6;
    id v8 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v6);
    uint64_t v9 = *v8;
    uint64_t v10 = v8[1];
    uint64_t v11 = (uint64_t *)(*(void *)(v1 + 56) + v7);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v14 = (void (*)(uint64_t *__return_ptr, void *))v0[5];
    v23[0] = v9;
    v23[1] = v10;
    void v23[2] = v12;
    v23[3] = v13;
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v13);
    v14(&v22, v23);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v10);
    return v22;
  }

  uint64_t v16 = v3 + 1;
  if (__OFADD__(v3, 1LL))
  {
    __break(1u);
  }

  else
  {
    char v17 = (unint64_t)(v0[2] + 64) >> 6;
    if (v16 < v17)
    {
      unint64_t v18 = v0[1];
      uint64_t v19 = *(void *)(v18 + 8 * v16);
      if (v19)
      {
LABEL_7:
        uint64_t v5 = (v19 - 1) & v19;
        unint64_t v6 = __clz(__rbit64(v19)) + (v16 << 6);
        int64_t v4 = v16;
        goto LABEL_3;
      }

      BOOL v20 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v17)
      {
        uint64_t v19 = *(void *)(v18 + 8 * v20);
        if (v19)
        {
LABEL_10:
          uint64_t v16 = v20;
          goto LABEL_7;
        }

        int64_t v4 = v3 + 2;
        if (v3 + 3 < v17)
        {
          uint64_t v19 = *(void *)(v18 + 8 * (v3 + 3));
          if (v19)
          {
            uint64_t v16 = v3 + 3;
            goto LABEL_7;
          }

          BOOL v20 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v17)
          {
            uint64_t v19 = *(void *)(v18 + 8 * v20);
            if (v19) {
              goto LABEL_10;
            }
            uint64_t v16 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v17)
            {
              uint64_t v19 = *(void *)(v18 + 8 * v16);
              if (v19) {
                goto LABEL_7;
              }
              int64_t v4 = v17 - 1;
              uint64_t v21 = v3 + 6;
              while (v17 != v21)
              {
                uint64_t v19 = *(void *)(v18 + 8 * v21++);
                if (v19)
                {
                  uint64_t v16 = v21 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }

    uint64_t result = 0LL;
    v0[3] = v4;
    v0[4] = 0LL;
  }

  return result;
}

uint64_t sub_1000C4854()
{
  return sub_1000C487C( (uint64_t (*)(void))&type metadata accessor for MetricsFieldExclusionRequest,  &qword_10013D318);
}

uint64_t sub_1000C4868()
{
  return sub_1000C487C( (uint64_t (*)(void))&type metadata accessor for MetricsFieldInclusionRequest,  (uint64_t *)&unk_10013F9E0);
}

uint64_t sub_1000C487C(uint64_t (*a1)(void), uint64_t *a2)
{
  void (*v24)(uint64_t *__return_ptr, char *);
  uint64_t v25;
  char *v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  char *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v4 = a1(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v32 - v6;
  uint64_t v8 = sub_100029E18(a2);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v32 - v13;
  uint64_t v15 = *v2;
  uint64_t v16 = v2[1];
  uint64_t v17 = v2[2];
  int64_t v18 = v2[3];
  unint64_t v19 = v2[4];
  uint64_t v32 = v7;
  uint64_t v33 = a2;
  if (!v19)
  {
    __n128 v27 = v18 + 1;
    if (__OFADD__(v18, 1LL))
    {
      __break(1u);
      return result;
    }

    uint64_t v28 = (unint64_t)(v17 + 64) >> 6;
    if (v27 >= v28)
    {
      uint64_t v20 = 0LL;
      uint64_t v23 = 1LL;
      uint64_t v22 = v15;
      goto LABEL_4;
    }

    BOOL v29 = *(void *)(v16 + 8 * v27);
    if (v29) {
      goto LABEL_11;
    }
    uint64_t v30 = v18 + 2;
    if (v18 + 2 < v28)
    {
      BOOL v29 = *(void *)(v16 + 8 * v30);
      if (v29) {
        goto LABEL_15;
      }
      if (v18 + 3 >= v28) {
        goto LABEL_28;
      }
      BOOL v29 = *(void *)(v16 + 8 * (v18 + 3));
      if (v29)
      {
        __n128 v27 = v18 + 3;
        goto LABEL_11;
      }

      uint64_t v30 = v18 + 4;
      if (v18 + 4 >= v28)
      {
        uint64_t v20 = 0LL;
        uint64_t v23 = 1LL;
        v18 += 3LL;
        uint64_t v22 = v15;
        goto LABEL_4;
      }

      BOOL v29 = *(void *)(v16 + 8 * v30);
      if (v29)
      {
LABEL_15:
        __n128 v27 = v30;
LABEL_11:
        uint64_t v20 = (v29 - 1) & v29;
        unint64_t v21 = __clz(__rbit64(v29)) + (v27 << 6);
        int64_t v18 = v27;
        goto LABEL_3;
      }

      __n128 v27 = v18 + 5;
      if (v18 + 5 >= v28)
      {
LABEL_28:
        uint64_t v20 = 0LL;
        uint64_t v23 = 1LL;
        int64_t v18 = v30;
        uint64_t v22 = v15;
        goto LABEL_4;
      }

      BOOL v29 = *(void *)(v16 + 8 * v27);
      if (v29) {
        goto LABEL_11;
      }
      __n128 v27 = v28 - 1;
      uint64_t v31 = v18 + 6;
      while (v28 != v31)
      {
        BOOL v29 = *(void *)(v16 + 8 * v31++);
        if (v29)
        {
          __n128 v27 = v31 - 1;
          goto LABEL_11;
        }
      }
    }

    uint64_t v20 = 0LL;
    uint64_t v23 = 1LL;
    int64_t v18 = v27;
    uint64_t v22 = v15;
    goto LABEL_4;
  }

  uint64_t v20 = (v19 - 1) & v19;
  unint64_t v21 = __clz(__rbit64(v19)) | (v18 << 6);
LABEL_3:
  uint64_t v22 = v15;
  (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))( v14,  *(void *)(v15 + 48) + *(void *)(v5 + 72) * v21,  v4);
  uint64_t v23 = 0LL;
LABEL_4:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v14, v23, 1LL, v4);
  *unint64_t v2 = v22;
  v2[1] = v16;
  v2[2] = v17;
  v2[3] = v18;
  v2[4] = v20;
  char v24 = (void (*)(uint64_t *__return_ptr, char *))v2[5];
  sub_100038A7C((uint64_t)v14, (uint64_t)v11, v33);
  uint64_t v26 = v32;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v32, v11, v4);
  v24(&v34, v26);
  uint64_t v25 = v34;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v26, v4);
  return v25;
}

uint64_t (*sub_1000C4B40@<X0>(uint64_t a1@<X8>))(void)
{
  return sub_1000C4B58((uint64_t (*)(void))&type metadata accessor for MetricsFieldExclusionRequest, a1);
}

uint64_t (*sub_1000C4B4C@<X0>(uint64_t a1@<X8>))(void)
{
  return sub_1000C4B58((uint64_t (*)(void))&type metadata accessor for MetricsFieldInclusionRequest, a1);
}

uint64_t (*sub_1000C4B58@<X0>(uint64_t (*result)(void)@<X0>, uint64_t a2@<X8>))(void)
{
  int64_t v3 = result;
  int64_t v6 = v2[3];
  unint64_t v5 = v2[4];
  int64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (v5 - 1) & v5;
    unint64_t v9 = __clz(__rbit64(v5)) | (v6 << 6);
LABEL_3:
    uint64_t v10 = (uint64_t *)(*(void *)(*v2 + 48LL) + 16 * v9);
    uint64_t v11 = *v10;
    uint64_t v12 = v10[1];
    v2[3] = v7;
    v2[4] = v8;
    uint64_t v13 = (void (*)(void *))v2[5];
    v22[0] = v11;
    v22[1] = v12;
    swift_bridgeObjectRetain(v12);
    v13(v22);
    swift_bridgeObjectRelease(v12);
    uint64_t v14 = v3(0LL);
    return (uint64_t (*)(void))(*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))( a2,  0LL,  1LL,  v14);
  }

  int64_t v15 = v6 + 1;
  if (__OFADD__(v6, 1LL))
  {
    __break(1u);
  }

  else
  {
    int64_t v16 = (unint64_t)(v2[2] + 64LL) >> 6;
    if (v15 < v16)
    {
      uint64_t v17 = v2[1];
      unint64_t v18 = *(void *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        uint64_t v8 = (v18 - 1) & v18;
        unint64_t v9 = __clz(__rbit64(v18)) + (v15 << 6);
        int64_t v7 = v15;
        goto LABEL_3;
      }

      int64_t v19 = v6 + 2;
      int64_t v7 = v6 + 1;
      if (v6 + 2 < v16)
      {
        unint64_t v18 = *(void *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          int64_t v15 = v19;
          goto LABEL_7;
        }

        int64_t v7 = v6 + 2;
        if (v6 + 3 < v16)
        {
          unint64_t v18 = *(void *)(v17 + 8 * (v6 + 3));
          if (v18)
          {
            int64_t v15 = v6 + 3;
            goto LABEL_7;
          }

          int64_t v19 = v6 + 4;
          int64_t v7 = v6 + 3;
          if (v6 + 4 < v16)
          {
            unint64_t v18 = *(void *)(v17 + 8 * v19);
            if (v18) {
              goto LABEL_10;
            }
            int64_t v15 = v6 + 5;
            int64_t v7 = v6 + 4;
            if (v6 + 5 < v16)
            {
              unint64_t v18 = *(void *)(v17 + 8 * v15);
              if (v18) {
                goto LABEL_7;
              }
              int64_t v7 = v16 - 1;
              int64_t v20 = v6 + 6;
              while (v16 != v20)
              {
                unint64_t v18 = *(void *)(v17 + 8 * v20++);
                if (v18)
                {
                  int64_t v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }

    v2[3] = v7;
    v2[4] = 0LL;
    uint64_t v21 = result(0LL);
    return (uint64_t (*)(void))(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))( a2,  1LL,  1LL,  v21);
  }

  return result;
}

uint64_t sub_1000C4D08(uint64_t result)
{
  void (*v10)(uint64_t *__return_ptr, void **);
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v2 = v1;
  uint64_t v3 = *v1;
  if ((*v1 & 0x8000000000000000LL) == 0)
  {
    int64_t v5 = v1[3];
    unint64_t v4 = v2[4];
    if (v4)
    {
      uint64_t v6 = (v4 - 1) & v4;
      unint64_t v7 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_4:
      uint64_t v8 = *(void **)(*(void *)(v3 + 48) + 8 * v7);
      id v9 = v8;
      goto LABEL_5;
    }

    uint64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
      __break(1u);
      return result;
    }

    uint64_t v14 = (unint64_t)(v2[2] + 64LL) >> 6;
    if (v13 >= v14)
    {
      uint64_t v8 = 0LL;
      uint64_t v6 = 0LL;
      goto LABEL_5;
    }

    int64_t v15 = v2[1];
    int64_t v16 = *(void *)(v15 + 8 * v13);
    if (v16)
    {
LABEL_14:
      uint64_t v6 = (v16 - 1) & v16;
      unint64_t v7 = __clz(__rbit64(v16)) + (v13 << 6);
      int64_t v5 = v13;
      goto LABEL_4;
    }

    uint64_t v17 = v5 + 2;
    if (v5 + 2 >= v14) {
      goto LABEL_30;
    }
    int64_t v16 = *(void *)(v15 + 8 * v17);
    if (v16)
    {
LABEL_18:
      uint64_t v13 = v17;
      goto LABEL_14;
    }

    if (v5 + 3 < v14)
    {
      int64_t v16 = *(void *)(v15 + 8 * (v5 + 3));
      if (v16)
      {
        uint64_t v13 = v5 + 3;
        goto LABEL_14;
      }

      uint64_t v17 = v5 + 4;
      if (v5 + 4 >= v14)
      {
        uint64_t v8 = 0LL;
        uint64_t v6 = 0LL;
        v5 += 3LL;
LABEL_5:
        v2[3] = v5;
        v2[4] = v6;
        if (v8)
        {
LABEL_6:
          uint64_t v10 = (void (*)(uint64_t *__return_ptr, void **))v2[5];
          int64_t v20 = v8;
          v10(&v19, &v20);

          return v19;
        }

        return 0LL;
      }

      int64_t v16 = *(void *)(v15 + 8 * v17);
      if (v16) {
        goto LABEL_18;
      }
      uint64_t v13 = v5 + 5;
      if (v5 + 5 < v14)
      {
        int64_t v16 = *(void *)(v15 + 8 * v13);
        if (v16) {
          goto LABEL_14;
        }
        uint64_t v13 = v14 - 1;
        unint64_t v18 = v5 + 6;
        while (v14 != v18)
        {
          int64_t v16 = *(void *)(v15 + 8 * v18++);
          if (v16)
          {
            uint64_t v13 = v18 - 1;
            goto LABEL_14;
          }
        }

uint64_t sub_1000C4F08@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    uint64_t v11 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v10);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    sub_100060108(*(void *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(void *)&__int128 v23 = v13;
    *((void *)&v23 + 1) = v12;
    swift_bridgeObjectRetain(v12);
    goto LABEL_23;
  }

  int64_t v14 = v5 + 1;
  if (__OFADD__(v5, 1LL))
  {
    __break(1u);
    return result;
  }

  int64_t v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    unint64_t v16 = *(void *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      uint64_t v9 = (v16 - 1) & v16;
      unint64_t v10 = __clz(__rbit64(v16)) + (v14 << 6);
      int64_t v7 = v14;
      goto LABEL_3;
    }

    int64_t v17 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      unint64_t v16 = *(void *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        int64_t v14 = v17;
        goto LABEL_7;
      }

      int64_t v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        unint64_t v16 = *(void *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          int64_t v14 = v5 + 3;
          goto LABEL_7;
        }

        int64_t v17 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          unint64_t v16 = *(void *)(v4 + 8 * v17);
          if (v16) {
            goto LABEL_10;
          }
          int64_t v14 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            unint64_t v16 = *(void *)(v4 + 8 * v14);
            if (v16) {
              goto LABEL_7;
            }
            int64_t v7 = v15 - 1;
            int64_t v18 = v5 + 6;
            while (v15 != v18)
            {
              unint64_t v16 = *(void *)(v4 + 8 * v18++);
              if (v16)
              {
                int64_t v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }

  uint64_t v9 = 0LL;
  memset(v24, 0, sizeof(v24));
  __int128 v23 = 0u;
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  int64_t v19 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_100038A7C((uint64_t)&v23, (uint64_t)v22, &qword_10013E8F8);
  if (*((void *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_10002E92C((uint64_t)v21, (uint64_t *)&unk_10013F960);
  }

  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }

  return result;
}

void sub_1000C50EC(void *a1@<X8>)
{
  *a1 = 0x404E000000000000LL;
}

void sub_1000C50F8(void *a1@<X8>)
{
  *a1 = 0x3FF0000000000000LL;
}

uint64_t sub_1000C5104(uint64_t a1, uint64_t a2)
{
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v2 = sub_100029E18((uint64_t *)&unk_10013DCA0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  int64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for JSONTimeUnit(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v34 = 0LL;
  unint64_t v35 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(37LL);
  swift_bridgeObjectRelease(v35);
  unint64_t v34 = 0xD000000000000023LL;
  unint64_t v35 = 0x8000000100100DD0LL;
  unint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___ASCViewRender);
  id v11 = [v10 category];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  int64_t v14 = v13;

  v15._unint64_t countAndFlagsBits = v12;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14);
  unint64_t v16 = v35;
  NSString v17 = String._bridgeToObjectiveC()();
  __n128 v18 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, void, uint64_t, __n128))(v7 + 104))( v9,  enum case for JSONTimeUnit.milliseconds(_:),  v6,  v18);
  uint64_t v19 = v32;
  Bag.subscript.getter(v17, v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  Bag.Value.current(or:)(&v34, sub_1000C50EC, 0LL, v2);
  int64_t v20 = *(void (**)(char *, uint64_t))(v3 + 8);
  v20(v5, v2);
  unint64_t v34 = 0LL;
  unint64_t v35 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(45LL);
  *(void *)&double v21 = swift_bridgeObjectRelease(v35).n128_u64[0];
  unint64_t v34 = 0xD00000000000002BLL;
  unint64_t v35 = 0x8000000100100E00LL;
  id v22 = objc_msgSend(v10, "category", v21);
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v25 = v24;

  v26._unint64_t countAndFlagsBits = v23;
  v26._object = v25;
  String.append(_:)(v26);
  swift_bridgeObjectRelease(v25);
  unint64_t v27 = v35;
  NSString v28 = String._bridgeToObjectiveC()();
  __n128 v29 = swift_bridgeObjectRelease(v27);
  Bag.subscript.getter(v28, v29);

  Bag.Value.current(or:)(&v34, sub_1000C50F8, 0LL, v2);
  uint64_t v30 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v30 - 8) + 8LL))(v19, v30);
  v20(v5, v2);
  return v33;
}

uint64_t sub_1000C53E8()
{
  return swift_deallocObject(v0, 49LL, 7LL);
}

uint64_t sub_1000C540C(unsigned __int8 *a1)
{
  return sub_1000DE2E0( *a1,  *(void (**)(void, __n128))(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(_BYTE *)(v1 + 48));
}

uint64_t sub_1000C5420(void *a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v6 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v95 = *(void *)(v6 - 8);
  uint64_t v96 = v6;
  __chkstk_darwin(v6);
  uint64_t v93 = v7;
  uint64_t v94 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v98 = *(void *)(v8 - 8);
  uint64_t v99 = v8;
  __chkstk_darwin(v8);
  uint64_t v97 = (char *)&v87 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v91 = v9;
  __chkstk_darwin(v10);
  uint64_t v100 = (char *)&v87 - v11;
  uint64_t v12 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v12);
  int64_t v14 = (char *)&v87 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for OSLogger(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  __n128 v18 = (char *)&v87 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for Bag(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v22 = (char *)&v87 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v101 = swift_allocObject(&unk_100125000, 24LL, 7LL);
  *(void *)(v101 + swift_weakDestroy(v0 + 16) = a3;
  uint64_t v92 = a2;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))( v22,  a2 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_bag,  v19);
  type metadata accessor for LocalPreferences(0LL);
  uint64_t v23 = _Block_copy(a3);
  uint64_t v24 = static LocalPreferences.currentApplication.getter(v23);
  uint64_t v25 = sub_1000C5104((uint64_t)v22, v24);
  double v27 = v26;
  double v29 = v28;
  uint64_t v31 = v30;
  uint64_t v102 = v25;
  if ((sub_1000C21A4(v25, v30, v26, v28) & 1) != 0)
  {
    uint64_t v89 = v31;
    if (qword_10013BC50 != -1) {
      swift_once(&qword_10013BC50, sub_1000D1578);
    }
    uint64_t v32 = sub_10002A768(v15, (uint64_t)qword_100148630);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v32, v15);
    uint64_t v33 = sub_100029E18(&qword_10013EA00);
    uint64_t v34 = type metadata accessor for LogMessage(0LL);
    uint64_t v35 = swift_allocObject( v33,  ((*(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL))
          + *(void *)(*(void *)(v34 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v34 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v35 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(36LL, 1LL);
    v36._object = (void *)0x8000000100100CA0LL;
    v36._unint64_t countAndFlagsBits = 0xD000000000000024LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v36);
    uint64_t v104 = sub_10002A030(0LL, (unint64_t *)&unk_10013F920, off_10011E568);
    *(void *)&__int128 v103 = a1;
    id v37 = a1;
    LogMessage.StringInterpolation.appendInterpolation(sensitive:)(&v103);
    sub_10002E92C((uint64_t)&v103, &qword_10013C6F0);
    v38._unint64_t countAndFlagsBits = 0LL;
    v38._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v38);
    LogMessage.init(stringInterpolation:)(v14);
    Logger.info(_:)(v35, v15, &protocol witness table for OSLogger);
    __n128 v39 = swift_bridgeObjectRelease(v35);
    (*(void (**)(char *, uint64_t, __n128))(v16 + 8))(v18, v15, v39);
    sub_10002A030(0LL, (unint64_t *)&unk_10013DBB0, &OBJC_CLASS___OS_os_log_ptr);
    uint64_t v40 = static OS_os_log.default.getter();
    unint64_t v41 = v100;
    uint64_t v42 = OSSignpostID.init(log:)(v40);
    uint64_t v43 = static os_signpost_type_t.begin.getter(v42);
    uint64_t v44 = (void *)static OS_os_log.default.getter();
    os_signpost(_:dso:log:name:signpostID:)(v43, &_mh_execute_header, v44, "Metrics.processViewRender", 25LL, 2LL, v41);

    if (qword_10013BBC0 != -1) {
      swift_once(&qword_10013BBC0, sub_100079DAC);
    }
    id v45 = [v37 predicateByAddingTag:qword_100148570];
    uint64_t v46 = v92;
    Swift::String v47 = *(void **)(v92 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_collectionQueue);
    sub_1000388F0(v92 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_signpostExtractor, (uint64_t)&v103);
    uint64_t v48 = swift_allocObject(&unk_100125028, 64LL, 7LL);
    sub_10002C438(&v103, v48 + 16);
    *(void *)(v48 + 56) = v45;
    sub_100029E18(&qword_10013F930);
    id v49 = v47;
    id v90 = v45;
    uint64_t v50 = Promise.__allocating_init()(v90);
    unint64_t v51 = (void *)swift_allocObject(&unk_100125050, 40LL, 7LL);
    _OWORD v51[2] = sub_1000C5D48;
    v51[3] = v48;
    v51[4] = v50;
    uint64_t v88 = v50;
    swift_retain(v50);
    swift_retain(v48);
    OS_dispatch_queue.schedule(task:)(sub_1000C5DA4, v51);

    swift_release(v51);
    swift_release(v48);
    uint64_t v53 = v94;
    uint64_t v52 = v95;
    uint64_t v54 = v96;
    (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))( v94,  v46 + OBJC_IVAR____TtC19appstorecomponentsd13MetricsClient_metricsPipeline,  v96);
    uint64_t v55 = *(unsigned __int8 *)(v52 + 80);
    uint64_t v56 = (v55 + 48) & ~v55;
    uint64_t v57 = (double *)swift_allocObject(&unk_100125078, v56 + v93, v55 | 7);
    v57[2] = v27;
    v57[3] = v29;
    uint64_t v58 = v102;
    uint64_t v59 = v89;
    *((void *)v57 + 4) = v102;
    *((void *)v57 + sub_100029F4C(v0 + 5) = v59;
    (*(void (**)(char *, char *, uint64_t))(v52 + 32))((char *)v57 + v56, v53, v54);
    uint64_t v60 = type metadata accessor for SyncTaskScheduler(0LL);
    uint64_t v104 = v60;
    uint64_t v105 = &protocol witness table for SyncTaskScheduler;
    sub_10002C328(&v103);
    uint64_t v61 = swift_unknownObjectRetain(v58);
    SyncTaskScheduler.init()(v61);
    uint64_t v62 = sub_100029E18(&qword_10013F938);
    unint64_t v63 = sub_1000C5E68();
    uint64_t v64 = Promise.flatMap<A>(on:_:)(&v103, sub_1000C5E24, v57, v62, v63);
    swift_release(v57);
    sub_100029F4C(&v103);
    uint64_t v104 = v60;
    uint64_t v105 = &protocol witness table for SyncTaskScheduler;
    uint64_t v65 = sub_10002C328(&v103);
    SyncTaskScheduler.init()(v65);
    uint64_t v67 = v97;
    uint64_t v66 = v98;
    uint64_t v68 = v99;
    (*(void (**)(char *, char *, uint64_t))(v98 + 16))(v97, v41, v99);
    uint64_t v69 = *(unsigned __int8 *)(v66 + 80);
    uint64_t v70 = (v69 + 16) & ~v69;
    uint64_t v71 = swift_allocObject(&unk_1001250A0, v70 + v91, v69 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v66 + 32))(v71 + v70, v67, v68);
    Promise.always(on:perform:)(&v103, sub_1000C5EB8, v71);
    swift_release(v71);
    sub_100029F4C(&v103);
    uint64_t v72 = swift_allocObject(&unk_1001250C8, 49LL, 7LL);
    uint64_t v73 = v101;
    *(void *)(v72 + swift_weakDestroy(v0 + 16) = sub_100044794;
    *(void *)(v72 + 24) = v73;
    *(void *)(v72 + 32) = "processViewRender(with:withReplyHandler:)";
    *(void *)(v72 + 40) = 41LL;
    *(_BYTE *)(v72 + 48) = 2;
    uint64_t v74 = swift_allocObject(&unk_1001250F0, 49LL, 7LL);
    *(void *)(v74 + swift_weakDestroy(v0 + 16) = sub_100044794;
    *(void *)(v74 + 24) = v73;
    *(void *)(v74 + 32) = "processViewRender(with:withReplyHandler:)";
    *(void *)(v74 + 40) = 41LL;
    *(_BYTE *)(v74 + 48) = 2;
    uint64_t v75 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
    uint64_t v76 = swift_retain_n(v73, 2LL);
    uint64_t v77 = static OS_dispatch_queue.main.getter(v76);
    uint64_t v104 = v75;
    uint64_t v105 = &protocol witness table for OS_dispatch_queue;
    *(void *)&__int128 v103 = v77;
    Promise.then(perform:orCatchError:on:)(sub_1000C5EC8, v72, sub_1000C53E4, v74, &v103);
    swift_release(v72);
    swift_release(v74);
    sub_100029F4C(&v103);
    swift_unknownObjectRelease(v102);

    swift_release(v88);
    swift_release(v64);
    (*(void (**)(char *, uint64_t))(v66 + 8))(v100, v68);
    return swift_release(v73);
  }

  else
  {
    if (qword_10013BC50 != -1) {
      swift_once(&qword_10013BC50, sub_1000D1578);
    }
    uint64_t v79 = sub_10002A768(v15, (uint64_t)qword_100148630);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v79, v15);
    uint64_t v80 = sub_100029E18(&qword_10013EA00);
    uint64_t v81 = type metadata accessor for LogMessage(0LL);
    uint64_t v82 = swift_allocObject( v80,  ((*(unsigned __int8 *)(*(void *)(v81 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v81 - 8) + 80LL))
          + *(void *)(*(void *)(v81 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v81 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v82 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(48LL, 1LL);
    v83._unint64_t countAndFlagsBits = 0xD000000000000030LL;
    v83._object = (void *)0x8000000100100C60LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v83);
    uint64_t v104 = sub_10002A030(0LL, (unint64_t *)&unk_10013F920, off_10011E568);
    *(void *)&__int128 v103 = a1;
    id v84 = a1;
    LogMessage.StringInterpolation.appendInterpolation(sensitive:)(&v103);
    sub_10002E92C((uint64_t)&v103, &qword_10013C6F0);
    v85._unint64_t countAndFlagsBits = 0LL;
    v85._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v85);
    LogMessage.init(stringInterpolation:)(v14);
    Logger.info(_:)(v82, v15, &protocol witness table for OSLogger);
    __n128 v86 = swift_bridgeObjectRelease(v82);
    (*(void (**)(char *, uint64_t, __n128))(v16 + 8))(v18, v15, v86);
    a3[2](a3, 0LL);
    swift_release(v101);
    return swift_unknownObjectRelease(v102);
  }

uint64_t sub_1000C5D1C()
{
  return swift_deallocObject(v0, 64LL, 7LL);
}

void sub_1000C5D48(void *a1@<X8>)
{
  if (!v2) {
    *a1 = v4;
  }
}

uint64_t sub_1000C5D78()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000C5DA4()
{
  return sub_1000C4200(*(void (**)(uint64_t *__return_ptr))(v0 + 16));
}

uint64_t sub_1000C5DB0()
{
  uint64_t v1 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000C5E24(uint64_t *a1)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(type metadata accessor for MetricsPipeline(0LL) - 8) + 80LL);
  return sub_1000C2E38( a1,  *(void *)(v1 + 32),  *(void *)(v1 + 40),  v1 + ((v3 + 48) & ~v3),  *(double *)(v1 + 16),  *(double *)(v1 + 24));
}

unint64_t sub_1000C5E68()
{
  unint64_t result = qword_10013F940;
  if (!qword_10013F940)
  {
    uint64_t v1 = sub_100029F6C(&qword_10013F938);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Promise<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10013F940);
  }

  return result;
}

void sub_1000C5EB8(uint64_t a1)
{
}

void sub_1000C5ECC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6 = 0LL;
  uint64_t v7 = a3 + 56;
  uint64_t v8 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 56);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  if (v10) {
    goto LABEL_7;
  }
LABEL_8:
  int64_t v15 = v6 + 1;
  if (!__OFADD__(v6, 1LL))
  {
    if (v15 < v11)
    {
      unint64_t v16 = *(void *)(v7 + 8 * v15);
      ++v6;
      if (v16) {
        goto LABEL_21;
      }
      int64_t v6 = v15 + 1;
      if (v15 + 1 >= v11) {
        goto LABEL_26;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (v16) {
        goto LABEL_21;
      }
      int64_t v6 = v15 + 2;
      if (v15 + 2 >= v11) {
        goto LABEL_26;
      }
      unint64_t v16 = *(void *)(v7 + 8 * v6);
      if (v16)
      {
LABEL_21:
        unint64_t v10 = (v16 - 1) & v16;
        for (unint64_t i = __clz(__rbit64(v16)) + (v6 << 6); ; unint64_t i = v13 | (v6 << 6))
        {
          __n128 v18 = (uint64_t *)(*(void *)(a3 + 48) + 16 * i);
          uint64_t v19 = *v18;
          uint64_t v20 = v18[1];
          uint64_t v21 = *(void *)(a4 + 16);
          swift_bridgeObjectRetain(v20);
          if (v21 && (unint64_t v22 = sub_10008D45C(v19, v20), (v23 & 1) != 0))
          {
            sub_100060108(*(void *)(a4 + 56) + 32 * v22, (uint64_t)v26);
            sub_10002E92C((uint64_t)v26, &qword_10013C6F0);
            swift_bridgeObjectRelease(v20);
            if (!v10) {
              goto LABEL_8;
            }
          }

          else
          {
            memset(v26, 0, sizeof(v26));
            sub_10002E92C((uint64_t)v26, &qword_10013C6F0);
            swift_bridgeObjectRelease(v20);
            *(unint64_t *)((char *)a1 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
            if (__OFADD__(v27++, 1LL)) {
              goto LABEL_29;
            }
            if (!v10) {
              goto LABEL_8;
            }
          }

uint64_t sub_1000C60DC(uint64_t a1, uint64_t a2)
{
  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1LL << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n(a2, 2LL);
  if (v6 <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v8, 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v16 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL), v8);
    swift_bridgeObjectRetain(a2);
    sub_1000C5ECC((unint64_t *)((char *)&v16 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v7, a1, a2);
    uint64_t v11 = v10;
    swift_release(a1);
    swift_bridgeObjectRelease(a2);
    if (v2) {
      swift_willThrow(v12);
    }
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  else
  {
    unint64_t v13 = (void *)swift_slowAlloc(v8, -1LL);
    bzero(v13, v8);
    swift_bridgeObjectRetain(a2);
    sub_1000C5ECC((unint64_t *)v13, v7, a1, a2);
    uint64_t v11 = v14;
    swift_release(a1);
    swift_bridgeObjectRelease(a2);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  return v11;
}

unint64_t sub_1000C62A0()
{
  unint64_t result = qword_10013C0F0;
  if (!qword_10013C0F0)
  {
    type metadata accessor for ASCMetricsError(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1000ED2AC, v1);
    atomic_store(result, (unint64_t *)&qword_10013C0F0);
  }

  return result;
}

unint64_t sub_1000C62E8()
{
  unint64_t result = qword_10013F980;
  if (!qword_10013F980)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_10013F980);
  }

  return result;
}

void sub_1000C632C(uint64_t a1, uint64_t a2)
{
}

unint64_t sub_1000C6334()
{
  unint64_t result = qword_10013D310;
  if (!qword_10013D310)
  {
    uint64_t v1 = sub_10002A030(255LL, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10013D310);
  }

  return result;
}

uint64_t sub_1000C638C(unsigned __int8 a1, void *a2, uint64_t a3)
{
  return sub_100068748( a1,  a2,  a3,  *(void *)(v3 + 16),  *(void *)(v3 + 24),  *(void (**)(void))(v3 + 32),  *(void *)(v3 + 40),  *(void (**)(uint64_t *, uint64_t))(v3 + 48),  *(void *)(v3 + 56));
}

uint64_t sub_1000C63BC()
{
  uint64_t v1 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_1000C641C(uint64_t a1)
{
}

void sub_1000C642C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(type metadata accessor for OSSignpostID(0LL) - 8) + 80LL);
  sub_1000C3338(a1, v3 + ((v7 + 16) & ~v7), a2, a3);
}

uint64_t sub_1000C6484(uint64_t a1)
{
  return sub_1000DE090( a1,  *(void (**)(void, __n128))(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(_BYTE *)(v1 + 48));
}

uint64_t sub_1000C64BC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Bag(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  size_t v8 = (void *)((char *)&v34 - v7);
  uint64_t v9 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v8, v2, a1, v2, v9);
  uint64_t v10 = sub_100029E18(&qword_10013DDB0);
  inject<A, B>(_:from:)(v41, v10, a1, v10, v9);
  unint64_t v11 = sub_100057CA8();
  inject<A, B>(_:from:)(v40, v11, a1, v11, v9);
  uint64_t v12 = (void *)v40[0];
  uint64_t v13 = sub_100029E18((uint64_t *)&unk_10013DD40);
  inject<A, B>(_:from:)(v40, v13, a1, v13, v9);
  uint64_t v14 = sub_100029E18(&qword_10013DCC0);
  inject<A, B>(_:from:)(v39, v14, a1, v14, v9);
  int64_t v15 = *(void (**)(char *, void *, uint64_t))(v3 + 16);
  v15(v6, v8, v2);
  sub_1000388F0((uint64_t)v41, (uint64_t)v36);
  id v16 = [(id)objc_opt_self(NSBundle) mainBundle];
  MetricsFieldsAggregator.init(bag:accountProvider:bundle:)(v6, v36, v16);
  id v37 = &type metadata for AppStateMetricsFieldsProvider;
  unint64_t v38 = sub_1000C692C();
  uint64_t v17 = swift_allocObject(&unk_1001251B8, 96LL, 7LL);
  v36[0] = v17;
  sub_1000388F0((uint64_t)v40, v17 + 16);
  sub_1000388F0((uint64_t)v39, v17 + 56);
  if (qword_10013BBB0 != -1) {
    swift_once(&qword_10013BBB0, sub_100049194);
  }
  uint64_t v18 = type metadata accessor for MetricsFieldInclusionRequest(0LL);
  uint64_t v19 = sub_10002A768(v18, (uint64_t)qword_100148530);
  MetricsFieldsAggregator.addOptInProvider(_:forRequest:)(v36, v19);
  sub_100029F4C(v36);
  uint64_t v20 = type metadata accessor for UniversalMetricsFieldsProvider(0LL);
  id v37 = (ValueMetadata *)v20;
  unint64_t v38 = sub_100027978( &qword_10013F9F8,  type metadata accessor for UniversalMetricsFieldsProvider,  (uint64_t)&unk_1000F17E8);
  uint64_t v21 = (char *)sub_10002C328(v36);
  sub_1000388F0((uint64_t)v41, (uint64_t)v21);
  v15(&v21[*(int *)(v20 + 24)], v8, v2);
  *((void *)v21 + sub_100029F4C(v0 + 5) = v12;
  uint64_t v22 = qword_10013BC70;
  id v23 = v12;
  if (v22 != -1) {
    swift_once(&qword_10013BC70, sub_1000DCE50);
  }
  uint64_t v24 = type metadata accessor for MetricsFieldExclusionRequest(0LL);
  uint64_t v25 = sub_10002A768(v24, (uint64_t)qword_100148698);
  MetricsFieldsAggregator.addOptOutProvider(_:forRequest:)(v36, v25);
  sub_100029F4C(v36);
  id v37 = &type metadata for ActivityMetricsFieldsProvider;
  unint64_t v38 = sub_1000C699C();
  if (qword_10013BB98 != -1) {
    swift_once(&qword_10013BB98, sub_10002A6C4);
  }
  uint64_t v26 = sub_10002A768(v24, (uint64_t)qword_100148500);
  MetricsFieldsAggregator.addOptOutProvider(_:forRequest:)(v36, v26);
  sub_100029F4C(v36);
  BaseObjectGraph.inject<A>(_:)(&v35, &type metadata for MetricsIdStore, &type metadata for MetricsIdStore);
  uint64_t v27 = type metadata accessor for MetricsIdMetricsFieldsProvider(0LL);
  id v37 = (ValueMetadata *)v27;
  unint64_t v38 = sub_100027978( &qword_10013FA08,  type metadata accessor for MetricsIdMetricsFieldsProvider,  (uint64_t)&unk_1000F0AE8);
  __int128 v34 = v35;
  double v28 = sub_10002C328(v36);
  double v29 = (char *)v28 + *(int *)(v27 + 20);
  uint64_t v30 = enum case for MetricsFieldsProviderCategory.expensive(_:);
  uint64_t v31 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104LL))(v29, v30, v31);
  *(_OWORD *)double v28 = v34;
  if (qword_10013BC10 != -1) {
    swift_once(&qword_10013BC10, sub_1000C69E0);
  }
  uint64_t v32 = sub_10002A768(v24, (uint64_t)qword_1001485A8);
  MetricsFieldsAggregator.addOptOutProvider(_:forRequest:)(v36, v32);

  sub_100029F4C(v39);
  sub_100029F4C(v40);
  sub_100029F4C(v41);
  (*(void (**)(void *, uint64_t))(v3 + 8))(v8, v2);
  return sub_100029F4C(v36);
}

unint64_t sub_1000C692C()
{
  unint64_t result = qword_10013F9F0;
  if (!qword_10013F9F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000EE2D0, &type metadata for AppStateMetricsFieldsProvider);
    atomic_store(result, (unint64_t *)&qword_10013F9F0);
  }

  return result;
}

uint64_t sub_1000C6970()
{
  return swift_deallocObject(v0, 96LL, 7LL);
}

unint64_t sub_1000C699C()
{
  unint64_t result = qword_10013FA00;
  if (!qword_10013FA00)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000EDA40, &type metadata for ActivityMetricsFieldsProvider);
    atomic_store(result, (unint64_t *)&qword_10013FA00);
  }

  return result;
}

uint64_t sub_1000C69E0()
{
  uint64_t v0 = type metadata accessor for MetricsFieldExclusionRequest(0LL);
  sub_10002A728(v0, qword_1001485A8);
  sub_10002A768(v0, (uint64_t)qword_1001485A8);
  return MetricsFieldExclusionRequest.init(rawValue:)(0x557363697274656DLL, 0xED00006449726573LL);
}

char *sub_1000C6A48(char *a1, char **a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v4 = *a2;
  *(void *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v5 = &v4[(v3 + 16LL) & ~(unint64_t)v3];
    swift_retain(v4);
  }

  else
  {
    uint64_t v5 = a1;
    uint64_t v6 = a2[1];
    *((void *)a1 + 1) = v6;
    uint64_t v7 = *(int *)(a3 + 20);
    size_t v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
    unint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL);
    uint64_t v12 = v4;
    swift_unknownObjectRetain(v6);
    v11(v8, v9, v10);
  }

  return v5;
}

uint64_t sub_1000C6AF4(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease(*(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

void *sub_1000C6B44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16LL);
  id v11 = v5;
  swift_unknownObjectRetain(v4);
  v10(v7, v8, v9);
  return a1;
}

uint64_t sub_1000C6BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v9;
  swift_unknownObjectRetain(v9);
  swift_unknownObjectRelease(v10);
  uint64_t v11 = *(int *)(a3 + 20);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 24LL))(v12, v13, v14);
  return a1;
}

_OWORD *sub_1000C6C48(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 20);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

uint64_t sub_1000C6CA4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[1];
  swift_unknownObjectRelease(v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000C6D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C6D2C);
}

uint64_t sub_1000C6D2C(char *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *(void *)a1;
    if (*(void *)a1 >= 0xFFFFFFFFuLL) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( &a1[*(int *)(a3 + 20)],  a2,  v8);
  }

uint64_t sub_1000C6DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C6DB4);
}

char *sub_1000C6DB4(char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)unint64_t result = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( &v5[*(int *)(a4 + 20)],  a2,  a2,  v7);
  }

  return result;
}

uint64_t type metadata accessor for MetricsIdMetricsFieldsProvider(uint64_t a1)
{
  uint64_t result = qword_10013FA68;
  if (!qword_10013FA68) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MetricsIdMetricsFieldsProvider);
  }
  return result;
}

uint64_t sub_1000C6E64(uint64_t a1)
{
  v4[0] = &unk_1000F0AD0;
  uint64_t result = type metadata accessor for MetricsFieldsProviderCategory(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000C6ED8(uint64_t a1)
{
  *(void *)(v2 + 240) = a1;
  *(void *)(v2 + 248) = v1;
  return swift_task_switch(sub_1000C6EF0, 0LL, 0LL);
}

uint64_t sub_1000C6EF0()
{
  uint64_t v1 = v0[31];
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = sub_100029E18(&qword_10013F700);
  uint64_t inited = swift_initStackObject(v4, v0 + 20);
  v0[32] = inited;
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EEBC0;
  if (qword_10013BC20 != -1) {
    swift_once(&qword_10013BC20, sub_1000C7CC0);
  }
  uint64_t v6 = (void *)qword_10013FAC8;
  *(void *)(inited + 32) = qword_10013FAC8;
  specialized Array._endMutation()();
  v0[33] = inited;
  id v7 = v6;
  id v8 = objc_msgSend(v2, "ams_activeiTunesAccount");
  v0[34] = v8;
  uint64_t v9 = sub_1000C7448(inited, 0xD000000000000013LL, 0x8000000100100EB0LL);
  v0[35] = v9;
  uint64_t v10 = (void *)swift_task_alloc(dword_10013FB54);
  v0[36] = v10;
  *uint64_t v10 = v0;
  v10[1] = sub_1000C7030;
  return sub_1000C76B0((uint64_t)v9, (uint64_t)v8, (uint64_t)v2, v3);
}

uint64_t sub_1000C7030(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 288);
  *(void *)(v3 + 296) = a1;
  *(void *)(v3 + 304) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    uint64_t v5 = sub_1000C7350;
  }
  else {
    uint64_t v5 = sub_1000C709C;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

void sub_1000C709C()
{
  uint64_t v1 = *(void *)(v0 + 296);
  uint64_t v2 = *(void **)(v0 + 272);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v30 = *(void *)(v0 + 240);
  swift_bridgeObjectRelease(*(void *)(v0 + 280));

  swift_bridgeObjectRelease(v3);
  int64_t v4 = 0LL;
  uint64_t v5 = *(void *)(v1 + 64);
  uint64_t v27 = v1 + 64;
  uint64_t v31 = v1;
  uint64_t v6 = -1LL;
  uint64_t v7 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v7 < 64) {
    uint64_t v6 = ~(-1LL << -(char)v7);
  }
  unint64_t v8 = v6 & v5;
  double v29 = (_OWORD *)(v0 + 32);
  int64_t v28 = (unint64_t)(63 - v7) >> 6;
  uint64_t v9 = *(void *)(v0 + 304);
  if ((v6 & v5) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    uint64_t v15 = *(void *)(v0 + 240);
    id v16 = (uint64_t *)(*(void *)(v31 + 48) + 16 * i);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    *(void *)(v0 + swift_weakDestroy(v0 + 16) = *v16;
    *(void *)(v0 + 24) = v18;
    sub_100060108(*(void *)(v31 + 56) + 32 * i, (uint64_t)v29);
    *(void *)(v0 + 64) = v17;
    *(void *)(v0 + 72) = v18;
    sub_1000445E4(v29, (_OWORD *)(v0 + 80));
    swift_bridgeObjectRetain(v18);
    uint64_t v19 = sub_100029E18((uint64_t *)&unk_10013F960);
    uint64_t v20 = sub_100029E18((uint64_t *)&unk_10013CC60);
    swift_dynamicCast(v0 + 112, v0 + 64, v19, v20, 7LL);
    uint64_t v21 = *(void *)(v0 + 112);
    uint64_t v22 = *(void *)(v0 + 120);
    sub_1000445E4((_OWORD *)(v0 + 128), (_OWORD *)(v0 + 200));
    uint64_t v23 = *(void *)(v30 + 24);
    uint64_t v24 = *(void *)(v30 + 32);
    sub_10002ACB8(v15, v23);
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)(v0 + 200, v21, v22, v23, v24);
    if (v9)
    {
      uint64_t v25 = *(void *)(v0 + 296);
      swift_bridgeObjectRelease(v22);
      sub_100029F4C((void *)(v0 + 200));
      swift_release(v25);
      uint64_t v26 = *(void (**)(void))(v0 + 8);
LABEL_24:
      v26();
      return;
    }

    sub_100029F4C((void *)(v0 + 200));
    swift_bridgeObjectRelease(v22);
    if (v8) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      break;
    }
    if (v12 >= v28) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v12);
    ++v4;
    if (v13) {
      goto LABEL_18;
    }
    int64_t v4 = v12 + 1;
    if (v12 + 1 >= v28) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v4);
    if (v13) {
      goto LABEL_18;
    }
    int64_t v4 = v12 + 2;
    if (v12 + 2 >= v28) {
      goto LABEL_23;
    }
    unint64_t v13 = *(void *)(v27 + 8 * v4);
    if (v13) {
      goto LABEL_18;
    }
    int64_t v14 = v12 + 3;
    if (v14 >= v28)
    {
LABEL_23:
      swift_release(*(void *)(v0 + 296));
      uint64_t v26 = *(void (**)(void))(v0 + 8);
      goto LABEL_24;
    }

    unint64_t v13 = *(void *)(v27 + 8 * v14);
    if (!v13)
    {
      while (1)
      {
        int64_t v4 = v14 + 1;
        if (__OFADD__(v14, 1LL)) {
          goto LABEL_26;
        }
        if (v4 >= v28) {
          goto LABEL_23;
        }
        unint64_t v13 = *(void *)(v27 + 8 * v4);
        ++v14;
        if (v13) {
          goto LABEL_18;
        }
      }
    }

    int64_t v4 = v14;
LABEL_18:
    unint64_t v8 = (v13 - 1) & v13;
  }

  __break(1u);
LABEL_26:
  __break(1u);
}

uint64_t sub_1000C7350()
{
  uint64_t v1 = *(void **)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 264);
  swift_bridgeObjectRelease(*(void *)(v0 + 280));

  swift_bridgeObjectRelease(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000C7394(uint64_t a1)
{
  int64_t v4 = (void *)swift_task_alloc(dword_10013FAAC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4;
  *int64_t v4 = v2;
  v4[1] = sub_10002A858;
  v4[30] = a1;
  v4[31] = v1;
  return swift_task_switch(sub_1000C6EF0, 0LL, 0LL);
}

uint64_t sub_1000C73F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 20);
  uint64_t v5 = type metadata accessor for MetricsFieldsProviderCategory(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

uint64_t sub_1000C7434()
{
  return MetricsFieldsProvider.addMetricsFields(into:using:)();
}

char *sub_1000C7448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (1)
  {
    if (!v5) {
      return (char *)_swiftEmptyArrayStorage;
    }
    uint64_t result = sub_10009020C(0LL, v5 & ~(v5 >> 63), 0);
    if (v5 < 0) {
      break;
    }
    uint64_t v7 = 0LL;
    while (v5 != v7)
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, a1);
      }
      else {
        id v8 = *(id *)(a1 + 8 * v7 + 32);
      }
      id v9 = v8;
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      unint64_t v10 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(a3);
      if (v11 >= v10 >> 1) {
        sub_10009020C((char *)(v10 > 1), v11 + 1, 1);
      }
      ++v7;
      _swiftEmptyArrayStorage[2] = v11 + 1;
      int64_t v12 = &_swiftEmptyArrayStorage[3 * v11];
      v12[4] = v9;
      v12[5] = a2;
      v12[6] = a3;
      if (v5 == v7) {
        return (char *)_swiftEmptyArrayStorage;
      }
    }

    __break(1u);
LABEL_15:
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }

  __break(1u);
  return result;
}

void *initializeBufferWithCopyOfBuffer for XPCConnectionOwner.ActiveConnection(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  swift_unknownObjectRetain(v4);
  return a1;
}

uint64_t destroy for XPCConnectionOwner.ActiveConnection(uint64_t a1)
{
  return swift_unknownObjectRelease(*(void *)(a1 + 8));
}

uint64_t assignWithCopy for XPCConnectionOwner.ActiveConnection(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  id v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  swift_unknownObjectRetain(v7);
  swift_unknownObjectRelease(v8);
  return a1;
}

uint64_t assignWithTake for XPCConnectionOwner.ActiveConnection(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_unknownObjectRelease(v4);
  return a1;
}

ValueMetadata *type metadata accessor for MetricsIdStore()
{
  return &type metadata for MetricsIdStore;
}

uint64_t sub_1000C76B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[13] = a3;
  v4[14] = a4;
  v4[11] = a1;
  v4[12] = a2;
  return swift_task_switch(sub_1000C76CC, 0LL, 0LL);
}

uint64_t sub_1000C76CC()
{
  uint64_t v1 = *(void *)(v0 + 96);
  unint64_t v2 = sub_100044F60((uint64_t)_swiftEmptyArrayStorage);
  if (v1) {
    id v3 = *(id *)(v0 + 96);
  }
  else {
    id v3 = objc_msgSend(*(id *)(v0 + 104), "ams_activeiTunesAccount");
  }
  *(void *)(v0 + 120) = v3;
  uint64_t v4 = *(void **)(v0 + 88);
  uint64_t v5 = v4[2];
  *(void *)(v0 + 128) = v5;
  if (v5)
  {
    id v6 = *(void **)(v0 + 96);
    *(void *)(v0 + 136) = v2;
    *(void *)(v0 + 144) = 0LL;
    uint64_t v7 = (void *)v4[4];
    *(void *)(v0 + 152) = v7;
    uint64_t v9 = v4[5];
    uint64_t v8 = v4[6];
    *(void *)(v0 + 160) = v8;
    id v10 = v7;
    swift_bridgeObjectRetain(v8);
    id v11 = v6;
    swift_bridgeObjectRetain(v4);
    id v12 = v3;
    if (!v3)
    {
      id v12 = objc_msgSend(*(id *)(v0 + 104), "ams_activeiTunesAccount");
      id v3 = *(id *)(v0 + 120);
    }

    *(void *)(v0 + 168) = v12;
    uint64_t v13 = dword_10013FB5C;
    id v14 = v3;
    uint64_t v15 = swift_task_alloc(v13);
    *(void *)(v0 + 176) = v15;
    *(void *)uint64_t v15 = v0;
    *(void *)(v15 + 8) = sub_1000C78AC;
    __int128 v16 = *(_OWORD *)(v0 + 104);
    *(void *)(v15 + 272) = v9;
    *(void *)(v15 + 280) = v8;
    *(void *)(v15 + 256) = v12;
    *(void *)(v15 + 264) = v10;
    *(_OWORD *)(v15 + 240) = v16;
    return swift_task_switch(sub_1000C7D48, 0LL, 0LL);
  }

  else
  {
    id v18 = *(id *)(v0 + 96);
    *(void *)(v0 + swift_weakDestroy(v0 + 16) = 0xD000000000000019LL;
    *(void *)(v0 + 40) = &type metadata for String;
    *(void *)(v0 + 24) = 0x8000000100100F30LL;
    sub_1000445E4((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v2);
    sub_10008F6E0((_OWORD *)(v0 + 48), 0x734E72657375LL, 0xE600000000000000LL, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(0x8000000000000000LL);

    return (*(uint64_t (**)(unint64_t))(v0 + 8))(v2);
  }

uint64_t sub_1000C78AC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 176);
  *(void *)(*v2 + 184) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    id v6 = sub_1000C7B48;
  }

  else
  {
    *(void *)(v4 + 192) = a1;
    id v6 = sub_1000C7920;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

void sub_1000C7920()
{
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 136);

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v3);
  *(void *)(v0 + 80) = v3;
  sub_1000C42DC(v1, (uint64_t)sub_1000C429C, 0LL, isUniquelyReferenced_nonNull_native, v0 + 80);
  if (v2)
  {
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  else
  {
    id v6 = *(void **)(v0 + 152);
    uint64_t v5 = *(void *)(v0 + 160);
    uint64_t v7 = *(void *)(v0 + 128);
    uint64_t v8 = *(void *)(v0 + 144) + 1LL;
    uint64_t v9 = *(void *)(v0 + 80);
    swift_bridgeObjectRelease(0x8000000000000000LL);

    swift_bridgeObjectRelease(v5);
    if (v8 == v7)
    {
      swift_bridgeObjectRelease(*(void *)(v0 + 88));
      id v10 = *(void **)(v0 + 120);
      *(void *)(v0 + swift_weakDestroy(v0 + 16) = 0xD000000000000019LL;
      *(void *)(v0 + 40) = &type metadata for String;
      *(void *)(v0 + 24) = 0x8000000100100F30LL;
      sub_1000445E4((_OWORD *)(v0 + 16), (_OWORD *)(v0 + 48));
      char v11 = swift_isUniquelyReferenced_nonNull_native(v9);
      sub_10008F6E0((_OWORD *)(v0 + 48), 0x734E72657375LL, 0xE600000000000000LL, v11);
      swift_bridgeObjectRelease(0x8000000000000000LL);

      (*(void (**)(uint64_t))(v0 + 8))(v9);
    }

    else
    {
      uint64_t v12 = *(void *)(v0 + 144) + 1LL;
      *(void *)(v0 + 136) = v9;
      *(void *)(v0 + 144) = v12;
      uint64_t v13 = *(void **)(v0 + 120);
      id v14 = (void *)(*(void *)(v0 + 88) + 24 * v12);
      uint64_t v15 = (void *)v14[4];
      *(void *)(v0 + 152) = v15;
      uint64_t v17 = v14[5];
      uint64_t v16 = v14[6];
      *(void *)(v0 + 160) = v16;
      id v18 = v15;
      swift_bridgeObjectRetain(v16);
      id v19 = v13;
      if (!v13)
      {
        id v19 = objc_msgSend(*(id *)(v0 + 104), "ams_activeiTunesAccount");
        uint64_t v13 = *(void **)(v0 + 120);
      }

      *(void *)(v0 + 168) = v19;
      uint64_t v20 = dword_10013FB5C;
      id v21 = v13;
      uint64_t v22 = swift_task_alloc(v20);
      *(void *)(v0 + 176) = v22;
      *(void *)uint64_t v22 = v0;
      *(void *)(v22 + 8) = sub_1000C78AC;
      __int128 v23 = *(_OWORD *)(v0 + 104);
      *(void *)(v22 + 272) = v17;
      *(void *)(v22 + 280) = v16;
      *(void *)(v22 + 256) = v19;
      *(void *)(v22 + 264) = v18;
      *(_OWORD *)(v22 + 240) = v23;
      swift_task_switch(sub_1000C7D48, 0LL, 0LL);
    }
  }

uint64_t sub_1000C7B48()
{
  uint64_t v1 = *(void *)(v0 + 160);
  uint64_t v2 = *(void **)(v0 + 168);
  uint64_t v3 = *(void **)(v0 + 152);
  uint64_t v4 = *(void *)(v0 + 136);
  uint64_t v5 = *(void **)(v0 + 120);
  swift_bridgeObjectRelease(*(void *)(v0 + 88));
  swift_bridgeObjectRelease(v4);

  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000C7BB8()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  sub_10002A728(v4, qword_10013FAB0);
  sub_10002A768(v4, (uint64_t)qword_10013FAB0);
  if (qword_10013BC30 != -1) {
    swift_once(&qword_10013BC30, sub_1000D14B4);
  }
  uint64_t v5 = sub_10002A768(v0, (uint64_t)qword_1001485D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSLogger.init(subsystem:category:)(v3, 0x497363697274654DLL, 0xEE0065726F745364LL);
}

void sub_1000C7CC0()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(AMSMetricsIdentifierKey) keyWithName:v0 crossDeviceSync:1];

  qword_10013FAC8 = (uint64_t)v1;
}

uint64_t sub_1000C7D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[34] = a5;
  v6[35] = a6;
  v6[32] = a3;
  v6[33] = a4;
  v6[30] = a1;
  v6[31] = a2;
  return swift_task_switch(sub_1000C7D48, 0LL, 0LL);
}

uint64_t sub_1000C7D48()
{
  id v1 = *(void **)(v0 + 256);
  id v2 = v1;
  if (!v1)
  {
    id v2 = objc_msgSend(*(id *)(v0 + 240), "ams_activeiTunesAccount");
    id v1 = *(void **)(v0 + 256);
  }

  *(void *)(v0 + 288) = v2;
  uint64_t v3 = dword_10013FB3C;
  id v4 = v1;
  uint64_t v5 = (void *)swift_task_alloc(v3);
  *(void *)(v0 + 296) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000C7DD0;
  return sub_1000C8AC4((uint64_t)v2, *(void *)(v0 + 272), *(void *)(v0 + 280), *(void *)(v0 + 248));
}

uint64_t sub_1000C7DD0(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 296);
  *(void *)(v3 + 304) = a1;
  *(void *)(v3 + 312) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    uint64_t v5 = sub_1000C8300;
  }
  else {
    uint64_t v5 = sub_1000C7E3C;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

void sub_1000C7E3C()
{
  uint64_t v1 = v0 + 16;
  uint64_t v2 = v0 + 88;
  uint64_t v3 = (_OWORD *)(v0 + 160);
  id v49 = (_OWORD *)(v0 + 208);
  uint64_t v4 = *(void **)(v0 + 304);
  uint64_t v5 = *(void **)(v0 + 264);

  uint64_t v6 = sub_100029E18(&qword_10013F700);
  uint64_t v7 = swift_allocObject(v6, 40LL, 7LL);
  *(_OWORD *)(v7 + swift_weakDestroy(v0 + 16) = xmmword_1000EEBC0;
  *(void *)(v7 + 32) = v5;
  uint64_t v54 = v7;
  specialized Array._endMutation()();
  sub_10002A030(0LL, &qword_10013FB68, &OBJC_CLASS___AMSMetricsIdentifierKey_ptr);
  id v8 = v5;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v10 = objc_msgSend(v4, "generateEventFieldsForKeys:", isa, swift_bridgeObjectRelease(v54).n128_f64[0]);

  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v10,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  unint64_t v12 = sub_100044F60((uint64_t)_swiftEmptyArrayStorage);
  int64_t v13 = 0LL;
  uint64_t v14 = *(void *)(v11 + 64);
  unint64_t v51 = (void *)v12;
  uint64_t v52 = v11 + 64;
  uint64_t v15 = -1LL;
  uint64_t v16 = -1LL << *(_BYTE *)(v11 + 32);
  if (-v16 < 64) {
    uint64_t v15 = ~(-1LL << -(char)v16);
  }
  unint64_t v17 = v15 & v14;
  int64_t v53 = (unint64_t)(63 - v16) >> 6;
  id v18 = (_OWORD *)(v0 + 56);
  id v19 = (_OWORD *)(v0 + 128);
  uint64_t v48 = v0;
  uint64_t v46 = (_OWORD *)(v0 + 176);
  if ((v15 & v14) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v20 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v26)) + (v13 << 6))
  {
    sub_1000602DC(*(void *)(v11 + 48) + 40 * i, v1);
    sub_100060108(*(void *)(v11 + 56) + 32 * i, (uint64_t)v18);
    __int128 v22 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)uint64_t v2 = *(_OWORD *)v1;
    *(_OWORD *)(v2 + swift_weakDestroy(v0 + 16) = v22;
    *(void *)(v2 + 32) = *(void *)(v1 + 32);
    sub_1000445E4(v18, v19);
    uint64_t v23 = sub_100029E18((uint64_t *)&unk_10013FB70);
    uint64_t v24 = sub_100029E18((uint64_t *)&unk_10013CC60);
    if ((swift_dynamicCast(v3, v2, v23, v24, 6LL) & 1) == 0)
    {
      v3[1] = 0u;
      v3[2] = 0u;
      *uint64_t v3 = 0u;
      sub_10002E92C((uint64_t)v3, &qword_10013FB80);
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }

    uint64_t v28 = *(void *)(v48 + 168);
    uint64_t v50 = *(void *)(v48 + 160);
    sub_1000445E4(v46, v49);
    unsigned int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v51);
    unint64_t v29 = sub_10008D45C(v50, v28);
    uint64_t v31 = v51;
    unint64_t v32 = v29;
    uint64_t v33 = v51[2];
    BOOL v34 = (v30 & 1) == 0;
    uint64_t v35 = v33 + v34;
    if (__OFADD__(v33, v34)) {
      goto LABEL_38;
    }
    if (v51[3] >= v35)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v30 & 1) == 0) {
          goto LABEL_30;
        }
      }

      else
      {
        char v45 = v30;
        sub_10005CA74();
        uint64_t v31 = v51;
        if ((v45 & 1) == 0) {
          goto LABEL_30;
        }
      }
    }

    else
    {
      char v44 = v30;
      sub_10008DBE0(v35, isUniquelyReferenced_nonNull_native);
      unint64_t v36 = sub_10008D45C(v50, v28);
      if ((v44 & 1) != (v37 & 1))
      {
        KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
        return;
      }

      unint64_t v32 = v36;
      uint64_t v31 = v51;
      if ((v44 & 1) == 0)
      {
LABEL_30:
        v31[(v32 >> 6) + 8] |= 1LL << v32;
        __n128 v39 = (uint64_t *)(v51[6] + 16 * v32);
        *__n128 v39 = v50;
        v39[1] = v28;
        sub_1000445E4(v49, (_OWORD *)(v51[7] + 32 * v32));
        uint64_t v40 = v51[2];
        BOOL v41 = __OFADD__(v40, 1LL);
        uint64_t v42 = v40 + 1;
        if (v41) {
          goto LABEL_39;
        }
        _OWORD v51[2] = v42;
        swift_bridgeObjectRetain(v28);
        goto LABEL_32;
      }
    }

    unint64_t v38 = (void *)(v31[7] + 32 * v32);
    sub_100029F4C(v38);
    sub_1000445E4(v49, v38);
LABEL_32:
    swift_bridgeObjectRelease(0x8000000000000000LL);
    swift_bridgeObjectRelease(v28);
    if (v17) {
      goto LABEL_4;
    }
LABEL_7:
    int64_t v25 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
      __break(1u);
      goto LABEL_37;
    }

    if (v25 >= v53) {
      goto LABEL_34;
    }
    unint64_t v26 = *(void *)(v52 + 8 * v25);
    ++v13;
    if (!v26)
    {
      int64_t v13 = v25 + 1;
      if (v25 + 1 >= v53) {
        goto LABEL_34;
      }
      unint64_t v26 = *(void *)(v52 + 8 * v13);
      if (!v26)
      {
        int64_t v13 = v25 + 2;
        if (v25 + 2 >= v53) {
          goto LABEL_34;
        }
        unint64_t v26 = *(void *)(v52 + 8 * v13);
        if (!v26) {
          break;
        }
      }
    }

uint64_t sub_1000C8300()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000C8334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return swift_task_switch(sub_1000C8350, 0LL, 0LL);
}

uint64_t sub_1000C8350()
{
  if (qword_10013BC20 != -1) {
    swift_once(&qword_10013BC20, sub_1000C7CC0);
  }
  id v1 = objc_msgSend(*(id *)(v0 + 24), "ams_activeiTunesAccount");
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = (void *)swift_task_alloc(dword_10013FB3C);
  *(void *)(v0 + 48) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_1000C83FC;
  return sub_1000C8AC4((uint64_t)v1, 0xD000000000000013LL, 0x8000000100100EB0LL, *(void *)(v0 + 32));
}

uint64_t sub_1000C83FC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 48);
  *(void *)(*v2 + 56) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    uint64_t v6 = sub_100063688;
  }

  else
  {
    *(void *)(v4 + 64) = a1;
    uint64_t v6 = sub_1000C8470;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_1000C8470()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(void **)(v0 + 16);

  *uint64_t v2 = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Int sub_1000C84B0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C8504(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000010LL, 0x80000001000FA5A0LL);
}

Swift::Int sub_1000C8520()
{
  return Hasher._finalize()();
}

uint64_t sub_1000C8570@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._unint64_t countAndFlagsBits = *a1;
  uint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10011F860, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_1000C85C0(void *a1@<X8>)
{
  *a1 = 0xD000000000000010LL;
  a1[1] = 0x80000001000FA5A0LL;
}

Swift::Int sub_1000C85E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a2 + swift_weakDestroy(v0 + 16) = a1;
  swift_errorRelease(v4);
  swift_errorRetain(a1);
  return OS_dispatch_semaphore.signal()();
}

Swift::Int sub_1000C8640(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a2 + swift_weakDestroy(v0 + 16) = a1;

  id v5 = a1;
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_1000C869C(uint64_t result, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (a3)
  {
    uint64_t v5 = sub_100029E18((uint64_t *)&unk_10013E900);
    uint64_t v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0LL, 0LL);
    *uint64_t v7 = a3;
    id v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }

  else if (a2)
  {
    **(void **)(*(void *)(v3 + 64) + 40LL) = a2;
    id v9 = a2;
    return swift_continuation_throwingResume(v3);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1000C8728@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_1000C8758(a1, a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
    a3[2] = v7;
  }

  return result;
}

uint64_t sub_1000C8758(uint64_t a1, uint64_t a2)
{
  uint64_t v34 = a2;
  uint64_t v3 = type metadata accessor for JSONObject(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  id v10 = (char *)&v33 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (uint64_t)&v33 - v11;
  uint64_t v13 = JSONObject.subscript.getter(0x6570795479656BLL, 0xE700000000000000LL);
  JSONObject.string.getter(v13);
  uint64_t v15 = v14;
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v16(v12, v3);
  if (!v15)
  {
    uint64_t v18 = type metadata accessor for JSONError(0LL);
    unint64_t v23 = sub_100029F04();
    swift_allocError(v18, v23, 0LL, 0LL);
    id v21 = v20;
    *unint64_t v20 = 1701667182LL;
    v20[1] = 0xE400000000000000LL;
LABEL_9:
    void v20[2] = &type metadata for MetricsIdentifierKeyContext;
    uint64_t v30 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v18 - 8) + 104LL))( v21,  enum case for JSONError.missingProperty(_:),  v18);
    swift_willThrow(v30);
    uint64_t v31 = type metadata accessor for JSONContext(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v31 - 8) + 8LL))(v34, v31);
    v16(a1, v3);
    return v12;
  }

  uint64_t v17 = JSONObject.subscript.getter(0x6E795373736F7263LL, 0xEF65636976654463LL);
  uint64_t v12 = JSONObject.BOOL.getter(v17);
  v16((uint64_t)v10, v3);
  if (v12 == 2)
  {
    swift_bridgeObjectRelease(v15);
    uint64_t v18 = type metadata accessor for JSONError(0LL);
    unint64_t v19 = sub_100029F04();
    swift_allocError(v18, v19, 0LL, 0LL);
    id v21 = v20;
    *unint64_t v20 = 0x6E795373736F7263LL;
    unint64_t v22 = 0xEF65636976654463LL;
LABEL_8:
    v20[1] = v22;
    goto LABEL_9;
  }

  uint64_t v24 = JSONObject.subscript.getter(0x73656D614E676162LL, 0xEC00000065636170LL);
  JSONObject.string.getter(v24);
  uint64_t v26 = v25;
  v16((uint64_t)v7, v3);
  if (!v26)
  {
    swift_bridgeObjectRelease(v15);
    uint64_t v18 = type metadata accessor for JSONError(0LL);
    unint64_t v29 = sub_100029F04();
    swift_allocError(v18, v29, 0LL, 0LL);
    id v21 = v20;
    *unint64_t v20 = 0x73656D614E676162LL;
    unint64_t v22 = 0xEC00000065636170LL;
    goto LABEL_8;
  }

  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  uint64_t v12 = (uint64_t) [(id)objc_opt_self(AMSMetricsIdentifierKey) keyWithName:v27 crossDeviceSync:v12 & 1];

  uint64_t v28 = type metadata accessor for JSONContext(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v28 - 8) + 8LL))(v34, v28);
  v16(a1, v3);
  return v12;
}

uint64_t sub_1000C8AC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[26] = a3;
  v4[27] = a4;
  _BYTE v4[24] = a1;
  v4[25] = a2;
  uint64_t v5 = type metadata accessor for OSLogger(0LL);
  v4[28] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[29] = v6;
  v4[30] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000C8B28, 0LL, 0LL);
}

uint64_t sub_1000C8B28()
{
  uint64_t v1 = v0 + 2;
  uint64_t v2 = v0[27];
  uint64_t v3 = v0[24];
  uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___AMSMetricsIdentifierStore);
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = [v4 identifierStoreWithAccount:v3 bagNamespace:v5 bag:v2];
  v0[31] = v6;

  v0[7] = v0 + 23;
  v0[2] = v0;
  v0[3] = sub_1000C8C28;
  uint64_t v7 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  uint64_t v8 = v0 + 10;
  v8[1] = 0x40000000LL;
  v8[2] = sub_1000C869C;
  v8[3] = &unk_100125278;
  v8[4] = v7;
  [v6 resultWithCompletion:v8];
  return swift_continuation_await(v1);
}

uint64_t sub_1000C8C28()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48LL);
  *(void *)(*(void *)v0 + 256LL) = v1;
  if (v1) {
    uint64_t v2 = sub_1000C8CF4;
  }
  else {
    uint64_t v2 = sub_1000C8C88;
  }
  return swift_task_switch(v2, 0LL, 0LL);
}

uint64_t sub_1000C8C88()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void **)(v0 + 184);

  [v2 setIncludeAccountMatchStatus:1];
  [v2 setIsActiveITunesAccountRequired:1];
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void *))(v0 + 8))(v2);
}

uint64_t sub_1000C8CF4(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + 248);
  swift_willThrow(a1);

  if (qword_10013BC18 != -1) {
    swift_once(&qword_10013BC18, sub_1000C7BB8);
  }
  uint64_t v4 = *(void *)(v1 + 232);
  uint64_t v3 = *(void *)(v1 + 240);
  uint64_t v5 = *(void *)(v1 + 224);
  uint64_t v6 = *(void *)(v1 + 192);
  uint64_t v7 = sub_10002A768(v5, (uint64_t)qword_10013FAB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v7, v5);
  uint64_t v8 = sub_100029E18(&qword_10013EA00);
  uint64_t v9 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v10 = swift_allocObject( v8,  ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + 4LL * *(void *)(v9 + 72),
          *(unsigned __int8 *)(v9 + 80) | 7LL);
  *(_OWORD *)(v10 + swift_weakDestroy(v0 + 16) = xmmword_1000EEB80;
  LogMessage.init(stringLiteral:)(0xD000000000000022LL, 0x8000000100100F00LL);
  if (v6)
  {
    uint64_t v11 = *(void **)(v1 + 192);
    *(void *)(v1 + 144) = sub_10002A030(0LL, (unint64_t *)&unk_10013FB40, &OBJC_CLASS___ACAccount_ptr);
    *(void *)(v1 + 120) = v11;
  }

  else
  {
    *(_OWORD *)(v1 + 120) = 0u;
    *(_OWORD *)(v1 + 136) = 0u;
    uint64_t v11 = *(void **)(v1 + 192);
  }

  uint64_t v12 = *(void *)(v1 + 240);
  uint64_t v19 = *(void *)(v1 + 232);
  uint64_t v14 = *(void *)(v1 + 216);
  uint64_t v13 = *(void *)(v1 + 224);
  id v15 = v11;
  static LogMessage.traceableSensitive(_:)(v1 + 120);
  sub_10002E92C(v1 + 120, &qword_10013C6F0);
  LogMessage.init(stringLiteral:)(0x6761622068746977LL, 0xE90000000000003ALL);
  *(void *)(v1 + 176) = swift_getObjectType(v14);
  *(void *)(v1 + 152) = v14;
  swift_unknownObjectRetain(v14);
  static LogMessage.traceableSensitive(_:)(v1 + 152);
  sub_10002E92C(v1 + 152, &qword_10013C6F0);
  Logger.error(_:)(v10, v13, &protocol witness table for OSLogger);
  __n128 v16 = swift_bridgeObjectRelease(v10);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v19 + 8))(v12, v13, v16);
  swift_willThrow(v17);
  swift_task_dealloc(v12);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

id sub_1000C8F2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v64 = (void *)v6;
  uint64_t v7 = __chkstk_darwin(v6);
  v56[0] = (char *)v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v62 = (char *)v56 - v9;
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___AMSMetricsIdentifierStore);
  NSString v11 = String._bridgeToObjectiveC()();
  uint64_t v57 = a1;
  uint64_t v58 = a4;
  id v12 = [v10 identifierStoreWithAccount:a1 bagNamespace:v11 bag:a4];

  id v13 = [v12 promiseWithTimeout:0.5];
  uint64_t v14 = swift_allocObject(&unk_1001252A0, 24LL, 7LL);
  *(void *)(v14 + swift_weakDestroy(v0 + 16) = 0LL;
  id v15 = (id *)(v14 + 16);
  uint64_t v16 = swift_allocObject(&unk_1001252C8, 24LL, 7LL);
  *(void *)(v16 + swift_weakDestroy(v0 + 16) = 0LL;
  uint64_t v17 = (void *)(v16 + 16);
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
  uint64_t v19 = swift_allocObject(&unk_1001252F0, 32LL, 7LL);
  *(void *)(v19 + swift_weakDestroy(v0 + 16) = v16;
  *(void *)(v19 + 24) = v18;
  uint64_t v72 = sub_1000C9748;
  uint64_t v73 = v19;
  *(void *)&__int128 aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256LL;
  *(void *)&__int128 v71 = sub_1000C75AC;
  *((void *)&v71 + 1) = &unk_100125308;
  unint64_t v20 = _Block_copy(&aBlock);
  uint64_t v21 = v73;
  uint64_t v59 = v16;
  swift_retain(v16);
  unint64_t v22 = v18;
  swift_release(v21);
  [v13 addErrorBlock:v20];
  _Block_release(v20);
  uint64_t v23 = swift_allocObject(&unk_100125340, 32LL, 7LL);
  *(void *)(v23 + swift_weakDestroy(v0 + 16) = v14;
  *(void *)(v23 + 24) = v22;
  uint64_t v72 = sub_1000C976C;
  uint64_t v73 = v23;
  *(void *)&__int128 aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256LL;
  *(void *)&__int128 v71 = sub_1000C75AC;
  *((void *)&v71 + 1) = &unk_100125358;
  uint64_t v24 = _Block_copy(&aBlock);
  uint64_t v25 = v73;
  uint64_t v26 = v22;
  uint64_t v60 = v14;
  swift_retain(v14);
  swift_release(v25);
  id v61 = v13;
  [v13 addSuccessBlock:v24];
  _Block_release(v24);
  OS_dispatch_semaphore.wait()();
  swift_beginAccess(v16 + 16, v69, 0LL, 0LL);
  uint64_t v27 = *v17;
  if (*v17)
  {
    swift_errorRetain(*v17);
    if (qword_10013BC18 != -1) {
      swift_once(&qword_10013BC18, sub_1000C7BB8);
    }
    uint64_t v28 = (uint64_t)v64;
    uint64_t v29 = sub_10002A768((uint64_t)v64, (uint64_t)qword_10013FAB0);
    (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v29, v28);
    uint64_t v30 = sub_100029E18(&qword_10013EA00);
    uint64_t v31 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v32 = swift_allocObject( v30,  ((*(unsigned __int8 *)(v31 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))
          + 6LL * *(void *)(v31 + 72),
            *(unsigned __int8 *)(v31 + 80) | 7LL);
    *(_OWORD *)(v32 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBF0;
    LogMessage.init(stringLiteral:)(0xD00000000000002DLL, 0x8000000100100F80LL);
    uint64_t v33 = v57;
    uint64_t v34 = v26;
    if (v57)
    {
      *((void *)&v71 + 1) = sub_10002A030(0LL, (unint64_t *)&unk_10013FB40, &OBJC_CLASS___ACAccount_ptr);
      *(void *)&__int128 aBlock = v33;
    }

    else
    {
      __int128 aBlock = 0u;
      __int128 v71 = 0u;
    }

    id v37 = v33;
    static LogMessage.traceableSensitive(_:)(&aBlock);
    sub_10002E92C((uint64_t)&aBlock, &qword_10013C6F0);
    LogMessage.init(stringLiteral:)(0x6761622068746977LL, 0xE90000000000003ALL);
    uint64_t v38 = v58;
    *((void *)&v71 + 1) = swift_getObjectType(v58);
    *(void *)&__int128 aBlock = v38;
    swift_unknownObjectRetain(v38);
    static LogMessage.traceableSensitive(_:)(&aBlock);
    sub_10002E92C((uint64_t)&aBlock, &qword_10013C6F0);
    LogMessage.init(stringLiteral:)(0x6F72726520646E61LL, 0xE900000000000072LL);
    swift_getErrorValue(v27, v67, &v65);
    uint64_t v39 = v65;
    uint64_t v40 = v66;
    *((void *)&v71 + 1) = v66;
    BOOL v41 = sub_10002C328(&aBlock);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 16LL))(v41, v39, v40);
    static LogMessage.traceableSensitive(_:)(&aBlock);
    sub_10002E92C((uint64_t)&aBlock, &qword_10013C6F0);
    id v36 = v64;
    uint64_t v42 = v62;
    Logger.error(_:)(v32, v64, &protocol witness table for OSLogger);
    __n128 v43 = swift_bridgeObjectRelease(v32);
    uint64_t v44 = (*(uint64_t (**)(char *, id, __n128))(v63 + 8))(v42, v36, v43);
LABEL_10:
    swift_willThrow(v44);

    swift_release(v60);
    swift_release(v59);

    return v36;
  }

  uint64_t v35 = v56[0];
  swift_beginAccess(v15, v68, 0LL, 0LL);
  if (!*v15)
  {
    if (qword_10013BC18 != -1) {
      swift_once(&qword_10013BC18, sub_1000C7BB8);
    }
    uint64_t v46 = (uint64_t)v64;
    uint64_t v47 = sub_10002A768((uint64_t)v64, (uint64_t)qword_10013FAB0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v35, v47, v46);
    uint64_t v48 = sub_100029E18(&qword_10013EA00);
    uint64_t v49 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v50 = swift_allocObject( v48,  ((*(unsigned __int8 *)(v49 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80))
          + 4LL * *(void *)(v49 + 72),
            *(unsigned __int8 *)(v49 + 80) | 7LL);
    *(_OWORD *)(v50 + swift_weakDestroy(v0 + 16) = xmmword_1000EEB80;
    LogMessage.init(stringLiteral:)(0xD000000000000022LL, 0x8000000100100F00LL);
    unint64_t v51 = v57;
    uint64_t v34 = v26;
    if (v57)
    {
      *((void *)&v71 + 1) = sub_10002A030(0LL, (unint64_t *)&unk_10013FB40, &OBJC_CLASS___ACAccount_ptr);
      *(void *)&__int128 aBlock = v51;
    }

    else
    {
      __int128 aBlock = 0u;
      __int128 v71 = 0u;
    }

    id v52 = v51;
    static LogMessage.traceableSensitive(_:)(&aBlock);
    sub_10002E92C((uint64_t)&aBlock, &qword_10013C6F0);
    LogMessage.init(stringLiteral:)(0x6761622068746977LL, 0xE90000000000003ALL);
    uint64_t v53 = v58;
    *((void *)&v71 + 1) = swift_getObjectType(v58);
    *(void *)&__int128 aBlock = v53;
    swift_unknownObjectRetain(v53);
    static LogMessage.traceableSensitive(_:)(&aBlock);
    sub_10002E92C((uint64_t)&aBlock, &qword_10013C6F0);
    id v36 = v64;
    Logger.error(_:)(v50, v64, &protocol witness table for OSLogger);
    __n128 v54 = swift_bridgeObjectRelease(v50);
    (*(void (**)(uint64_t, id, __n128))(v63 + 8))(v35, v36, v54);
    unint64_t v55 = sub_1000C9774();
    uint64_t v44 = swift_allocError(&type metadata for MetricsIdStore.MetricsIdStoreError, v55, 0LL, 0LL);
    goto LABEL_10;
  }

  id v36 = *v15;
  [v36 setIncludeAccountMatchStatus:1];
  [v36 setIsActiveITunesAccountRequired:1];

  swift_release(v60);
  swift_release(v59);

  return v36;
}

uint64_t sub_1000C96FC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000C9720()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

Swift::Int sub_1000C9748(uint64_t a1)
{
  return sub_1000C85E0(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000C9750(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000C9760(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

Swift::Int sub_1000C976C(void *a1)
{
  return sub_1000C8640(a1, *(void *)(v1 + 16));
}

unint64_t sub_1000C9774()
{
  unint64_t result = qword_10013FB88;
  if (!qword_10013FB88)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0C3C, &type metadata for MetricsIdStore.MetricsIdStoreError);
    atomic_store(result, (unint64_t *)&qword_10013FB88);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for MetricsIdStore.MetricsIdStoreError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000C97F8 + 4 * byte_1000F0B30[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000C9818 + 4 * byte_1000F0B35[v4]))();
  }
}

_BYTE *sub_1000C97F8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000C9818(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000C9820(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000C9828(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000C9830(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000C9838(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for MetricsIdStore.MetricsIdStoreError()
{
  return &type metadata for MetricsIdStore.MetricsIdStoreError;
}

uint64_t destroy for MetricsIdentifierKeyContext(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

void *_s19appstorecomponentsd27MetricsIdentifierKeyContextVwCP_0(void *a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  a1[2] = v5;
  id v6 = v3;
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for MetricsIdentifierKeyContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t assignWithTake for MetricsIdentifierKeyContext(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v5 = a2[2];
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = a2[1];
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricsIdentifierKeyContext(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricsIdentifierKeyContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + swift_weakDestroy(v0 + 16) = 0LL;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MetricsIdentifierKeyContext()
{
  return &type metadata for MetricsIdentifierKeyContext;
}

unint64_t sub_1000C99FC()
{
  unint64_t result = qword_10013FB98;
  if (!qword_10013FB98)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0C14, &type metadata for MetricsIdStore.MetricsIdStoreError);
    atomic_store(result, (unint64_t *)&qword_10013FB98);
  }

  return result;
}

uint64_t MetricsLogger.Configuration.init(asPartOf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v26 = a2;
  uint64_t v3 = type metadata accessor for JSONTimeUnit(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_100029E18((uint64_t *)&unk_10013DCA0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for Bag(0LL);
  uint64_t v25 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v13 = (uint64_t *)((char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v14 = type metadata accessor for BaseObjectGraph(0LL);
  uint64_t v24 = a1;
  inject<A, B>(_:from:)(v13, v11, a1, v11, v14);
  uint64_t v15 = sub_100029E18((uint64_t *)&unk_10013DD20);
  inject<A, B>(_:from:)(v28, v15, a1, v15, v14);
  NSString v16 = String._bridgeToObjectiveC()();
  Bag.subscript.getter(v16, v17);

  Bag.Value.current(or:)(v27, sub_1000C50F8, 0LL, v7);
  dispatch_semaphore_t v18 = *(void (**)(char *, uint64_t))(v8 + 8);
  v18(v10, v7);
  double v19 = *(double *)v27;
  NSString v20 = String._bridgeToObjectiveC()();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for JSONTimeUnit.milliseconds(_:), v3);
  Bag.subscript.getter(v20, v6);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  Bag.Value.current(or:)(v27, sub_1000C50EC, 0LL, v7);
  v18(v10, v7);
  double v21 = *(double *)v27;
  sub_1000388F0((uint64_t)v28, (uint64_t)v27);
  MetricsLogger.Configuration.init(recorder:eventTopic:samplingPercentage:samplingDuration:)( v27,  0xD000000000000013LL,  0x8000000100101010LL,  v19,  v21);
  swift_release(v24);
  sub_100029F4C(v28);
  return (*(uint64_t (**)(void *, uint64_t))(v25 + 8))(v13, v11);
}

uint64_t sub_1000C9CEC(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001LL) != 0)
  {
    id v3 = a1;
    char v4 = __CocoaSet.contains(_:)();

    return v4 & 1;
  }

  if (!*(void *)(a2 + 16)
    || (Swift::Int v6 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40)),
        uint64_t v7 = -1LL << *(_BYTE *)(a2 + 32),
        unint64_t v8 = v6 & ~v7,
        uint64_t v9 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0))
  {
LABEL_11:
    char v12 = 0;
    return v12 & 1;
  }

  sub_10002A030(0LL, (unint64_t *)&qword_10013CB50, &OBJC_CLASS___NSNumber_ptr);
  id v10 = *(id *)(*(void *)(a2 + 48) + 8 * v8);
  char v11 = static NSObject.== infix(_:_:)();

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = ~v7;
    unint64_t v14 = (v8 + 1) & v13;
    if (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v14) & 1) != 0)
    {
      do
      {
        id v15 = *(id *)(*(void *)(a2 + 48) + 8 * v14);
        char v12 = static NSObject.== infix(_:_:)();

        if ((v12 & 1) != 0) {
          break;
        }
        unint64_t v14 = (v14 + 1) & v13;
      }

      while (((*(void *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v14) & 1) != 0);
      return v12 & 1;
    }

    goto LABEL_11;
  }

  char v12 = 1;
  return v12 & 1;
}

BOOL sub_1000C9E4C(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16)) {
    return 0LL;
  }
  uint64_t v4 = static Hasher._hash(seed:_:)(*(void *)(a2 + 40), a1);
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = v4 & ~v5;
  uint64_t v7 = a2 + 56;
  if (((*(void *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
    return 0LL;
  }
  uint64_t v8 = *(void *)(a2 + 48);
  if (*(void *)(v8 + 8 * v6) == a1) {
    return 1LL;
  }
  uint64_t v10 = ~v5;
  unint64_t v11 = (v6 + 1) & v10;
  if (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v11) & 1) == 0) {
    return 0LL;
  }
  do
  {
    uint64_t v12 = *(void *)(v8 + 8 * v11);
    BOOL result = v12 == a1;
    if (v12 == a1) {
      break;
    }
    unint64_t v11 = (v11 + 1) & v10;
  }

  while (((*(void *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_1000C9F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20);
    String.hash(into:)(v20, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      unint64_t v11 = (void *)(v10 + 16 * v8);
      uint64_t v12 = v11[1];
      BOOL v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0LL) & 1) != 0) {
        return 1LL;
      }
      uint64_t v15 = ~v7;
      unint64_t v16 = (v8 + 1) & v15;
      if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
      {
        while (1)
        {
          __n128 v17 = (void *)(v10 + 16 * v16);
          uint64_t v18 = v17[1];
          BOOL v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v16 = (v16 + 1) & v15;
          if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t MetricsTopicProvider.init(bag:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
}

uint64_t MetricsTopicProvider.currentMetricsTopic.getter()
{
  uint64_t v0 = sub_100029E18(&qword_10013DEB8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_100029E18(&qword_10013CF28);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NSString v8 = String._bridgeToObjectiveC()();
  Bag.subscript.getter();

  Bag.Value.currentOrNil()(v11, v4);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v11[1]) {
    return v11[0];
  }
  NSString v10 = String._bridgeToObjectiveC()();
  Bag.subscript.getter();

  Bag.Value.current(or:)(v11, sub_1000AED74, 0LL, v0);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (LOBYTE(v11[0])) {
    return 0xD000000000000012LL;
  }
  else {
    return 0x615F706D615F7078LL;
  }
}

Swift::Int MetricsTopicProvider.anonymousMetricsTopics.getter()
{
  Swift::Int v0 = sub_1000CAA18((uint64_t)&off_10011F9B0);
  swift_arrayDestroy(&unk_10011F9D0, 1LL, &type metadata for String);
  return v0;
}

uint64_t MetricsTopicProvider.shouldHaveAnonymousEvents.getter()
{
  uint64_t v0 = sub_100029E18(&qword_10013DEB8);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  NSString v4 = String._bridgeToObjectiveC()();
  Bag.subscript.getter();

  Bag.Value.current(or:)(&v7, sub_1000AED74, 0LL, v0);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v7;
}

Swift::String __swiftcall MetricsTopicProvider.replacementTopic(for:)(Swift::String a1)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (qword_10013BC28 != -1) {
    swift_once(&qword_10013BC28, sub_1000CA3CC);
  }
  if ((sub_1000C9F14(countAndFlagsBits, (uint64_t)object, qword_10013FBA0) & 1) != 0)
  {
    uint64_t countAndFlagsBits = MetricsTopicProvider.currentMetricsTopic.getter();
    object = v3;
  }

  else
  {
    swift_bridgeObjectRetain(object);
  }

  uint64_t v4 = countAndFlagsBits;
  uint64_t v5 = object;
  result._object = v5;
  result._uint64_t countAndFlagsBits = v4;
  return result;
}

uint64_t sub_1000CA3CC()
{
  Swift::Int v0 = sub_1000CAA18((uint64_t)&off_10011F9E0);
  uint64_t result = swift_arrayDestroy(&unk_10011FA00, 2LL, &type metadata for String);
  qword_10013FBA0 = v0;
  return result;
}

void *sub_1000CA414(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for App(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  NSString v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_100029E18(&qword_10013D9B8);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_100027978( &qword_10013D330,  (uint64_t (*)(uint64_t))&type metadata accessor for App,  (uint64_t)&protocol conformance descriptor for App);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_100027978( &qword_10013D9B0,  (uint64_t (*)(uint64_t))&type metadata accessor for App,  (uint64_t)&protocol conformance descriptor for App);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + swift_weakDestroy(v0 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

void sub_1000CA67C(uint64_t a1)
{
}

void sub_1000CA698(uint64_t a1)
{
}

void sub_1000CA6B4(uint64_t a1, uint64_t *a2, unint64_t *a3, void *a4)
{
  uint64_t v5 = a1;
  unint64_t v6 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v10 = a1;
    }
    else {
      uint64_t v10 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v5);
    if (v7)
    {
LABEL_3:
      sub_100029E18(a2);
      NSString v8 = (void *)static _SetStorage.allocate(capacity:)(v7);
      if (!v6) {
        goto LABEL_4;
      }
LABEL_11:
      if (v5 < 0) {
        uint64_t v11 = v5;
      }
      else {
        uint64_t v11 = v5 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v5);
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v11);
      swift_bridgeObjectRelease(v5);
      if (!v9) {
        return;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v7) {
      goto LABEL_3;
    }
  }

  NSString v8 = &_swiftEmptySetSingleton;
  if (v6) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v9 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v9) {
    return;
  }
LABEL_15:
  uint64_t v12 = (char *)(v8 + 7);
  uint64_t v50 = v9;
  if ((v5 & 0xC000000000000001LL) != 0)
  {
    uint64_t v13 = 0LL;
    uint64_t v46 = v5;
    while (1)
    {
      uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(v13, v5);
      BOOL v15 = __OFADD__(v13++, 1LL);
      if (v15)
      {
        __break(1u);
        goto LABEL_43;
      }

      uint64_t v16 = v14;
      Swift::Int v17 = NSObject._rawHashValue(seed:)(v8[5]);
      uint64_t v18 = -1LL << *((_BYTE *)v8 + 32);
      unint64_t v19 = v17 & ~v18;
      unint64_t v20 = v19 >> 6;
      uint64_t v21 = *(void *)&v12[8 * (v19 >> 6)];
      uint64_t v22 = 1LL << v19;
      if (((1LL << v19) & v21) != 0)
      {
        sub_10002A030(0LL, a3, a4);
        id v23 = *(id *)(v8[6] + 8 * v19);
        char v24 = static NSObject.== infix(_:_:)();

        if ((v24 & 1) != 0)
        {
LABEL_17:
          swift_unknownObjectRelease(v16);
          uint64_t v5 = v46;
          goto LABEL_18;
        }

        uint64_t v25 = ~v18;
        while (1)
        {
          unint64_t v19 = (v19 + 1) & v25;
          unint64_t v20 = v19 >> 6;
          uint64_t v21 = *(void *)&v12[8 * (v19 >> 6)];
          uint64_t v22 = 1LL << v19;
          if ((v21 & (1LL << v19)) == 0) {
            break;
          }
          id v26 = *(id *)(v8[6] + 8 * v19);
          char v27 = static NSObject.== infix(_:_:)();

          if ((v27 & 1) != 0) {
            goto LABEL_17;
          }
        }

        uint64_t v5 = v46;
      }

      *(void *)&v12[8 * v20] = v22 | v21;
      *(void *)(v8[6] + 8 * v19) = v16;
      uint64_t v28 = v8[2];
      BOOL v15 = __OFADD__(v28, 1LL);
      uint64_t v29 = v28 + 1;
      if (v15) {
        goto LABEL_44;
      }
      v8[2] = v29;
LABEL_18:
      if (v13 == v50) {
        return;
      }
    }
  }

  uint64_t v30 = 0LL;
  uint64_t v47 = *(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v30 != v47)
  {
    Swift::Int v31 = v8[5];
    id v32 = *(id *)(v5 + 32 + 8 * v30);
    Swift::Int v33 = NSObject._rawHashValue(seed:)(v31);
    uint64_t v34 = -1LL << *((_BYTE *)v8 + 32);
    unint64_t v35 = v33 & ~v34;
    unint64_t v36 = v35 >> 6;
    uint64_t v37 = *(void *)&v12[8 * (v35 >> 6)];
    uint64_t v38 = 1LL << v35;
    if (((1LL << v35) & v37) != 0)
    {
      sub_10002A030(0LL, a3, a4);
      id v39 = *(id *)(v8[6] + 8 * v35);
      char v40 = static NSObject.== infix(_:_:)();

      if ((v40 & 1) != 0) {
        goto LABEL_30;
      }
      uint64_t v41 = ~v34;
      unint64_t v35 = (v35 + 1) & v41;
      unint64_t v36 = v35 >> 6;
      uint64_t v37 = *(void *)&v12[8 * (v35 >> 6)];
      uint64_t v38 = 1LL << v35;
      if ((v37 & (1LL << v35)) != 0)
      {
        while (1)
        {
          id v42 = *(id *)(v8[6] + 8 * v35);
          char v43 = static NSObject.== infix(_:_:)();

          if ((v43 & 1) != 0) {
            break;
          }
          unint64_t v35 = (v35 + 1) & v41;
          unint64_t v36 = v35 >> 6;
          uint64_t v37 = *(void *)&v12[8 * (v35 >> 6)];
          uint64_t v38 = 1LL << v35;
          if ((v37 & (1LL << v35)) == 0) {
            goto LABEL_38;
          }
        }

Swift::Int sub_1000CAA18(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100029E18(&qword_10013D980);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v27 = a1 + 32;
    while (1)
    {
      unint64_t v6 = (uint64_t *)(v27 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v28);
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        uint64_t v17 = v16[1];
        BOOL v18 = *v16 == v8 && v17 == v7;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0LL), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v19 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v19;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          unint64_t v20 = (void *)(v15 + 16 * v11);
          uint64_t v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0LL);
            if ((result & 1) == 0) {
              continue;
            }
          }

          goto LABEL_3;
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v23 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *id v23 = v8;
      v23[1] = v7;
      uint64_t v24 = *(void *)(v3 + 16);
      BOOL v25 = __OFADD__(v24, 1LL);
      uint64_t v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + swift_weakDestroy(v0 + 16) = v26;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t initializeBufferWithCopyOfBuffer for MetricsTopicProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for MetricsTopicProvider(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Bag(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t initializeWithCopy for MetricsTopicProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for MetricsTopicProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24LL))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for MetricsTopicProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for MetricsTopicProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for MetricsTopicProvider(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CAD44);
}

uint64_t sub_1000CAD44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for MetricsTopicProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CAD8C);
}

uint64_t sub_1000CAD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Bag(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56LL))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for MetricsTopicProvider(uint64_t a1)
{
  uint64_t result = qword_10013FC00;
  if (!qword_10013FC00) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MetricsTopicProvider);
  }
  return result;
}

uint64_t sub_1000CAE08(uint64_t a1)
{
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 1LL, &v4, a1 + 16);
    return 0LL;
  }

  return result;
}

void *sub_1000CAE70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for AdamID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_100029E18(&qword_10013FC58);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_100027978( &qword_10013FC60,  (uint64_t (*)(uint64_t))&type metadata accessor for AdamID,  (uint64_t)&protocol conformance descriptor for AdamID);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_100027978( qword_10013FC68,  (uint64_t (*)(uint64_t))&type metadata accessor for AdamID,  (uint64_t)&protocol conformance descriptor for AdamID);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          BOOL v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + swift_weakDestroy(v0 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

void *sub_1000CB0D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_100029E18(&qword_10013FC40);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_100027978( &qword_10013FC48,  (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component,  (uint64_t)&protocol conformance descriptor for Calendar.Component);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_100027978( &qword_10013FC50,  (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component,  (uint64_t)&protocol conformance descriptor for Calendar.Component);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          BOOL v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + swift_weakDestroy(v0 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

uint64_t sub_1000CB340(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100029E18(&qword_10013D9C0);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    uint64_t v7 = *(void *)(v3 + 40);
    uint64_t v8 = ~(-1LL << *(_BYTE *)(v3 + 32));
    while (1)
    {
      uint64_t v9 = *(void *)(v6 + 8 * v4);
      uint64_t result = static Hasher._hash(seed:_:)(v7, v9);
      unint64_t v11 = result & v8;
      unint64_t v12 = (result & (unint64_t)v8) >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * v12);
      uint64_t v14 = 1LL << (result & v8);
      uint64_t v15 = *(void *)(v3 + 48);
      if ((v14 & v13) != 0)
      {
        while (*(void *)(v15 + 8 * v11) != v9)
        {
          unint64_t v11 = (v11 + 1) & v8;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        *(void *)(v5 + 8 * v12) = v14 | v13;
        *(void *)(v15 + 8 * v11) = v9;
        uint64_t v16 = *(void *)(v3 + 16);
        BOOL v17 = __OFADD__(v16, 1LL);
        uint64_t v18 = v16 + 1;
        if (v17)
        {
          __break(1u);
          return result;
        }

        *(void *)(v3 + swift_weakDestroy(v0 + 16) = v18;
      }

      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (uint64_t)&_swiftEmptySetSingleton;
}

uint64_t sub_1000CB458(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100029E18(&qword_10013FC38);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    uint64_t v7 = *(void *)(v3 + 40);
    uint64_t v8 = ~(-1LL << *(_BYTE *)(v3 + 32));
    while (1)
    {
      uint64_t v9 = *(void *)(v6 + 8 * v4);
      uint64_t result = static Hasher._hash(seed:_:)(v7, v9);
      unint64_t v11 = result & v8;
      unint64_t v12 = (result & (unint64_t)v8) >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * v12);
      uint64_t v14 = 1LL << (result & v8);
      uint64_t v15 = *(void *)(v3 + 48);
      if ((v14 & v13) != 0)
      {
        while (*(void *)(v15 + 8 * v11) != v9)
        {
          unint64_t v11 = (v11 + 1) & v8;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            goto LABEL_7;
          }
        }
      }

      else
      {
LABEL_7:
        *(void *)(v5 + 8 * v12) = v14 | v13;
        *(void *)(v15 + 8 * v11) = v9;
        uint64_t v16 = *(void *)(v3 + 16);
        BOOL v17 = __OFADD__(v16, 1LL);
        uint64_t v18 = v16 + 1;
        if (v17)
        {
          __break(1u);
          return result;
        }

        *(void *)(v3 + swift_weakDestroy(v0 + 16) = v18;
      }

      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (uint64_t)&_swiftEmptySetSingleton;
}

uint64_t sub_1000CB570(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24LL);
}

uint64_t type metadata accessor for ModelThunk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100079578(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ModelThunk);
}

uint64_t sub_1000CB584(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (*(uint64_t (**)(void))(a4 + 8))();
  uint64_t v7 = type metadata accessor for JSONContext(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(a2, v7);
  uint64_t v8 = type metadata accessor for JSONObject(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(a1, v8);
  return v6;
}

uint64_t sub_1000CB600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result = sub_1000CB584(a1, a2, *(void *)(a3 + 16), *(void *)(a3 + 24));
  if (!v4) {
    *a4 = result;
  }
  return result;
}

uint64_t sub_1000CB630()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 valueForEntitlement:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)(v5, v2);
    swift_unknownObjectRelease(v2);
  }

  else
  {
    memset(v5, 0, sizeof(v5));
  }

  sub_1000CC028((uint64_t)v5, (uint64_t)v6);
  if (v7)
  {
  }

  else
  {
    sub_10004C810((uint64_t)v6);
  }

  return 0LL;
}

id sub_1000CB710(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000CBBF4(a1, a2, 25705LL, 0xE200000000000000LL);
  if (v10) {
    return (id)v9;
  }
  NSString v12 = String._bridgeToObjectiveC()();
  id v11 = [v3 valueForEntitlement:v12];

  if (v11)
  {
    _bridgeAnyObjectToAny(_:)(v21, v11);
    swift_unknownObjectRelease(v11);
    sub_1000445E4(v21, v22);
    sub_100060108((uint64_t)v22, (uint64_t)v21);
    if (swift_dynamicCast(&v20, v21, (char *)&type metadata for Any + 8, &type metadata for String, 6LL))
    {
      id v11 = v20;
      sub_100029F4C(v22);
    }

    else
    {
      if (qword_10013BC48 != -1) {
        swift_once(&qword_10013BC48, sub_1000D1558);
      }
      uint64_t v13 = type metadata accessor for OSLogger(0LL);
      sub_10002A768(v13, (uint64_t)qword_100148618);
      uint64_t v14 = sub_100029E18(&qword_10013EA00);
      uint64_t v15 = type metadata accessor for LogMessage(0LL);
      uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
            + *(void *)(*(void *)(v15 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(53LL, 1LL);
      v17._uint64_t countAndFlagsBits = 0LL;
      v17._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      LogMessage.StringInterpolation.appendInterpolation(identity:)(v3);
      v18._uint64_t countAndFlagsBits = 0xD000000000000035LL;
      v18._object = (void *)0x80000001001011A0LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v18);
      LogMessage.init(stringInterpolation:)(v8);
      Logger.error(_:)(v16, v13, &protocol witness table for OSLogger);
      swift_bridgeObjectRelease(v16);
      sub_100029F4C(v22);
      return 0LL;
    }
  }

  return v11;
}

id sub_1000CB97C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1000CBBF4(a1, a2, 0x6E6F6973726576LL, 0xE700000000000000LL);
  if (v10) {
    return (id)v9;
  }
  NSString v12 = String._bridgeToObjectiveC()();
  id v11 = [v3 valueForEntitlement:v12];

  if (v11)
  {
    _bridgeAnyObjectToAny(_:)(v21, v11);
    swift_unknownObjectRelease(v11);
    sub_1000445E4(v21, v22);
    sub_100060108((uint64_t)v22, (uint64_t)v21);
    if (swift_dynamicCast(&v20, v21, (char *)&type metadata for Any + 8, &type metadata for String, 6LL))
    {
      id v11 = v20;
      sub_100029F4C(v22);
    }

    else
    {
      if (qword_10013BC48 != -1) {
        swift_once(&qword_10013BC48, sub_1000D1558);
      }
      uint64_t v13 = type metadata accessor for OSLogger(0LL);
      sub_10002A768(v13, (uint64_t)qword_100148618);
      uint64_t v14 = sub_100029E18(&qword_10013EA00);
      uint64_t v15 = type metadata accessor for LogMessage(0LL);
      uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
            + *(void *)(*(void *)(v15 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(50LL, 1LL);
      v17._uint64_t countAndFlagsBits = 0LL;
      v17._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v17);
      LogMessage.StringInterpolation.appendInterpolation(identity:)(v3);
      v18._object = (void *)0x8000000100101090LL;
      v18._uint64_t countAndFlagsBits = 0xD000000000000032LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v18);
      LogMessage.init(stringInterpolation:)(v8);
      Logger.error(_:)(v16, v13, &protocol witness table for OSLogger);
      swift_bridgeObjectRelease(v16);
      sub_100029F4C(v22);
      return 0LL;
    }
  }

  return v11;
}

uint64_t sub_1000CBBF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  NSString v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a2) {
    return a1;
  }
  uint64_t v40 = a3;
  swift_bridgeObjectRetain(a2);
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v5 valueForEntitlement:v17];

  if (v18)
  {
    _bridgeAnyObjectToAny(_:)(v43, v18);
    swift_unknownObjectRelease(v18);
  }

  else
  {
    memset(v43, 0, sizeof(v43));
  }

  uint64_t v41 = a1;
  sub_1000CC028((uint64_t)v43, (uint64_t)&v44);
  if (!*((void *)&v45 + 1))
  {
LABEL_18:
    sub_10004C810((uint64_t)&v44);
    goto LABEL_19;
  }

  uint64_t v19 = sub_100029E18(&qword_10013CD70);
  if ((swift_dynamicCast(&v42, &v44, (char *)&type metadata for Any + 8, v19, 6LL) & 1) != 0)
  {
    uint64_t v20 = v42;
    if (*(void *)(v42 + 16))
    {
      swift_bridgeObjectRetain(a2);
      unint64_t v21 = sub_10008D45C(v41, a2);
      if ((v22 & 1) != 0)
      {
        sub_100060108(*(void *)(v20 + 56) + 32 * v21, (uint64_t)&v44);
      }

      else
      {
        __int128 v44 = 0u;
        __int128 v45 = 0u;
      }

      swift_bridgeObjectRelease(a2);
    }

    else
    {
      __int128 v44 = 0u;
      __int128 v45 = 0u;
    }

    swift_bridgeObjectRelease(v20);
    if (*((void *)&v45 + 1))
    {
      uint64_t v23 = sub_100029E18(&qword_10013C720);
      if ((swift_dynamicCast(v43, &v44, (char *)&type metadata for Any + 8, v23, 6LL) & 1) != 0)
      {
        uint64_t v24 = *(void *)&v43[0];
        if (*(void *)(*(void *)&v43[0] + 16LL))
        {
          swift_bridgeObjectRetain(a4);
          unint64_t v25 = sub_10008D45C(v40, a4);
          if ((v26 & 1) != 0)
          {
            uint64_t v27 = (uint64_t *)(*(void *)(v24 + 56) + 16 * v25);
            a1 = *v27;
            swift_bridgeObjectRetain(v27[1]);
            swift_bridgeObjectRelease(a2);
            swift_bridgeObjectRelease(a4);
            swift_bridgeObjectRelease(v24);
            return a1;
          }

          swift_bridgeObjectRelease(a4);
        }

        swift_bridgeObjectRelease(v24);
      }

      goto LABEL_19;
    }

    goto LABEL_18;
  }

uint64_t sub_1000CC028(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013C6F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for ObjectGraph(uint64_t a1)
{
  uint64_t result = qword_10013FD10;
  if (!qword_10013FD10) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ObjectGraph);
  }
  return result;
}

uint64_t sub_1000CC0AC(uint64_t a1)
{
  v2[0] = "(";
  v2[1] = "(";
  v2[2] = "(";
  v2[3] = "(";
  return swift_initClassMetadata2(a1, 0LL, 4LL, v2, a1 + qword_1001485C0);
}

uint64_t sub_1000CC0F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000CC148(a1, a2, a3);
}

uint64_t sub_1000CC148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for DependencyDictionary(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = v3 + qword_10013FCF0;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = 0u;
  *(void *)(v11 + 32) = 0LL;
  uint64_t v12 = v3 + qword_10013FCF8;
  *(void *)(v12 + 32) = 0LL;
  *(_OWORD *)uint64_t v12 = 0u;
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = 0u;
  uint64_t v13 = v3 + qword_10013FD00;
  *(_OWORD *)uint64_t v13 = 0u;
  *(_OWORD *)(v13 + swift_weakDestroy(v0 + 16) = 0u;
  *(void *)(v13 + 32) = 0LL;
  uint64_t v14 = v3 + qword_10013FD08;
  *(void *)(v14 + 32) = 0LL;
  *(_OWORD *)uint64_t v14 = 0u;
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = 0u;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
  uint64_t v15 = BaseObjectGraph.init(name:dependencies:)(a1, a2, v10);
  uint64_t v16 = sub_100029E18((uint64_t *)&unk_10013DD40);
  swift_retain(v15);
  BaseObjectGraph.optional<A>(_:)(v16, v16);
  uint64_t v17 = v15 + qword_10013FCF0;
  swift_beginAccess(v15 + qword_10013FCF0, v25, 33LL, 0LL);
  sub_100060278((uint64_t)v26, v17, &qword_10013C7E0);
  swift_endAccess(v25);
  uint64_t v18 = sub_100029E18((uint64_t *)&unk_10013CE70);
  swift_retain(v15);
  BaseObjectGraph.optional<A>(_:)(v18, v18);
  swift_release(v15);
  uint64_t v19 = v15 + qword_10013FCF8;
  swift_beginAccess(v15 + qword_10013FCF8, v25, 33LL, 0LL);
  sub_100060278((uint64_t)v26, v19, (uint64_t *)&unk_10013DCB0);
  swift_endAccess(v25);
  uint64_t v20 = sub_100029E18(&qword_10013C6B0);
  swift_retain(v15);
  BaseObjectGraph.optional<A>(_:)(v20, v20);
  swift_release(v15);
  uint64_t v21 = v15 + qword_10013FD00;
  swift_beginAccess(v15 + qword_10013FD00, v25, 33LL, 0LL);
  sub_100060278((uint64_t)v26, v21, &qword_10013FD60);
  swift_endAccess(v25);
  uint64_t v22 = sub_100029E18((uint64_t *)&unk_10013DD30);
  swift_retain(v15);
  BaseObjectGraph.optional<A>(_:)(v22, v22);
  swift_release_n(v15, 2LL);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a3, v7);
  uint64_t v23 = v15 + qword_10013FD08;
  swift_beginAccess(v15 + qword_10013FD08, v25, 33LL, 0LL);
  sub_100060278((uint64_t)v26, v23, (uint64_t *)&unk_10013FD68);
  swift_endAccess(v25);
  return v15;
}

uint64_t sub_1000CC3FC()
{
  return sub_10002E92C(v0 + qword_10013FD08, (uint64_t *)&unk_10013FD68);
}

uint64_t sub_1000CC46C()
{
  uint64_t v0 = BaseObjectGraph.deinit();
  sub_10002E92C(v0 + qword_10013FCF0, &qword_10013C7E0);
  sub_10002E92C(v0 + qword_10013FCF8, (uint64_t *)&unk_10013DCB0);
  sub_10002E92C(v0 + qword_10013FD00, &qword_10013FD60);
  sub_10002E92C(v0 + qword_10013FD08, (uint64_t *)&unk_10013FD68);
  return swift_deallocClassInstance(v0, 176LL, 7LL);
}

uint64_t sub_1000CC4F8()
{
  return type metadata accessor for ObjectGraph(0LL);
}

uint64_t getEnumTagSinglePayload for OfferAlertOfferActionImplementation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferAlertOfferActionImplementation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 8) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OfferAlertOfferActionImplementation()
{
  return &type metadata for OfferAlertOfferActionImplementation;
}

unint64_t sub_1000CC598()
{
  unint64_t result = qword_10013C4D0;
  if (!qword_10013C4D0)
  {
    uint64_t v1 = sub_10002A030(255LL, &qword_10013C4C8, off_10011E558);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ASCOfferAlertOffer, v1);
    atomic_store(result, (unint64_t *)&qword_10013C4D0);
  }

  return result;
}

uint64_t sub_1000CC5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[49] = a3;
  v4[50] = a4;
  v4[47] = a1;
  v4[48] = a2;
  uint64_t v5 = type metadata accessor for MetricsFieldsContext(0LL);
  v4[51] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[52] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[53] = swift_task_alloc(v7);
  v4[54] = swift_task_alloc(v7);
  uint64_t v8 = type metadata accessor for ActionOutcome(0LL);
  v4[55] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[56] = v9;
  v4[57] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_100029E18(&qword_10013C6C8);
  v4[58] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[59] = v11;
  unint64_t v12 = (*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[60] = swift_task_alloc(v12);
  v4[61] = swift_task_alloc(v12);
  uint64_t v13 = type metadata accessor for ScalarDictionary(0LL);
  v4[62] = swift_task_alloc((*(void *)(*(void *)(v13 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for CancelOrPauseInstallAction(0LL);
  v4[63] = v14;
  v4[64] = swift_task_alloc((*(void *)(*(void *)(v14 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_100029E18(&qword_10013CBA0);
  v4[65] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v4[66] = v16;
  unint64_t v17 = (*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[67] = swift_task_alloc(v17);
  v4[68] = swift_task_alloc(v17);
  uint64_t v18 = type metadata accessor for AppOffer(0LL);
  v4[69] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v4[70] = v19;
  v4[71] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for App.Kind(0LL);
  v4[72] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v4[73] = v21;
  v4[74] = swift_task_alloc((*(void *)(v21 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for AdamID(0LL);
  v4[75] = swift_task_alloc((*(void *)(*(void *)(v22 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = type metadata accessor for App(0LL);
  v4[76] = v23;
  uint64_t v24 = *(void *)(v23 - 8);
  v4[77] = v24;
  v4[78] = swift_task_alloc((*(void *)(v24 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = type metadata accessor for State(0LL);
  v4[79] = v25;
  uint64_t v26 = *(void *)(v25 - 8);
  v4[80] = v26;
  unint64_t v27 = (*(void *)(v26 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v4[81] = swift_task_alloc(v27);
  v4[82] = swift_task_alloc(v27);
  return swift_task_switch(sub_1000CC818, 0LL, 0LL);
}

uint64_t sub_1000CC818()
{
  uint64_t v1 = *(void *)(v0 + 384) + qword_10013FCF0;
  swift_beginAccess(v1, v0 + 296, 0LL, 0LL);
  sub_100030628(v1, v0 + 136);
  if (!*(void *)(v0 + 160))
  {
    sub_10002E92C(v0 + 136, &qword_10013C7E0);
    uint64_t v6 = sub_100029E18((uint64_t *)&unk_10013DD40);
    return dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)(v6, v6);
  }

  uint64_t v2 = *(void **)(v0 + 392);
  sub_10002C438((__int128 *)(v0 + 136), v0 + 176);
  uint64_t v3 = *(void *)(v0 + 200);
  uint64_t v4 = *(void *)(v0 + 208);
  sub_100029EE0((void *)(v0 + 176), v3);
  id v5 = [v2 id];
  AdamID.init(value:)([v5 int64value]);
  uint64_t v8 = *(void *)(v0 + 656);
  uint64_t v50 = *(void *)(v0 + 632);
  uint64_t v52 = *(void *)(v0 + 648);
  uint64_t v9 = *(void *)(v0 + 624);
  uint64_t v47 = *(void *)(v0 + 608);
  uint64_t v48 = *(void *)(v0 + 640);
  uint64_t v10 = *(void *)(v0 + 600);
  uint64_t v44 = v4;
  uint64_t v11 = *(void *)(v0 + 592);
  uint64_t v12 = *(void *)(v0 + 568);
  uint64_t v43 = *(void *)(v0 + 560);
  uint64_t v45 = *(void *)(v0 + 552);
  uint64_t v46 = *(void *)(v0 + 616);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 584) + 104LL))( v11,  enum case for App.Kind.store(_:),  *(void *)(v0 + 576));
  App.init(id:kind:)(v10, v11);

  sub_10003908C();
  AppStateController.state(forApp:applying:)(v9, v12, v3, v44);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v12, v45);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v9, v47);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v52, v8, v50);
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 88))(v52, v50);
  if (v13 == enum case for State.waiting(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 640) + 96LL))( *(void *)(v0 + 648),  *(void *)(v0 + 632));
    uint64_t v14 = type metadata accessor for AppInstallationType(0LL);
LABEL_8:
    uint64_t v15 = *(void **)(v0 + 544);
    uint64_t v16 = *(void *)(v0 + 520);
    uint64_t v17 = *(void *)(v0 + 504);
    uint64_t v18 = *(void *)(v0 + 512);
    uint64_t v19 = *(void *)(v0 + 496);
    uint64_t v49 = *(void *)(v0 + 472);
    uint64_t v51 = *(void *)(v0 + 464);
    uint64_t v53 = *(void *)(v0 + 488);
    uint64_t v20 = *(void *)(v0 + 384);
    uint64_t v21 = *(void **)(v0 + 392);
    (*(void (**)(void))(*(void *)(v14 - 8) + 8LL))(*(void *)(v0 + 648));
    uint64_t v22 = type metadata accessor for ObjectGraph(0LL);
    inject<A, B>(_:from:)(v15, v16, v20, v16, v22);
    id v23 = [v21 metrics];
    uint64_t v24 = sub_10002A030(0LL, (unint64_t *)&qword_10013C7E8, off_10011E550);
    uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

    size_t v26 = sub_100067DF8(v25);
    swift_bridgeObjectRelease(v25);
    ScalarDictionary.init()(v27);
    ActionMetrics.init(data:custom:)(v26, v19);
    *(void *)(v18 + *(int *)(v17 + 20)) = [v21 id];
    *(void *)(v0 + 120) = v17;
    *(void *)(v0 + 128) = sub_100027978( (unint64_t *)&qword_10013FDA0,  type metadata accessor for CancelOrPauseInstallAction,  (uint64_t)&unk_1000EF630);
    uint64_t v28 = sub_10002C328((void *)(v0 + 96));
    sub_100038AC0(v18, (uint64_t)v28, type metadata accessor for CancelOrPauseInstallAction);
    (*(void (**)(uint64_t, void, uint64_t))(v49 + 104))( v53,  enum case for ActionDispatcher.MetricsBehavior.notProcessed<A>(_:),  v51);
    uint64_t v29 = (uint64_t *)swift_task_alloc(async function pointer to ActionDispatcher.perform(_:withMetrics:asPartOf:)[1]);
    *(void *)(v0 + 664) = v29;
    *uint64_t v29 = v0;
    v29[1] = (uint64_t)sub_1000CCF68;
    return ActionDispatcher.perform(_:withMetrics:asPartOf:)( *(void *)(v0 + 376),  v0 + 96,  *(void *)(v0 + 488),  *(void *)(v0 + 384),  *(void *)(v0 + 520));
  }

  if (v13 == enum case for State.installing(_:))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 640) + 96LL))( *(void *)(v0 + 648),  *(void *)(v0 + 632));
    uint64_t v14 = type metadata accessor for AppInstallation(0LL);
    goto LABEL_8;
  }

  if ([*(id *)(v0 + 392) shouldCheckForAvailableDiskSpace])
  {
    if (qword_10013BC40 != -1) {
      swift_once(&qword_10013BC40, sub_1000D1538);
    }
    uint64_t v31 = type metadata accessor for OSLogger(0LL);
    sub_10002A768(v31, (uint64_t)qword_100148600);
    uint64_t v32 = sub_100029E18(&qword_10013EA00);
    uint64_t v33 = type metadata accessor for LogMessage(0LL);
    uint64_t v34 = swift_allocObject( v32,  ((*(unsigned __int8 *)(*(void *)(v33 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v33 - 8) + 80LL))
          + *(void *)(*(void *)(v33 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v33 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v34 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.init(stringLiteral:)(0xD000000000000053LL, 0x8000000100101350LL);
    Logger.error(_:)(v34, v31, &protocol witness table for OSLogger);
    *(void *)&double v30 = swift_bridgeObjectRelease(v34).n128_u64[0];
  }

  id v35 = objc_msgSend(*(id *)(v0 + 392), "checkRestrictionsForContentRating", v30);

  if (v35)
  {
    if (qword_10013BC40 != -1) {
      swift_once(&qword_10013BC40, sub_1000D1538);
    }
    uint64_t v36 = type metadata accessor for OSLogger(0LL);
    sub_10002A768(v36, (uint64_t)qword_100148600);
    uint64_t v37 = sub_100029E18(&qword_10013EA00);
    uint64_t v38 = type metadata accessor for LogMessage(0LL);
    uint64_t v39 = swift_allocObject( v37,  ((*(unsigned __int8 *)(*(void *)(v38 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v38 - 8) + 80LL))
          + *(void *)(*(void *)(v38 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v38 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v39 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.init(stringLiteral:)(0xD000000000000050LL, 0x80000001001012F0LL);
    Logger.error(_:)(v39, v36, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v39);
  }

  uint64_t v40 = (int8x16_t *)swift_task_alloc(dword_10013FD8C);
  *(void *)(v0 + 680) = v40;
  v40->i64[0] = v0;
  v40->i64[1] = (uint64_t)sub_1000CD154;
  uint64_t v41 = *(void *)(v0 + 456);
  int8x16_t v42 = *(int8x16_t *)(v0 + 384);
  v40[5].i64[0] = *(void *)(v0 + 400);
  v40[4] = vextq_s8(v42, v42, 8uLL);
  v40[3].i64[1] = v41;
  return swift_task_switch(sub_1000CE440, 0LL, 0LL);
}

uint64_t sub_1000CCF68()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 664LL);
  *(void *)(*(void *)v1 + 672LL) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(void, void))(v2[59] + 8LL))(v2[61], v2[58]);
  if (v0)
  {
    uint64_t v4 = sub_1000CE2A8;
  }

  else
  {
    sub_100029F4C(v2 + 12);
    uint64_t v4 = sub_1000CCFF8;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000CCFF8()
{
  uint64_t v1 = *(void *)(v0 + 640);
  uint64_t v2 = *(void *)(v0 + 544);
  uint64_t v3 = *(void *)(v0 + 528);
  uint64_t v4 = *(void *)(v0 + 520);
  sub_100038B04(*(void *)(v0 + 512), type metadata accessor for CancelOrPauseInstallAction);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  id v5 = *(void (**)(uint64_t, void))(v1 + 8);
  uint64_t v6 = *(void *)(v0 + 656);
  uint64_t v7 = *(void *)(v0 + 648);
  uint64_t v8 = *(void *)(v0 + 624);
  uint64_t v9 = *(void *)(v0 + 600);
  uint64_t v10 = *(void *)(v0 + 592);
  uint64_t v11 = *(void *)(v0 + 568);
  uint64_t v12 = *(void *)(v0 + 544);
  uint64_t v13 = *(void *)(v0 + 536);
  uint64_t v15 = *(void *)(v0 + 512);
  uint64_t v16 = *(void *)(v0 + 496);
  uint64_t v17 = *(void *)(v0 + 488);
  uint64_t v18 = *(void *)(v0 + 480);
  uint64_t v19 = *(void *)(v0 + 456);
  uint64_t v20 = *(void *)(v0 + 432);
  uint64_t v21 = *(void *)(v0 + 424);
  v5(v6, *(void *)(v0 + 632));
  sub_100029F4C((void *)(v0 + 176));
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CD154()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 680LL);
  *(void *)(*(void *)v1 + 688LL) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000CDA9C;
  }

  else
  {
    (*(void (**)(void, void))(v2[56] + 8LL))(v2[57], v2[55]);
    uint64_t v4 = sub_1000CD1C8;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000CD1C8()
{
  if ([*(id *)(v0 + 392) shouldPromptForConfirmation])
  {
    if (qword_10013BC40 != -1) {
      swift_once(&qword_10013BC40, sub_1000D1538);
    }
    uint64_t v2 = type metadata accessor for OSLogger(0LL);
    sub_10002A768(v2, (uint64_t)qword_100148600);
    uint64_t v3 = sub_100029E18(&qword_10013EA00);
    uint64_t v4 = type metadata accessor for LogMessage(0LL);
    uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
         + *(void *)(*(void *)(v4 - 8) + 72LL),
           *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.init(stringLiteral:)(0xD00000000000004ELL, 0x80000001001012A0LL);
    Logger.error(_:)(v5, v2, &protocol witness table for OSLogger);
    *(void *)&double v1 = swift_bridgeObjectRelease(v5).n128_u64[0];
  }

  id v6 = objc_msgSend(*(id *)(v0 + 392), "completionOffer", v1);
  *(void *)(v0 + 696) = v6;
  if (!v6)
  {
    uint64_t v31 = *(void *)(v0 + 440);
    uint64_t v30 = *(void *)(v0 + 448);
    uint64_t v32 = *(void *)(v0 + 376);
    uint64_t v33 = *(void (**)(uint64_t, void))(*(void *)(v0 + 640) + 8LL);
    v33(*(void *)(v0 + 656), *(void *)(v0 + 632));
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v32, enum case for ActionOutcome.performed(_:), v31);
    uint64_t v34 = *(void *)(v0 + 648);
    uint64_t v35 = *(void *)(v0 + 656);
    uint64_t v36 = *(void *)(v0 + 624);
    uint64_t v37 = *(void *)(v0 + 600);
    uint64_t v38 = *(void *)(v0 + 592);
    uint64_t v39 = *(void *)(v0 + 568);
    uint64_t v40 = *(void *)(v0 + 544);
    uint64_t v66 = *(void *)(v0 + 536);
    uint64_t v68 = *(void *)(v0 + 512);
    uint64_t v70 = *(void *)(v0 + 496);
    uint64_t v72 = *(void *)(v0 + 488);
    uint64_t v73 = *(void *)(v0 + 480);
    uint64_t v74 = *(void *)(v0 + 456);
    uint64_t v78 = *(void *)(v0 + 432);
    uint64_t v81 = *(void *)(v0 + 424);
    v33(v34, *(void *)(v0 + 632));
    sub_100029F4C((void *)(v0 + 176));
    swift_task_dealloc(v35);
    swift_task_dealloc(v34);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v66);
    swift_task_dealloc(v68);
    swift_task_dealloc(v70);
    swift_task_dealloc(v72);
    swift_task_dealloc(v73);
    swift_task_dealloc(v74);
    swift_task_dealloc(v78);
    swift_task_dealloc(v81);
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }

  id v7 = v6;
  sub_100029170((uint64_t)v6, v0 + 256);
  if (!*(void *)(v0 + 280))
  {
    uint64_t v79 = *(void *)(v0 + 656);
    uint64_t v82 = *(void *)(v0 + 648);
    uint64_t v75 = *(void *)(v0 + 640);
    uint64_t v42 = *(void *)(v0 + 632);
    sub_10002E92C(v0 + 256, (uint64_t *)&unk_10013CBC0);
    type metadata accessor for ASCAppOfferActionError(0LL);
    uint64_t v44 = v43;
    *(void *)(v0 + 368) = 2LL;
    uint64_t v45 = sub_100029E18(&qword_10013F670);
    uint64_t inited = swift_initStackObject(v45, v0 + 16);
    *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v47;
    _StringGuts.grow(_:)(32LL);
    uint64_t ObjectType = swift_getObjectType(v7);
    uint64_t v49 = _typeName(_:qualified:)(ObjectType, 0LL);
    uint64_t v51 = v50;
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v52._object = (void *)0x80000001000FB070LL;
    v52._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v52);
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v49;
    *(void *)(inited + 56) = v51;
    unint64_t v53 = sub_100044F60(inited);
    uint64_t v54 = sub_100027978( (unint64_t *)&qword_10013CE80,  (uint64_t (*)(uint64_t))type metadata accessor for ASCAppOfferActionError,  (uint64_t)&unk_1000ED13C);
    unint64_t v55 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 320), v0 + 368, v53, v44, v54);
    swift_willThrow(v55);
    swift_unknownObjectRelease(v7);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v75 + 8);
    v56(v79, v42);
    v56(v82, v42);
    uint64_t v57 = *(void *)(v0 + 656);
    uint64_t v58 = *(void *)(v0 + 648);
    uint64_t v59 = *(void *)(v0 + 624);
    uint64_t v60 = *(void *)(v0 + 600);
    uint64_t v61 = *(void *)(v0 + 592);
    uint64_t v62 = *(void *)(v0 + 568);
    uint64_t v63 = *(void *)(v0 + 544);
    uint64_t v64 = *(void *)(v0 + 536);
    uint64_t v65 = *(void *)(v0 + 512);
    uint64_t v67 = *(void *)(v0 + 496);
    uint64_t v69 = *(void *)(v0 + 488);
    uint64_t v71 = *(void *)(v0 + 480);
    uint64_t v76 = *(void *)(v0 + 456);
    uint64_t v80 = *(void *)(v0 + 432);
    uint64_t v83 = *(void *)(v0 + 424);
    sub_100029F4C((void *)(v0 + 176));
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v63);
    swift_task_dealloc(v64);
    swift_task_dealloc(v65);
    swift_task_dealloc(v67);
    swift_task_dealloc(v69);
    swift_task_dealloc(v71);
    swift_task_dealloc(v76);
    swift_task_dealloc(v80);
    swift_task_dealloc(v83);
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }

  uint64_t v8 = *(void *)(v0 + 392);
  sub_10002C438((__int128 *)(v0 + 256), v0 + 216);
  uint64_t v9 = sub_10002A030(0LL, (unint64_t *)&qword_10013FD90, off_10011E548);
  uint64_t v10 = BaseObjectGraph.optional<A>(_:)(v9, v9);
  uint64_t v11 = *(void **)(v0 + 336);
  MetricsFieldsContext.init()(v10);
  *(void *)(v0 + 344) = v8;
  if (qword_10013BBA8 != -1) {
    swift_once(&qword_10013BBA8, sub_10004911C);
  }
  uint64_t v12 = sub_100029E18(qword_10013CD50);
  uint64_t v13 = sub_10002A768(v12, (uint64_t)qword_100148518);
  uint64_t v14 = sub_100029E18(&qword_10013C410);
  MetricsFieldsContext.addValue<A>(_:forProperty:)(v0 + 344, v13, v14);
  if (v11)
  {
    *(void *)(v0 + 352) = v11;
    uint64_t v15 = qword_10013BB90;
    id v16 = v11;
    if (v15 != -1) {
      swift_once(&qword_10013BB90, sub_10002A650);
    }
    uint64_t v17 = sub_100029E18((uint64_t *)&unk_10013F9D0);
    uint64_t v18 = sub_10002A768(v17, (uint64_t)qword_1001484E8);
    MetricsFieldsContext.addValue<A>(_:forProperty:)(v0 + 352, v18, v9);
  }

  uint64_t v19 = *(void **)(v0 + 536);
  uint64_t v20 = *(void *)(v0 + 520);
  uint64_t v21 = *(void *)(v0 + 472);
  uint64_t v22 = *(void *)(v0 + 480);
  uint64_t v77 = *(void *)(v0 + 464);
  uint64_t v23 = *(void *)(v0 + 432);
  uint64_t v25 = *(void *)(v0 + 408);
  uint64_t v24 = *(void *)(v0 + 416);
  uint64_t v26 = *(void *)(v0 + 384);
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 32))(v23, *(void *)(v0 + 424), v25);

  uint64_t v27 = type metadata accessor for ObjectGraph(0LL);
  inject<A, B>(_:from:)(v19, v20, v26, v20, v27);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v23, v25);
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))( v22,  enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:),  v77);
  uint64_t v28 = (void *)swift_task_alloc(async function pointer to ActionDispatcher.perform(_:withMetrics:asPartOf:)[1]);
  *(void *)(v0 + 704) = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_1000CD894;
  return ActionDispatcher.perform(_:withMetrics:asPartOf:)( *(void *)(v0 + 376),  v0 + 216,  *(void *)(v0 + 480),  *(void *)(v0 + 384),  *(void *)(v0 + 520));
}

uint64_t sub_1000CD894()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 704LL);
  *(void *)(*(void *)v1 + 712LL) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(void, void))(v2[59] + 8LL))(v2[60], v2[58]);
  if (v0) {
    uint64_t v4 = sub_1000CE10C;
  }
  else {
    uint64_t v4 = sub_1000CD908;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000CD908()
{
  uint64_t v25 = *(void *)(v0 + 656);
  uint64_t v1 = *(void *)(v0 + 640);
  uint64_t v2 = *(void *)(v0 + 632);
  uint64_t v3 = *(void *)(v0 + 536);
  uint64_t v4 = *(void *)(v0 + 528);
  uint64_t v5 = *(void *)(v0 + 520);
  uint64_t v6 = *(void *)(v0 + 432);
  uint64_t v8 = *(void *)(v0 + 408);
  uint64_t v7 = *(void *)(v0 + 416);
  swift_unknownObjectRelease(*(void *)(v0 + 696));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_100029F4C((void *)(v0 + 216));
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v9(v25, v2);
  uint64_t v10 = *(void *)(v0 + 648);
  uint64_t v11 = *(void *)(v0 + 656);
  uint64_t v12 = *(void *)(v0 + 624);
  uint64_t v13 = *(void *)(v0 + 600);
  uint64_t v14 = *(void *)(v0 + 592);
  uint64_t v15 = *(void *)(v0 + 568);
  uint64_t v16 = *(void *)(v0 + 544);
  uint64_t v17 = *(void *)(v0 + 536);
  uint64_t v19 = *(void *)(v0 + 512);
  uint64_t v20 = *(void *)(v0 + 496);
  uint64_t v21 = *(void *)(v0 + 488);
  uint64_t v22 = *(void *)(v0 + 480);
  uint64_t v23 = *(void *)(v0 + 456);
  uint64_t v24 = *(void *)(v0 + 432);
  uint64_t v26 = *(void *)(v0 + 424);
  v9(v10, *(void *)(v0 + 632));
  sub_100029F4C((void *)(v0 + 176));
  swift_task_dealloc(v11);
  swift_task_dealloc(v10);
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
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CDA9C()
{
  *(void *)(v0 + 328) = *(void *)(v0 + 688);
  uint64_t v1 = sub_100029E18((uint64_t *)&unk_10013E900);
  if ((swift_dynamicCast(v1, v0 + 328, v1, &type metadata for OfferAlertOfferActionImplementation.Error, 0LL) & 1) != 0)
  {
    uint64_t v83 = (void *)(v0 + 176);
    uint64_t v2 = *(void *)(v0 + 440);
    uint64_t v3 = *(void *)(v0 + 448);
    uint64_t v4 = *(void *)(v0 + 376);
    uint64_t v5 = *(void (**)(uint64_t, void))(*(void *)(v0 + 640) + 8LL);
    v5(*(void *)(v0 + 656), *(void *)(v0 + 632));
    (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v4, enum case for ActionOutcome.performed(_:), v2);
    swift_errorRelease(*(void *)(v0 + 328));
LABEL_13:
    uint64_t v33 = *(void *)(v0 + 648);
    uint64_t v34 = *(void *)(v0 + 656);
    uint64_t v35 = *(void *)(v0 + 624);
    uint64_t v36 = *(void *)(v0 + 600);
    uint64_t v37 = *(void *)(v0 + 592);
    uint64_t v38 = *(void *)(v0 + 568);
    uint64_t v39 = *(void *)(v0 + 544);
    uint64_t v40 = *(void *)(v0 + 536);
    uint64_t v65 = *(void *)(v0 + 512);
    uint64_t v67 = *(void *)(v0 + 496);
    uint64_t v69 = *(void *)(v0 + 488);
    uint64_t v71 = *(void *)(v0 + 480);
    uint64_t v74 = *(void *)(v0 + 456);
    uint64_t v76 = *(void *)(v0 + 432);
    uint64_t v80 = *(void *)(v0 + 424);
    v5(v33, *(void *)(v0 + 632));
    sub_100029F4C(v83);
    swift_task_dealloc(v34);
    swift_task_dealloc(v33);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    swift_task_dealloc(v38);
    swift_task_dealloc(v39);
    swift_task_dealloc(v40);
    swift_task_dealloc(v65);
    swift_task_dealloc(v67);
    swift_task_dealloc(v69);
    swift_task_dealloc(v71);
    swift_task_dealloc(v74);
    swift_task_dealloc(v76);
    swift_task_dealloc(v80);
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }

  swift_errorRelease(*(void *)(v0 + 328));
  id v6 = [*(id *)(v0 + 392) completionOffer];
  *(void *)(v0 + 696) = v6;
  if (!v6)
  {
    uint64_t v83 = (void *)(v0 + 176);
    uint64_t v31 = *(void *)(v0 + 440);
    uint64_t v30 = *(void *)(v0 + 448);
    uint64_t v32 = *(void *)(v0 + 376);
    uint64_t v5 = *(void (**)(uint64_t, void))(*(void *)(v0 + 640) + 8LL);
    v5(*(void *)(v0 + 656), *(void *)(v0 + 632));
    (*(void (**)(uint64_t, void, uint64_t))(v30 + 104))(v32, enum case for ActionOutcome.performed(_:), v31);
    goto LABEL_13;
  }

  id v7 = v6;
  sub_100029170((uint64_t)v6, v0 + 256);
  if (!*(void *)(v0 + 280))
  {
    uint64_t v77 = *(void *)(v0 + 656);
    uint64_t v81 = *(void *)(v0 + 648);
    uint64_t v72 = *(void *)(v0 + 640);
    uint64_t v42 = *(void *)(v0 + 632);
    sub_10002E92C(v0 + 256, (uint64_t *)&unk_10013CBC0);
    type metadata accessor for ASCAppOfferActionError(0LL);
    uint64_t v44 = v43;
    *(void *)(v0 + 368) = 2LL;
    uint64_t v45 = sub_100029E18(&qword_10013F670);
    uint64_t inited = swift_initStackObject(v45, v0 + 16);
    *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
    *(void *)(inited + 40) = v47;
    _StringGuts.grow(_:)(32LL);
    uint64_t ObjectType = swift_getObjectType(v7);
    uint64_t v49 = _typeName(_:qualified:)(ObjectType, 0LL);
    uint64_t v51 = v50;
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v52._object = (void *)0x80000001000FB070LL;
    v52._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v52);
    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v49;
    *(void *)(inited + 56) = v51;
    unint64_t v53 = sub_100044F60(inited);
    uint64_t v54 = sub_100027978( (unint64_t *)&qword_10013CE80,  (uint64_t (*)(uint64_t))type metadata accessor for ASCAppOfferActionError,  (uint64_t)&unk_1000ED13C);
    unint64_t v55 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 320), v0 + 368, v53, v44, v54);
    swift_willThrow(v55);
    swift_unknownObjectRelease(v7);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v56(v77, v42);
    v56(v81, v42);
    uint64_t v57 = *(void *)(v0 + 656);
    uint64_t v58 = *(void *)(v0 + 648);
    uint64_t v59 = *(void *)(v0 + 624);
    uint64_t v60 = *(void *)(v0 + 600);
    uint64_t v61 = *(void *)(v0 + 592);
    uint64_t v62 = *(void *)(v0 + 568);
    uint64_t v63 = *(void *)(v0 + 544);
    uint64_t v64 = *(void *)(v0 + 536);
    uint64_t v66 = *(void *)(v0 + 512);
    uint64_t v68 = *(void *)(v0 + 496);
    uint64_t v70 = *(void *)(v0 + 488);
    uint64_t v73 = *(void *)(v0 + 480);
    uint64_t v75 = *(void *)(v0 + 456);
    uint64_t v78 = *(void *)(v0 + 432);
    uint64_t v82 = *(void *)(v0 + 424);
    sub_100029F4C((void *)(v0 + 176));
    swift_task_dealloc(v57);
    swift_task_dealloc(v58);
    swift_task_dealloc(v59);
    swift_task_dealloc(v60);
    swift_task_dealloc(v61);
    swift_task_dealloc(v62);
    swift_task_dealloc(v63);
    swift_task_dealloc(v64);
    swift_task_dealloc(v66);
    swift_task_dealloc(v68);
    swift_task_dealloc(v70);
    swift_task_dealloc(v73);
    swift_task_dealloc(v75);
    swift_task_dealloc(v78);
    swift_task_dealloc(v82);
    uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
    return v41();
  }

  uint64_t v8 = *(void *)(v0 + 392);
  sub_10002C438((__int128 *)(v0 + 256), v0 + 216);
  uint64_t v9 = sub_10002A030(0LL, (unint64_t *)&qword_10013FD90, off_10011E548);
  uint64_t v10 = BaseObjectGraph.optional<A>(_:)(v9, v9);
  uint64_t v11 = *(void **)(v0 + 336);
  MetricsFieldsContext.init()(v10);
  *(void *)(v0 + 344) = v8;
  if (qword_10013BBA8 != -1) {
    swift_once(&qword_10013BBA8, sub_10004911C);
  }
  uint64_t v12 = sub_100029E18(qword_10013CD50);
  uint64_t v13 = sub_10002A768(v12, (uint64_t)qword_100148518);
  uint64_t v14 = sub_100029E18(&qword_10013C410);
  MetricsFieldsContext.addValue<A>(_:forProperty:)(v0 + 344, v13, v14);
  if (v11)
  {
    *(void *)(v0 + 352) = v11;
    uint64_t v15 = qword_10013BB90;
    id v16 = v11;
    if (v15 != -1) {
      swift_once(&qword_10013BB90, sub_10002A650);
    }
    uint64_t v17 = sub_100029E18((uint64_t *)&unk_10013F9D0);
    uint64_t v18 = sub_10002A768(v17, (uint64_t)qword_1001484E8);
    MetricsFieldsContext.addValue<A>(_:forProperty:)(v0 + 352, v18, v9);
  }

  uint64_t v19 = *(void **)(v0 + 536);
  uint64_t v20 = *(void *)(v0 + 520);
  uint64_t v21 = *(void *)(v0 + 472);
  uint64_t v22 = *(void *)(v0 + 480);
  uint64_t v79 = *(void *)(v0 + 464);
  uint64_t v23 = *(void *)(v0 + 432);
  uint64_t v25 = *(void *)(v0 + 408);
  uint64_t v24 = *(void *)(v0 + 416);
  uint64_t v26 = *(void *)(v0 + 384);
  (*(void (**)(uint64_t, void, uint64_t))(v24 + 32))(v23, *(void *)(v0 + 424), v25);

  uint64_t v27 = type metadata accessor for ObjectGraph(0LL);
  inject<A, B>(_:from:)(v19, v20, v26, v20, v27);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v22, v23, v25);
  (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))( v22,  enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:),  v79);
  uint64_t v28 = (void *)swift_task_alloc(async function pointer to ActionDispatcher.perform(_:withMetrics:asPartOf:)[1]);
  *(void *)(v0 + 704) = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_1000CD894;
  return ActionDispatcher.perform(_:withMetrics:asPartOf:)( *(void *)(v0 + 376),  v0 + 216,  *(void *)(v0 + 480),  *(void *)(v0 + 384),  *(void *)(v0 + 520));
}

uint64_t sub_1000CE10C()
{
  uint64_t v25 = *(void *)(v0 + 656);
  uint64_t v27 = *(void *)(v0 + 648);
  uint64_t v1 = *(void *)(v0 + 640);
  uint64_t v2 = *(void *)(v0 + 632);
  uint64_t v3 = *(void *)(v0 + 536);
  uint64_t v4 = *(void *)(v0 + 528);
  uint64_t v5 = *(void *)(v0 + 520);
  uint64_t v6 = *(void *)(v0 + 432);
  uint64_t v8 = *(void *)(v0 + 408);
  uint64_t v7 = *(void *)(v0 + 416);
  swift_unknownObjectRelease(*(void *)(v0 + 696));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  sub_100029F4C((void *)(v0 + 216));
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v9(v25, v2);
  v9(v27, v2);
  uint64_t v10 = *(void *)(v0 + 656);
  uint64_t v11 = *(void *)(v0 + 648);
  uint64_t v12 = *(void *)(v0 + 624);
  uint64_t v13 = *(void *)(v0 + 600);
  uint64_t v14 = *(void *)(v0 + 592);
  uint64_t v15 = *(void *)(v0 + 568);
  uint64_t v16 = *(void *)(v0 + 544);
  uint64_t v17 = *(void *)(v0 + 536);
  uint64_t v18 = *(void *)(v0 + 512);
  uint64_t v20 = *(void *)(v0 + 496);
  uint64_t v21 = *(void *)(v0 + 488);
  uint64_t v22 = *(void *)(v0 + 480);
  uint64_t v23 = *(void *)(v0 + 456);
  uint64_t v24 = *(void *)(v0 + 432);
  uint64_t v26 = *(void *)(v0 + 424);
  sub_100029F4C((void *)(v0 + 176));
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
  swift_task_dealloc(v26);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CE2A8()
{
  uint64_t v1 = *(void *)(v0 + 656);
  uint64_t v2 = *(void *)(v0 + 640);
  uint64_t v3 = *(void *)(v0 + 632);
  uint64_t v4 = *(void *)(v0 + 544);
  uint64_t v5 = *(void *)(v0 + 528);
  uint64_t v6 = *(void *)(v0 + 520);
  sub_100038B04(*(void *)(v0 + 512), type metadata accessor for CancelOrPauseInstallAction);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_100029F4C((void *)(v0 + 96));
  uint64_t v7 = *(void *)(v0 + 656);
  uint64_t v8 = *(void *)(v0 + 648);
  uint64_t v9 = *(void *)(v0 + 624);
  uint64_t v10 = *(void *)(v0 + 600);
  uint64_t v11 = *(void *)(v0 + 592);
  uint64_t v12 = *(void *)(v0 + 568);
  uint64_t v13 = *(void *)(v0 + 544);
  uint64_t v14 = *(void *)(v0 + 536);
  uint64_t v15 = *(void *)(v0 + 512);
  uint64_t v17 = *(void *)(v0 + 496);
  uint64_t v18 = *(void *)(v0 + 488);
  uint64_t v19 = *(void *)(v0 + 480);
  uint64_t v20 = *(void *)(v0 + 456);
  uint64_t v21 = *(void *)(v0 + 432);
  uint64_t v22 = *(void *)(v0 + 424);
  sub_100029F4C((void *)(v0 + 176));
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CE424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[9] = a3;
  v4[10] = a4;
  v4[7] = a1;
  v4[8] = a2;
  return swift_task_switch(sub_1000CE440, 0LL, 0LL);
}

uint64_t sub_1000CE440()
{
  id v1 = [*(id *)(v0 + 64) remoteControllerRequirement];
  *(void *)(v0 + 88) = v1;
  if (!v1)
  {
    uint64_t v14 = *(void *)(v0 + 56);
    uint64_t v15 = enum case for ActionOutcome.performed(_:);
    uint64_t v16 = type metadata accessor for ActionOutcome(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 104LL))(v14, v15, v16);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v2 = v1;
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = sub_100029E18(&qword_10013C6B0);
  uint64_t v5 = type metadata accessor for ObjectGraph(0LL);
  inject<A, B>(_:from:)((void *)(v0 + 16), v4, v3, v4, v5);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(@"CONTROLLER_REQUIRED");
  uint64_t v8 = v7;
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v6 == v10 && v8 == v9)
  {
    swift_bridgeObjectRelease_n(v8, 2LL);
  }

  else
  {
    uint64_t v12 = v9;
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v8, v10, v9, 0LL);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v8);
    if ((v13 & 1) == 0) {
      goto LABEL_11;
    }
  }

  if ([(id)swift_getObjCClassFromMetadata(*(void *)(v0 + 80)) userHasPairedGameController])
  {
LABEL_11:
    uint64_t v17 = *(void *)(v0 + 56);

    uint64_t v18 = enum case for ActionOutcome.performed(_:);
    uint64_t v19 = type metadata accessor for ActionOutcome(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104LL))(v17, v18, v19);
    sub_100029F4C((void *)(v0 + 16));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v32 = *(void *)(v0 + 72);
  sub_100029EE0((void *)(v0 + 16), *(void *)(v0 + 40));
  v21._object = (void *)0x80000001001013B0LL;
  v21._uint64_t countAndFlagsBits = 0xD000000000000026LL;
  Swift::String v22 = Localizer.string(forKey:)(v21);
  *(void *)(v0 + 96) = v22._object;
  sub_100029EE0((void *)(v0 + 16), *(void *)(v0 + 40));
  v23._uint64_t countAndFlagsBits = 0xD000000000000028LL;
  v23._object = (void *)0x80000001001013E0LL;
  Swift::String v24 = Localizer.string(forKey:)(v23);
  *(void *)(v0 + 104) = v24._object;
  sub_100029EE0((void *)(v0 + 16), *(void *)(v0 + 40));
  v25._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
  v25._object = (void *)0x8000000100101410LL;
  Swift::String v26 = Localizer.string(forKey:)(v25);
  *(void *)(v0 + 112) = v26._object;
  sub_100029EE0((void *)(v0 + 16), *(void *)(v0 + 40));
  v27._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
  v27._object = (void *)0x8000000100101440LL;
  Swift::String v28 = Localizer.string(forKey:)(v27);
  *(void *)(v0 + 120) = v28._object;
  uint64_t v29 = (Swift::String *)swift_task_alloc(96LL);
  *(void *)(v0 + 128) = v29;
  v29[1] = v28;
  _OWORD v29[2] = v26;
  v29[3] = v22;
  v29[4] = v24;
  v29[5]._uint64_t countAndFlagsBits = v32;
  uint64_t v30 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  *(void *)(v0 + 136) = v30;
  uint64_t v31 = type metadata accessor for ActionOutcome(0LL);
  *uint64_t v30 = v0;
  v30[1] = sub_1000CE7C0;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)( *(void *)(v0 + 56),  0LL,  0LL,  0xD000000000000037LL,  0x8000000100101470LL,  sub_1000CF11C,  v29,  v31);
}

uint64_t sub_1000CE7C0()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 136LL);
  *(void *)(*(void *)v1 + 144LL) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000CE89C;
  }

  else
  {
    uint64_t v5 = v2[15];
    uint64_t v6 = v2[16];
    uint64_t v8 = v2[13];
    uint64_t v7 = v2[14];
    uint64_t v9 = v2[12];
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v8);
    swift_task_dealloc(v6);
    uint64_t v4 = sub_1000CE85C;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000CE85C()
{
  sub_100029F4C((void *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CE89C()
{
  uint64_t v2 = *(void *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 96);

  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_task_dealloc(v1);
  sub_100029F4C((void *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CE91C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v66 = a8;
  uint64_t v65 = a7;
  uint64_t v64 = a6;
  uint64_t v56 = a5;
  uint64_t v60 = a4;
  uint64_t v54 = a3;
  uint64_t v57 = a2;
  uint64_t v55 = a1;
  uint64_t v63 = a9;
  uint64_t v67 = a10;
  uint64_t v68 = *a10;
  uint64_t v71 = sub_100029E18(&qword_10013C6C8);
  uint64_t v70 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  uint64_t v69 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = sub_100029E18(&qword_10013CBA0);
  uint64_t v72 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v61 = (uint64_t *)((char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v59 = type metadata accessor for AlertAction(0LL);
  __chkstk_darwin(v59);
  uint64_t v58 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_100029E18((uint64_t *)&unk_10013FDB0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(void *)(v17 + 64);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for ActionMetrics(0LL);
  __chkstk_darwin(v20);
  Swift::String v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  static ActionMetrics.notInstrumented.getter(v23);
  Swift::String v24 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v24(v19, a1, v16);
  uint64_t v25 = *(unsigned __int8 *)(v17 + 80);
  uint64_t v26 = (v25 + 16) & ~v25;
  uint64_t v27 = v26 + v18;
  uint64_t v28 = v25 | 7;
  uint64_t v29 = swift_allocObject(&unk_100125668, v27, v25 | 7);
  uint64_t v30 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 32);
  v30(v29 + v26, v19, v16);
  uint64_t v31 = type metadata accessor for ClosureAction(0LL);
  v77[1] = v31;
  v77[2] = &protocol witness table for ClosureAction;
  sub_10002C328(v76);
  ClosureAction.init(actionMetrics:body:)(v22, sub_1000CF154, v29);
  v78[0] = v57;
  v78[1] = v54;
  uint64_t v32 = sub_1000CF170((uint64_t)v76, (uint64_t)v79);
  static ActionMetrics.notInstrumented.getter(v32);
  v24(v19, v55, v16);
  uint64_t v33 = swift_allocObject(&unk_100125690, v27, v28);
  v30(v33 + v26, v19, v16);
  uint64_t v74 = v31;
  uint64_t v75 = &protocol witness table for ClosureAction;
  sub_10002C328(v73);
  ClosureAction.init(actionMetrics:body:)(v22, sub_1000CF220, v33);
  v76[0] = v60;
  v76[1] = v56;
  uint64_t v34 = sub_1000CF170((uint64_t)v73, (uint64_t)v77);
  uint64_t v35 = (uint64_t)v58;
  static ActionMetrics.notInstrumented.getter(v34);
  uint64_t v36 = sub_100029E18(&qword_10013CF80);
  uint64_t v37 = swift_allocObject(v36, 144LL, 7LL);
  *(_OWORD *)(v37 + swift_weakDestroy(v0 + 16) = xmmword_1000EDA10;
  sub_10002C124(v76, v37 + 32);
  sub_10002C124(v78, v37 + 88);
  uint64_t v38 = v59;
  uint64_t v39 = (void *)(v35 + *(int *)(v59 + 20));
  uint64_t v40 = v65;
  *uint64_t v39 = v64;
  v39[1] = v40;
  uint64_t v41 = (void *)(v35 + *(int *)(v38 + 24));
  uint64_t v42 = v63;
  *uint64_t v41 = v66;
  v41[1] = v42;
  uint64_t v43 = v38;
  *(void *)(v35 + *(int *)(v38 + 28)) = v37;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(v40);
  uint64_t v44 = v61;
  uint64_t v45 = v62;
  uint64_t v46 = v67;
  inject<A, B>(_:from:)(v61, v62, v67, v62, v68);
  uint64_t v74 = v43;
  uint64_t v75 = (void *)sub_100027978( (unint64_t *)&qword_10013FDC0,  type metadata accessor for AlertAction,  (uint64_t)&unk_1000EDA80);
  uint64_t v47 = sub_10002C328(v73);
  sub_100038AC0(v35, (uint64_t)v47, type metadata accessor for AlertAction);
  uint64_t v48 = v70;
  uint64_t v49 = v69;
  uint64_t v50 = v71;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))( v69,  enum case for ActionDispatcher.MetricsBehavior.notProcessed<A>(_:),  v71);
  uint64_t v51 = ActionDispatcher.perform(_:withMetrics:asPartOf:)(v73, v49, v46, v45);
  swift_release(v51);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v49, v50);
  (*(void (**)(void *, uint64_t))(v72 + 8))(v44, v45);
  sub_100038B04(v35, type metadata accessor for AlertAction);
  sub_10002C160(v76);
  sub_10002C160(v78);
  return sub_100029F4C(v73);
}

uint64_t sub_1000CEE28()
{
  uint64_t v0 = type metadata accessor for ActionOutcome(0LL);
  __n128 v1 = __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, __n128))(v4 + 104))(v3, enum case for ActionOutcome.performed(_:), v1);
  uint64_t v5 = sub_100029E18((uint64_t *)&unk_10013FDB0);
  return CheckedContinuation.resume(returning:)(v3, v5);
}

uint64_t sub_1000CEEC0()
{
  unint64_t v0 = sub_1000CF284();
  uint64_t v3 = swift_allocError(&type metadata for OfferAlertOfferActionImplementation.Error, v0, 0LL, 0LL);
  uint64_t v1 = sub_100029E18((uint64_t *)&unk_10013FDB0);
  return CheckedContinuation.resume(throwing:)(&v3, v1);
}

uint64_t sub_1000CEF24(void **a1, uint64_t a2)
{
  uint64_t v5 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = *a1;
  uint64_t v9 = *v2;
  uint64_t v10 = (void *)swift_allocObject(&unk_100125618, 40LL, 7LL);
  v10[2] = a2;
  v10[3] = v8;
  v10[4] = v9;
  sub_100029E18((uint64_t *)&unk_10013CC30);
  swift_retain(a2);
  uint64_t v11 = Promise.__allocating_init()(v8);
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v7, 1LL, 1LL, v12);
  uint64_t v13 = (void *)swift_allocObject(&unk_100125640, 56LL, 7LL);
  void v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10013FD80;
  v13[5] = v10;
  void v13[6] = v11;
  swift_retain(v11);
  uint64_t v14 = sub_1000B3448((uint64_t)v7, (uint64_t)&unk_10013CE60, (uint64_t)v13);
  swift_release(v14);
  return v11;
}

uint64_t sub_1000CF050()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000CF07C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_10013FD7C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10002A858;
  return sub_1000CC5F0(a1, v4, v5, v6);
}

uint64_t sub_1000CF0E8()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000CF11C(uint64_t a1)
{
  return sub_1000CE91C( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(void *)(v1 + 48),  *(void *)(v1 + 56),  *(void *)(v1 + 64),  *(void *)(v1 + 72),  *(void **)(v1 + 80));
}

uint64_t sub_1000CF154()
{
  return sub_1000CF23C((uint64_t (*)(uint64_t))sub_1000CEE28);
}

uint64_t sub_1000CF170(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18((uint64_t *)&unk_10013CBC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000CF1BC()
{
  uint64_t v1 = sub_100029E18((uint64_t *)&unk_10013FDB0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000CF220()
{
  return sub_1000CF23C((uint64_t (*)(uint64_t))sub_1000CEEC0);
}

uint64_t sub_1000CF23C(uint64_t (*a1)(uint64_t))
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(sub_100029E18((uint64_t *)&unk_10013FDB0) - 8) + 80LL);
  return a1(v1 + ((v3 + 16) & ~v3));
}

unint64_t sub_1000CF284()
{
  unint64_t result = qword_10013FDC8;
  if (!qword_10013FDC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0F50, &type metadata for OfferAlertOfferActionImplementation.Error);
    atomic_store(result, (unint64_t *)&qword_10013FDC8);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for OfferAlertOfferActionImplementation.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000CF308 + 4 * byte_1000F0E60[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000CF328 + 4 * byte_1000F0E65[v4]))();
  }
}

_BYTE *sub_1000CF308(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000CF328(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000CF330(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000CF338(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000CF340(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000CF348(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for OfferAlertOfferActionImplementation.Error()
{
  return &type metadata for OfferAlertOfferActionImplementation.Error;
}

unint64_t sub_1000CF368()
{
  unint64_t result = qword_10013FDD0;
  if (!qword_10013FDD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F0F28, &type metadata for OfferAlertOfferActionImplementation.Error);
    atomic_store(result, (unint64_t *)&qword_10013FDD0);
  }

  return result;
}

ValueMetadata *_s8OpenableVMa()
{
  return &_s8OpenableVN;
}

uint64_t sub_1000CF3BC(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, char a6)
{
  BOOL v6 = __PAIR128__((unint64_t)(a1 != 0) + a2 - 1, a1 - 1) < 2;
  if (a3 != 6) {
    BOOL v6 = 0;
  }
  unsigned int v7 = a3 < 5u || v6;
  if (a6 == 5) {
    return v7;
  }
  else {
    return 0LL;
  }
}

void *sub_1000CF3FC(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (void *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v12);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = *(void **)((char *)a2 + v8);
    *(void *)((char *)a1 + v8) = v10;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    *((_BYTE *)a1 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    id v11 = v10;
  }

  return a1;
}

uint64_t sub_1000CF49C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = *(void **)(a2 + v7);
  *(void *)(a1 + v7) = v9;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  id v10 = v9;
  return a1;
}

uint64_t sub_1000CF510(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a2 + v7);
  uint64_t v9 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  id v10 = v8;

  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000CF590(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(void *)(a1 + a3[5]) = *(void *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1000CF600(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = *(void **)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);

  uint64_t v9 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  *(_BYTE *)(a1 + v9) = *(_BYTE *)(a2 + v9);
  return a1;
}

uint64_t sub_1000CF678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000CF684);
}

uint64_t sub_1000CF684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_1000CF700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000CF70C);
}

uint64_t sub_1000CF70C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ActionMetrics(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for OpenAppAction(uint64_t a1)
{
  uint64_t result = qword_10013FE38;
  if (!qword_10013FE38) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for OpenAppAction);
  }
  return result;
}

uint64_t sub_1000CF7C0(uint64_t a1)
{
  uint64_t result = type metadata accessor for ActionMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    void v4[2] = &unk_1000F1008;
    void v4[3] = &unk_1000F1008;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

ValueMetadata *type metadata accessor for OpenAppActionImplementation()
{
  return &type metadata for OpenAppActionImplementation;
}

uint64_t sub_1000CF850()
{
  return sub_100027978( (unint64_t *)&qword_10013C7F0,  type metadata accessor for OpenAppAction,  (uint64_t)&unk_1000F0FC0);
}

uint64_t sub_1000CF87C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = type metadata accessor for AdamID(0LL);
  v3[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[7] = v5;
  v3[8] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000CF8E0, 0LL, 0LL);
}

uint64_t sub_1000CF8E0()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = type metadata accessor for OpenAppAction(0LL);
  *(void *)(v0 + 72) = v2;
  AdamID.init(value:)([*(id *)(v1 + *(int *)(v2 + 20)) int64value]);
  unint64_t v3 = (void *)swift_task_alloc(dword_10013FE8C);
  *(void *)(v0 + 80) = v3;
  *unint64_t v3 = v0;
  v3[1] = sub_1000CF994;
  return sub_1000D044C(*(void *)(v0 + 64), *(void **)(v0 + 40));
}

uint64_t sub_1000CF994(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *(void *)(*v3 + 80);
  *(void *)(*v3 + 88) = v2;
  swift_task_dealloc(v7);
  if (v2)
  {
    uint64_t v8 = sub_1000CFA0C;
  }

  else
  {
    *(void *)(v6 + 96) = a2;
    *(void *)(v6 + 104) = a1;
    uint64_t v8 = sub_1000CFB00;
  }

  return swift_task_switch(v8, 0LL, 0LL);
}

uint64_t sub_1000CFA0C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  _s3__C4CodeOMa_0(0LL);
  uint64_t v3 = v2;
  *(void *)(v0 + swift_weakDestroy(v0 + 16) = 0LL;
  swift_errorRetain(v1);
  uint64_t v4 = sub_100027978(&qword_10013C260, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_1000ED8F0);
  char v5 = static _ErrorCodeProtocol.~= infix(_:_:)(v0 + 16, v1, v3, v4);
  swift_errorRelease(v1);
  if ((v5 & 1) != 0)
  {
    swift_errorRelease(*(void *)(v0 + 88));
    uint64_t v6 = (void *)swift_task_alloc(dword_10013FE94);
    *(void *)(v0 + 136) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_1000CFC5C;
    return sub_1000D0D54(*(void *)(v0 + 64));
  }

  else
  {
    (*(void (**)(void, void))(*(void *)(v0 + 56) + 8LL))(*(void *)(v0 + 64), *(void *)(v0 + 48));
    swift_task_dealloc(*(void *)(v0 + 64));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

uint64_t sub_1000CFB00()
{
  uint64_t v1 = v0[12];
  char v2 = *(_BYTE *)(v0[4] + *(int *)(v0[9] + 24LL));
  id v3 = objc_allocWithZone(&OBJC_CLASS___ASDApp);
  swift_bridgeObjectRetain(v1);
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = objc_msgSend(v3, "initWithBundleID:", v4, swift_bridgeObjectRelease(v1).n128_f64[0]);
  v0[14] = v5;

  uint64_t v6 = swift_task_alloc(32LL);
  v0[15] = v6;
  *(void *)(v6 + swift_weakDestroy(v0 + 16) = v5;
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v0[16] = v7;
  *uint64_t v7 = v0;
  if ((v2 & 1) != 0)
  {
    v7[1] = sub_1000CFDFC;
    uint64_t v8 = (char *)&type metadata for () + 8;
    unint64_t v9 = 0x80000001001014B0LL;
    id v10 = sub_1000D1370;
    unint64_t v11 = 0xD00000000000002FLL;
  }

  else
  {
    v7[1] = sub_1000CFD18;
    unint64_t v11 = 0xD00000000000003ALL;
    uint64_t v8 = (char *)&type metadata for () + 8;
    unint64_t v9 = 0x80000001001014E0LL;
    id v10 = sub_1000D13A8;
  }

  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v7, 0LL, 0LL, v11, v9, v10, v6, v8);
}

uint64_t sub_1000CFC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *(void *)(*v3 + 136);
  *(void *)(*v3 + 144) = v2;
  swift_task_dealloc(v7);
  if (v2)
  {
    uint64_t v8 = sub_1000CFCD4;
  }

  else
  {
    *(void *)(v6 + 96) = a2;
    *(void *)(v6 + 104) = a1;
    uint64_t v8 = sub_1000CFB00;
  }

  return swift_task_switch(v8, 0LL, 0LL);
}

uint64_t sub_1000CFCD4()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CFD18()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 128);
  *(void *)(*v1 + 152) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    NSString v4 = sub_1000CFD84;
  }

  else
  {
    swift_task_dealloc(*(void *)(v2 + 120));
    NSString v4 = sub_1000D14B0;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000CFD84()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 48);

  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v1);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(*(void *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CFDFC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 128);
  *(void *)(*v1 + 160) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = sub_1000CFF08;
  }

  else
  {
    swift_task_dealloc(*(void *)(v2 + 120));
    uint64_t v4 = sub_1000CFE68;
  }

  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000CFE68()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 24);

  swift_bridgeObjectRelease(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v6 = enum case for ActionOutcome.performed(_:);
  uint64_t v7 = type metadata accessor for ActionOutcome(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104LL))(v5, v6, v7);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000CFF08()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 48);

  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v1);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc(*(void *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1000CFF80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, SEL *a6)
{
  uint64_t v20 = a2;
  uint64_t v11 = sub_100029E18(&qword_10013FE98);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___ASDAppLibrary);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))( (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a1,  v11);
  uint64_t v15 = *(unsigned __int8 *)(v12 + 80);
  uint64_t v16 = (v15 + 16) & ~v15;
  uint64_t v17 = swift_allocObject(a3, v16 + v13, v15 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))( v17 + v16,  (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v11);
  aBlock[4] = a4;
  uint64_t v22 = v17;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_100087B94;
  aBlock[3] = a5;
  uint64_t v18 = _Block_copy(aBlock);
  swift_release(v22);
  objc_msgSend(v14, *a6, v20, v18);
  _Block_release(v18);
}

uint64_t sub_1000D00C4(uint64_t a1)
{
  uint64_t v1 = sub_100072EDC(a1);
  if (v1)
  {
    uint64_t v5 = v1;
    uint64_t v2 = sub_100029E18(&qword_10013FE98);
    return CheckedContinuation.resume(throwing:)(&v5, v2);
  }

  else
  {
    uint64_t v4 = sub_100029E18(&qword_10013FE98);
    return CheckedContinuation.resume(returning:)(v4, v4);
  }

uint64_t sub_1000D0124(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for OpenAppAction(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  id v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000306F8(a1, (uint64_t)v10);
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v12 = (v11 + 16) & ~v11;
  unint64_t v13 = (v9 + v12 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v14 = swift_allocObject(&unk_100125840, v13 + 8, v11 | 7);
  sub_1000D0344((uint64_t)v10, v14 + v12);
  *(void *)(v14 + v13) = a2;
  sub_100029E18((uint64_t *)&unk_10013CC30);
  uint64_t v15 = swift_retain(a2);
  uint64_t v16 = Promise.__allocating_init()(v15);
  uint64_t v17 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56LL))(v6, 1LL, 1LL, v17);
  uint64_t v18 = (void *)swift_allocObject(&unk_100125868, 56LL, 7LL);
  v18[2] = 0LL;
  v18[3] = 0LL;
  v18[4] = &unk_10013FE80;
  v18[5] = v14;
  v18[6] = v16;
  swift_retain(v16);
  uint64_t v19 = sub_1000B3448((uint64_t)v6, (uint64_t)&unk_10013CE60, (uint64_t)v18);
  swift_release(v19);
  return v16;
}

uint64_t sub_1000D02A8()
{
  uint64_t v1 = type metadata accessor for OpenAppAction(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v7 = v0 + v4;
  uint64_t v8 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(v7, v8);

  swift_release(*(void *)(v0 + v6));
  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_1000D0344(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for OpenAppAction(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000D0388(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for OpenAppAction(0LL) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1 + v5;
  uint64_t v7 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFF8LL));
  uint64_t v8 = (void *)swift_task_alloc(dword_10013FE7C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10002A858;
  return sub_1000CF87C(a1, v6, v7);
}

uint64_t sub_1000D0418()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000D044C(uint64_t a1, void *a2)
{
  v2[21] = a1;
  v2[22] = a2;
  v2[23] = *a2;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  v2[24] = swift_task_alloc((*(void *)(*(void *)(v3 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  v2[25] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[26] = v5;
  v2[27] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DeviceAppQuery(0LL);
  v2[28] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[29] = v7;
  v2[30] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000D04FC, 0LL, 0LL);
}

uint64_t sub_1000D04FC()
{
  uint64_t v1 = (void *)v0[30];
  uint64_t v20 = v0[29];
  uint64_t v21 = v0[28];
  uint64_t v3 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v4 = v0[21];
  uint64_t v5 = sub_100029E18(&qword_10013D2D0);
  inject<A, B>(_:from:)(v0 + 2, v5, v3, v5, v2);
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[6];
  sub_100029EE0(v0 + 2, v6);
  uint64_t v8 = sub_100029E18(qword_10013E018);
  uint64_t v9 = type metadata accessor for AdamID(0LL);
  v0[31] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = (v11 + 32) & ~v11;
  uint64_t v13 = swift_allocObject(v8, v12 + *(void *)(v10 + 72), v11 | 7);
  *(_OWORD *)(v13 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  uint64_t v14 = v13 + v12;
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v0[32] = v15;
  v15(v14, v4, v9);
  uint64_t v16 = sub_1000CAE70(v13);
  swift_setDeallocating(v13);
  swift_arrayDestroy(v14, 1LL, v9);
  swift_deallocClassInstance(v13, 32LL, 7LL);
  *uint64_t v1 = v16;
  (*(void (**)(void *, void, uint64_t))(v20 + 104))(v1, enum case for DeviceAppQuery.storeIDs(_:), v21);
  uint64_t v17 = *(void *)(v7 + 8);
  uint64_t v18 = (void *)swift_task_alloc(async function pointer to dispatch thunk of DeviceAppFetcher.fetchQuery(_:)[1]);
  v0[33] = v18;
  *uint64_t v18 = v0;
  v18[1] = sub_1000D068C;
  return dispatch thunk of DeviceAppFetcher.fetchQuery(_:)(v0[30], v6, v17);
}

uint64_t sub_1000D068C(uint64_t a1)
{
  uint64_t v3 = *(void **)v2;
  uint64_t v4 = *(void *)(*(void *)v2 + 264LL);
  v3[34] = a1;
  v3[35] = v1;
  swift_task_dealloc(v4);
  (*(void (**)(void, void))(v3[29] + 8LL))(v3[30], v3[28]);
  if (v1) {
    uint64_t v5 = sub_1000D0CF4;
  }
  else {
    uint64_t v5 = sub_1000D0708;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_1000D0708()
{
  uint64_t v1 = (void *)(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 272);
  if (!((unint64_t)v2 >> 62))
  {
    if (*(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease(*(void *)(v0 + 272));
    type metadata accessor for ASCOpenAppError(0LL);
    uint64_t v52 = v51;
    *(void *)(v0 + 160) = 0LL;
    unint64_t v53 = sub_100043C24((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v54 = sub_100027978( (unint64_t *)&qword_10013C278,  (uint64_t (*)(uint64_t))type metadata accessor for ASCOpenAppError,  (uint64_t)&unk_1000ED888);
    uint64_t v55 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 152), v0 + 160, v53, v52, v54);
    swift_willThrow(v55);
    goto LABEL_20;
  }

  if (v2 < 0) {
    uint64_t v49 = *(void *)(v0 + 272);
  }
  else {
    uint64_t v49 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*(void *)(v0 + 272));
  uint64_t v50 = _CocoaArrayWrapper.endIndex.getter(v49);
  swift_bridgeObjectRelease(v2);
  if (!v50) {
    goto LABEL_19;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001LL) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, *(void *)(v0 + 272));
    uint64_t v3 = *(void *)(v0 + 272);
  }

  else
  {
    if (!*(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
LABEL_23:
      swift_once(&qword_10013BC40, sub_1000D1538);
      goto LABEL_8;
    }

    uint64_t v3 = *(void *)(v0 + 272);
    id v4 = *(id *)(v3 + 32);
  }

  if (!objc_msgSend(v4, "isPlaceholder", swift_bridgeObjectRelease(v3).n128_f64[0]))
  {
    if (![v4 isLaunchProhibited])
    {
      uint64_t v41 = *(void *)(v0 + 240);
      uint64_t v42 = *(void *)(v0 + 216);
      uint64_t v43 = *(void *)(v0 + 192);
      id v44 = [v4 bundleID];
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
      uint64_t v47 = v46;

      sub_100029F4C((void *)(v0 + 16));
      swift_task_dealloc(v41);
      swift_task_dealloc(v42);
      swift_task_dealloc(v43);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v45, v47);
    }

    uint64_t v64 = v4;
    uint64_t v65 = (void *)(v0 + 16);
    if (qword_10013BC40 != -1) {
      swift_once(&qword_10013BC40, sub_1000D1538);
    }
    uint64_t v24 = *(void *)(v0 + 248);
    uint64_t v25 = *(void *)(v0 + 208);
    uint64_t v26 = *(void *)(v0 + 216);
    uint64_t v27 = *(void *)(v0 + 192);
    uint64_t v28 = *(void *)(v0 + 200);
    uint64_t v59 = *(void *)(v0 + 168);
    uint64_t v61 = *(void (**)(void *, uint64_t, uint64_t))(v0 + 256);
    uint64_t v29 = sub_10002A768(v28, (uint64_t)qword_100148600);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v26, v29, v28);
    uint64_t v30 = sub_100029E18(&qword_10013EA00);
    uint64_t v31 = type metadata accessor for LogMessage(0LL);
    uint64_t v32 = swift_allocObject( v30,  ((*(unsigned __int8 *)(*(void *)(v31 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v31 - 8) + 80LL))
          + *(void *)(*(void *)(v31 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v31 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v32 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(77LL, 1LL);
    v33._object = (void *)0x80000001001015D0LL;
    v33._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v33);
    *(void *)(v0 + 80) = v24;
    uint64_t v34 = sub_10002C328((void *)(v0 + 56));
    v61(v34, v59, v24);
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 + 56);
    sub_10004C810(v0 + 56);
    v35._uint64_t countAndFlagsBits = 0xD000000000000020LL;
    v35._object = (void *)0x80000001001015A0LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v35);
    LogMessage.init(stringInterpolation:)(v27);
    Logger.error(_:)(v32, v28, &protocol witness table for OSLogger);
    __n128 v36 = swift_bridgeObjectRelease(v32);
    (*(void (**)(uint64_t, uint64_t, __n128))(v25 + 8))(v26, v28, v36);
    type metadata accessor for ASCOpenAppError(0LL);
    uint64_t v38 = v37;
    *(void *)(v0 + 128) = 1LL;
    unint64_t v39 = sub_100043C24((uint64_t)_swiftEmptyArrayStorage);
    uint64_t v40 = sub_100027978( (unint64_t *)&qword_10013C278,  (uint64_t (*)(uint64_t))type metadata accessor for ASCOpenAppError,  (uint64_t)&unk_1000ED888);
    uint64_t v23 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 120), v0 + 128, v39, v38, v40);
    goto LABEL_13;
  }

  uint64_t v64 = v4;
  uint64_t v65 = (void *)(v0 + 16);
  uint64_t v1 = (void *)(v0 + 88);
  uint64_t v62 = v0 + 144;
  uint64_t v63 = (void *)(v0 + 136);
  if (qword_10013BC40 != -1) {
    goto LABEL_23;
  }
LABEL_8:
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v60 = *(void (**)(void *, uint64_t, uint64_t))(v0 + 256);
  uint64_t v6 = *(void *)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 216);
  uint64_t v8 = *(void *)(v0 + 192);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 168);
  uint64_t v11 = sub_10002A768(v9, (uint64_t)qword_100148600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v7, v11, v9);
  uint64_t v12 = sub_100029E18(&qword_10013EA00);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(76LL, 1LL);
  v15._object = (void *)0x80000001001015D0LL;
  v15._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v15);
  *(void *)(v0 + 112) = v5;
  uint64_t v16 = sub_10002C328(v1);
  v60(v16, v10, v5);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v1);
  sub_10004C810((uint64_t)v1);
  v17._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  v17._object = (void *)0x8000000100101600LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  LogMessage.init(stringInterpolation:)(v8);
  Logger.error(_:)(v14, v9, &protocol witness table for OSLogger);
  __n128 v18 = swift_bridgeObjectRelease(v14);
  (*(void (**)(uint64_t, uint64_t, __n128))(v6 + 8))(v7, v9, v18);
  type metadata accessor for ASCOpenAppError(0LL);
  uint64_t v20 = v19;
  *(void *)(v0 + 144) = 0LL;
  unint64_t v21 = sub_100043C24((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v22 = sub_100027978( (unint64_t *)&qword_10013C278,  (uint64_t (*)(uint64_t))type metadata accessor for ASCOpenAppError,  (uint64_t)&unk_1000ED888);
  uint64_t v23 = _BridgedStoredNSError.init(_:userInfo:)(v63, v62, v21, v20, v22);
LABEL_13:
  swift_willThrow(v23);

  uint64_t v1 = v65;
LABEL_20:
  uint64_t v56 = *(void *)(v0 + 240);
  uint64_t v57 = *(void *)(v0 + 216);
  uint64_t v58 = *(void *)(v0 + 192);
  sub_100029F4C(v1);
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000D0CF4()
{
  uint64_t v1 = *(void *)(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 216);
  uint64_t v3 = *(void *)(v0 + 192);
  sub_100029F4C((void *)(v0 + 16));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000D0D54(uint64_t a1)
{
  v1[15] = a1;
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  v1[16] = swift_task_alloc((*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  v1[17] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v1[18] = v4;
  v1[19] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000D0E00, 0LL, 0LL);
}

uint64_t sub_1000D0E00(uint64_t a1)
{
  uint64_t v3 = AdamID.int64Value.getter(a1);
  if (v3 < 0)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v4 = v3;
  id v5 = objc_allocWithZone(&OBJC_CLASS___LSApplicationRecord);
  *(void *)(v1 + 96) = 0LL;
  id v6 = [v5 initWithStoreItemIdentifier:v4 error:v1 + 96];
  uint64_t v7 = *(void **)(v1 + 96);
  if (!v6)
  {
    id v33 = v7;
    uint64_t v34 = _convertNSErrorToError(_:)(v7);

    swift_willThrow(v35);
    swift_errorRelease(v34);
    goto LABEL_10;
  }

  uint64_t v8 = v6;
  id v9 = v7;
  id v10 = [v8 bundleIdentifier];
  if (!v10)
  {

LABEL_10:
    uint64_t v2 = (void *)(v1 + 48);
    uint64_t v60 = v1 + 88;
    uint64_t v61 = (void *)(v1 + 80);
    if (qword_10013BC40 == -1)
    {
LABEL_11:
      uint64_t v36 = *(void *)(v1 + 144);
      uint64_t v37 = *(void *)(v1 + 152);
      uint64_t v38 = *(void *)(v1 + 128);
      uint64_t v39 = *(void *)(v1 + 136);
      uint64_t v40 = *(void *)(v1 + 120);
      uint64_t v41 = sub_10002A768(v39, (uint64_t)qword_100148600);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v37, v41, v39);
      uint64_t v42 = sub_100029E18(&qword_10013EA00);
      uint64_t v43 = type metadata accessor for LogMessage(0LL);
      uint64_t v44 = swift_allocObject( v42,  ((*(unsigned __int8 *)(*(void *)(v43 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v43 - 8) + 80LL))
            + *(void *)(*(void *)(v43 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v43 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v44 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(57LL, 1LL);
      v45._uint64_t countAndFlagsBits = 0xD000000000000038LL;
      v45._object = (void *)0x8000000100101530LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v45);
      uint64_t v46 = type metadata accessor for AdamID(0LL);
      *(void *)(v1 + 72) = v46;
      uint64_t v47 = sub_10002C328(v2);
      (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 16LL))(v47, v40, v46);
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v2);
      sub_10004C810((uint64_t)v2);
      v48._uint64_t countAndFlagsBits = 46LL;
      v48._object = (void *)0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v48);
      LogMessage.init(stringInterpolation:)(v38);
      Logger.error(_:)(v44, v39, &protocol witness table for OSLogger);
      __n128 v49 = swift_bridgeObjectRelease(v44);
      (*(void (**)(uint64_t, uint64_t, __n128))(v36 + 8))(v37, v39, v49);
      type metadata accessor for ASCOpenAppError(0LL);
      uint64_t v51 = v50;
      *(void *)(v1 + 88) = 0LL;
      unint64_t v52 = sub_100043C24((uint64_t)_swiftEmptyArrayStorage);
      uint64_t v53 = sub_100027978( (unint64_t *)&qword_10013C278,  (uint64_t (*)(uint64_t))type metadata accessor for ASCOpenAppError,  (uint64_t)&unk_1000ED888);
      uint64_t v54 = _BridgedStoredNSError.init(_:userInfo:)(v61, v60, v52, v51, v53);
      swift_willThrow(v54);
LABEL_12:
      uint64_t v55 = *(void *)(v1 + 128);
      swift_task_dealloc(*(void *)(v1 + 152));
      swift_task_dealloc(v55);
      return (*(uint64_t (**)(void))(v1 + 8))();
    }

void sub_1000D1370(uint64_t a1)
{
}

void sub_1000D13A8(uint64_t a1)
{
}

uint64_t sub_1000D13E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000D13F8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000D1404()
{
  uint64_t v1 = sub_100029E18(&qword_10013FE98);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000D1468(uint64_t a1)
{
  return sub_1000D00C4(a1);
}

uint64_t sub_1000D14B4()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  sub_10002A728(v0, qword_1001485D0);
  sub_10002A768(v0, (uint64_t)qword_1001485D0);
  return OSLogger.Subsystem.init(rawValue:)(0xD00000000000001DLL, 0x80000001000FF430LL);
}

uint64_t sub_1000D1514(uint64_t a1)
{
  return sub_1000D15DC(a1, qword_1001485E8, 0x6C6379636566694CLL, 0xE900000000000065LL);
}

uint64_t sub_1000D1538(uint64_t a1)
{
  return sub_1000D15DC(a1, qword_100148600, 0x656372656D6D6F43LL, 0xE800000000000000LL);
}

uint64_t sub_1000D1558(uint64_t a1)
{
  return sub_1000D15DC(a1, qword_100148618, 0x7365636976726553LL, 0xE800000000000000LL);
}

uint64_t sub_1000D1578(uint64_t a1)
{
  return sub_1000D15DC(a1, qword_100148630, 0x7363697274654DLL, 0xE700000000000000LL);
}

uint64_t sub_1000D1598(uint64_t a1)
{
  return sub_1000D15DC(a1, qword_100148648, 0x6574617453707041LL, 0xE800000000000000LL);
}

uint64_t sub_1000D15B8(uint64_t a1)
{
  return sub_1000D15DC(a1, qword_100148660, 0x617453726566664FLL, 0xEA00000000006574LL);
}

uint64_t sub_1000D15DC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for OSLogger(0LL);
  sub_10002A728(v11, a2);
  sub_10002A768(v11, (uint64_t)a2);
  if (qword_10013BC30 != -1) {
    swift_once(&qword_10013BC30, sub_1000D14B4);
  }
  uint64_t v12 = sub_10002A768(v7, (uint64_t)qword_1001485D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  return OSLogger.init(subsystem:category:)(v10, a3, a4);
}

uint64_t sub_1000D16D8()
{
  id v0 = [(id)objc_opt_self(NSProcessInfo) processInfo];
  [v0 operatingSystemVersion];

  uint64_t v8 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  v1._uint64_t countAndFlagsBits = 46LL;
  v1._object = (void *)0xE100000000000000LL;
  String.append(_:)(v1);
  v2._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v2._object;
  String.append(_:)(v2);
  swift_bridgeObjectRelease(object);
  v4._uint64_t countAndFlagsBits = 46LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  v5._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  uint64_t v6 = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v6);
  return v8;
}

unint64_t sub_1000D17E4()
{
  uint64_t v0 = type metadata accessor for Device(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = &v28[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v4 = sub_100029E18(&qword_10013FEA0);
  uint64_t inited = swift_initStackObject(v4, v28);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000F1080;
  *(void *)(inited + 32) = 29551LL;
  *(void *)(inited + 40) = 0xE200000000000000LL;
  uint64_t v6 = static Device.current.getter(inited);
  uint64_t v7 = Device.systemName.getter(v6);
  uint64_t v9 = v8;
  id v10 = *(uint64_t (**)(_BYTE *, uint64_t))(v1 + 8);
  uint64_t v11 = v10(v3, v0);
  *(void *)(inited + 48) = v7;
  *(void *)(inited + 56) = v9;
  strcpy((char *)(inited + 64), "hardwareFamily");
  *(_BYTE *)(inited + 79) = -18;
  uint64_t v12 = static Device.current.getter(v11);
  uint64_t v13 = Device.modelFamily.getter(v12);
  uint64_t v15 = v14;
  uint64_t v16 = v10(v3, v0);
  *(void *)(inited + 80) = v13;
  *(void *)(inited + 88) = v15;
  strcpy((char *)(inited + 96), "hardwareModel");
  *(_WORD *)(inited + 110) = -4864;
  uint64_t v17 = static Device.current.getter(v16);
  uint64_t v18 = Device.physicalModel.getter(v17);
  uint64_t v20 = v19;
  uint64_t v21 = v10(v3, v0);
  *(void *)(inited + 112) = v18;
  *(void *)(inited + 120) = v20;
  strcpy((char *)(inited + 128), "osBuildNumber");
  *(_WORD *)(inited + 142) = -4864;
  uint64_t v22 = static Device.current.getter(v21);
  uint64_t v23 = Device.buildVersion.getter(v22);
  uint64_t v25 = v24;
  v10(v3, v0);
  *(void *)(inited + 144) = v23;
  *(void *)(inited + 152) = v25;
  *(void *)(inited + 160) = 0x6F6973726556736FLL;
  *(void *)(inited + 168) = 0xE90000000000006ELL;
  *(void *)(inited + 176) = sub_1000D16D8();
  *(void *)(inited + 184) = v26;
  return sub_100045094(inited);
}

id sub_1000D19A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v40 = a4;
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v39 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = swift_allocObject(&unk_100125980, 24LL, 7LL);
  *(void *)(v10 + swift_weakDestroy(v0 + 16) = 0LL;
  uint64_t v37 = (uint64_t *)(v10 + 16);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001259A8, 40LL, 7LL);
  void v11[2] = a1;
  v11[3] = a2;
  v11[4] = v10;
  uint64_t v12 = swift_allocObject(&unk_1001259D0, 32LL, 7LL);
  *(void *)(v12 + swift_weakDestroy(v0 + 16) = sub_1000D2178;
  *(void *)(v12 + 24) = v11;
  Swift::String v45 = sub_1000D2184;
  uint64_t v46 = v12;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v42 = 1107296256LL;
  uint64_t v43 = sub_1000D1E88;
  uint64_t v44 = &unk_1001259E8;
  uint64_t v13 = _Block_copy(&aBlock);
  uint64_t v14 = v46;
  swift_retain(a2);
  swift_retain(v10);
  swift_retain(v11);
  swift_release(v14);
  [a3 setBeginEventProcessingBlock:v13];
  _Block_release(v13);
  uint64_t v15 = swift_allocObject(&unk_100125A20, 32LL, 7LL);
  *(void *)(v15 + swift_weakDestroy(v0 + 16) = sub_1000D2178;
  *(void *)(v15 + 24) = v11;
  Swift::String v45 = sub_1000D21CC;
  uint64_t v46 = v15;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v42 = 1107296256LL;
  uint64_t v43 = sub_1000D1E88;
  uint64_t v44 = &unk_100125A38;
  uint64_t v16 = _Block_copy(&aBlock);
  uint64_t v17 = v46;
  swift_retain(v11);
  swift_release(v17);
  [a3 setEndEventProcessingBlock:v16];
  _Block_release(v16);
  uint64_t v18 = swift_allocObject(&unk_100125A70, 32LL, 7LL);
  *(void *)(v18 + swift_weakDestroy(v0 + 16) = sub_1000D2178;
  *(void *)(v18 + 24) = v11;
  Swift::String v45 = sub_1000D21D8;
  uint64_t v46 = v18;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v42 = 1107296256LL;
  uint64_t v43 = sub_1000D1E88;
  uint64_t v44 = &unk_100125A88;
  uint64_t v19 = _Block_copy(&aBlock);
  uint64_t v20 = v46;
  swift_retain(v11);
  swift_release(v20);
  [a3 setEmitEventProcessingBlock:v19];
  _Block_release(v19);
  Swift::String v45 = sub_1000D221C;
  uint64_t v46 = v10;
  __int128 aBlock = _NSConcreteStackBlock;
  uint64_t v42 = 1107296256LL;
  uint64_t v43 = sub_1000D1F4C;
  uint64_t v44 = &unk_100125AB0;
  uint64_t v21 = _Block_copy(&aBlock);
  uint64_t v22 = v46;
  swift_retain(v10);
  swift_release(v22);
  [a3 setDeviceRebootProcessingBlock:v21];
  _Block_release(v21);
  DateInterval.start.getter(v23);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  uint64_t v25 = v39;
  uint64_t v26 = *(double (**)(char *, uint64_t))(v38 + 8);
  v27.n128_f64[0] = v26(v9, v39);
  DateInterval.end.getter(v27);
  Class v28 = Date._bridgeToObjectiveC()().super.isa;
  v26(v9, v25);
  __int128 aBlock = 0LL;
  unsigned int v29 = [a3 processLogArchiveWithPath:0 startDate:isa endDate:v28 errorOut:&aBlock];

  unint64_t v30 = aBlock;
  if (!v29)
  {
    uint64_t v34 = v30;
    _convertNSErrorToError(_:)();

    goto LABEL_5;
  }

  uint64_t v31 = v37;
  swift_beginAccess(v37, &aBlock, 0LL, 0LL);
  uint64_t v32 = *v31;
  if (v32)
  {
    uint64_t v33 = swift_errorRetain(v32);
LABEL_5:
    swift_willThrow(v33);
    swift_release(v10);
    swift_release(v11);
    [a3 setBeginEventProcessingBlock:0];
    [a3 setEndEventProcessingBlock:0];
    return [a3 setEmitEventProcessingBlock:0];
  }

  swift_release(v10);
  swift_release(v11);
  [a3 setBeginEventProcessingBlock:0];
  [a3 setEndEventProcessingBlock:0];
  return [a3 setEmitEventProcessingBlock:0];
}

uint64_t sub_1000D1E0C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, _BYTE *))
{
  v4[0] = 0;
  a3(a1, a2, v4);
  return (v4[0] ^ 1) & 1;
}

uint64_t sub_1000D1E88(uint64_t a1, void *a2)
{
  uint64_t v4 = *(uint64_t (**)(void))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  id v5 = a2;
  LOBYTE(v4) = v4();
  swift_release(v3);

  return v4 & 1;
}

uint64_t sub_1000D1ED8(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  unint64_t v3 = sub_1000D2224();
  uint64_t v4 = swift_allocError(&type metadata for OSSignpostExtractor.DeviceRebootError, v3, 0LL, 0LL);
  swift_beginAccess(v2, v7, 1LL, 0LL);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v4;
  swift_errorRelease(v5);
  return 0LL;
}

uint64_t sub_1000D1F4C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  LOBYTE(v1) = v1(v3);
  swift_release(v2);
  return v1 & 1;
}

uint64_t sub_1000D1F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v10 = [objc_allocWithZone(SignpostSupportObjectExtractor) init];
  id v11 = [objc_allocWithZone(SignpostSupportSubsystemCategoryAllowlist) init];
  NSString v12 = String._bridgeToObjectiveC()();
  NSString v13 = String._bridgeToObjectiveC()();
  [v11 addSubsystem:v12 category:v13];

  [v10 setSubsystemCategoryFilter:v11];
  uint64_t v14 = swift_allocObject(&unk_100125958, 32LL, 7LL);
  *(void *)(v14 + swift_weakDestroy(v0 + 16) = a6;
  *(void *)(v14 + 24) = a7;
  sub_1000D19A0((uint64_t)sub_1000D2108, v14, v10, a1);
  if (v17)
  {

    return swift_release(v14);
  }

  else
  {

    char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v14, "", 133LL, 35LL, 13LL, 0LL);
    uint64_t result = swift_release(v14);
    if ((isEscapingClosureAtFileLocation & 1) != 0) {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_1000D20F8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000D2108()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000D2128()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000D214C()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000D2178(uint64_t a1, uint64_t a2)
{
  return sub_1000D1E0C(a1, a2, *(void (**)(uint64_t, uint64_t, _BYTE *))(v2 + 16));
}

uint64_t sub_1000D2184(uint64_t a1)
{
  return sub_1000D21E4(a1, (uint64_t (*)(void))&static os_signpost_type_t.begin.getter);
}

uint64_t sub_1000D2190(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000D21A0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000D21A8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000D21CC(uint64_t a1)
{
  return sub_1000D21E4(a1, (uint64_t (*)(void))&static os_signpost_type_t.end.getter);
}

uint64_t sub_1000D21D8(uint64_t a1)
{
  return sub_1000D21E4(a1, (uint64_t (*)(void))&static os_signpost_type_t.event.getter);
}

uint64_t sub_1000D21E4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  uint64_t v5 = a2();
  return v4(v5, a1) & 1;
}

uint64_t sub_1000D221C()
{
  return sub_1000D1ED8(v0);
}

unint64_t sub_1000D2224()
{
  unint64_t result = qword_10013FEA8;
  if (!qword_10013FEA8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F10C4, &type metadata for OSSignpostExtractor.DeviceRebootError);
    atomic_store(result, (unint64_t *)&qword_10013FEA8);
  }

  return result;
}

ValueMetadata *type metadata accessor for OSSignpostExtractor.DeviceRebootError()
{
  return &type metadata for OSSignpostExtractor.DeviceRebootError;
}

ValueMetadata *type metadata accessor for OSSignpostExtractor()
{
  return &type metadata for OSSignpostExtractor;
}

uint64_t *sub_1000D22A8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v10);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    swift_errorRetain(v9);
    *(uint64_t *)((char *)a1 + v8) = v9;
  }

  return a1;
}

uint64_t sub_1000D2338(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  return swift_errorRelease(*(void *)(a1 + *(int *)(a2 + 20)));
}

uint64_t sub_1000D237C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a2 + v7);
  swift_errorRetain(v8);
  *(void *)(a1 + v7) = v8;
  return a1;
}

uint64_t sub_1000D23E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a2 + v7);
  swift_errorRetain(v8);
  uint64_t v9 = *(void *)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  swift_errorRelease(v9);
  return a1;
}

uint64_t sub_1000D244C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_errorRelease(v8);
  return a1;
}

uint64_t sub_1000D24B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000D24BC);
}

uint64_t sub_1000D24BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_1000D2538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000D2544);
}

uint64_t sub_1000D2544(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ActionMetrics(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for PresentErrorAction(uint64_t a1)
{
  uint64_t result = qword_10013FF08;
  if (!qword_10013FF08) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PresentErrorAction);
  }
  return result;
}

uint64_t sub_1000D25F8(uint64_t a1)
{
  uint64_t result = type metadata accessor for ActionMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = "\b";
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

ValueMetadata *type metadata accessor for PresentErrorActionImplementation()
{
  return &type metadata for PresentErrorActionImplementation;
}

uint64_t sub_1000D2678()
{
  return sub_100027978(&qword_10013CC50, type metadata accessor for PresentErrorAction, (uint64_t)&unk_1000F1150);
}

uint64_t sub_1000D26A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = sub_100029E18(&qword_10013C6C8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  __n128 v49 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = (int *)type metadata accessor for AlertAction(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_100029E18(&qword_10013CBA0);
  uint64_t v48 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v47 = (uint64_t *)((char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  inject<A, B>(_:from:)(v47, v13, a2, v13, v4);
  uint64_t v14 = sub_100029E18(&qword_10013C6B0);
  inject<A, B>(_:from:)(v53, v14, a2, v14, v4);
  uint64_t v15 = *(void *)(a1 + *(int *)(type metadata accessor for PresentErrorAction(0LL) + 20));
  _s3__C4CodeOMa_0(0LL);
  uint64_t v17 = v16;
  v50[0] = 1LL;
  swift_errorRetain(v15);
  uint64_t v18 = sub_100027978(&qword_10013C260, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0, (uint64_t)&unk_1000ED8F0);
  if ((static _ErrorCodeProtocol.~= infix(_:_:)(v50, v15, v17, v18) & 1) != 0)
  {
    swift_errorRelease(v15);
    sub_100029EE0(v53, v54);
    v19._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    v19._object = (void *)0x8000000100101680LL;
    Swift::String v20 = Localizer.string(forKey:)(v19);
    uint64_t countAndFlagsBits = v20._countAndFlagsBits;
    object = v20._object;
    sub_100029EE0(v53, v54);
    unint64_t v23 = 0xD000000000000021LL;
    uint64_t v24 = "Alert.AppLaunchRestricted.Message";
  }

  else
  {
    _s3__C4CodeOMa_2(0LL);
    uint64_t v26 = v25;
    v50[0] = 4LL;
    uint64_t v27 = sub_100027978(&qword_10013C098, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_2, (uint64_t)&unk_1000ED1DC);
    char v28 = static _ErrorCodeProtocol.~= infix(_:_:)(v50, v15, v26, v27);
    swift_errorRelease(v15);
    sub_100029EE0(v53, v54);
    if ((v28 & 1) == 0)
    {
      v35._uint64_t countAndFlagsBits = 0x65472E726F727245LL;
      v35._object = (void *)0xED0000636972656ELL;
      Swift::String v36 = Localizer.string(forKey:)(v35);
      uint64_t countAndFlagsBits = v36._countAndFlagsBits;
      object = v36._object;
      swift_getErrorValue(v15, v52, v51);
      uint64_t v32 = Error.localizedDescription.getter(v51[1], v51[2]);
      goto LABEL_7;
    }

    v29._object = (void *)0x8000000100101640LL;
    v29._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
    Swift::String v30 = Localizer.string(forKey:)(v29);
    uint64_t countAndFlagsBits = v30._countAndFlagsBits;
    object = v30._object;
    sub_100029EE0(v53, v54);
    unint64_t v23 = 0xD00000000000001ELL;
    uint64_t v24 = "Alert.AppBuyRestricted.Message";
  }

  unint64_t v31 = (unint64_t)(v24 - 32) | 0x8000000000000000LL;
  Swift::String v34 = Localizer.string(forKey:)(*(Swift::String *)&v23);
  uint64_t v33 = v34._object;
  uint64_t v32 = v34._countAndFlagsBits;
LABEL_7:
  uint64_t v37 = v32;
  uint64_t v38 = v33;
  static ActionMetrics.notInstrumented.getter(v32);
  uint64_t v39 = (uint64_t *)&v10[v8[5]];
  *uint64_t v39 = countAndFlagsBits;
  v39[1] = (uint64_t)object;
  uint64_t v40 = &v10[v8[6]];
  *(void *)uint64_t v40 = v37;
  *((void *)v40 + 1) = v38;
  *(void *)&v10[v8[7]] = _swiftEmptyArrayStorage;
  v50[3] = v8;
  v50[4] = sub_100027978( (unint64_t *)&qword_10013FDC0,  type metadata accessor for AlertAction,  (uint64_t)&unk_1000EDA80);
  uint64_t v41 = sub_10002C328(v50);
  sub_10002C194((uint64_t)v10, (uint64_t)v41);
  uint64_t v42 = v49;
  (*(void (**)(char *, void, uint64_t))(v6 + 104))( v49,  enum case for ActionDispatcher.MetricsBehavior.notProcessed<A>(_:),  v5);
  uint64_t v43 = v47;
  uint64_t v44 = ActionDispatcher.perform(_:withMetrics:asPartOf:)(v50, v42, a2, v11);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v42, v5);
  sub_10002C7FC((uint64_t)v10);
  (*(void (**)(void *, uint64_t))(v48 + 8))(v43, v11);
  sub_100029F4C(v50);
  sub_100029F4C(v53);
  return v44;
}

uint64_t sub_1000D2ADC(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v29 = a6;
  uint64_t v28 = a5;
  uint64_t v9 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for OSLogger(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_getErrorValue(a1, v37, v36);
  uint64_t v16 = sub_100098160(v36[1], v36[2]);
  a2();
  swift_errorRelease(v16);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v17 = sub_10002A768(v12, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  uint64_t v18 = sub_100029E18(&qword_10013EA00);
  uint64_t v19 = type metadata accessor for LogMessage(0LL);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
        + *(void *)(*(void *)(v19 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39LL, 2LL);
  v21._uint64_t countAndFlagsBits = 0LL;
  v21._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  Swift::String v35 = &type metadata for StaticString;
  v33[0] = a4;
  v33[1] = v28;
  char v34 = v29;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v33);
  sub_10004C810((uint64_t)v33);
  v22._object = (void *)0x80000001001016D0LL;
  v22._uint64_t countAndFlagsBits = 0xD000000000000027LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  swift_getErrorValue(a1, v32, &v30);
  uint64_t v23 = v30;
  uint64_t v24 = v31;
  Swift::String v35 = v31;
  uint64_t v25 = sub_10002C328(v33);
  (*(void (**)(void *, uint64_t, void *))(*(v24 - 1) + 16LL))(v25, v23, v24);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v33);
  sub_10004C810((uint64_t)v33);
  v26._uint64_t countAndFlagsBits = 0LL;
  v26._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v26);
  LogMessage.init(stringInterpolation:)(v11);
  Logger.error(_:)(v20, v12, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v20);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

ValueMetadata *_s9PurchasedVMa()
{
  return &_s9PurchasedVN;
}

BOOL sub_1000D2D74(uint64_t a1, uint64_t a2, unsigned __int8 a3, char a4, uint64_t a5, char a6)
{
  if (a6 != 1) {
    return 0LL;
  }
  if (a3)
  {
    if (a3 == 1)
    {
      if ((a1 & 1) == 0 && (a4 & 1) != 0) {
        return 1LL;
      }
    }

    else if (a3 == 6 && !(a1 & 0xFFFFFFFFFFFFFFFDLL | a2))
    {
      return 1LL;
    }
  }

  else if ((a1 & 0xFE) == 0)
  {
    return 1LL;
  }

  if ((a4 & 1) == 0 || a3 > 6u) {
    return 0LL;
  }
  if (((1 << a3) & 0x37) == 0) {
    return a3 == 6 && __PAIR128__((unint64_t)(a1 != 0) + a2 - 1, a1 - 1) < 2;
  }
  return 1LL;
}

uint64_t sub_1000D2E20()
{
  uint64_t v0 = type metadata accessor for OSLogger.Subsystem(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSLogger(0LL);
  sub_10002A728(v4, qword_100148678);
  sub_10002A768(v4, (uint64_t)qword_100148678);
  if (qword_10013BC30 != -1) {
    swift_once(&qword_10013BC30, sub_1000D14B4);
  }
  uint64_t v5 = sub_10002A768(v0, (uint64_t)qword_1001485D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSLogger.init(subsystem:category:)(v3, 0xD000000000000021LL, 0x80000001000F1210LL);
}

uint64_t sub_1000D2F20(uint64_t a1)
{
  return sub_1000D3AAC(a1, (uint64_t)sub_1000D66D4, (uint64_t)&unk_100125E10);
}

void *sub_1000D2F54()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029E18(&qword_10013D300);
  __chkstk_darwin(v2);
  uint64_t v4 = &v20[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v5 = sub_100029E18(&qword_10013D308);
  uint64_t v6 = *(void *)(v5 - 8);
  *(void *)&double v7 = __chkstk_darwin(v5).n128_u64[0];
  uint64_t v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v10 = OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_notificationCenter;
  objc_msgSend( *(id *)((char *)v1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_notificationCenter),  "removeObserver:",  v1,  v7);
  uint64_t v11 = (uint64_t)v1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_accountsSubscription;
  swift_beginAccess( (char *)v1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_accountsSubscription,  v20,  0LL,  0LL);
  sub_1000320E4(v11, (uint64_t)v4, &qword_10013D300);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5) == 1)
  {
    sub_10002E92C((uint64_t)v4, &qword_10013D300);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
    uint64_t v12 = v1[5];
    uint64_t v13 = v1[6];
    sub_100029EE0(v1 + 2, v12);
    uint64_t active = dispatch thunk of AccountProvider.onActiveAccountChange.getter(v12, v13);
    uint64_t v16 = v15;
    uint64_t ObjectType = swift_getObjectType(active);
    dispatch thunk of EventEmitter.removeObserver(_:)(v9, ObjectType, v16);
    swift_unknownObjectRelease(active);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }

  sub_100029F4C(v1 + 2);
  sub_10002E92C(v11, &qword_10013D300);
  sub_100029F4C((void *)((char *)v1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_platform));
  swift_unknownObjectRelease(*(void *)((char *)v1
                                       + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory));

  swift_bridgeObjectRelease(*(void *)((char *)v1
                                      + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates));
  swift_release(*(void *)((char *)v1
                          + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_onSynchronizeAppStates));
  return v1;
}

uint64_t sub_1000D3168()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1000D318C()
{
  return type metadata accessor for PurchaseHistoryAppStateDataSource(0LL);
}

uint64_t type metadata accessor for PurchaseHistoryAppStateDataSource(uint64_t a1)
{
  uint64_t result = qword_10013FFB0;
  if (!qword_10013FFB0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PurchaseHistoryAppStateDataSource);
  }
  return result;
}

uint64_t sub_1000D31D0@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates);
  swift_beginAccess( a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates,  v15,  32LL,  0LL);
  uint64_t v6 = *v5;
  if (*(void *)(v6 + 16))
  {
    id v7 = a2;
    unint64_t v8 = sub_10008D4F0((uint64_t)v7);
    if ((v9 & 1) != 0)
    {
      uint64_t v10 = *(void *)(v6 + 56) + 24 * v8;
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *(void *)(v10 + 8);
      char v13 = *(_BYTE *)(v10 + 16);
      sub_100048494(*(void *)v10, v12, v13);
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      char v13 = -1;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    char v13 = -1;
  }

  *(void *)a3 = v11;
  *(void *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + swift_weakDestroy(v0 + 16) = v13;
  return swift_endAccess(v15);
}

uint64_t sub_1000D32A4(uint64_t (*a1)(void), uint64_t a2)
{
  if (*(void *)(v2 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistoryContext) == 1LL)
  {
    uint64_t v5 = swift_allocObject(&unk_100125C40, 24LL, 7LL);
    swift_weakInit(v5 + 16, v2);
    uint64_t v6 = (void *)swift_allocObject(&unk_100125DA8, 40LL, 7LL);
    void v6[2] = v5;
    v6[3] = a1;
    v6[4] = a2;
    swift_retain(v5);
    swift_retain(a2);
    sub_1000D3384((uint64_t)sub_1000D662C, (uint64_t)v6);
    swift_release(v5);
    return swift_release(v6);
  }

  else
  {
    sub_1000D3384(0LL, 0LL);
    return a1(0LL);
  }

uint64_t sub_1000D3384(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v21 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v20[1] = *(uint64_t *)((char *)v2 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_workQueue);
  char v13 = (void *)swift_allocObject(&unk_100125C90, 48LL, 7LL);
  void v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = v5;
  aBlock[4] = sub_1000D64FC;
  uint64_t v24 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10008A71C;
  aBlock[3] = &unk_100125CA8;
  uint64_t v14 = _Block_copy(aBlock);
  swift_retain(v2);
  uint64_t v15 = sub_1000D6520(a1, a2);
  static DispatchQoS.unspecified.getter(v15);
  Swift::String v22 = _swiftEmptyArrayStorage;
  uint64_t v16 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_100029E18((uint64_t *)&unk_10013DBD0);
  unint64_t v18 = sub_1000766D4();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v17, v18, v6, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release(v24);
}

uint64_t sub_1000D3584(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v5 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(v5);
  if (!Strong) {
    return a2();
  }
  uint64_t v7 = Strong;
  sub_1000D35FC((uint64_t)a2, a3);
  return swift_release(v7);
}

uint64_t sub_1000D35FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v19 = *v2;
  uint64_t v6 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v6);
  unint64_t v8 = (char *)&v20[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)((char *)v2
                 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory
                 + 8);
  uint64_t ObjectType = swift_getObjectType(*(void *)((char *)v2
                                             + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory));
  uint64_t v12 = v2[5];
  uint64_t v11 = v2[6];
  sub_100029EE0(v2 + 2, v12);
  dispatch thunk of AccountProvider.activeAccount.getter(v12, v11);
  uint64_t v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 16))( v8,  (uint64_t)v2 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_platform,  ObjectType,  v9);
  sub_10002E92C((uint64_t)v8, &qword_10013C6D0);
  uint64_t v14 = swift_allocObject(&unk_100125C40, 24LL, 7LL);
  swift_weakInit(v14 + 16, v3);
  uint64_t v15 = (void *)swift_allocObject(&unk_100125DD0, 40LL, 7LL);
  v15[2] = v14;
  v15[3] = a1;
  void v15[4] = a2;
  uint64_t v16 = (void *)swift_allocObject(&unk_100125DF8, 40LL, 7LL);
  v16[2] = a1;
  v16[3] = a2;
  void v16[4] = v19;
  v20[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v20[4] = &protocol witness table for SyncTaskScheduler;
  sub_10002C328(v20);
  sub_1000D6520(a1, a2);
  uint64_t v17 = sub_1000D6520(a1, a2);
  SyncTaskScheduler.init()(v17);
  Promise.then(perform:orCatchError:on:)(sub_1000D668C, v15, sub_1000D66C8, v16, v20);
  swift_release(v13);
  swift_release(v15);
  swift_release(v16);
  return sub_100029F4C(v20);
}

uint64_t sub_1000D37E8(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = a1 + 16;
  swift_beginAccess(a1 + 16, v13, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(v9);
  if (!Strong) {
    return a2();
  }
  uint64_t v11 = Strong;
  sub_1000D3878(a4, a5 & 1, (uint64_t)a2, a3);
  return swift_release(v11);
}

uint64_t sub_1000D3878(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v25 = a4;
  int v26 = a2;
  uint64_t v27 = *v4;
  uint64_t v8 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *(void *)((char *)v4
                  + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory
                  + 8);
  uint64_t ObjectType = swift_getObjectType(*(void *)((char *)v4
                                             + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory));
  uint64_t v14 = v4[5];
  uint64_t v13 = v4[6];
  sub_100029EE0(v4 + 2, v14);
  dispatch thunk of AccountProvider.activeAccount.getter(v14, v13);
  uint64_t v15 = swift_bridgeObjectRetain(a1);
  uint64_t v16 = sub_1000476FC(v15);
  swift_bridgeObjectRelease(a1);
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t **, uint64_t, uint64_t, uint64_t))(v11 + 24))( v10,  v16,  (uint64_t)v4 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_platform,  ObjectType,  v11);
  swift_release(v16);
  sub_10002E92C((uint64_t)v10, &qword_10013C6D0);
  uint64_t v18 = swift_allocObject(&unk_100125C40, 24LL, 7LL);
  swift_weakInit(v18 + 16, v5);
  uint64_t v19 = swift_allocObject(&unk_100125D58, 49LL, 7LL);
  *(void *)(v19 + swift_weakDestroy(v0 + 16) = v18;
  *(void *)(v19 + 24) = a3;
  uint64_t v20 = v25;
  *(void *)(v19 + 32) = v25;
  *(void *)(v19 + 40) = a1;
  *(_BYTE *)(v19 + 48) = v26;
  uint64_t v21 = (void *)swift_allocObject(&unk_100125D80, 48LL, 7LL);
  _OWORD v21[2] = a1;
  _OWORD v21[3] = a3;
  uint64_t v22 = v27;
  v21[4] = v20;
  v21[5] = v22;
  v28[3] = type metadata accessor for SyncTaskScheduler(0LL);
  void v28[4] = &protocol witness table for SyncTaskScheduler;
  sub_10002C328(v28);
  swift_bridgeObjectRetain(a1);
  sub_1000D6520(a3, v20);
  swift_bridgeObjectRetain(a1);
  uint64_t v23 = sub_1000D6520(a3, v20);
  SyncTaskScheduler.init()(v23);
  Promise.then(perform:orCatchError:on:)(sub_1000D65B0, v19, sub_1000D65D0, v21, v28);
  swift_release(v17);
  swift_release(v19);
  swift_release(v21);
  return sub_100029F4C(v28);
}

uint64_t sub_1000D3AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v22 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v21[1] = *(void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_workQueue);
  uint64_t v13 = swift_allocObject(&unk_100125C40, 24LL, 7LL);
  swift_weakInit(v13 + 16, v3);
  aBlock[4] = a2;
  uint64_t v25 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10008A71C;
  aBlock[3] = a3;
  uint64_t v14 = _Block_copy(aBlock);
  uint64_t v15 = swift_retain(v13);
  static DispatchQoS.unspecified.getter(v15);
  uint64_t v23 = _swiftEmptyArrayStorage;
  uint64_t v16 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v17 = sub_100029E18((uint64_t *)&unk_10013DBD0);
  unint64_t v18 = sub_1000766D4();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v23, v17, v18, v6, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  uint64_t v19 = v25;
  swift_release(v13);
  return swift_release(v19);
}

uint64_t sub_1000D3CA0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v9, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v1);
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result
                   + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistoryContext) == 1LL)
    {
      sub_1000D35FC(0LL, 0LL);
    }

    else
    {
      uint64_t v4 = (void *)(result + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates);
      swift_beginAccess( result + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates,  &v8,  0LL,  0LL);
      swift_bridgeObjectRetain(*v4);
      sub_100057FC4(v5);
      uint64_t v7 = v6;
      sub_1000D3878(v6, 1, 0LL, 0LL);
      swift_bridgeObjectRelease(v7);
    }

    return swift_release(v3);
  }

  return result;
}

void sub_1000D3E0C(uint64_t a1)
{
  v4[0] = "(";
  sub_1000BFBB8(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(v2 - 8) + 64LL;
    void v4[2] = "(";
    void v4[3] = &unk_1000F1270;
    void v4[4] = (char *)&value witness table for Builtin.Int64 + 64;
    void v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    void v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
    v4[8] = &unk_1000F1288;
    v4[9] = &unk_1000F12A0;
    v4[10] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 11LL, v4, a1 + 80);
  }

void *sub_1000D3ED8(uint64_t a1)
{
  uint64_t v2 = sub_100029E18(&qword_10013C6D0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)v21 - v6;
  a1 += 16LL;
  swift_beginAccess(a1, v22, 0LL, 0LL);
  uint64_t result = (void *)swift_weakLoadStrong(a1);
  if (result)
  {
    uint64_t v9 = result;
    uint64_t v10 = result[5];
    uint64_t v11 = result[6];
    sub_100029EE0(result + 2, v10);
    dispatch thunk of AccountProvider.activeAccount.getter(v10, v11);
    sub_1000320E4((uint64_t)v7, (uint64_t)v5, &qword_10013C6D0);
    uint64_t v12 = type metadata accessor for Account(0LL);
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v5, 1LL, v12) == 1)
    {
      sub_10002E92C((uint64_t)v5, &qword_10013C6D0);
    }

    else
    {
      uint64_t KeyPath = swift_getKeyPath(&unk_1000F12D8);
      Account.subscript.getter(v21);
      swift_release(KeyPath);
      uint64_t v15 = (void *)v21[0];
      (*(void (**)(char *, uint64_t))(v13 + 8))(v5, v12);
      if (v15)
      {
        id v16 = [v15 longLongValue];

        if ((*((_BYTE *)v9 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_lastAccountID + 8) & 1) == 0
          && v16 == *(id *)((char *)v9
                          + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_lastAccountID))
        {
          goto LABEL_11;
        }

LABEL_9:
        if (*(void *)((char *)v9
                       + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistoryContext) != 1LL)
        {
          uint64_t v17 = (void *)((char *)v9
                         + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates);
          swift_beginAccess( (char *)v9 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates,  v21,  0LL,  0LL);
          uint64_t v18 = swift_bridgeObjectRetain(*v17);
          sub_100057FC4(v18);
          uint64_t v20 = v19;
          sub_1000D3878(v19, 1, 0LL, 0LL);
          swift_release(v9);
          swift_bridgeObjectRelease(v20);
          return (void *)sub_10002E92C((uint64_t)v7, &qword_10013C6D0);
        }

        sub_1000D35FC(0LL, 0LL);
LABEL_11:
        swift_release(v9);
        return (void *)sub_10002E92C((uint64_t)v7, &qword_10013C6D0);
      }
    }

    if ((*((_BYTE *)v9 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_lastAccountID + 8) & 1) != 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  return result;
}

uint64_t sub_1000D4128(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for OSLogger(0LL);
  uint64_t v50 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  __n128 v49 = (char *)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  id v16 = (char *)v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = *a1;
  a2 += 16LL;
  swift_beginAccess(a2, v54, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(a2);
  if (result)
  {
    uint64_t v19 = result;
    uint64_t v45 = v11;
    swift_weakInit(v53, result);
    unint64_t v52 = &_swiftEmptySetSingleton;
    v43[1] = *(void *)(v19 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_workQueue);
    uint64_t v20 = sub_100029E18(&qword_10013D260);
    uint64_t v21 = swift_allocObject( v20,  ((*(unsigned __int8 *)(v14 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))
          + *(void *)(v14 + 72),
            *(unsigned __int8 *)(v14 + 80) | 7LL);
    __int128 v44 = xmmword_1000EDBE0;
    *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    uint64_t v47 = a3;
    uint64_t v48 = a4;
    uint64_t v22 = sub_1000D6520((uint64_t)a3, a4);
    static DispatchWorkItemFlags.barrier.getter(v22);
    v51[0] = v21;
    uint64_t v23 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v24 = sub_100029E18((uint64_t *)&unk_10013DBD0);
    unint64_t v25 = sub_1000766D4();
    uint64_t v26 = dispatch thunk of SetAlgebra.init<A>(_:)(v51, v24, v25, v13, v23);
    __chkstk_darwin(v26);
    v43[-4] = v19;
    v43[-3] = &v52;
    uint64_t v46 = v17;
    v43[-2] = v17;
    v43[-1] = 0LL;
    OS_dispatch_queue.sync<A>(flags:execute:)(v16, sub_1000D66EC);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    if (qword_10013BC68 != -1) {
      swift_once(&qword_10013BC68, sub_1000D2E20);
    }
    uint64_t v27 = v45;
    uint64_t v28 = sub_10002A768(v45, (uint64_t)qword_100148678);
    uint64_t v30 = v49;
    uint64_t v29 = v50;
    (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v49, v28, v27);
    uint64_t v31 = sub_100029E18(&qword_10013EA00);
    uint64_t v32 = type metadata accessor for LogMessage(0LL);
    uint64_t v33 = swift_allocObject( v31,  ((*(unsigned __int8 *)(*(void *)(v32 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v32 - 8) + 80LL))
          + *(void *)(*(void *)(v32 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v32 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v33 + swift_weakDestroy(v0 + 16) = v44;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39LL, 1LL);
    v34._object = (void *)0x8000000100101850LL;
    v34._uint64_t countAndFlagsBits = 0xD000000000000022LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v34);
    uint64_t v35 = v46;
    if ((unint64_t)v46 >> 62)
    {
      if (v46 < 0) {
        uint64_t v42 = v46;
      }
      else {
        uint64_t v42 = v46 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v46);
      uint64_t v36 = _CocoaArrayWrapper.endIndex.getter(v42);
      swift_bridgeObjectRelease(v35);
    }

    else
    {
      uint64_t v36 = *(void *)((v46 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v37 = v48;
    void v51[3] = &type metadata for Int;
    v51[0] = v36;
    LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v51);
    sub_10002E92C((uint64_t)v51, &qword_10013C6F0);
    v38._uint64_t countAndFlagsBits = 0x7370706120LL;
    v38._object = (void *)0xE500000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v38);
    LogMessage.init(stringInterpolation:)(v10);
    Logger.info(_:)(v33, v27, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v33);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v27);
    uint64_t v39 = v52;
    uint64_t v40 = swift_bridgeObjectRetain(v52);
    uint64_t v41 = v47;
    sub_1000D4588(v40, (uint64_t)v53, v47);
    swift_release(v19);
    swift_bridgeObjectRelease_n(v39, 2LL);
    sub_10002E968((uint64_t)v41, v37);
    return swift_weakDestroy(v53);
  }

  else if (a3)
  {
    return a3(0LL);
  }

  return result;
}

uint64_t sub_1000D4588(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t result = swift_weakLoadStrong(a2);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)(result
                   + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_onSynchronizeAppStates);
    swift_retain(v8);
    swift_release(v7);
    uint64_t v9 = a1;
    SyncEvent.post(_:)(&v9);
    uint64_t result = swift_release(v8);
  }

  if (a3) {
    return a3(0LL);
  }
  return result;
}

uint64_t sub_1000D4630(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  v22[1] = a3;
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC68 != -1) {
    swift_once(&qword_10013BC68, sub_1000D2E20);
  }
  uint64_t v12 = sub_10002A768(v8, (uint64_t)qword_100148678);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = sub_100029E18(&qword_10013EA00);
  uint64_t v14 = type metadata accessor for LogMessage(0LL);
  uint64_t v15 = swift_allocObject( v13,  ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL))
        + *(void *)(*(void *)(v14 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v15 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(36LL, 1LL);
  v16._object = (void *)0x8000000100101880LL;
  v16._uint64_t countAndFlagsBits = 0xD000000000000024LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v16);
  swift_getErrorValue(a1, v25, &v23);
  uint64_t v17 = v23;
  uint64_t v18 = v24;
  v26[3] = v24;
  uint64_t v19 = sub_10002C328(v26);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 16LL))(v19, v17, v18);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v26);
  sub_10002E92C((uint64_t)v26, &qword_10013C6F0);
  v20._uint64_t countAndFlagsBits = 0LL;
  v20._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v20);
  LogMessage.init(stringInterpolation:)(v7);
  Logger.error(_:)(v15, v8, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v15);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (a2) {
    return a2(a1);
  }
  return result;
}

uint64_t sub_1000D4854( uint64_t *a1, uint64_t a2, uint64_t (*a3)(void), uint64_t a4, uint64_t a5, int a6)
{
  int v55 = a6;
  uint64_t v52 = a5;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v54 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v53 = (char *)v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = *a1;
  a2 += 16LL;
  swift_beginAccess(a2, v59, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(a2);
  if (result)
  {
    uint64_t v21 = result;
    uint64_t v48 = v13;
    swift_weakInit(v58, result);
    uint64_t v57 = &_swiftEmptySetSingleton;
    v46[1] = *(void *)(v21 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_workQueue);
    uint64_t v22 = sub_100029E18(&qword_10013D260);
    uint64_t v23 = swift_allocObject( v22,  ((*(unsigned __int8 *)(v16 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))
          + *(void *)(v16 + 72),
            *(unsigned __int8 *)(v16 + 80) | 7LL);
    __int128 v47 = xmmword_1000EDBE0;
    *(_OWORD *)(v23 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    uint64_t v50 = a3;
    uint64_t v51 = a4;
    uint64_t v24 = sub_1000D6520((uint64_t)a3, a4);
    static DispatchWorkItemFlags.barrier.getter(v24);
    v56[0] = v23;
    uint64_t v25 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    uint64_t v26 = sub_100029E18((uint64_t *)&unk_10013DBD0);
    unint64_t v27 = sub_1000766D4();
    uint64_t v28 = dispatch thunk of SetAlgebra.init<A>(_:)(v56, v26, v27, v15, v25);
    __chkstk_darwin(v28);
    v46[-4] = v21;
    v46[-3] = &v57;
    uint64_t v49 = v19;
    uint64_t v29 = v52;
    v46[-2] = v19;
    v46[-1] = v29;
    OS_dispatch_queue.sync<A>(flags:execute:)(v18, sub_1000D65DC);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    if (qword_10013BC68 != -1) {
      swift_once(&qword_10013BC68, sub_1000D2E20);
    }
    uint64_t v30 = v48;
    uint64_t v31 = sub_10002A768(v48, (uint64_t)qword_100148678);
    uint64_t v33 = v53;
    uint64_t v32 = v54;
    (*(void (**)(char *, uint64_t, uint64_t))(v54 + 16))(v53, v31, v30);
    uint64_t v34 = sub_100029E18(&qword_10013EA00);
    uint64_t v35 = type metadata accessor for LogMessage(0LL);
    uint64_t v36 = swift_allocObject( v34,  ((*(unsigned __int8 *)(*(void *)(v35 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v35 - 8) + 80LL))
          + *(void *)(*(void *)(v35 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v35 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v36 + swift_weakDestroy(v0 + 16) = v47;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39LL, 1LL);
    v37._object = (void *)0x8000000100101850LL;
    v37._uint64_t countAndFlagsBits = 0xD000000000000022LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v37);
    uint64_t v38 = v49;
    if ((unint64_t)v49 >> 62)
    {
      if (v49 < 0) {
        uint64_t v45 = v49;
      }
      else {
        uint64_t v45 = v49 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v49);
      uint64_t v39 = _CocoaArrayWrapper.endIndex.getter(v45);
      swift_bridgeObjectRelease(v38);
    }

    else
    {
      uint64_t v39 = *(void *)((v49 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v40 = v51;
    v56[3] = &type metadata for Int;
    v56[0] = v39;
    LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v56);
    sub_10002E92C((uint64_t)v56, &qword_10013C6F0);
    v41._uint64_t countAndFlagsBits = 0x7370706120LL;
    v41._object = (void *)0xE500000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v41);
    LogMessage.init(stringInterpolation:)(v12);
    Logger.info(_:)(v36, v30, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v36);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v30);
    uint64_t v42 = v57;
    uint64_t v43 = swift_bridgeObjectRetain(v57);
    __int128 v44 = v50;
    sub_1000D4CD0(v43, v55 & 1, (uint64_t)v58, v50);
    swift_release(v21);
    swift_bridgeObjectRelease_n(v42, 2LL);
    sub_10002E968((uint64_t)v44, v40);
    return swift_weakDestroy(v58);
  }

  else if (a3)
  {
    return a3(0LL);
  }

  return result;
}

uint64_t sub_1000D4CD0(uint64_t result, char a2, uint64_t a3, uint64_t (*a4)(void))
{
  if ((a2 & 1) != 0)
  {
    uint64_t v6 = result;
    swift_beginAccess(a3, v10, 0LL, 0LL);
    uint64_t result = swift_weakLoadStrong(a3);
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)(result
                     + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_onSynchronizeAppStates);
      swift_retain(v8);
      swift_release(v7);
      uint64_t v9 = v6;
      SyncEvent.post(_:)(&v9);
      uint64_t result = swift_release(v8);
    }
  }

  if (a4) {
    return a4(0LL);
  }
  return result;
}

uint64_t sub_1000D4D7C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v24 = a4;
  uint64_t v25 = a3;
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OSLogger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC68 != -1) {
    swift_once(&qword_10013BC68, sub_1000D2E20);
  }
  uint64_t v13 = sub_10002A768(v9, (uint64_t)qword_100148678);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v13, v9);
  uint64_t v14 = sub_100029E18(&qword_10013EA00);
  uint64_t v15 = type metadata accessor for LogMessage(0LL);
  uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
        + *(void *)(*(void *)(v15 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(36LL, 2LL);
  v17._object = (void *)0x8000000100101830LL;
  v17._uint64_t countAndFlagsBits = 0xD00000000000001ALL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v17);
  uint64_t v30 = sub_100029E18(&qword_10013E590);
  v29[0] = a2;
  swift_bridgeObjectRetain(a2);
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v29);
  sub_10002E92C((uint64_t)v29, &qword_10013C6F0);
  v18._uint64_t countAndFlagsBits = 0x6E6F73616572202CLL;
  v18._object = (void *)0xEA0000000000203ALL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v18);
  swift_getErrorValue(a1, v28, &v26);
  uint64_t v20 = v26;
  uint64_t v19 = v27;
  uint64_t v30 = v27;
  uint64_t v21 = sub_10002C328(v29);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 16LL))(v21, v20, v19);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v29);
  sub_10002E92C((uint64_t)v29, &qword_10013C6F0);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  LogMessage.init(stringInterpolation:)(v8);
  Logger.error(_:)(v16, v9, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v16);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  if (v25) {
    return v25(a1);
  }
  return result;
}

uint64_t sub_1000D4FF4(uint64_t result, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t v6 = OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_hasRequestedUpdated;
  if ((*(_BYTE *)(result + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_hasRequestedUpdated) & 1) != 0)
  {
    if (a2) {
      return a2();
    }
  }

  else
  {
    uint64_t v8 = result;
    if (qword_10013BC68 != -1) {
      swift_once(&qword_10013BC68, sub_1000D2E20);
    }
    uint64_t v9 = type metadata accessor for OSLogger(0LL);
    sub_10002A768(v9, (uint64_t)qword_100148678);
    uint64_t v10 = sub_100029E18(&qword_10013EA00);
    uint64_t v11 = type metadata accessor for LogMessage(0LL);
    uint64_t v12 = swift_allocObject( v10,  ((*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL))
          + *(void *)(*(void *)(v11 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v11 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.init(stringLiteral:)(0xD000000000000019LL, 0x80000001001017C0LL);
    Logger.info(_:)(v12, v9, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v12);
    uint64_t v13 = *(void *)(v8 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v8
                                               + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistory));
    uint64_t v15 = (*(uint64_t (**)(void, uint64_t, uint64_t))(v13 + 8))( *(void *)(v8 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistoryContext),  ObjectType,  v13);
    uint64_t v16 = (void *)swift_allocObject(&unk_100125CE0, 40LL, 7LL);
    v16[2] = a2;
    v16[3] = a3;
    void v16[4] = a4;
    uint64_t v17 = swift_allocObject(&unk_100125D08, 32LL, 7LL);
    *(void *)(v17 + swift_weakDestroy(v0 + 16) = sub_1000D6534;
    *(void *)(v17 + 24) = v16;
    Swift::String v18 = (void *)swift_allocObject(&unk_100125D30, 40LL, 7LL);
    v18[2] = a2;
    v18[3] = a3;
    v18[4] = a4;
    v20[3] = type metadata accessor for SyncTaskScheduler(0LL);
    v20[4] = &protocol witness table for SyncTaskScheduler;
    sub_10002C328(v20);
    sub_1000D6520((uint64_t)a2, a3);
    uint64_t v19 = sub_1000D6520((uint64_t)a2, a3);
    SyncTaskScheduler.init()(v19);
    Promise.then(perform:orCatchError:on:)(sub_100099A38, v17, sub_1000D6568, v18, v20);
    swift_release(v15);
    swift_release(v17);
    swift_release(v18);
    uint64_t result = sub_100029F4C(v20);
    *(_BYTE *)(v8 + v6) = 1;
  }

  return result;
}

void sub_1000D5258(void (*a1)(__n128))
{
  if (qword_10013BC68 != -1) {
    swift_once(&qword_10013BC68, sub_1000D2E20);
  }
  uint64_t v2 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v2, (uint64_t)qword_100148678);
  uint64_t v3 = sub_100029E18(&qword_10013EA00);
  uint64_t v4 = type metadata accessor for LogMessage(0LL);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
       + *(void *)(*(void *)(v4 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000018LL, 0x8000000100101810LL);
  Logger.info(_:)(v5, v2, &protocol witness table for OSLogger);
  __n128 v6 = swift_bridgeObjectRelease(v5);
  if (a1) {
    a1(v6);
  }
}

uint64_t sub_1000D5364(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4);
  __n128 v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for OSLogger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC68 != -1) {
    swift_once(&qword_10013BC68, sub_1000D2E20);
  }
  uint64_t v11 = sub_10002A768(v7, (uint64_t)qword_100148678);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v11, v7);
  uint64_t v12 = sub_100029E18(&qword_10013EA00);
  uint64_t v13 = type metadata accessor for LogMessage(0LL);
  uint64_t v14 = swift_allocObject( v12,  ((*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL))
        + *(void *)(*(void *)(v13 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v13 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(43LL, 1LL);
  v15._object = (void *)0x80000001001017E0LL;
  v15._uint64_t countAndFlagsBits = 0xD00000000000002BLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v15);
  swift_getErrorValue(a1, v24, &v22);
  uint64_t v16 = v22;
  uint64_t v17 = v23;
  v25[3] = v23;
  Swift::String v18 = sub_10002C328(v25);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 16LL))(v18, v16, v17);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v25);
  sub_10002E92C((uint64_t)v25, &qword_10013C6F0);
  v19._uint64_t countAndFlagsBits = 0LL;
  v19._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v19);
  LogMessage.init(stringInterpolation:)(v6);
  Logger.info(_:)(v14, v7, &protocol witness table for OSLogger);
  __n128 v20 = swift_bridgeObjectRelease(v14);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v20);
  if (a2) {
    return a2(result);
  }
  return result;
}

void sub_1000D5584(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v136 = a3;
  uint64_t v139 = a2;
  uint64_t v6 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v130 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[5];
  uint64_t v10 = a1[6];
  sub_100029EE0(a1 + 2, v9);
  dispatch thunk of AccountProvider.activeAccount.getter(v9, v10);
  uint64_t v11 = type metadata accessor for Account(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = &unk_10013F000;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1LL, v11) == 1)
  {
    sub_10002E92C((uint64_t)v8, &qword_10013C6D0);
LABEL_38:
    uint64_t v71 = (void *)((char *)a1
                   + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates);
    swift_beginAccess( (char *)a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates,  v148,  1LL,  0LL);
    uint64_t v72 = swift_bridgeObjectRetain(*v71);
    sub_10008A9E4(v72);
    uint64_t v73 = *v71;
    *uint64_t v71 = &_swiftEmptyDictionarySingleton;
    swift_bridgeObjectRelease(v73);
    uint64_t v74 = (char *)a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_lastAccountID;
    *(void *)uint64_t v74 = 0LL;
    v74[8] = 1;
    return;
  }

  uint64_t KeyPath = swift_getKeyPath(&unk_1000F12D8);
  Account.subscript.getter(v148);
  swift_release(KeyPath);
  id v15 = v148[0];
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
  if (!v15) {
    goto LABEL_38;
  }
  uint64_t v16 = [v15 longLongValue];

  uint64_t v17 = (char *)a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_lastAccountID;
  if ((*((_BYTE *)a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_lastAccountID + 8) & 1) != 0
    || v16 != *(void **)v17)
  {
    Swift::String v18 = (void *)((char *)a1
                   + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates);
    swift_beginAccess( (char *)a1 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates,  v147,  1LL,  0LL);
    uint64_t v19 = swift_bridgeObjectRetain(*v18);
    sub_10008A9E4(v19);
    uint64_t v20 = *v18;
    *Swift::String v18 = &_swiftEmptyDictionarySingleton;
    swift_bridgeObjectRelease(v20);
    *(void *)uint64_t v17 = v16;
    v17[8] = 0;
  }

  v135 = v16;
  v151 = &_swiftEmptySetSingleton;
  if ((unint64_t)v136 >> 62)
  {
    if (v136 < 0) {
      uint64_t v75 = v136;
    }
    else {
      uint64_t v75 = v136 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v136);
    uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v75);
    if (v21) {
      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v21 = *(void *)((v136 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v136);
    if (v21)
    {
LABEL_9:
      unint64_t v130 = a4;
      v131 = (char *)a1;
      if (v21 < 1) {
        goto LABEL_100;
      }
      uint64_t v22 = 0LL;
      v140 = &v131[OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_platform];
      uint64_t v23 = (uint64_t *)&v131[OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_expectedAppStates];
      uint64_t v24 = v136;
      int64_t v138 = v136 & 0xC000000000000001LL;
      __int128 v137 = xmmword_1000EDBE0;
      uint64_t v25 = v135;
      uint64_t v141 = v21;
      while (1)
      {
        if (v138) {
          id v26 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v22, v24);
        }
        else {
          id v26 = *(id *)(v24 + 8 * v22 + 32);
        }
        uint64_t v27 = v26;
        id v28 =  objc_msgSend( objc_allocWithZone((Class)ASCAdamID),  "initWithInt64:",  objc_msgSend(v26, "storeItemID", v130));
        sub_10006BE0C((Swift::Int *)v148, v28);

        uint64_t v29 = sub_100029E18(&qword_100140088);
        uint64_t inited = swift_initStackObject(v29, v146);
        *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = v137;
        *(void *)(inited + 32) = v25;
        uint64_t v31 = sub_1000CB458(inited);
        swift_setDeallocating(inited);
        sub_1000388F0((uint64_t)v140, (uint64_t)v148);
        id v32 = v27;
        if ([v32 isHidden])
        {
          swift_bridgeObjectRelease(v31);
        }

        else
        {
          char v33 = sub_1000C9E48([v32 purchaserDSID], v31);
          swift_bridgeObjectRelease(v31);
          if ((v33 & 1) != 0)
          {
            if ([v32 isPreorder])
            {

              sub_100029F4C(v148);
              uint64_t v34 = 0LL;
              uint64_t v35 = 1LL;
              goto LABEL_28;
            }

            uint64_t v48 = v149;
            unint64_t v49 = v150;
            sub_100029EE0(v148, v149);
            if ((dispatch thunk of Platform.isRunnable(_:)(v32, v48, v49) & 1) != 0)
            {
              id v50 = [v32 cleanedRedownloadParams];
              uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
              uint64_t v34 = v51;

              sub_100029F4C(v148);
              swift_bridgeObjectRetain(v34);
              char v52 = 3;
            }

            else
            {

              sub_100029F4C(v148);
              uint64_t v35 = 0LL;
              uint64_t v34 = 0LL;
LABEL_28:
              char v52 = 1;
            }

            swift_beginAccess(v23, v148, 32LL, 0LL);
            uint64_t v53 = *v23;
            if (*(void *)(*v23 + 16))
            {
              v133 = (char *)v28;
              unint64_t v54 = sub_10008D4F0((uint64_t)v133);
              if ((v55 & 1) != 0)
              {
                uint64_t v56 = *(void *)(v53 + 56) + 24 * v54;
                uint64_t v57 = *(void *)v56;
                uint64_t v58 = *(void *)(v56 + 8);
                uint64_t v134 = v34;
                uint64_t v59 = v35;
                char v60 = *(_BYTE *)(v56 + 16);
                swift_endAccess(v148);
                sub_100048494(v57, v58, v60);

                sub_100048494(v57, v58, v60);
                sub_100048494(v59, v134, v52);
                sub_100048CA8(v57, v58, v60);
                LODWORD(v132) = v61;
                sub_1000484C0(v59, v134, v52);
                sub_1000484C0(v57, v58, v60);
                uint64_t v62 = v58;
                uint64_t v24 = v136;
                char v63 = v60;
                uint64_t v35 = v59;
                uint64_t v34 = v134;
                sub_1000484C0(v57, v62, v63);
                if ((v132 & 1) != 0)
                {
                  sub_1000484C0(v35, v34, v52);
                  sub_100049100(v35, v34, v52);

                  id v64 = v133;
LABEL_36:

LABEL_37:
                  uint64_t v25 = v135;
                  goto LABEL_12;
                }

LABEL_98:
              sub_10002EB74(v79);
              swift_bridgeObjectRelease(v144);
              swift_endAccess(v145);
              swift_bridgeObjectRelease(v138);
              return;
            }
          }
        }
      }
    }

LABEL_83:
    uint64_t v100 = (v108 - 1) & v108;
    unint64_t v101 = __clz(__rbit64(v108)) + (v102 << 6);
    goto LABEL_84;
  }

  __break(1u);
LABEL_100:
  __break(1u);
}

BOOL sub_1000D6318()
{
  return *(void *)(v0 + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_purchaseHistoryContext) != 1LL;
}

uint64_t sub_1000D6330()
{
  return swift_retain(*(void *)(v0
                                + OBJC_IVAR____TtC19appstorecomponentsd33PurchaseHistoryAppStateDataSource_onSynchronizeAppStates));
}

uint64_t sub_1000D6344(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = swift_allocObject(&unk_100125C40, 24LL, 7LL);
  swift_weakInit(v9 + 16, v4);
  uint64_t v10 = swift_allocObject(&unk_100125C68, 49LL, 7LL);
  *(void *)(v10 + swift_weakDestroy(v0 + 16) = v9;
  *(void *)(v10 + 24) = a3;
  *(void *)(v10 + 32) = a4;
  *(void *)(v10 + 40) = a1;
  *(_BYTE *)(v10 + 48) = a2;
  swift_retain(v9);
  swift_retain(a4);
  swift_bridgeObjectRetain(a1);
  sub_1000D3384((uint64_t)sub_1000D64DC, v10);
  swift_release(v9);
  return swift_release(v10);
}

uint64_t sub_1000D6400(uint64_t a1)
{
  v3[3] = a1;
  uint64_t v1 = sub_100029E18(&qword_10013E820);
  OS_dispatch_queue.sync<A>(execute:)(&v4, sub_1000D646C, v3, v1);
  return v4;
}

uint64_t sub_1000D646C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000D31D0(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t sub_1000D6484()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000D64A8()
{
  return swift_deallocObject(v0, 49LL, 7LL);
}

uint64_t sub_1000D64DC()
{
  return sub_1000D37E8( *(void *)(v0 + 16),  *(uint64_t (**)(void))(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(_BYTE *)(v0 + 48));
}

uint64_t sub_1000D64EC()
{
  return sub_1000D6648((void (*)(void))&_swift_release, 48LL);
}

uint64_t sub_1000D64FC()
{
  return sub_1000D4FF4(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40));
}

uint64_t sub_1000D6508(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000D6518(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000D6520(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_retain(a2);
  }
  return result;
}

void sub_1000D6534()
{
}

uint64_t sub_1000D6540()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000D6568(uint64_t a1)
{
  return sub_1000D5364(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_1000D6574()
{
  if (v0[3]) {
    swift_release(v0[4]);
  }
  swift_bridgeObjectRelease(v0[5]);
  return swift_deallocObject(v0, 49LL, 7LL);
}

uint64_t sub_1000D65B0(uint64_t *a1)
{
  return sub_1000D4854( a1,  *(void *)(v1 + 16),  *(uint64_t (**)(void))(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(unsigned __int8 *)(v1 + 48));
}

uint64_t sub_1000D65C0()
{
  return sub_1000D6648((void (*)(void))&_swift_bridgeObjectRelease, 48LL);
}

uint64_t sub_1000D65D0(uint64_t a1)
{
  return sub_1000D4D7C(a1, *(void *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32));
}

void sub_1000D65DC()
{
}

uint64_t sub_1000D6600()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000D662C()
{
  return sub_1000D3584(*(void *)(v0 + 16), *(uint64_t (**)(void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_1000D6638()
{
  return sub_1000D6648((void (*)(void))&_swift_release, 40LL);
}

uint64_t sub_1000D6648(void (*a1)(void), uint64_t a2)
{
  if (v2[3]) {
    swift_release(v2[4]);
  }
  return swift_deallocObject(v2, a2, 7LL);
}

uint64_t sub_1000D668C(uint64_t *a1)
{
  return sub_1000D4128(a1, *(void *)(v1 + 16), *(uint64_t (**)(void))(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000D669C()
{
  if (*(void *)(v0 + 16)) {
    swift_release(*(void *)(v0 + 24));
  }
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000D66C8(uint64_t a1)
{
  return sub_1000D4630(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24));
}

void *sub_1000D66D4()
{
  return sub_1000D3ED8(v0);
}

uint64_t sub_1000D66DC()
{
  return sub_1000D3CA0(v0);
}

void sub_1000D66EC()
{
}

uint64_t sub_1000D6710()
{
  if (*v0) {
    return 0xD000000000000010LL;
  }
  else {
    return 0x6F726665726F7473LL;
  }
}

uint64_t sub_1000D6758@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000D7814(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000D677C()
{
  return 0LL;
}

void sub_1000D6788(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1000D6794(uint64_t a1)
{
  unint64_t v2 = sub_1000D7A78();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000D67BC(uint64_t a1)
{
  unint64_t v2 = sub_1000D7A78();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000D67E4(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  int v17 = a4;
  uint64_t v8 = sub_100029E18(&qword_100140178);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_100029EE0(a1, v12);
  unint64_t v14 = sub_1000D7A78();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for RebootstrapTrigger.AccountState.CodingKeys,  &type metadata for RebootstrapTrigger.AccountState.CodingKeys,  v14,  v12,  v13);
  char v19 = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a2, a3, &v19, v8);
  if (!v4)
  {
    char v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v17 & 1, &v18, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000D690C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = a1[1];
  int v4 = *((unsigned __int8 *)a1 + 16);
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = *(unsigned __int8 *)(a2 + 16);
  if (!v3)
  {
    if (!v5) {
      return v4 ^ v6 ^ 1u;
    }
    return 0LL;
  }

  if (!v5) {
    return 0LL;
  }
  uint64_t v7 = *a1;
  if (v7 == *(void *)a2 && v3 == v5) {
    return v4 ^ v6 ^ 1u;
  }
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v3, *(void *)a2, v5, 0LL);
  uint64_t result = 0LL;
  if ((v9 & 1) != 0) {
    return v4 ^ v6 ^ 1u;
  }
  return result;
}

uint64_t sub_1000D6980@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000D7918(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + swift_weakDestroy(v0 + 16) = v6 & 1;
  }

  return result;
}

uint64_t sub_1000D69B0(void *a1)
{
  return sub_1000D67E4(a1, *(void *)v1, *(void *)(v1 + 8), *(unsigned __int8 *)(v1 + 16));
}

uint64_t sub_1000D69CC()
{
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v0 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v0, (uint64_t)qword_1001485E8);
  uint64_t v1 = sub_100029E18(&qword_10013EA00);
  uint64_t v2 = type metadata accessor for LogMessage(0LL);
  uint64_t v3 = swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL))
       + *(void *)(*(void *)(v2 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v3 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000038LL, 0x8000000100101AC0LL);
  Logger.info(_:)(v3, v0, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v3);
  char v5 = 0;
  return AsyncEvent.post(_:)(&v5);
}

void sub_1000D6AE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v49 = *(void *)(v2 - 8);
  uint64_t v50 = v2;
  __chkstk_darwin(v2);
  uint64_t v48 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  __chkstk_darwin(v4);
  char v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *(void *)(v0 + 40);
  uint64_t ObjectType = swift_getObjectType(*(void *)(v0 + 32));
  unint64_t v45 = (unint64_t)"ting re-bootstrap cycle";
  unint64_t v57 = 0xD000000000000023LL;
  unint64_t v58 = 0x80000001001019A0LL;
  uint64_t v9 = sub_100029E18(&qword_100140180);
  uint64_t v10 = sub_100044410(&qword_100140188, &qword_100140180, (uint64_t)&unk_1000EF758);
  Preferences.subscript.getter(&aBlock, &v57, ObjectType, v9, v7, v10);
  uint64_t v11 = v52;
  if (v52 == 1)
  {
    uint64_t v12 = *(void *)(v0 + 64);
    char v13 = *(_BYTE *)(v0 + 72);
    __int128 aBlock = *(void ***)(v0 + 56);
    uint64_t v52 = v12;
    LOBYTE(v53) = v13;
    unint64_t v57 = 0xD000000000000023LL;
    unint64_t v58 = 0x80000001001019A0LL;
    swift_bridgeObjectRetain(v12);
    Preferences.subscript.setter(&aBlock, &v57, ObjectType, v9, v7, v10);
    if (qword_10013BC38 != -1) {
      swift_once(&qword_10013BC38, sub_1000D1514);
    }
    uint64_t v14 = type metadata accessor for OSLogger(0LL);
    sub_10002A768(v14, (uint64_t)qword_1001485E8);
    uint64_t v15 = sub_100029E18(&qword_10013EA00);
    uint64_t v16 = type metadata accessor for LogMessage(0LL);
    uint64_t v17 = swift_allocObject( v15,  ((*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL))
          + *(void *)(*(void *)(v16 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v16 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    unint64_t v18 = 0xD000000000000046LL;
    char v19 = "Established baseline account state to track offline storefront changes";
LABEL_18:
    LogMessage.init(stringLiteral:)(v18, (unint64_t)(v19 - 32) | 0x8000000000000000LL);
    Logger.debug(_:)(v17, v14, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v17);
    return;
  }

  uint64_t v41 = v10;
  uint64_t v42 = v9;
  uint64_t v43 = ObjectType;
  uint64_t v44 = v7;
  uint64_t v20 = aBlock;
  int v21 = v53;
  uint64_t v22 = *(void *)(v1 + 64);
  int v23 = *(unsigned __int8 *)(v1 + 72);
  if (v22)
  {
    if (v52)
    {
      uint64_t v24 = *(void ***)(v1 + 56);
      if (v24 != aBlock || v22 != v52)
      {
        char v25 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v22, aBlock, v52, 0LL);
        sub_1000D7ABC((uint64_t)v20, v11);
        if ((v25 & 1) == 0 || ((v21 ^ v23) & 1) != 0) {
          goto LABEL_19;
        }
LABEL_15:
        if (qword_10013BC38 != -1) {
          swift_once(&qword_10013BC38, sub_1000D1514);
        }
        uint64_t v14 = type metadata accessor for OSLogger(0LL);
        sub_10002A768(v14, (uint64_t)qword_1001485E8);
        uint64_t v26 = sub_100029E18(&qword_10013EA00);
        uint64_t v27 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
        uint64_t v17 = swift_allocObject( v26,  ((*(unsigned __int8 *)(v27 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80))
              + 2LL * *(void *)(v27 + 72),
                *(unsigned __int8 *)(v27 + 80) | 7LL);
        *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_1000EDA10;
        LogMessage.init(stringLiteral:)(0xD00000000000003BLL, 0x8000000100101A20LL);
        unint64_t v18 = 0xD000000000000012LL;
        char v19 = "none were detected";
        goto LABEL_18;
      }

      goto LABEL_14;
    }

uint64_t sub_1000D7008()
{
  swift_unknownObjectRelease(*(void *)(v0 + 32));
  swift_bridgeObjectRelease(*(void *)(v0 + 64));
  swift_release(*(void *)(v0 + 80));
  return v0;
}

uint64_t sub_1000D7068()
{
  return swift_deallocClassInstance(v0, 88LL, 7LL);
}

uint64_t sub_1000D7088(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)(v3 + 56);
  uint64_t v5 = *(void *)(v3 + 64);
  int v7 = *(unsigned __int8 *)(v3 + 72);
  if (!a2)
  {
    if (v5) {
      goto LABEL_11;
    }
LABEL_10:
    if (((v7 ^ a3) & 1) == 0) {
      return result;
    }
    goto LABEL_11;
  }

  if (v5)
  {
    if (v6 == result && v5 == a2)
    {
      if (v7 == (a3 & 1)) {
        return result;
      }
      goto LABEL_11;
    }

    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, a2, *(void *)(v3 + 56), *(void *)(v3 + 64), 0LL);
    if ((result & 1) != 0) {
      goto LABEL_10;
    }
  }

double sub_1000D7194()
{
  char v5 = 1;
  AsyncEvent.post(_:)(&v5);
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v0 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v0, (uint64_t)qword_1001485E8);
  uint64_t v1 = sub_100029E18(&qword_10013EA00);
  uint64_t v2 = type metadata accessor for LogMessage(0LL);
  uint64_t v3 = swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL))
       + *(void *)(*(void *)(v2 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v2 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v3 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000036LL, 0x8000000100101A80LL);
  Logger.info(_:)(v3, v0, &protocol witness table for OSLogger);
  *(void *)&double result = swift_bridgeObjectRelease(v3).n128_u64[0];
  return result;
}

id sub_1000D729C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + 48);
  [v2 lock];
  uint64_t v3 = sub_1000D773C(*(id *)(v0 + 16));
  char v5 = v3;
  uint64_t v6 = v4;
  char v8 = v7;
  uint64_t v9 = *(void *)(v0 + 56);
  uint64_t v10 = *(void *)(v1 + 64);
  int v11 = *(unsigned __int8 *)(v1 + 72);
  if (!v10)
  {
    if (!v4)
    {
LABEL_11:
      char v13 = v8 ^ v11 ^ 1;
      goto LABEL_12;
    }

LABEL_10:
    char v13 = 0;
    goto LABEL_12;
  }

  if (!v4) {
    goto LABEL_10;
  }
  char v13 = 0;
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(v9, *(void *)(v1 + 64), v3, v4, 0LL) & 1) != 0) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v14 = *(void *)(v1 + 64);
  *(void *)(v1 + 56) = v5;
  *(void *)(v1 + 64) = v6;
  *(_BYTE *)(v1 + 72) = v8 & 1;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v14);
  sub_1000D7088(v9, v10, v11);
  id result = objc_msgSend(v2, "unlock", swift_bridgeObjectRelease(v10).n128_f64[0]);
  if ((v13 & 1) == 0)
  {
    if (qword_10013BC38 != -1) {
      swift_once(&qword_10013BC38, sub_1000D1514);
    }
    uint64_t v16 = type metadata accessor for OSLogger(0LL);
    sub_10002A768(v16, (uint64_t)qword_1001485E8);
    uint64_t v17 = sub_100029E18(&qword_10013EA00);
    uint64_t v18 = type metadata accessor for LogMessage(0LL);
    uint64_t v19 = swift_allocObject( v17,  ((*(unsigned __int8 *)(*(void *)(v18 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v18 - 8) + 80LL))
          + *(void *)(*(void *)(v18 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v18 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.init(stringLiteral:)(0xD000000000000037LL, 0x8000000100101960LL);
    Logger.info(_:)(v19, v16, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v19);
    char v20 = 0;
    return (id)AsyncEvent.post(_:)(&v20);
  }

  return result;
}

        uint64_t v43 = (void *)objc_opt_self(&OBJC_CLASS___ASCMobileGestalt);
        [v43 mainScreenSize];
        unint64_t v45 = v44;
        uint64_t v47 = v46;
        [v43 mainScreenScale];
        uint64_t v72 = &type metadata for CGFloat;
        uint64_t v69 = v48;
        uint64_t v49 = *(void *)(a1 + 24);
        uint64_t v50 = *(void *)(a1 + 32);
        sub_10002ACB8(a1, v49);
        uint64_t v51 = v73;
        dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v69,  0x7461526C65786970LL,  0xEA00000000006F69LL,  v49,  v50);
        if (!v51)
        {
          sub_100029F4C(&v69);
          uint64_t v72 = &type metadata for CGFloat;
          uint64_t v69 = v47;
          uint64_t v52 = *(void *)(a1 + 24);
          uint64_t v53 = *(void *)(a1 + 32);
          sub_10002ACB8(a1, v52);
          dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v69,  0x65486E6565726373LL,  0xEC00000074686769LL,  v52,  v53);
          sub_100029F4C(&v69);
          uint64_t v72 = &type metadata for CGFloat;
          uint64_t v69 = v45;
          unint64_t v54 = *(void *)(a1 + 24);
          char v55 = *(void *)(a1 + 32);
          sub_10002ACB8(a1, v54);
          dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v69,  0x69576E6565726373LL,  0xEB00000000687464LL,  v54,  v55);
        }

        (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v42);
        return sub_100029F4C(&v69);
      }
    }

    uint64_t v42 = v65;
    goto LABEL_10;
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for RebootstrapTrigger()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd18RebootstrapTrigger);
}

ValueMetadata *type metadata accessor for RebootstrapTrigger.Target()
{
  return &type metadata for RebootstrapTrigger.Target;
}

uint64_t sub_1000D7570(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for RebootstrapTrigger.AccountState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for RebootstrapTrigger.AccountState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RebootstrapTrigger.AccountState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RebootstrapTrigger.AccountState( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 0;
    *(void *)id result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for RebootstrapTrigger.AccountState()
{
  return &type metadata for RebootstrapTrigger.AccountState;
}

unint64_t sub_1000D76F8()
{
  unint64_t result = qword_100140160;
  if (!qword_100140160)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F1450, &type metadata for RebootstrapTrigger.Target);
    atomic_store(result, (unint64_t *)&qword_100140160);
  }

  return result;
}

void *sub_1000D773C(void *a1)
{
  id v2 = objc_msgSend(a1, "ams_localiTunesAccount");
  unint64_t v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(v2, "ams_storefront");

    if (v4)
    {
      unint64_t v3 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    }

    else
    {
      unint64_t v3 = 0LL;
    }
  }

  id v5 = objc_msgSend(a1, "ams_activeiTunesAccount");
  if (v5)
  {
    uint64_t v6 = v5;
    objc_msgSend(v5, "ams_isManagedAppleID");
  }

  return v3;
}

uint64_t sub_1000D7814(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6F726665726F7473LL && a2 == 0xEC0000004449746ELL)
  {
    unint64_t v5 = 0xEC0000004449746ELL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6F726665726F7473LL, 0xEC0000004449746ELL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0xD000000000000010LL && a2 == 0x8000000100100410LL)
  {
    swift_bridgeObjectRelease(0x8000000100100410LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x8000000100100410LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_1000D7918(void *a1)
{
  uint64_t v3 = sub_100029E18(&qword_100140168);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100029EE0(a1, v7);
  unint64_t v9 = sub_1000D7A78();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for RebootstrapTrigger.AccountState.CodingKeys,  &type metadata for RebootstrapTrigger.AccountState.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_100029F4C(a1);
    swift_bridgeObjectRelease(0LL);
  }

  else
  {
    char v13 = 0;
    uint64_t v8 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v13, v3);
    char v12 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v12, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100029F4C(a1);
  }

  return v8;
}

unint64_t sub_1000D7A78()
{
  unint64_t result = qword_100140170;
  if (!qword_100140170)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F153C, &type metadata for RebootstrapTrigger.AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100140170);
  }

  return result;
}

uint64_t sub_1000D7ABC(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

double sub_1000D7AD0()
{
  return sub_1000D7194();
}

uint64_t sub_1000D7AD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000D7AE8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t _s19appstorecomponentsd18RebootstrapTriggerC6TargetOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000D7B3C + 4 * byte_1000F1325[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000D7B70 + 4 * asc_1000F1320[v4]))();
}

uint64_t sub_1000D7B70(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000D7B78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000D7B80LL);
  }
  return result;
}

uint64_t sub_1000D7B8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000D7B94LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_1000D7B98(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000D7BA0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RebootstrapTrigger.AccountState.CodingKeys()
{
  return &type metadata for RebootstrapTrigger.AccountState.CodingKeys;
}

unint64_t sub_1000D7BC0()
{
  unint64_t result = qword_100140190;
  if (!qword_100140190)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F1514, &type metadata for RebootstrapTrigger.AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100140190);
  }

  return result;
}

unint64_t sub_1000D7C08()
{
  unint64_t result = qword_100140198;
  if (!qword_100140198)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F1484, &type metadata for RebootstrapTrigger.AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100140198);
  }

  return result;
}

unint64_t sub_1000D7C50()
{
  unint64_t result = qword_1001401A0;
  if (!qword_1001401A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000F14AC, &type metadata for RebootstrapTrigger.AccountState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1001401A0);
  }

  return result;
}

uint64_t sub_1000D7CA4(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a4;
  uint64_t v35 = a3;
  uint64_t v6 = type metadata accessor for State(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v8);
  char v13 = (char *)&v32 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v32 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v19(v18, a2, v6);
  int v20 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v18, v6);
  if (v20 != enum case for State.purchased(_:))
  {
    uint64_t v32 = a2;
    uint64_t v33 = v19;
    if (v20 == enum case for State.downloadable(_:))
    {
      (*(void (**)(char *, uint64_t))(v7 + 96))(v18, v6);
      swift_bridgeObjectRelease(*((void *)v18 + 1));
      uint64_t v22 = v35;
    }

    else
    {
      BOOL v23 = v20 == enum case for State.buyable(_:) || v20 == enum case for State.unknown(_:);
      uint64_t v22 = v35;
      if (!v23)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
        return 1LL;
      }
    }

    uint64_t v24 = v34;
    if ((dispatch thunk of Restrictions.isAppInstallationAllowed.getter(v22, v34) & 1) == 0
      || (dispatch thunk of Restrictions.isRunningInStoreDemoMode.getter(v22, v24) & 1) != 0
      && ([a1 flags] & 4) == 0)
    {
      return 0LL;
    }

    char v25 = dispatch thunk of Restrictions.hasManagedAppleID.getter(v35, v24);
    uint64_t v26 = v33;
    v33(v16, v32, v6);
    if ((v25 & 1) != 0)
    {
      uint64_t v27 = *(void (**)(char *, void, uint64_t))(v7 + 104);
      v27(v13, enum case for State.unknown(_:), v6);
      char v28 = static State.== infix(_:_:)(v16, v13);
      uint64_t v29 = *(void (**)(char *, uint64_t))(v7 + 8);
      v29(v13, v6);
      v26(v10, v16, v6);
      if ((v28 & 1) != 0)
      {
        v29(v10, v6);
        v29(v16, v6);
        return 0LL;
      }

      v27(v13, enum case for State.buyable(_:), v6);
      char v31 = static State.== infix(_:_:)(v10, v13);
      v29(v13, v6);
      v29(v10, v6);
      v29(v16, v6);
      if ((v31 & 1) != 0) {
        return 0LL;
      }
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    }

    return 1LL;
  }

  (*(void (**)(char *, uint64_t))(v7 + 96))(v18, v6);
  uint64_t v21 = type metadata accessor for AppPurchaseType(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v21 - 8) + 8LL))(v18, v21);
  return 0LL;
}

uint64_t (*sub_1000D7F98(uint64_t a1))(void *a1)
{
  uint64_t v2 = swift_allocObject(&unk_1001260F8, 32LL, 7LL);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = sub_1000D8624;
  *(void *)(v2 + 24) = a1;
  swift_retain(a1);
  return sub_1000751E8;
}

uint64_t *sub_1000D7FF8@<X0>(uint64_t a1@<X0>, uint64_t **a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v38[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for OSLogger(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v38[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v39 = &type metadata for Feature;
  unint64_t v40 = sub_10004C76C();
  LOBYTE(v38[0]) = 0;
  char v11 = isFeatureEnabled(_:)(v38);
  sub_100029F4C(v38);
  if ((v11 & 1) != 0)
  {
    if (qword_10013BC58 != -1) {
      swift_once(&qword_10013BC58, sub_1000D1598);
    }
    uint64_t v12 = sub_10002A768(v7, (uint64_t)qword_100148648);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
    uint64_t v13 = sub_100029E18(&qword_10013EA00);
    uint64_t v14 = type metadata accessor for LogMessage(0LL);
    uint64_t v15 = swift_allocObject( v13,  ((*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL))
          + *(void *)(*(void *)(v14 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v14 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v15 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(53LL, 1LL);
    v16._uint64_t countAndFlagsBits = 0LL;
    v16._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v16);
    uint64_t v39 = &type metadata for Feature;
    LOBYTE(v38[0]) = 0;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v38);
    sub_10004C810((uint64_t)v38);
    v17._object = (void *)0x8000000100101B70LL;
    v17._uint64_t countAndFlagsBits = 0xD000000000000035LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v17);
    LogMessage.init(stringInterpolation:)(v6);
    Logger.info(_:)(v15, v7, &protocol witness table for OSLogger);
    swift_bridgeObjectRelease(v15);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v18 = type metadata accessor for ManagedRestrictions(0LL);
    uint64_t v19 = sub_100029E18(&qword_10013DDB0);
    uint64_t v20 = type metadata accessor for BaseObjectGraph(0LL);
    inject<A, B>(_:from:)(v38, v19, a1, v19, v20);
    unint64_t result = (uint64_t *)ManagedRestrictions.__allocating_init(accounts:)(v38);
    uint64_t v22 = result;
    a2[3] = (uint64_t *)v18;
    a2[4] = (uint64_t *)&protocol witness table for ManagedRestrictions;
    goto LABEL_9;
  }

  if (qword_10013BC58 != -1) {
    swift_once(&qword_10013BC58, sub_1000D1598);
  }
  uint64_t v23 = sub_10002A768(v7, (uint64_t)qword_100148648);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v23, v7);
  uint64_t v24 = sub_100029E18(&qword_10013EA00);
  uint64_t v25 = type metadata accessor for LogMessage(0LL);
  uint64_t v26 = swift_allocObject( v24,  ((*(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL))
        + *(void *)(*(void *)(v25 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v26 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(54LL, 1LL);
  v27._uint64_t countAndFlagsBits = 0LL;
  v27._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v27);
  uint64_t v39 = &type metadata for Feature;
  LOBYTE(v38[0]) = 0;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v38);
  sub_10004C810((uint64_t)v38);
  v28._uint64_t countAndFlagsBits = 0xD000000000000036LL;
  v28._object = (void *)0x8000000100101B30LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v28);
  LogMessage.init(stringInterpolation:)(v6);
  Logger.info(_:)(v26, v7, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v29 = sub_100029E18(&qword_10013DDB0);
  uint64_t v30 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v38, v29, a1, v29, v30);
  unint64_t result = (uint64_t *)[(id)objc_opt_self(MCProfileConnection) sharedConnection];
  if (result)
  {
    char v31 = result;
    id v32 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
    uint64_t v33 = type metadata accessor for ManagedRestrictions(0LL);
    swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
    uint64_t v34 = sub_1000BF164(v38, v31, v32);
    uint64_t v35 = type metadata accessor for ASCMigrationRestrictionsImplementation();
    uint64_t v36 = (uint64_t *)swift_allocObject(v35, 40LL, 7LL);
    uint64_t v22 = sub_1000D8490((uint64_t)v34, v36);
    a2[3] = (uint64_t *)v35;
    a2[4] = (uint64_t *)sub_100064AB8();
    unint64_t result = (uint64_t *)swift_release(v34);
LABEL_9:
    *a2 = v22;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t type metadata accessor for RestrictionsFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd19RestrictionsFactory);
}

uint64_t *sub_1000D8490(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = sub_100029E18(&qword_100140240);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2[2] = a1;
  a2[3] = (uint64_t)&off_100124E10;
  uint64_t v9 = sub_100029E18(&qword_100140248);
  swift_allocObject(v9, *(unsigned int *)(v9 + 48), *(unsigned __int16 *)(v9 + 52));
  uint64_t v10 = swift_unknownObjectRetain(a1);
  a2[4] = AsyncEvent.init()(v10);
  uint64_t v11 = *(void *)(a1 + OBJC_IVAR____TtC19appstorecomponentsd19ManagedRestrictions_onRestrictionsChange);
  uint64_t v12 = sub_100029E18(&qword_10013F890);
  unint64_t v13 = sub_1000D85D8();
  swift_retain(v11);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v16, v12, v13);
  EventEmitter.addObserver<A>(on:target:method:)(v16, a2, sub_1000D7F98, 0LL, v12, v4, v13);
  swift_release(v11);
  sub_100029F4C(v16);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a2;
}

unint64_t sub_1000D85D8()
{
  unint64_t result = qword_100140250;
  if (!qword_100140250)
  {
    uint64_t v1 = sub_100029F6C(&qword_10013F890);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for AsyncEvent<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100140250);
  }

  return result;
}

uint64_t sub_1000D8624(uint64_t a1, uint64_t a2)
{
  return sub_10006497C(a1, a2, v2);
}

uint64_t sub_1000D862C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t (*sub_1000D8650(void *a1))(uint64_t a1)
{
  uint64_t v2 = swift_allocObject(&unk_1001263C8, 24LL, 7LL);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = a1;
  uint64_t v3 = swift_allocObject(&unk_1001263F0, 32LL, 7LL);
  *(void *)(v3 + swift_weakDestroy(v0 + 16) = sub_1000DBB0C;
  *(void *)(v3 + 24) = v2;
  id v4 = a1;
  return sub_1000DBB14;
}

id (*sub_1000D86C8(void *a1))(uint64_t a1)
{
  *(void *)(swift_allocObject(&unk_1001263A0, 24LL, 7LL) + swift_weakDestroy(v0 + 16) = a1;
  id v2 = a1;
  return sub_1000DBB04;
}

id (*sub_1000D871C(void *a1))(uint64_t a1)
{
  *(void *)(swift_allocObject(&unk_100126378, 24LL, 7LL) + swift_weakDestroy(v0 + 16) = a1;
  id v2 = a1;
  return sub_1000DBAFC;
}

uint64_t (*sub_1000D8770(void *a1))(void *a1)
{
  uint64_t v2 = swift_allocObject(&unk_100126328, 24LL, 7LL);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = a1;
  uint64_t v3 = swift_allocObject(&unk_100126350, 32LL, 7LL);
  *(void *)(v3 + swift_weakDestroy(v0 + 16) = sub_1000DBAF4;
  *(void *)(v3 + 24) = v2;
  id v4 = a1;
  return sub_100092718;
}

uint64_t (*sub_1000D87E8(void *a1))(unsigned __int8 *a1)
{
  uint64_t v2 = swift_allocObject(&unk_1001262D8, 24LL, 7LL);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = a1;
  uint64_t v3 = swift_allocObject(&unk_100126300, 32LL, 7LL);
  *(void *)(v3 + swift_weakDestroy(v0 + 16) = sub_1000DBAEC;
  *(void *)(v3 + 24) = v2;
  id v4 = a1;
  return sub_100081104;
}

uint64_t sub_1000D8860( void *a1, void (*a2)(void *, void), uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v29 = a6;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  Swift::String v16 = &v28[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  v30[0] = a1;
  id v17 = a1;
  a2(v30, 0LL);

  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v18 = sub_10002A768(v13, (uint64_t)qword_100148618);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v16, v18, v13);
  uint64_t v19 = sub_100029E18(&qword_10013EA00);
  uint64_t v20 = type metadata accessor for LogMessage(0LL);
  uint64_t v21 = swift_allocObject( v19,  ((*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL))
        + *(void *)(*(void *)(v20 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(29LL, 2LL);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  id v32 = &type metadata for StaticString;
  v30[0] = a4;
  v30[1] = a5;
  char v31 = v29;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
  sub_10002E92C((uint64_t)v30, &qword_10013C6F0);
  v23._object = (void *)0x8000000100101C80LL;
  v23._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  id v32 = (void *)sub_10002A030(0LL, &qword_10013F6D0, off_10011E4C8);
  v30[0] = v17;
  id v24 = v17;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v30);
  sub_10002E92C((uint64_t)v30, &qword_10013C6F0);
  v25._uint64_t countAndFlagsBits = 0LL;
  v25._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v25);
  LogMessage.init(stringInterpolation:)(v12);
  Logger.info(_:)(v21, v13, &protocol witness table for OSLogger);
  __n128 v26 = swift_bridgeObjectRelease(v21);
  return (*(uint64_t (**)(_BYTE *, uint64_t, __n128))(v14 + 8))(v16, v13, v26);
}

uint64_t sub_1000D8ACC( uint64_t a1, void (*a2)(void *, void), uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return sub_1000D8B3C( a1,  a2,  a3,  a4,  a5,  a6,  (void (*)(uint64_t))&_swift_bridgeObjectRetain,  (void (*)(uint64_t))&_swift_bridgeObjectRelease,  (uint64_t *)&unk_1001403E0);
}

uint64_t sub_1000D8B04( uint64_t a1, void (*a2)(void *, void), uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  return sub_1000D8B3C( a1,  a2,  a3,  a4,  a5,  a6,  (void (*)(uint64_t))&_swift_bridgeObjectRetain,  (void (*)(uint64_t))&_swift_bridgeObjectRelease,  (uint64_t *)&unk_1001403D0);
}

uint64_t sub_1000D8B3C( uint64_t a1, void (*a2)(void *, void), uint64_t a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(uint64_t), void (*a8)(uint64_t), uint64_t *a9)
{
  int v32 = a6;
  uint64_t v31 = a5;
  uint64_t v33 = a9;
  uint64_t v14 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v14);
  Swift::String v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for OSLogger(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v34[0] = a1;
  a7(a1);
  a2(v34, 0LL);
  a8(a1);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v21 = sub_10002A768(v17, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21, v17);
  uint64_t v22 = sub_100029E18(&qword_10013EA00);
  uint64_t v23 = type metadata accessor for LogMessage(0LL);
  uint64_t v24 = swift_allocObject( v22,  ((*(unsigned __int8 *)(*(void *)(v23 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v23 - 8) + 80LL))
        + *(void *)(*(void *)(v23 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v23 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v24 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(29LL, 2LL);
  v25._uint64_t countAndFlagsBits = 0LL;
  v25._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v25);
  uint64_t v36 = &type metadata for StaticString;
  v34[0] = a4;
  v34[1] = v31;
  char v35 = v32;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
  sub_10002E92C((uint64_t)v34, &qword_10013C6F0);
  v26._object = (void *)0x8000000100101C80LL;
  v26._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v26);
  uint64_t v36 = (void *)sub_100029E18(v33);
  v34[0] = a1;
  a7(a1);
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v34);
  sub_10002E92C((uint64_t)v34, &qword_10013C6F0);
  v27._uint64_t countAndFlagsBits = 0LL;
  v27._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v27);
  LogMessage.init(stringInterpolation:)(v16);
  Logger.info(_:)(v24, v17, &protocol witness table for OSLogger);
  __n128 v28 = swift_bridgeObjectRelease(v24);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v18 + 8))(v20, v17, v28);
}

uint64_t sub_1000D8DB4( void *a1, void (*a2)(void *, void), uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v29 = a6;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = &v28[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  Swift::String v16 = &v28[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  v30[0] = a1;
  id v17 = a1;
  a2(v30, 0LL);

  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v18 = sub_10002A768(v13, (uint64_t)qword_100148618);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v16, v18, v13);
  uint64_t v19 = sub_100029E18(&qword_10013EA00);
  uint64_t v20 = type metadata accessor for LogMessage(0LL);
  uint64_t v21 = swift_allocObject( v19,  ((*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL))
        + *(void *)(*(void *)(v20 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(29LL, 2LL);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  int v32 = &type metadata for StaticString;
  v30[0] = a4;
  v30[1] = a5;
  char v31 = v29;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v30);
  sub_10002E92C((uint64_t)v30, &qword_10013C6F0);
  v23._object = (void *)0x8000000100101C80LL;
  v23._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  int v32 = (void *)type metadata accessor for AppOfferStateClient();
  v30[0] = v17;
  id v24 = v17;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v30);
  sub_10002E92C((uint64_t)v30, &qword_10013C6F0);
  v25._uint64_t countAndFlagsBits = 0LL;
  v25._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v25);
  LogMessage.init(stringInterpolation:)(v12);
  Logger.info(_:)(v21, v13, &protocol witness table for OSLogger);
  __n128 v26 = swift_bridgeObjectRelease(v21);
  return (*(uint64_t (**)(_BYTE *, uint64_t, __n128))(v14 + 8))(v16, v13, v26);
}

uint64_t sub_1000D9014( uint64_t a1, void (*a2)(void *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v30 = a6;
  uint64_t v29 = a5;
  uint64_t v9 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for OSLogger(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v34[0] = 0LL;
  swift_getErrorValue(a1, v38, v37);
  uint64_t v16 = sub_100098160(v37[1], v37[2]);
  a2(v34, v16);
  swift_errorRelease(v16);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v17 = sub_10002A768(v12, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  uint64_t v18 = sub_100029E18(&qword_10013EA00);
  uint64_t v19 = type metadata accessor for LogMessage(0LL);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
        + *(void *)(*(void *)(v19 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39LL, 2LL);
  v21._uint64_t countAndFlagsBits = 0LL;
  v21._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  uint64_t v36 = &type metadata for StaticString;
  v34[0] = a4;
  v34[1] = v29;
  char v35 = v30;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
  sub_10002E92C((uint64_t)v34, &qword_10013C6F0);
  v22._object = (void *)0x80000001001016D0LL;
  v22._uint64_t countAndFlagsBits = 0xD000000000000027LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  swift_getErrorValue(a1, v33, &v31);
  uint64_t v23 = v31;
  id v24 = v32;
  uint64_t v36 = v32;
  Swift::String v25 = sub_10002C328(v34);
  (*(void (**)(void *, uint64_t, void *))(*(v24 - 1) + 16LL))(v25, v23, v24);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v34);
  sub_10002E92C((uint64_t)v34, &qword_10013C6F0);
  v26._uint64_t countAndFlagsBits = 0LL;
  v26._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v26);
  LogMessage.init(stringInterpolation:)(v11);
  Logger.error(_:)(v20, v12, &protocol witness table for OSLogger);
  __n128 v27 = swift_bridgeObjectRelease(v20);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v13 + 8))(v15, v12, v27);
}

uint64_t sub_1000D92B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v6, (uint64_t)qword_100148618);
  uint64_t v7 = sub_100029E18(&qword_10013EA00);
  uint64_t v8 = type metadata accessor for LogMessage(0LL);
  uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
       + *(void *)(*(void *)(v8 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000012LL, 0x8000000100101D90LL);
  Logger.info(_:)(v9, v6, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = sub_100029EE0( (void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session),  *(void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session + 24));
  uint64_t v11 = *v10;
  uint64_t v12 = *(void **)(*v10 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_stateLock);
  [v12 lock];
  unint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState);
  if ((v13 >> 62) - 2 < 2)
  {
    uint64_t v14 = sub_10007FEE0();
LABEL_8:
    unint64_t v13 = v14;
    goto LABEL_9;
  }

  if (v13 >> 62)
  {
    sub_100029E18((uint64_t *)&unk_1001402F8);
    v21[0] = v13 & 0x3FFFFFFFFFFFFFFFLL;
    swift_retain(v13 & 0x3FFFFFFFFFFFFFFFLL);
    uint64_t v14 = Promise.__allocating_init(value:)(v21);
    goto LABEL_8;
  }

  swift_retain(*(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState));
LABEL_9:
  [v12 unlock];
  uint64_t v15 = swift_allocObject(&unk_1001265D0, 32LL, 7LL);
  *(void *)(v15 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v15 + 24) = a2;
  uint64_t v16 = swift_allocObject(&unk_1001265F8, 32LL, 7LL);
  *(void *)(v16 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v16 + 24) = a2;
  uint64_t v17 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  uint64_t v18 = swift_retain_n(a2, 2LL);
  uint64_t v19 = static OS_dispatch_queue.main.getter(v18);
  void v21[3] = v17;
  v21[4] = &protocol witness table for OS_dispatch_queue;
  v21[0] = v19;
  Promise.then(perform:orCatchError:on:)(sub_1000DBD24, v15, sub_1000DBD2C, v16, v21);
  swift_release(v13);
  swift_release(v15);
  swift_release(v16);
  return sub_100029F4C(v21);
}

uint64_t sub_1000D952C(uint64_t a1, uint64_t (*a2)(void, __n128))
{
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v3 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v3, (uint64_t)qword_100148618);
  uint64_t v4 = sub_100029E18(&qword_10013EA00);
  uint64_t v5 = type metadata accessor for LogMessage(0LL);
  uint64_t v6 = swift_allocObject( v4,  ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL))
       + *(void *)(*(void *)(v5 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v6 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000019LL, 0x8000000100101DE0LL);
  Logger.info(_:)(v6, v3, &protocol witness table for OSLogger);
  __n128 v7 = swift_bridgeObjectRelease(v6);
  return a2(0LL, v7);
}

uint64_t sub_1000D9638(uint64_t a1, void (*a2)(void))
{
  uint64_t v23 = a2;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v10 = sub_10002A768(v6, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  uint64_t v11 = sub_100029E18(&qword_10013EA00);
  uint64_t v12 = type metadata accessor for LogMessage(0LL);
  uint64_t v13 = swift_allocObject( v11,  ((*(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL))
        + *(void *)(*(void *)(v12 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v12 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v13 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(39LL, 1LL);
  v14._object = (void *)0x8000000100101DB0LL;
  v14._uint64_t countAndFlagsBits = 0xD000000000000027LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v14);
  swift_getErrorValue(a1, v28, &v26);
  uint64_t v15 = v26;
  uint64_t v16 = v27;
  void v29[3] = v27;
  uint64_t v17 = sub_10002C328(v29);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v16 - 8) + 16LL))(v17, v15, v16);
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v29);
  sub_10002E92C((uint64_t)v29, &qword_10013C6F0);
  v18._uint64_t countAndFlagsBits = 0LL;
  v18._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v18);
  LogMessage.init(stringInterpolation:)(v5);
  Logger.error(_:)(v13, v6, &protocol witness table for OSLogger);
  __n128 v19 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v7 + 8))(v9, v6, v19);
  swift_getErrorValue(a1, v25, v24);
  uint64_t v20 = sub_100098160(v24[1], v24[2]);
  v23();
  return swift_errorRelease(v20);
}

uint64_t sub_1000D989C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v6, (uint64_t)qword_100148618);
  uint64_t v7 = sub_100029E18(&qword_10013EA00);
  uint64_t v8 = type metadata accessor for LogMessage(0LL);
  uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
       + *(void *)(*(void *)(v8 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000016LL, 0x8000000100101D40LL);
  Logger.info(_:)(v9, v6, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = sub_100029EE0( (void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session),  *(void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session + 24));
  uint64_t v11 = *v10;
  uint64_t v12 = *(void **)(*v10 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_stateLock);
  [v12 lock];
  unint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState);
  if ((v13 >> 62) - 2 < 2)
  {
    uint64_t v14 = sub_10007FEE0();
LABEL_8:
    unint64_t v13 = v14;
    goto LABEL_9;
  }

  if (v13 >> 62)
  {
    sub_100029E18((uint64_t *)&unk_1001402F8);
    v25[0] = v13 & 0x3FFFFFFFFFFFFFFFLL;
    swift_retain(v13 & 0x3FFFFFFFFFFFFFFFLL);
    uint64_t v14 = Promise.__allocating_init(value:)(v25);
    goto LABEL_8;
  }

  swift_retain(*(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState));
LABEL_9:
  [v12 unlock];
  uint64_t v26 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v27 = &protocol witness table for SyncTaskScheduler;
  uint64_t v15 = sub_10002C328(v25);
  SyncTaskScheduler.init()(v15);
  uint64_t v16 = sub_100029E18(&qword_10013DD68);
  uint64_t v17 = Promise.map<A>(on:_:)(v25, sub_1000D9BCC, 0LL, v16);
  swift_release(v13);
  sub_100029F4C(v25);
  uint64_t v18 = swift_allocObject(&unk_100126530, 32LL, 7LL);
  *(void *)(v18 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = swift_allocObject(&unk_100126558, 49LL, 7LL);
  *(void *)(v19 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v19 + 24) = v18;
  *(void *)(v19 + 32) = "getLockupFetcherService(replyHandler:)";
  *(void *)(v19 + 40) = 38LL;
  *(_BYTE *)(v19 + 48) = 2;
  uint64_t v20 = swift_allocObject(&unk_100126580, 49LL, 7LL);
  *(void *)(v20 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v20 + 24) = v18;
  *(void *)(v20 + 32) = "getLockupFetcherService(replyHandler:)";
  *(void *)(v20 + 40) = 38LL;
  *(_BYTE *)(v20 + 48) = 2;
  uint64_t v21 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v18, 2LL);
  uint64_t v22 = swift_retain(a2);
  uint64_t v23 = static OS_dispatch_queue.main.getter(v22);
  uint64_t v26 = v21;
  uint64_t v27 = &protocol witness table for OS_dispatch_queue;
  v25[0] = v23;
  Promise.then(perform:orCatchError:on:)(sub_1000DBCB4, v19, sub_1000DAF40, v20, v25);
  swift_release(v19);
  swift_release(v20);
  sub_100029F4C(v25);
  swift_release(v17);
  return swift_release(v18);
}

void *sub_1000D9BCC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1000DADC0(a1, &qword_10013DD68, a2);
}

uint64_t sub_1000D9C04(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v6, (uint64_t)qword_100148618);
  uint64_t v7 = sub_100029E18(&qword_10013EA00);
  uint64_t v8 = type metadata accessor for LogMessage(0LL);
  uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
       + *(void *)(*(void *)(v8 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x8000000100101CF0LL);
  Logger.info(_:)(v9, v6, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = sub_100029EE0( (void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session),  *(void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session + 24));
  uint64_t v11 = *v10;
  uint64_t v12 = *(void **)(*v10 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_stateLock);
  [v12 lock];
  unint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState);
  if ((v13 >> 62) - 2 < 2)
  {
    uint64_t v14 = sub_10007FEE0();
LABEL_8:
    unint64_t v13 = v14;
    goto LABEL_9;
  }

  if (v13 >> 62)
  {
    sub_100029E18((uint64_t *)&unk_1001402F8);
    v25[0] = v13 & 0x3FFFFFFFFFFFFFFFLL;
    swift_retain(v13 & 0x3FFFFFFFFFFFFFFFLL);
    uint64_t v14 = Promise.__allocating_init(value:)(v25);
    goto LABEL_8;
  }

  swift_retain(*(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState));
LABEL_9:
  [v12 unlock];
  uint64_t v26 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v27 = &protocol witness table for SyncTaskScheduler;
  uint64_t v15 = sub_10002C328(v25);
  SyncTaskScheduler.init()(v15);
  uint64_t v16 = sub_100029E18(&qword_10013DD70);
  uint64_t v17 = Promise.map<A>(on:_:)(v25, sub_1000D9F34, 0LL, v16);
  swift_release(v13);
  sub_100029F4C(v25);
  uint64_t v18 = swift_allocObject(&unk_100126490, 32LL, 7LL);
  *(void *)(v18 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = swift_allocObject(&unk_1001264B8, 49LL, 7LL);
  *(void *)(v19 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v19 + 24) = v18;
  *(void *)(v19 + 32) = "getMetricsService(replyHandler:)";
  *(void *)(v19 + 40) = 32LL;
  *(_BYTE *)(v19 + 48) = 2;
  uint64_t v20 = swift_allocObject(&unk_1001264E0, 49LL, 7LL);
  *(void *)(v20 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v20 + 24) = v18;
  *(void *)(v20 + 32) = "getMetricsService(replyHandler:)";
  *(void *)(v20 + 40) = 32LL;
  *(_BYTE *)(v20 + 48) = 2;
  uint64_t v21 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v18, 2LL);
  uint64_t v22 = swift_retain(a2);
  uint64_t v23 = static OS_dispatch_queue.main.getter(v22);
  uint64_t v26 = v21;
  uint64_t v27 = &protocol witness table for OS_dispatch_queue;
  v25[0] = v23;
  Promise.then(perform:orCatchError:on:)(sub_1000DBCA8, v19, sub_1000DAF40, v20, v25);
  swift_release(v19);
  swift_release(v20);
  sub_100029F4C(v25);
  swift_release(v17);
  return swift_release(v18);
}

void *sub_1000D9F34@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1000DADC0(a1, &qword_10013DD70, a2);
}

uint64_t sub_1000D9F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v8, (uint64_t)qword_100148618);
  uint64_t v9 = sub_100029E18(&qword_10013EA00);
  uint64_t v10 = type metadata accessor for LogMessage(0LL);
  uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
        + *(void *)(*(void *)(v10 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD00000000000001BLL, 0x8000000100101CA0LL);
  Logger.info(_:)(v11, v8, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = sub_100029EE0( (void *)(v4 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session),  *(void *)(v4 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session + 24));
  uint64_t v13 = *v12;
  uint64_t v14 = *(void **)(*v12 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_stateLock);
  [v14 lock];
  unint64_t v15 = *(void *)(v13 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState);
  if ((v15 >> 62) - 2 < 2)
  {
    uint64_t v16 = sub_10007FEE0();
LABEL_8:
    unint64_t v15 = v16;
    goto LABEL_9;
  }

  if (v15 >> 62)
  {
    sub_100029E18((uint64_t *)&unk_1001402F8);
    v34[0] = v15 & 0x3FFFFFFFFFFFFFFFLL;
    swift_retain(v15 & 0x3FFFFFFFFFFFFFFFLL);
    uint64_t v16 = Promise.__allocating_init(value:)(v34);
    goto LABEL_8;
  }

  swift_retain(*(void *)(v13 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState));
LABEL_9:
  [v14 unlock];
  uint64_t v17 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v35 = v17;
  uint64_t v36 = &protocol witness table for SyncTaskScheduler;
  uint64_t v18 = sub_10002C328(v34);
  SyncTaskScheduler.init()(v18);
  uint64_t v19 = sub_100029E18(&qword_100140308);
  uint64_t v20 = sub_100044410( (unint64_t *)&unk_100140310,  &qword_100140308,  (uint64_t)&protocol conformance descriptor for Promise<A>);
  uint64_t v21 = Promise.flatMap<A>(on:_:)(v34, sub_1000DA368, 0LL, v19, v20);
  swift_release(v15);
  sub_100029F4C(v34);
  uint64_t v22 = swift_allocObject(&unk_1001261E8, 24LL, 7LL);
  *(void *)(v22 + swift_weakDestroy(v0 + 16) = a1;
  uint64_t v23 = swift_allocObject(&unk_100126210, 32LL, 7LL);
  *(void *)(v23 + swift_weakDestroy(v0 + 16) = sub_1000DAF68;
  *(void *)(v23 + 24) = v22;
  uint64_t v35 = v17;
  uint64_t v36 = &protocol witness table for SyncTaskScheduler;
  sub_10002C328(v34);
  uint64_t v24 = swift_unknownObjectRetain(a1);
  SyncTaskScheduler.init()(v24);
  uint64_t v25 = type metadata accessor for AppOfferStateClient();
  uint64_t v26 = Promise.map<A>(on:_:)(v34, sub_1000DAF94, v23, v25);
  swift_release(v21);
  swift_release(v23);
  sub_100029F4C(v34);
  uint64_t v27 = swift_allocObject(&unk_100126238, 32LL, 7LL);
  *(void *)(v27 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v27 + 24) = a3;
  uint64_t v28 = swift_allocObject(&unk_100126260, 49LL, 7LL);
  *(void *)(v28 + swift_weakDestroy(v0 + 16) = sub_100092718;
  *(void *)(v28 + 24) = v27;
  *(void *)(v28 + 32) = "getAppOfferStateService(for:withReplyHandler:)";
  *(void *)(v28 + 40) = 46LL;
  *(_BYTE *)(v28 + 48) = 2;
  uint64_t v29 = swift_allocObject(&unk_100126288, 49LL, 7LL);
  *(void *)(v29 + swift_weakDestroy(v0 + 16) = sub_100092718;
  *(void *)(v29 + 24) = v27;
  *(void *)(v29 + 32) = "getAppOfferStateService(for:withReplyHandler:)";
  *(void *)(v29 + 40) = 46LL;
  *(_BYTE *)(v29 + 48) = 2;
  uint64_t v30 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v27, 2LL);
  uint64_t v31 = swift_retain(a3);
  uint64_t v32 = static OS_dispatch_queue.main.getter(v31);
  uint64_t v35 = v30;
  uint64_t v36 = &protocol witness table for OS_dispatch_queue;
  v34[0] = v32;
  Promise.then(perform:orCatchError:on:)(sub_1000DAFF8, v28, sub_1000DAF40, v29, v34);
  swift_release(v28);
  swift_release(v29);
  sub_100029F4C(v34);
  swift_release(v26);
  return swift_release(v27);
}

uint64_t sub_1000DA368(uint64_t *a1)
{
  uint64_t v2 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = *a1;
  uint64_t v6 = v5 + qword_10013FCF0;
  swift_beginAccess(v5 + qword_10013FCF0, v21, 0LL, 0LL);
  sub_1000320E4(v6, (uint64_t)&v19, &qword_10013C7E0);
  if (v20)
  {
    sub_10002C438(&v19, (uint64_t)v22);
    sub_100029E18((uint64_t *)&unk_1001402F8);
    *(void *)&__int128 v19 = v5;
    swift_retain(v5);
    uint64_t v7 = Promise.__allocating_init(value:)(&v19);
    sub_1000388F0((uint64_t)v22, (uint64_t)&v19);
    uint64_t v8 = swift_allocObject(&unk_100126418, 56LL, 7LL);
    sub_10002C438(&v19, v8 + 16);
    uint64_t v9 = sub_100029E18(&qword_1001403B8);
    uint64_t v10 = Promise.__allocating_init()(v9);
    uint64_t v11 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v4, 1LL, 1LL, v11);
    uint64_t v12 = (void *)swift_allocObject(&unk_100126440, 56LL, 7LL);
    void v12[2] = 0LL;
    v12[3] = 0LL;
    v12[4] = &unk_1001403B0;
    v12[5] = v8;
    v12[6] = v10;
    swift_retain(v10);
    uint64_t v13 = sub_1000B3448((uint64_t)v4, (uint64_t)&unk_1001403C0, (uint64_t)v12);
    swift_release(v13);
    uint64_t v14 = sub_100044410(&qword_1001403C8, &qword_1001403B8, (uint64_t)&protocol conformance descriptor for Promise<A>);
    uint64_t v15 = Promise.join<A>(with:)(v10, v9, v14);
    swift_release(v7);
    swift_release(v10);
    sub_100029F4C(v22);
    return v15;
  }

  else
  {
    sub_10002E92C((uint64_t)&v19, &qword_10013C7E0);
    uint64_t v17 = sub_100029E18((uint64_t *)&unk_10013DD40);
    uint64_t result = dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)(v17, v17);
    __break(1u);
  }

  return result;
}

uint64_t sub_1000DA584(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_task_switch(sub_1000DA59C, 0LL, 0LL);
}

uint64_t sub_1000DA59C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  sub_100029EE0(v1, v2);
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AppStateController.loadDataSources()[1]);
  *(void *)(v0 + 32) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000DA608;
  return dispatch thunk of AppStateController.loadDataSources()(v2, v3);
}

uint64_t sub_1000DA608()
{
  uint64_t v2 = *(void *)(*v1 + 32);
  uint64_t v3 = *v1;
  swift_task_dealloc(v2);
  if (v0) {
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else {
    return swift_task_switch(sub_1000DA674, 0LL, 0LL);
  }
}

uint64_t sub_1000DA674()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000DA6A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 + qword_10013FCF8;
  swift_beginAccess(a1 + qword_10013FCF8, v41, 0LL, 0LL);
  sub_1000320E4(v6, (uint64_t)&v32, (uint64_t *)&unk_10013DCB0);
  if (v33)
  {
    sub_10002C438(&v32, (uint64_t)v42);
    uint64_t v7 = a1 + qword_10013FD08;
    swift_beginAccess(a1 + qword_10013FD08, v39, 0LL, 0LL);
    sub_1000320E4(v7, (uint64_t)&v32, (uint64_t *)&unk_10013FD68);
    if (v33)
    {
      sub_10002C438(&v32, (uint64_t)v40);
      uint64_t v8 = sub_100029E18(&qword_10013DCC0);
      uint64_t v9 = type metadata accessor for ObjectGraph(0LL);
      swift_retain(a1);
      inject<A, B>(_:from:)(v38, v8, a1, v8, v9);
      uint64_t v10 = sub_100029E18((uint64_t *)&unk_100140320);
      inject<A, B>(_:from:)(v37, v10, a1, v10, v9);
      uint64_t v11 = type metadata accessor for JSStackManager(0LL);
      inject<A, B>(_:from:)(&v36, v11, a1, v11, v9);
      uint64_t v12 = sub_100029E18(&qword_10013C6B0);
      inject<A, B>(_:from:)(v35, v12, a1, v12, v9);
      sub_1000388F0(a2, (uint64_t)&v32);
      swift_unknownObjectRetain(a3);
      inject<A, B>(_:from:)(v34, v10, a1, v10, v9);
      uint64_t v13 = sub_10002ACB8((uint64_t)v38, v38[3]);
      __n128 v14 = __chkstk_darwin(v13);
      uint64_t v16 = (uint64_t *)((char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      (*(void (**)(uint64_t *, __n128))(v17 + 16))(v16, v14);
      uint64_t v18 = sub_10002ACB8((uint64_t)v37, v37[3]);
      __n128 v19 = __chkstk_darwin(v18);
      uint64_t v21 = (uint64_t *)((char *)&v30 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      (*(void (**)(uint64_t *, __n128))(v22 + 16))(v21, v19);
      uint64_t v23 = v36;
      sub_10007EE98((uint64_t)&v32, (uint64_t)v31);
      uint64_t v24 = *v16;
      uint64_t v25 = *v21;
      swift_retain(v23);
      id v26 = sub_1000DB878(a1, v43, v42, (uint64_t)v40, v24, v25, v23, v35, a3, v31);
      swift_release(a1);
      swift_unknownObjectRelease(a3);
      sub_10007EED4(&v32);
      swift_release(v36);
      sub_100029F4C(v37);
      sub_100029F4C(v38);
      return (uint64_t)v26;
    }

    swift_retain(a1);
    sub_10002E92C((uint64_t)&v32, (uint64_t *)&unk_10013FD68);
    uint64_t v28 = (uint64_t *)&unk_10013DD30;
  }

  else
  {
    swift_retain(a1);
    sub_10002E92C((uint64_t)&v32, (uint64_t *)&unk_10013DCB0);
    uint64_t v28 = (uint64_t *)&unk_10013CE70;
  }

  uint64_t v29 = sub_100029E18(v28);
  uint64_t result = dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)(v29, v29);
  __break(1u);
  return result;
}

uint64_t sub_1000DAA74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v6 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v6, (uint64_t)qword_100148618);
  uint64_t v7 = sub_100029E18(&qword_10013EA00);
  uint64_t v8 = type metadata accessor for LogMessage(0LL);
  uint64_t v9 = swift_allocObject( v7,  ((*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL))
       + *(void *)(*(void *)(v8 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v8 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v9 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000017LL, 0x8000000100101C30LL);
  Logger.info(_:)(v9, v6, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = sub_100029EE0( (void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session),  *(void *)(v3 + OBJC_IVAR____TtC19appstorecomponentsd19ServiceBrokerClient_session + 24));
  uint64_t v11 = *v10;
  uint64_t v12 = *(void **)(*v10 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_stateLock);
  [v12 lock];
  unint64_t v13 = *(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState);
  if ((v13 >> 62) - 2 < 2)
  {
    uint64_t v14 = sub_10007FEE0();
LABEL_8:
    unint64_t v13 = v14;
    goto LABEL_9;
  }

  if (v13 >> 62)
  {
    sub_100029E18((uint64_t *)&unk_1001402F8);
    v25[0] = v13 & 0x3FFFFFFFFFFFFFFFLL;
    swift_retain(v13 & 0x3FFFFFFFFFFFFFFFLL);
    uint64_t v14 = Promise.__allocating_init(value:)(v25);
    goto LABEL_8;
  }

  swift_retain(*(void *)(v11 + OBJC_IVAR____TtC19appstorecomponentsd16BootstrapSession_bootstrapState));
LABEL_9:
  [v12 unlock];
  uint64_t v26 = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v27 = &protocol witness table for SyncTaskScheduler;
  uint64_t v15 = sub_10002C328(v25);
  SyncTaskScheduler.init()(v15);
  uint64_t v16 = sub_100029E18(&qword_10013DD78);
  uint64_t v17 = Promise.map<A>(on:_:)(v25, sub_1000DADA4, 0LL, v16);
  swift_release(v13);
  sub_100029F4C(v25);
  uint64_t v18 = swift_allocObject(&unk_100126148, 32LL, 7LL);
  *(void *)(v18 + swift_weakDestroy(v0 + 16) = a1;
  *(void *)(v18 + 24) = a2;
  uint64_t v19 = swift_allocObject(&unk_100126170, 49LL, 7LL);
  *(void *)(v19 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v19 + 24) = v18;
  *(void *)(v19 + 32) = "getUtilityService(replyHandler:)";
  *(void *)(v19 + 40) = 32LL;
  *(_BYTE *)(v19 + 48) = 2;
  uint64_t v20 = swift_allocObject(&unk_100126198, 49LL, 7LL);
  *(void *)(v20 + swift_weakDestroy(v0 + 16) = sub_1000BF0D8;
  *(void *)(v20 + 24) = v18;
  *(void *)(v20 + 32) = "getUtilityService(replyHandler:)";
  *(void *)(v20 + 40) = 32LL;
  *(_BYTE *)(v20 + 48) = 2;
  uint64_t v21 = sub_10002A030(0LL, (unint64_t *)&qword_10013CBB0, &OBJC_CLASS___OS_dispatch_queue_ptr);
  swift_retain_n(v18, 2LL);
  uint64_t v22 = swift_retain(a2);
  uint64_t v23 = static OS_dispatch_queue.main.getter(v22);
  uint64_t v26 = v21;
  uint64_t v27 = &protocol witness table for OS_dispatch_queue;
  v25[0] = v23;
  Promise.then(perform:orCatchError:on:)(sub_1000DAF34, v19, sub_1000DAF40, v20, v25);
  swift_release(v19);
  swift_release(v20);
  sub_100029F4C(v25);
  swift_release(v17);
  return swift_release(v18);
}

void *sub_1000DADA4@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_1000DADC0(a1, &qword_10013DD78, a2);
}

void *sub_1000DADC0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v4 = *a1;
  uint64_t v5 = sub_100029E18(a2);
  uint64_t v6 = type metadata accessor for ObjectGraph(0LL);
  return inject<A, B>(_:from:)(a3, v5, v4, v5, v6);
}

uint64_t sub_1000DAE38( void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = swift_allocObject(a4, 24LL, 7LL);
  *(void *)(v11 + swift_weakDestroy(v0 + 16) = v10;
  id v12 = a1;
  a6(a5, v11);

  return swift_release(v11);
}

uint64_t type metadata accessor for ServiceBrokerClient()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd19ServiceBrokerClient);
}

uint64_t sub_1000DAF10()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000DAF34(uint64_t *a1)
{
  return sub_1000DBCC0(a1, &qword_10013DD78);
}

uint64_t sub_1000DAF44()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000DAF68(uint64_t a1, uint64_t a2)
{
  return sub_1000DA6A8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000DAF70()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000DAF94@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void, void *))(v2 + 16))(*a1, a1 + 1);
  *a2 = result;
  return result;
}

uint64_t sub_1000DAFD4()
{
  return swift_deallocObject(v0, 49LL, 7LL);
}

uint64_t sub_1000DAFF8(void **a1)
{
  return sub_1000D8DB4( *a1,  *(void (**)(void *, void))(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(unsigned __int8 *)(v1 + 48));
}

id sub_1000DB00C( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, _OWORD *a10, char *a11)
{
  uint64_t v77 = a8;
  char v60 = (void *)a4;
  uint64_t v76 = a2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType(a11);
  uint64_t v75 = sub_100029E18(&qword_100140330);
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v73 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v72 = sub_100029E18(&qword_100140338);
  uint64_t v71 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  id v70 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v69 = sub_100029E18(&qword_100140340);
  uint64_t v68 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  id v67 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v66 = sub_100029E18(&qword_100140348);
  uint64_t v65 = *(void *)(v66 - 8);
  __chkstk_darwin(v66);
  id v64 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = sub_100029E18((uint64_t *)&unk_100140350);
  uint64_t v61 = *(void *)(v62 - 8);
  __chkstk_darwin(v62);
  uint64_t v22 = (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v87[3] = type metadata accessor for JSStackManager(0LL);
  v87[4] = &off_1001244C8;
  v87[0] = a7;
  uint64_t v85 = type metadata accessor for ASDContingentPricingSubscriptionManager();
  uint64_t v86 = &off_100122948;
  uint64_t v84 = a5;
  uint64_t v82 = type metadata accessor for LegacyAppStoreInstallStateMonitor();
  unint64_t v83 = &off_100124740;
  v81[0] = a6;
  v80[3] = &type metadata for DeviceAppDistribution;
  void v80[4] = &off_100122F98;
  uint64_t v23 = (_OWORD *)swift_allocObject(&unk_1001262B0, 96LL, 7LL);
  v80[0] = v23;
  __int128 v24 = a10[3];
  v23[3] = a10[2];
  void v23[4] = v24;
  v23[5] = a10[4];
  __int128 v25 = a10[1];
  v23[1] = *a10;
  void v23[2] = v25;
  *(void *)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_objectGraph] = a1;
  uint64_t v26 = v76;
  sub_1000388F0( (uint64_t)v76,  (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appStateController]);
  sub_1000388F0( (uint64_t)a3,  (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_arcadeSubscription]);
  uint64_t v27 = v60;
  sub_1000388F0((uint64_t)v60, (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_restrictions]);
  sub_1000388F0( (uint64_t)&v84,  (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_contingentOffers]);
  sub_1000388F0( (uint64_t)v81,  (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appStoreInstallStateMonitor]);
  sub_1000388F0((uint64_t)v87, (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_jsStackManager]);
  sub_1000388F0((uint64_t)v77, (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_localizer]);
  *(void *)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_delegate] = a9;
  sub_1000388F0((uint64_t)v80, (uint64_t)&a11[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_appDistribution]);
  id v28 = objc_allocWithZone(&OBJC_CLASS___NSLock);
  uint64_t v29 = a11;
  swift_retain(a1);
  swift_unknownObjectRetain(a9);
  id v30 = [v28 init];
  *(void *)&v29[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_stateLock] = v30;
  *(void *)&v29[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_observations] = sub_100047FE8(_swiftEmptyArrayStorage);
  v29[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_isUpdatingArcadeSubscription] = 0;
  v29[OBJC_IVAR____TtC19appstorecomponentsd19AppOfferStateClient_isUpdatingContingentOfferSubscription] = 0;

  v79.receiver = v29;
  v79.super_class = ObjectType;
  id v31 = objc_msgSendSuper2(&v79, "init");
  uint64_t v32 = v26[3];
  uint64_t v33 = v26[4];
  sub_100029EE0(v26, v32);
  id v34 = v31;
  uint64_t v35 = dispatch thunk of AppStateController.onStateChange.getter(v32, v33);
  uint64_t v36 = sub_100029E18(&qword_10013D2B8);
  uint64_t v37 = sub_100044410( (unint64_t *)&unk_100140360,  &qword_10013D2B8,  (uint64_t)&protocol conformance descriptor for AsyncEvent<A>);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v78, v36, v37);
  EventEmitter.addObserver<A>(on:target:method:)(v78, v34, sub_1000D8650, 0LL, v36, ObjectType, v37);
  swift_release(v35);
  sub_100029F4C(v78);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v22, v62);
  char v63 = a3;
  uint64_t v38 = a3[3];
  uint64_t v39 = a3[4];
  sub_100029EE0(a3, v38);
  uint64_t v40 = dispatch thunk of ArcadeSubscriptionManager.onSubscriptionStateChange.getter(v38, v39);
  uint64_t v41 = sub_100029E18(&qword_10013CF40);
  uint64_t v42 = sub_100044410( (unint64_t *)&unk_100140370,  &qword_10013CF40,  (uint64_t)&protocol conformance descriptor for AsyncEvent<A>);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v78, v41, v42);
  uint64_t v43 = v64;
  EventEmitter.addObserver<A>(on:target:method:)(v78, v34, sub_1000D86C8, 0LL, v41, ObjectType, v42);
  swift_release(v40);
  sub_100029F4C(v78);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v43, v66);
  uint64_t v44 = v27[3];
  uint64_t v45 = v27[4];
  sub_100029EE0(v27, v44);
  uint64_t v46 = dispatch thunk of Restrictions.onRestrictionsChange.getter(v44, v45);
  uint64_t v47 = sub_100029E18(&qword_100140248);
  uint64_t v48 = sub_100044410( (unint64_t *)&unk_100140380,  &qword_100140248,  (uint64_t)&protocol conformance descriptor for AsyncEvent<A>);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v78, v47, v48);
  uint64_t v49 = v67;
  EventEmitter.addObserver<A>(on:target:method:)(v78, v34, sub_1000D871C, 0LL, v47, ObjectType, v48);
  swift_release(v46);
  sub_100029F4C(v78);
  (*(void (**)(char *, uint64_t))(v68 + 8))(v49, v69);
  uint64_t v50 = *(void *)(*sub_100029EE0(&v84, v85) + 32LL);
  uint64_t v51 = sub_100029E18(&qword_10013E310);
  uint64_t v52 = sub_100044410( (unint64_t *)&unk_100140390,  &qword_10013E310,  (uint64_t)&protocol conformance descriptor for AsyncEvent<A>);
  swift_retain(v50);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v78, v51, v52);
  uint64_t v53 = v70;
  EventEmitter.addObserver<A>(on:target:method:)(v78, v34, sub_1000D8770, 0LL, v51, ObjectType, v52);
  swift_release(v50);
  sub_100029F4C(v78);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v53, v72);
  uint64_t v54 = *(void *)(*sub_100029EE0(v81, v82) + 24LL);
  uint64_t v55 = sub_100029E18(&qword_10013DEA8);
  uint64_t v56 = sub_100044410(&qword_1001403A0, &qword_10013DEA8, (uint64_t)&protocol conformance descriptor for AsyncEvent<A>);
  swift_retain(v54);
  dispatch thunk of static EventEmitter.defaultScheduler.getter(v78, v55, v56);
  unint64_t v57 = v73;
  EventEmitter.addObserver<A>(on:target:method:)(v78, v34, sub_1000D87E8, 0LL, v55, ObjectType, v56);
  swift_release(v54);
  sub_100029F4C(v78);
  (*(void (**)(char *, uint64_t))(v74 + 8))(v57, v75);
  id v58 = [(id)objc_opt_self(NSNotificationCenter) defaultCenter];
  [v58 addObserver:v34 selector:"didChangeAppCapabilities:" name:ASDAppCapabilitiesDidChangeNotification object:0];

  sub_100029F4C(v80);
  sub_100029F4C(v77);
  sub_100029F4C(v87);
  sub_100029F4C(v81);
  sub_100029F4C(&v84);
  sub_100029F4C(v27);
  sub_100029F4C(v63);
  sub_100029F4C(v76);
  return v34;
}

id sub_1000DB878( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, _OWORD *a10)
{
  uint64_t v39 = a7;
  uint64_t v40 = a8;
  uint64_t v16 = type metadata accessor for ASDContingentPricingSubscriptionManager();
  void v47[3] = v16;
  v47[4] = &off_100122948;
  v47[0] = a5;
  uint64_t v45 = type metadata accessor for LegacyAppStoreInstallStateMonitor();
  uint64_t v46 = &off_100124740;
  v44[0] = a6;
  uint64_t v42 = &type metadata for DeviceAppDistribution;
  uint64_t v43 = &off_100122F98;
  uint64_t v17 = (_OWORD *)swift_allocObject(&unk_1001262B0, 96LL, 7LL);
  v41[0] = v17;
  __int128 v18 = a10[3];
  v17[3] = a10[2];
  v17[4] = v18;
  v17[5] = a10[4];
  __int128 v19 = a10[1];
  v17[1] = *a10;
  v17[2] = v19;
  uint64_t v20 = (char *)objc_allocWithZone((Class)type metadata accessor for AppOfferStateClient());
  uint64_t v21 = sub_10002ACB8((uint64_t)v47, v16);
  __n128 v22 = __chkstk_darwin(v21);
  __int128 v24 = (uint64_t *)((char *)&v38 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *, __n128))(v25 + 16))(v24, v22);
  uint64_t v26 = sub_10002ACB8((uint64_t)v44, v45);
  __n128 v27 = __chkstk_darwin(v26);
  uint64_t v29 = (uint64_t *)((char *)&v38 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *, __n128))(v30 + 16))(v29, v27);
  uint64_t v31 = sub_10002ACB8((uint64_t)v41, (uint64_t)v42);
  __n128 v32 = __chkstk_darwin(v31);
  id v34 = (_OWORD *)((char *)&v38 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(_OWORD *, __n128))(v35 + 16))(v34, v32);
  id v36 = sub_1000DB00C(a1, a2, a3, a4, *v24, *v29, v39, v40, a9, v34, v20);
  sub_100029F4C(v41);
  sub_100029F4C(v44);
  sub_100029F4C(v47);
  return v36;
}

uint64_t sub_1000DBA9C()
{
  return swift_deallocObject(v0, 96LL, 7LL);
}

uint64_t sub_1000DBAC8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_1000DBAEC(uint64_t a1)
{
  return sub_100039A48(a1, *(void *)(v1 + 16));
}

id sub_1000DBAF4(uint64_t a1)
{
  return sub_100039908(a1, *(void *)(v1 + 16));
}

id sub_1000DBAFC(uint64_t a1)
{
  return sub_1000397D0(a1, *(void *)(v1 + 16));
}

id sub_1000DBB04(uint64_t a1)
{
  return sub_100039698(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000DBB0C(uint64_t a1, uint64_t a2)
{
  return sub_1000393B8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_1000DBB14(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = sub_100029E18(&qword_10013CB58);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_1000DBB58()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000DBB7C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc(dword_1001403AC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10002A858;
  void v4[2] = a1;
  void v4[3] = v1 + 16;
  return swift_task_switch(sub_1000DA59C, 0LL, 0LL);
}

uint64_t sub_1000DBBE0()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000DBC14(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = (void *)swift_task_alloc(dword_10013F32C);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10002A858;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t))((char *)&dword_10013F328
                                                                                     + dword_10013F328))( a1,  v4,  v5,  v6,  v7,  v8);
}

uint64_t sub_1000DBCA8(uint64_t *a1)
{
  return sub_1000DBCC0(a1, &qword_10013DD70);
}

uint64_t sub_1000DBCB4(uint64_t *a1)
{
  return sub_1000DBCC0(a1, &qword_10013DD68);
}

uint64_t sub_1000DBCC0(uint64_t *a1, uint64_t *a2)
{
  return sub_1000D8B3C( *a1,  *(void (**)(void *, void))(v2 + 16),  *(void *)(v2 + 24),  *(void *)(v2 + 32),  *(void *)(v2 + 40),  *(unsigned __int8 *)(v2 + 48),  (void (*)(uint64_t))&_swift_unknownObjectRetain,  (void (*)(uint64_t))&_swift_unknownObjectRelease,  a2);
}

uint64_t sub_1000DBD04(uint64_t a1)
{
  return sub_1000D9014( a1,  *(void (**)(void *, uint64_t))(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(unsigned __int8 *)(v1 + 48));
}

uint64_t sub_1000DBD24(uint64_t a1)
{
  return sub_1000D952C(a1, *(uint64_t (**)(void, __n128))(v1 + 16));
}

uint64_t sub_1000DBD2C(uint64_t a1)
{
  return sub_1000D9638(a1, *(void (**)(void))(v1 + 16));
}

id sub_1000DBD94()
{
  uint64_t v1 = v0;
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v2 = type metadata accessor for OSLogger(0LL);
  sub_10002A768(v2, (uint64_t)qword_1001485E8);
  uint64_t v3 = sub_100029E18(&qword_10013EA00);
  uint64_t v4 = type metadata accessor for LogMessage(0LL);
  uint64_t v5 = swift_allocObject( v3,  ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL))
       + *(void *)(*(void *)(v4 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v5 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.init(stringLiteral:)(0xD000000000000024LL, 0x8000000100101E60LL);
  Logger.info(_:)(v5, v2, &protocol witness table for OSLogger);
  *(void *)&double v6 = swift_bridgeObjectRelease(v5).n128_u64[0];
  uint64_t v7 = *(void **)(v1 + 48);
  objc_msgSend(v7, "lock", v6);
  uint64_t v8 = *(void *)(v1 + 56);
  if (v8)
  {
    uint64_t v9 = swift_retain(*(void *)(v1 + 56));
    dispatch thunk of DispatchWorkItem.cancel()(v9);
    swift_release(v8);
    uint64_t v10 = *(void *)(v1 + 56);
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  *(void *)(v1 + 56) = 0LL;
  swift_release(v10);
  return [v7 unlock];
}

uint64_t sub_1000DBEE0()
{
  swift_release(*(void *)(v0 + 56));
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t type metadata accessor for ShutdownTimer()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd13ShutdownTimer);
}

uint64_t sub_1000DBF3C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v25 = *(void *)(v8 - 8);
  uint64_t v26 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v11);
  unint64_t v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)(v4 + 56) = 0LL;
  *(void *)(v4 + 24) = a1;
  *(void *)(v4 + 32) = a2;
  *(double *)(v4 + swift_weakDestroy(v0 + 16) = a3;
  sub_100032130();
  uint64_t v17 = swift_retain(a2);
  uint64_t v18 = static DispatchQoS.background.getter(v17);
  uint64_t v19 = static OS_dispatch_queue.main.getter(v18);
  __n128 v27 = _swiftEmptyArrayStorage;
  uint64_t v20 = sub_100027978( (unint64_t *)&qword_10013DD90,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v21 = sub_100029E18(&qword_10013D2F8);
  uint64_t v22 = sub_100062254((unint64_t *)&qword_10013DDA0, &qword_10013D2F8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v27, v21, v22, v11, v20);
  (*(void (**)(char *, void, uint64_t))(v25 + 104))( v10,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v26);
  *(void *)(v4 + 40) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000026LL,  0x8000000100101E90LL,  v16,  v13,  v10,  v19);
  *(void *)(v4 + 48) = [objc_allocWithZone(JEUnfairLock) init];
  return v4;
}

ValueMetadata *type metadata accessor for SimpleMetricsFieldsBuilder()
{
  return &type metadata for SimpleMetricsFieldsBuilder;
}

void sub_1000DC160(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_1000DC1B8()
{
  return swift_bridgeObjectRetain(*v0);
}

ValueMetadata *type metadata accessor for StatefulOfferActionImplementation()
{
  return &type metadata for StatefulOfferActionImplementation;
}

unint64_t sub_1000DC1D4()
{
  unint64_t result = qword_10013C4C0;
  if (!qword_10013C4C0)
  {
    uint64_t v1 = sub_10002A030(255LL, &qword_10013C4B8, off_10011E570);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ASCStatefulOffer, v1);
    atomic_store(result, (unint64_t *)&qword_10013C4C0);
  }

  return result;
}

uint64_t sub_1000DC22C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[41] = a2;
  v3[42] = a3;
  v3[40] = a1;
  uint64_t v4 = sub_100029E18(&qword_10013C6C8);
  v3[43] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[44] = v5;
  v3[45] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100029E18(&qword_10013CBA0);
  v3[46] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[47] = v7;
  v3[48] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for MetricsFieldsContext(0LL);
  v3[49] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[50] = v9;
  unint64_t v10 = (*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[51] = swift_task_alloc(v10);
  v3[52] = swift_task_alloc(v10);
  uint64_t v11 = type metadata accessor for AppOffer(0LL);
  v3[53] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v3[54] = v12;
  v3[55] = swift_task_alloc((*(void *)(v12 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for State(0LL);
  v3[56] = v13;
  uint64_t v14 = *(void *)(v13 - 8);
  v3[57] = v14;
  v3[58] = swift_task_alloc((*(void *)(v14 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for App.Kind(0LL);
  v3[59] = v15;
  uint64_t v16 = *(void *)(v15 - 8);
  v3[60] = v16;
  v3[61] = swift_task_alloc((*(void *)(v16 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for AdamID(0LL);
  v3[62] = swift_task_alloc((*(void *)(*(void *)(v17 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = type metadata accessor for App(0LL);
  v3[63] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v3[64] = v19;
  v3[65] = swift_task_alloc((*(void *)(v19 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000DC3B8, 0LL, 0LL);
}

uint64_t sub_1000DC3B8()
{
  uint64_t v1 = *(void *)(v0 + 328) + qword_10013FCF0;
  swift_beginAccess(v1, v0 + 256, 0LL, 0LL);
  sub_100030628(v1, v0 + 136);
  if (*(void *)(v0 + 160))
  {
    uint64_t v2 = *(void **)(v0 + 336);
    sub_10002C438((__int128 *)(v0 + 136), v0 + 96);
    id v3 = [v2 id];
    AdamID.init(value:)([v3 int64value]);
    uint64_t v14 = *(void *)(v0 + 520);
    uint64_t v16 = *(void *)(v0 + 488);
    uint64_t v15 = *(void *)(v0 + 496);
    uint64_t v17 = *(void *)(v0 + 464);
    uint64_t v19 = *(void *)(v0 + 432);
    uint64_t v18 = *(void *)(v0 + 440);
    uint64_t v64 = *(void *)(v0 + 424);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 480) + 104LL))( v16,  enum case for App.Kind.store(_:),  *(void *)(v0 + 472));
    App.init(id:kind:)(v15, v16);

    uint64_t v20 = *(void *)(v0 + 120);
    uint64_t v21 = *(void *)(v0 + 128);
    sub_100029EE0((void *)(v0 + 96), v20);
    sub_10003908C();
    uint64_t v22 = (__int128 *)(v0 + 216);
    AppStateController.state(forApp:applying:)(v14, v18, v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v64);
    id v23 = sub_1000710BC(v17);
    *(void *)(v0 + 528) = v23;
    sub_100029170((uint64_t)v23, v0 + 216);
    if (*(void *)(v0 + 240))
    {
      uint64_t v24 = *(void *)(v0 + 336);
      sub_10002C438(v22, v0 + 176);
      uint64_t v25 = sub_10002A030(0LL, (unint64_t *)&qword_10013FD90, off_10011E548);
      uint64_t v26 = BaseObjectGraph.optional<A>(_:)(v25, v25);
      __n128 v27 = *(void **)(v0 + 296);
      MetricsFieldsContext.init()(v26);
      *(void *)(v0 + 304) = v24;
      if (qword_10013BBA8 != -1) {
        swift_once(&qword_10013BBA8, sub_10004911C);
      }
      uint64_t v28 = sub_100029E18(qword_10013CD50);
      uint64_t v29 = sub_10002A768(v28, (uint64_t)qword_100148518);
      uint64_t v30 = sub_100029E18(&qword_10013C410);
      MetricsFieldsContext.addValue<A>(_:forProperty:)(v0 + 304, v29, v30);
      if (v27)
      {
        *(void *)(v0 + 312) = v27;
        uint64_t v31 = qword_10013BB90;
        id v32 = v27;
        if (v31 != -1) {
          swift_once(&qword_10013BB90, sub_10002A650);
        }
        uint64_t v33 = sub_100029E18((uint64_t *)&unk_10013F9D0);
        uint64_t v34 = sub_10002A768(v33, (uint64_t)qword_1001484E8);
        MetricsFieldsContext.addValue<A>(_:forProperty:)(v0 + 312, v34, v25);
      }

      uint64_t v35 = *(void *)(v0 + 416);
      id v36 = v27;
      uint64_t v38 = *(void *)(v0 + 392);
      uint64_t v37 = *(void *)(v0 + 400);
      uint64_t v39 = *(void **)(v0 + 384);
      uint64_t v41 = *(void *)(v0 + 360);
      uint64_t v40 = *(void *)(v0 + 368);
      uint64_t v42 = *(void *)(v0 + 352);
      uint64_t v67 = *(void *)(v0 + 344);
      uint64_t v43 = *(void *)(v0 + 328);
      (*(void (**)(uint64_t, void, uint64_t))(v37 + 32))(v35, *(void *)(v0 + 408), v38);

      uint64_t v44 = type metadata accessor for ObjectGraph(0LL);
      inject<A, B>(_:from:)(v39, v40, v43, v40, v44);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v37 + 16))(v41, v35, v38);
      (*(void (**)(uint64_t, void, uint64_t))(v42 + 104))( v41,  enum case for ActionDispatcher.MetricsBehavior.fromAction<A>(_:),  v67);
      uint64_t v45 = (void *)swift_task_alloc(async function pointer to ActionDispatcher.perform(_:withMetrics:asPartOf:)[1]);
      *(void *)(v0 + 536) = v45;
      *uint64_t v45 = v0;
      v45[1] = sub_1000DC96C;
      return ActionDispatcher.perform(_:withMetrics:asPartOf:)( *(void *)(v0 + 320),  v0 + 176,  *(void *)(v0 + 360),  *(void *)(v0 + 328),  *(void *)(v0 + 368));
    }

    else
    {
      uint64_t v63 = *(void *)(v0 + 504);
      uint64_t v65 = *(void *)(v0 + 520);
      uint64_t v46 = *(void *)(v0 + 456);
      uint64_t v61 = *(void *)(v0 + 464);
      uint64_t v62 = *(void *)(v0 + 512);
      uint64_t v60 = *(void *)(v0 + 448);
      sub_10002E92C((uint64_t)v22, (uint64_t *)&unk_10013CBC0);
      type metadata accessor for ASCAppOfferActionError(0LL);
      uint64_t v48 = v47;
      *(void *)(v0 + 280) = 2LL;
      uint64_t v49 = sub_100029E18(&qword_10013F670);
      uint64_t inited = swift_initStackObject(v49, v0 + 16);
      *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
      *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(NSLocalizedDescriptionKey);
      *(void *)(inited + 40) = v51;
      _StringGuts.grow(_:)(32LL);
      uint64_t ObjectType = swift_getObjectType(v23);
      uint64_t v53 = _typeName(_:qualified:)(ObjectType, 0LL);
      uint64_t v55 = v54;
      swift_bridgeObjectRelease(0xE000000000000000LL);
      v56._object = (void *)0x80000001000FB070LL;
      v56._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
      String.append(_:)(v56);
      *(void *)(inited + 72) = &type metadata for String;
      *(void *)(inited + 48) = v53;
      *(void *)(inited + 56) = v55;
      unint64_t v57 = sub_100044F60(inited);
      unint64_t v58 = sub_10004C108();
      uint64_t v59 = _BridgedStoredNSError.init(_:userInfo:)((void *)(v0 + 288), v0 + 280, v57, v48, v58);
      swift_willThrow(v59);
      swift_unknownObjectRelease(v23);
      (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v61, v60);
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v65, v63);
      uint64_t v4 = *(void *)(v0 + 520);
      uint64_t v6 = *(void *)(v0 + 488);
      uint64_t v5 = *(void *)(v0 + 496);
      uint64_t v7 = *(void *)(v0 + 464);
      uint64_t v8 = *(void *)(v0 + 440);
      uint64_t v10 = *(void *)(v0 + 408);
      uint64_t v9 = *(void *)(v0 + 416);
      uint64_t v11 = *(void *)(v0 + 384);
      uint64_t v66 = *(void *)(v0 + 360);
      sub_100029F4C((void *)(v0 + 96));
      swift_task_dealloc(v4);
      swift_task_dealloc(v5);
      swift_task_dealloc(v6);
      swift_task_dealloc(v7);
      swift_task_dealloc(v8);
      swift_task_dealloc(v9);
      swift_task_dealloc(v10);
      swift_task_dealloc(v11);
      swift_task_dealloc(v66);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
  }

  else
  {
    sub_10002E92C(v0 + 136, &qword_10013C7E0);
    uint64_t v12 = sub_100029E18((uint64_t *)&unk_10013DD40);
    return dispatch thunk of BaseObjectGraph.noMemberFound<A>(toSatisfy:)(v12, v12);
  }

uint64_t sub_1000DC96C()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 536LL);
  *(void *)(*(void *)v1 + 544LL) = v0;
  swift_task_dealloc(v3);
  (*(void (**)(void, void))(v2[44] + 8LL))(v2[45], v2[43]);
  if (v0) {
    uint64_t v4 = sub_1000DCB1C;
  }
  else {
    uint64_t v4 = sub_1000DC9E0;
  }
  return swift_task_switch(v4, 0LL, 0LL);
}

uint64_t sub_1000DC9E0()
{
  uint64_t v1 = *(void *)(v0 + 520);
  uint64_t v12 = *(void *)(v0 + 512);
  uint64_t v13 = *(void *)(v0 + 504);
  uint64_t v14 = *(void *)(v0 + 496);
  uint64_t v15 = *(void *)(v0 + 488);
  uint64_t v2 = *(void *)(v0 + 456);
  uint64_t v3 = *(void *)(v0 + 464);
  uint64_t v11 = *(void *)(v0 + 448);
  uint64_t v4 = *(void *)(v0 + 416);
  uint64_t v16 = *(void *)(v0 + 440);
  uint64_t v17 = *(void *)(v0 + 408);
  uint64_t v6 = *(void *)(v0 + 392);
  uint64_t v5 = *(void *)(v0 + 400);
  uint64_t v7 = *(void *)(v0 + 376);
  uint64_t v8 = *(void *)(v0 + 384);
  uint64_t v9 = *(void *)(v0 + 368);
  uint64_t v18 = *(void *)(v0 + 360);
  swift_unknownObjectRelease(*(void *)(v0 + 528));
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_100029F4C((void *)(v0 + 176));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v11);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v13);
  sub_100029F4C((void *)(v0 + 96));
  swift_task_dealloc(v1);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v3);
  swift_task_dealloc(v16);
  swift_task_dealloc(v4);
  swift_task_dealloc(v17);
  swift_task_dealloc(v8);
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000DCB1C()
{
  uint64_t v22 = *(void *)(v0 + 520);
  uint64_t v20 = *(void *)(v0 + 512);
  uint64_t v21 = *(void *)(v0 + 504);
  uint64_t v1 = *(void *)(v0 + 456);
  uint64_t v19 = *(void *)(v0 + 464);
  uint64_t v2 = *(void *)(v0 + 448);
  uint64_t v3 = *(void *)(v0 + 416);
  uint64_t v5 = *(void *)(v0 + 392);
  uint64_t v4 = *(void *)(v0 + 400);
  uint64_t v6 = *(void *)(v0 + 376);
  uint64_t v7 = *(void *)(v0 + 384);
  uint64_t v8 = *(void *)(v0 + 368);
  swift_unknownObjectRelease(*(void *)(v0 + 528));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_100029F4C((void *)(v0 + 176));
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v19, v2);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v21);
  uint64_t v9 = *(void *)(v0 + 520);
  uint64_t v11 = *(void *)(v0 + 488);
  uint64_t v10 = *(void *)(v0 + 496);
  uint64_t v12 = *(void *)(v0 + 464);
  uint64_t v13 = *(void *)(v0 + 440);
  uint64_t v15 = *(void *)(v0 + 408);
  uint64_t v14 = *(void *)(v0 + 416);
  uint64_t v16 = *(void *)(v0 + 384);
  uint64_t v17 = *(void *)(v0 + 360);
  sub_100029F4C((void *)(v0 + 96));
  swift_task_dealloc(v9);
  swift_task_dealloc(v10);
  swift_task_dealloc(v11);
  swift_task_dealloc(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000DCC64(void **a1, uint64_t a2)
{
  uint64_t v4 = sub_100029E18(&qword_10013CE40);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *a1;
  uint64_t v8 = swift_allocObject(&unk_100126698, 32LL, 7LL);
  *(void *)(v8 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v8 + 24) = v7;
  sub_100029E18((uint64_t *)&unk_10013CC30);
  swift_retain(a2);
  uint64_t v9 = Promise.__allocating_init()(v7);
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v6, 1LL, 1LL, v10);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001266C0, 56LL, 7LL);
  void v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_1001404C0;
  v11[5] = v8;
  void v11[6] = v9;
  swift_retain(v9);
  uint64_t v12 = sub_1000B3448((uint64_t)v6, (uint64_t)&unk_10013CE60, (uint64_t)v11);
  swift_release(v12);
  return v9;
}

uint64_t sub_1000DCD8C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000DCDB8(uint64_t a1)
{
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v6 = (void *)swift_task_alloc(dword_1001404BC);
  *(void *)(v2 + swift_weakDestroy(v0 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_10002A858;
  return sub_1000DC22C(a1, v5, v4);
}

uint64_t sub_1000DCE1C()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_1000DCE50()
{
  uint64_t v0 = type metadata accessor for MetricsFieldExclusionRequest(0LL);
  sub_10002A728(v0, qword_100148698);
  sub_10002A768(v0, (uint64_t)qword_100148698);
  return MetricsFieldExclusionRequest.init(rawValue:)(1702060386LL, 0xE400000000000000LL);
}

void *sub_1000DCEA4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v15 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v15);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = (void *)a2[5];
    void v4[5] = v8;
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)v4 + v9;
    uint64_t v11 = (uint64_t)a2 + v9;
    uint64_t v12 = type metadata accessor for Bag(0LL);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL);
    id v14 = v8;
    v13(v10, v11, v12);
  }

  return v4;
}

uint64_t sub_1000DCF64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for Bag(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_1000DCFB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  __int128 v7 = *(void **)(a2 + 40);
  *(void *)(a1 + 40) = v7;
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for Bag(0LL);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
  id v13 = v7;
  v12(v9, v10, v11);
  return a1;
}

void *sub_1000DD03C(void *a1, void *a2, uint64_t a3)
{
  __int128 v6 = (void *)a2[5];
  __int128 v7 = (void *)a1[5];
  a1[5] = v6;
  id v8 = v6;

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for Bag(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 24LL))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000DD0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  return a1;
}

uint64_t sub_1000DD114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void **)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;

  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for Bag(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40LL))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000DD18C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000DD198);
}

uint64_t sub_1000DD198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for MetricsTopicProvider(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 24),  a2,  v8);
  }

uint64_t sub_1000DD214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000DD220);
}

uint64_t sub_1000DD220(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for MetricsTopicProvider(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 24),  a2,  a2,  v7);
  }

  return result;
}

uint64_t type metadata accessor for UniversalMetricsFieldsProvider(uint64_t a1)
{
  uint64_t result = qword_100140520;
  if (!qword_100140520) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UniversalMetricsFieldsProvider);
  }
  return result;
}

uint64_t sub_1000DD2D0(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  uint64_t result = type metadata accessor for Bag(319LL);
  if (v3 <= 0x3F)
  {
    void v4[2] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000DD350(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100029E18(&qword_10013DEB8);
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  __chkstk_darwin(v4);
  uint64_t v66 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100029E18(&qword_10013C6D0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_100029E18(&qword_10013EE90);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for URL(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  URL.init(string:)(0xD000000000000014LL, 0x8000000100101EC0LL);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v12);
  if ((_DWORD)result != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    uint64_t v17 = (void *)v2[5];
    URL._bridgeToObjectiveC()(v18);
    uint64_t v20 = v19;
    id v21 = objc_msgSend(v17, "ams_cookiesForURL:", v19);

    unint64_t v22 = sub_1000DD9F0();
    id v23 = v15;
    uint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);

    uint64_t v69 = v24;
    id v70 = sub_1000DD918;
    uint64_t v71 = 0LL;
    uint64_t v25 = sub_100029E18(&qword_100140570);
    unint64_t v26 = sub_1000DDA2C();
    uint64_t v27 = BidirectionalCollection<>.joined(separator:)(8251LL, 0xE200000000000000LL, v25, v26);
    uint64_t v29 = v28;
    swift_bridgeObjectRelease(v24);
    uint64_t v72 = &type metadata for String;
    uint64_t v69 = v27;
    id v70 = v29;
    uint64_t v30 = *(void *)(a1 + 24);
    uint64_t v31 = *(void *)(a1 + 32);
    sub_10002ACB8(a1, v30);
    uint64_t v32 = v73;
    dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)(&v69, 0x65696B6F6F63LL, 0xE600000000000000LL, v30, v31);
    if (v32)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v23, v12);
      return sub_100029F4C(&v69);
    }

    uint64_t v73 = 0LL;
    uint64_t v63 = v23;
    uint64_t v64 = v13;
    uint64_t v65 = v12;
    sub_100029F4C(&v69);
    uint64_t v33 = v2[3];
    uint64_t v34 = v2[4];
    sub_100029EE0(v2, v33);
    dispatch thunk of AccountProvider.activeAccount.getter(v33, v34);
    uint64_t v35 = type metadata accessor for Account(0LL);
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v8, 1LL, v35) == 1)
    {
      sub_100078B94((uint64_t)v8);
    }

    else
    {
      uint64_t KeyPath = swift_getKeyPath(&unk_1000F1838);
      Account.subscript.getter(&v69);
      swift_release(KeyPath);
      uint64_t v38 = (void *)v69;
      (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v35);
      if (v38)
      {
        type metadata accessor for UniversalMetricsFieldsProvider(0LL);
        NSString v39 = String._bridgeToObjectiveC()();
        uint64_t v40 = v66;
        Bag.subscript.getter();

        uint64_t v41 = v68;
        Bag.Value.current(or:)(&v69, sub_1000AED74, 0LL, v68);
        (*(void (**)(char *, uint64_t))(v67 + 8))(v40, v41);
        uint64_t v42 = v65;
        if ((v69 & 1) != 0)
        {
        }

        else
        {
          id v56 = [v38 stringValue];
          uint64_t v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
          uint64_t v59 = v58;

          uint64_t v72 = &type metadata for String;
          uint64_t v69 = v57;
          id v70 = v59;
          uint64_t v60 = *(void *)(a1 + 24);
          uint64_t v61 = *(void *)(a1 + 32);
          sub_10002ACB8(a1, v60);
          uint64_t v62 = v73;
          dispatch thunk of MetricsFieldsBuilder.addValue(_:forField:)( &v69,  1682535268LL,  0xE400000000000000LL,  v60,  v61);
          if (v62)
          {
            (*(void (**)(char *, uint64_t))(v64 + 8))(v63, v42);

            return sub_100029F4C(&v69);
          }

          uint64_t v73 = 0LL;

          sub_100029F4C(&v69);
        }

uint64_t sub_1000DD918@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = *a1;
  id v4 = [*a1 name];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  uint64_t v7 = v6;

  uint64_t v15 = v5;
  v8._uint64_t countAndFlagsBits = 61LL;
  v8._object = (void *)0xE100000000000000LL;
  String.append(_:)(v8);
  id v9 = [v3 value];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  uint64_t v12 = v11;

  v13._uint64_t countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  uint64_t result = swift_bridgeObjectRelease(v12);
  *a2 = v15;
  a2[1] = v7;
  return result;
}

uint64_t sub_1000DD9DC(uint64_t a1)
{
  return sub_1000DD350(a1);
}

unint64_t sub_1000DD9F0()
{
  unint64_t result = qword_100140568;
  if (!qword_100140568)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSHTTPCookie);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100140568);
  }

  return result;
}

unint64_t sub_1000DDA2C()
{
  unint64_t result = qword_100140578;
  if (!qword_100140578)
  {
    uint64_t v1 = sub_100029F6C(&qword_100140570);
    sub_1000DDA90();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyMapSequence<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100140578);
  }

  return result;
}

unint64_t sub_1000DDA90()
{
  unint64_t result = qword_100140580;
  if (!qword_100140580)
  {
    uint64_t v1 = sub_100029F6C(&qword_100140588);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100140580);
  }

  return result;
}

ValueMetadata *_s7UnknownVMa()
{
  return &_s7UnknownVN;
}

ValueMetadata *_s9UpdatableVMa()
{
  return &_s9UpdatableVN;
}

BOOL sub_1000DDB04(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6 != 2) {
    return 0LL;
  }
  BOOL result = 0LL;
  switch(a3)
  {
    case 0:
      BOOL result = (a1 & 0xFD) == 0;
      break;
    case 1:
    case 3:
    case 4:
    case 5:
      BOOL result = 1LL;
      break;
    case 6:
      BOOL result = __PAIR128__((unint64_t)(a1 != 0) + a2 - 1, a1 - 1) < 2;
      break;
    default:
      return result;
  }

  return result;
}

ValueMetadata *type metadata accessor for URLOfferActionImplementation()
{
  return &type metadata for URLOfferActionImplementation;
}

unint64_t sub_1000DDB90()
{
  unint64_t result = qword_10013C4B0;
  if (!qword_10013C4B0)
  {
    unint64_t v1 = sub_1000DDBD8();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ASCURLOffer, v1);
    atomic_store(result, (unint64_t *)&qword_10013C4B0);
  }

  return result;
}

unint64_t sub_1000DDBD8()
{
  unint64_t result = qword_10013C4A8;
  if (!qword_10013C4A8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___ASCURLOffer);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10013C4A8);
  }

  return result;
}

uint64_t sub_1000DDC14@<X0>(uint64_t a1@<X8>)
{
  return sub_10002B6F0(a1);
}

uint64_t sub_1000DDC28(void **a1)
{
  return sub_1000DDC34(*a1, *v1);
}

uint64_t sub_1000DDC34(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for URL(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  *(void *)&double v6 = __chkstk_darwin(v4).n128_u64[0];
  Swift::String v8 = (char *)&v21[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unsigned int v9 = objc_msgSend(a1, "isSensitive", v6);
  sub_100029E18(&qword_10013CBE0);
  id v10 = [a1 url];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v10);

  URL._bridgeToObjectiveC()(v11);
  Swift::String v13 = v12;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  if (v9) {
    id v14 = [a2 openSensitiveURL:v13];
  }
  else {
    id v14 = [a2 openURL:v13];
  }

  uint64_t v15 = Promise<A>.init(_:)(v14);
  void v21[3] = type metadata accessor for SyncTaskScheduler(0LL);
  v21[4] = &protocol witness table for SyncTaskScheduler;
  uint64_t v16 = sub_10002C328(v21);
  SyncTaskScheduler.init()(v16);
  uint64_t v17 = type metadata accessor for ActionOutcome(0LL);
  uint64_t v18 = Promise.map<A>(on:_:)(v21, sub_1000DDC14, 0LL, v17);
  swift_release(v15);
  sub_100029F4C(v21);
  return v18;
}

void sub_1000DDE18(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)(a1);
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_1000DDE64(void (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v9 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for OSLogger(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1(0LL);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v16 = sub_10002A768(v12, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v16, v12);
  uint64_t v17 = sub_100029E18(&qword_10013EA00);
  uint64_t v18 = type metadata accessor for LogMessage(0LL);
  uint64_t v19 = swift_allocObject( v17,  ((*(unsigned __int8 *)(*(void *)(v18 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v18 - 8) + 80LL))
        + *(void *)(*(void *)(v18 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v18 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(29LL, 2LL);
  v20._uint64_t countAndFlagsBits = 0LL;
  v20._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v20);
  unint64_t v26 = (char *)&type metadata for StaticString;
  v24[0] = a3;
  v24[1] = a4;
  char v25 = a5;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v24);
  sub_10004C810((uint64_t)v24);
  v21._object = (void *)0x8000000100101C80LL;
  v21._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  unint64_t v26 = (char *)&type metadata for () + 8;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v24);
  sub_10004C810((uint64_t)v24);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  LogMessage.init(stringInterpolation:)(v11);
  Logger.info(_:)(v19, v12, &protocol witness table for OSLogger);
  swift_bridgeObjectRelease(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_1000DE090( uint64_t a1, void (*a2)(void, __n128), uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v30 = a1;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __n128 v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a2(0LL, v15);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v18 = sub_10002A768(v13, (uint64_t)qword_100148618);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v17, v18, v13);
  uint64_t v19 = sub_100029E18(&qword_10013EA00);
  uint64_t v20 = type metadata accessor for LogMessage(0LL);
  uint64_t v21 = swift_allocObject( v19,  ((*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL))
        + *(void *)(*(void *)(v20 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(29LL, 2LL);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  uint64_t v33 = &type metadata for StaticString;
  v31[0] = a4;
  v31[1] = a5;
  char v32 = a6;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v31);
  sub_10004C810((uint64_t)v31);
  v23._object = (void *)0x8000000100101C80LL;
  v23._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  uint64_t v24 = type metadata accessor for LintedMetricsEvent(0LL);
  uint64_t v33 = (void *)v24;
  char v25 = sub_10002C328(v31);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16LL))(v25, v30, v24);
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v31);
  sub_10004C810((uint64_t)v31);
  v26._uint64_t countAndFlagsBits = 0LL;
  v26._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v26);
  LogMessage.init(stringInterpolation:)(v12);
  Logger.info(_:)(v21, v13, &protocol witness table for OSLogger);
  __n128 v27 = swift_bridgeObjectRelease(v21);
  return (*(uint64_t (**)(char *, uint64_t, __n128))(v14 + 8))(v17, v13, v27);
}

uint64_t sub_1000DE2E0( int a1, void (*a2)(void, __n128), uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v28 = a1;
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = &v27[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for OSLogger(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __n128 v15 = __chkstk_darwin(v13);
  uint64_t v17 = &v27[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  a2(0LL, v15);
  if (qword_10013BC48 != -1) {
    swift_once(&qword_10013BC48, sub_1000D1558);
  }
  uint64_t v18 = sub_10002A768(v13, (uint64_t)qword_100148618);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v14 + 16))(v17, v18, v13);
  uint64_t v19 = sub_100029E18(&qword_10013EA00);
  uint64_t v20 = type metadata accessor for LogMessage(0LL);
  uint64_t v21 = swift_allocObject( v19,  ((*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL))
        + *(void *)(*(void *)(v20 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v20 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(29LL, 2LL);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  uint64_t v31 = &type metadata for StaticString;
  v29[0] = a4;
  v29[1] = a5;
  char v30 = a6;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(v29);
  sub_10004C810((uint64_t)v29);
  v23._object = (void *)0x8000000100101C80LL;
  v23._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v23);
  uint64_t v31 = &type metadata for Bool;
  LOBYTE(v29[0]) = v28 & 1;
  LogMessage.StringInterpolation.appendInterpolation(sensitive:)(v29);
  sub_10004C810((uint64_t)v29);
  v24._uint64_t countAndFlagsBits = 0LL;
  v24._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v24);
  LogMessage.init(stringInterpolation:)(v12);
  Logger.info(_:)(v21, v13, &protocol witness table for OSLogger);
  __n128 v25 = swift_bridgeObjectRelease(v21);
  return (*(uint64_t (**)(_BYTE *, uint64_t, __n128))(v14 + 8))(v17, v13, v25);
}

uint64_t type metadata accessor for UtilityClient()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd13UtilityClient);
}

uint64_t sub_1000DE6AC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000DE6D0( uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  return sub_1000DDE64(a2, a3, a4, a5, a6);
}

uint64_t sub_1000DE6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [(id)objc_opt_self(ASCWorkspace) sharedWorkspace];
  URL._bridgeToObjectiveC()(v6);
  Swift::String v8 = v7;
  id v9 = [v5 openURL:v7];

  uint64_t v10 = Promise<A>.init(_:)(v9);
  uint64_t v11 = swift_allocObject(&unk_100126840, 49LL, 7LL);
  *(void *)(v11 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v11 + 24) = a3;
  *(void *)(v11 + 32) = "openURL(_:withReplyHandler:)";
  *(void *)(v11 + 40) = 28LL;
  *(_BYTE *)(v11 + 48) = 2;
  uint64_t v12 = swift_allocObject(&unk_100126868, 49LL, 7LL);
  *(void *)(v12 + swift_weakDestroy(v0 + 16) = a2;
  *(void *)(v12 + 24) = a3;
  *(void *)(v12 + 32) = "openURL(_:withReplyHandler:)";
  *(void *)(v12 + 40) = 28LL;
  *(_BYTE *)(v12 + 48) = 2;
  unint64_t v13 = sub_100032130();
  uint64_t v14 = swift_retain_n(a3, 2LL);
  v16[3] = v13;
  void v16[4] = &protocol witness table for OS_dispatch_queue;
  v16[0] = static OS_dispatch_queue.main.getter(v14);
  Promise.then(perform:orCatchError:on:)(sub_1000DE88C, v11, sub_1000442B4, v12, v16);
  swift_release(v11);
  swift_release(v12);
  sub_100029F4C(v16);
  return swift_release(v10);
}

uint64_t sub_1000DE868()
{
  return swift_deallocObject(v0, 49LL, 7LL);
}

uint64_t sub_1000DE88C()
{
  return sub_1000DDE64( *(void (**)(void))(v0 + 16),  *(void *)(v0 + 24),  *(void *)(v0 + 32),  *(void *)(v0 + 40),  *(_BYTE *)(v0 + 48));
}

ValueMetadata *_s7WaitingVMa()
{
  return &_s7WaitingVN;
}

uint64_t sub_1000DE8B4(uint64_t a1, uint64_t a2, char a3, char a4, uint64_t a5, char a6)
{
  switch(a3)
  {
    case 1:
      uint64_t result = a1 & (a6 == 0);
      break;
    case 2:
    case 5:
      if (a6) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = (a4 & 0xFD) == 0LL;
      }
      break;
    case 3:
    case 4:
      uint64_t result = a6 == 0;
      break;
    case 6:
      BOOL v7 = (a4 & 0xFE) == 0LL;
      if (a6) {
        BOOL v7 = 0;
      }
      if (a1 ^ 2 | a2) {
        BOOL v8 = 0;
      }
      else {
        BOOL v8 = a6 == 0;
      }
      if (a1 | a2) {
        uint64_t result = v8;
      }
      else {
        uint64_t result = v7;
      }
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void *sub_1000DE950()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v2);
  id v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  BOOL v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v1[2] = sub_1000457AC((uint64_t)_swiftEmptyArrayStorage);
  unint64_t v21 = sub_100032130();
  uint64_t v13 = sub_100029E18(&qword_10013D2F0);
  uint64_t v14 = swift_allocObject( v13,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + *(void *)(v10 + 72),
          *(unsigned __int8 *)(v10 + 80) | 7LL);
  *(_OWORD *)(v14 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  static OS_dispatch_queue.Attributes.concurrent.getter();
  uint64_t v22 = v14;
  uint64_t v15 = sub_100027978( (unint64_t *)&qword_10013DD90,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v16 = sub_100029E18(&qword_10013D2F8);
  uint64_t v17 = sub_100062254((unint64_t *)&qword_10013DDA0, &qword_10013D2F8);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v22, v16, v17, v9, v15);
  uint64_t v18 = (*(uint64_t (**)(char *, void, uint64_t))(v6 + 104))( v8,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v5);
  static DispatchQoS.unspecified.getter(v18);
  v1[3] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000025LL,  0x8000000100101F90LL,  v4,  v12,  v8,  0LL);
  uint64_t v19 = sub_100029E18(&qword_10013D2E8);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  v1[4] = SyncEvent.init()();
  return v1;
}

uint64_t sub_1000DEB7C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (*(void *)(v6 + 16))
  {
    id v7 = a2;
    unint64_t v8 = sub_10008D4F0((uint64_t)v7);
    if ((v9 & 1) != 0)
    {
      uint64_t v10 = *(void *)(v6 + 56) + 24 * v8;
      uint64_t v11 = *(void *)v10;
      uint64_t v12 = *(void *)(v10 + 8);
      char v13 = *(_BYTE *)(v10 + 16);
      sub_100048494(*(void *)v10, v12, v13);
    }

    else
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = 0LL;
      char v13 = -1;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    char v13 = -1;
  }

  *(void *)a3 = v11;
  *(void *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + swift_weakDestroy(v0 + 16) = v13;
  return swift_endAccess(v15);
}

uint64_t sub_1000DEC48(void *a1, int a2)
{
  int v20 = a2;
  uint64_t v21 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v4 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v19[1] = *(void *)(v2 + 24);
  uint64_t v11 = sub_100029E18(&qword_10013D260);
  uint64_t v12 = swift_allocObject( v11,  ((*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))
        + *(void *)(v8 + 72),
          *(unsigned __int8 *)(v8 + 80) | 7LL);
  *(_OWORD *)(v12 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  static DispatchWorkItemFlags.barrier.getter(v12);
  aBlock[0] = v12;
  uint64_t v13 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v14 = sub_100029E18((uint64_t *)&unk_10013DBD0);
  uint64_t v15 = sub_100062254((unint64_t *)&qword_10013D270, (uint64_t *)&unk_10013DBD0);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v14, v15, v7, v13);
  uint64_t v16 = swift_allocObject(&unk_100126960, 33LL, 7LL);
  *(void *)(v16 + swift_weakDestroy(v0 + 16) = v2;
  *(void *)(v16 + 24) = a1;
  *(_BYTE *)(v16 + 32) = v20;
  aBlock[4] = sub_1000DF3A8;
  uint64_t v23 = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10008A71C;
  aBlock[3] = &unk_100126978;
  uint64_t v17 = _Block_copy(aBlock);
  swift_retain(v2);
  static DispatchQoS.unspecified.getter(a1);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v6, v10, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v21);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_release(v23);
  return 1LL;
}

uint64_t sub_1000DEE7C(uint64_t a1, void *a2, unsigned __int8 a3)
{
  uint64_t v5 = a3;
  swift_beginAccess(a1 + 16, v11, 33LL, 0LL);
  id v6 = a2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(a1 + 16));
  uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = 0x8000000000000000LL;
  sub_10008FDAC(v5, 0LL, 0, v6, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v10;

  swift_bridgeObjectRelease(v8);
  return swift_endAccess(v11);
}

uint64_t sub_1000DEF20(void *a1)
{
  uint64_t v19 = type metadata accessor for DispatchQoS(0LL);
  uint64_t v3 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = *(void *)(v1 + 24);
  uint64_t v10 = sub_100029E18(&qword_10013D260);
  uint64_t v11 = swift_allocObject( v10,  ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
        + *(void *)(v7 + 72),
          *(unsigned __int8 *)(v7 + 80) | 7LL);
  *(_OWORD *)(v11 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  static DispatchWorkItemFlags.barrier.getter(v11);
  aBlock[0] = v11;
  uint64_t v12 = sub_100027978( (unint64_t *)&qword_10013D268,  (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags,  (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  uint64_t v13 = sub_100029E18((uint64_t *)&unk_10013DBD0);
  uint64_t v14 = sub_100062254((unint64_t *)&qword_10013D270, (uint64_t *)&unk_10013DBD0);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v13, v14, v6, v12);
  uint64_t v15 = swift_allocObject(&unk_100126910, 32LL, 7LL);
  *(void *)(v15 + swift_weakDestroy(v0 + 16) = v1;
  *(void *)(v15 + 24) = a1;
  aBlock[4] = sub_1000DF348;
  uint64_t v21 = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10008A71C;
  aBlock[3] = &unk_100126928;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain(v1);
  static DispatchQoS.unspecified.getter(a1);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0LL, v5, v9, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v19);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release(v21);
  return 1LL;
}

uint64_t sub_1000DF148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t *)(a1 + 16);
  swift_beginAccess(a1 + 16, v17, 33LL, 0LL);
  uint64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain(v5);
  unint64_t v6 = sub_10008D4F0(a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease(v5);
  if ((a2 & 1) != 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v9 = *v4;
    uint64_t v16 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10005D004();
      uint64_t v9 = v16;
    }

    uint64_t v10 = *(void *)(v9 + 56) + 24 * v6;
    uint64_t v11 = *(void *)v10;
    uint64_t v12 = *(void *)(v10 + 8);
    char v13 = *(_BYTE *)(v10 + 16);
    sub_10005C54C(v6, v9);
    uint64_t v14 = *v4;
    *uint64_t v4 = v9;
    swift_bridgeObjectRelease(v14);
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    char v13 = -1;
  }

  swift_endAccess(v17);
  return sub_100049100(v11, v12, v13);
}

uint64_t sub_1000DF250()
{
  swift_release(*(void *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for WaitingAppStateDataSource()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd25WaitingAppStateDataSource);
}

uint64_t sub_1000DF2A4()
{
  return swift_retain(*(void *)(v0 + 32));
}

uint64_t sub_1000DF2AC(uint64_t a1)
{
  v3[3] = a1;
  uint64_t v1 = sub_100029E18(&qword_10013E820);
  OS_dispatch_queue.sync<A>(execute:)(&v4, sub_1000DF3B4, v3, v1);
  return v4;
}

uint64_t sub_1000DF310(void *a1, int a2)
{
  return 1LL;
}

uint64_t sub_1000DF328(void *a1)
{
  return 1LL;
}

uint64_t sub_1000DF340()
{
  return sub_1000DF370(32LL);
}

uint64_t sub_1000DF348()
{
  return sub_1000DF148(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000DF350(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000DF360(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000DF368()
{
  return sub_1000DF370(33LL);
}

uint64_t sub_1000DF370(uint64_t a1)
{
  return swift_deallocObject(v1, a1, 7LL);
}

uint64_t sub_1000DF3A8()
{
  return sub_1000DEE7C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_1000DF3B4@<X0>(uint64_t a1@<X8>)
{
  return sub_1000DEB7C(*(void *)(v1 + 16), *(void **)(v1 + 24), a1);
}

uint64_t *sub_1000DF3D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = *(void **)v10;
    uint64_t v12 = (void *)*((void *)v10 + 1);
    char v13 = v10[16];
    sub_1000DF484(*(void **)v10, v12, v13);
    *(void *)uint64_t v9 = v11;
    *((void *)v9 + 1) = v12;
    v9[16] = v13;
  }

  return a1;
}

id sub_1000DF484(void *a1, id a2, char a3)
{
  if ((a3 & 1) != 0) {
    return (id)swift_bridgeObjectRetain(a2);
  }
  else {
    return a1;
  }
}

void sub_1000DF494(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  sub_1000DF4E0( *(void **)(a1 + *(int *)(a2 + 20)),  *(id *)(a1 + *(int *)(a2 + 20) + 8),  *(_BYTE *)(a1 + *(int *)(a2 + 20) + 16));
}

void sub_1000DF4E0(void *a1, id a2, char a3)
{
  if ((a3 & 1) != 0) {
    swift_bridgeObjectRelease(a2);
  }
  else {
}
  }

uint64_t sub_1000DF4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)v9;
  uint64_t v11 = *(void **)(v9 + 8);
  char v12 = *(_BYTE *)(v9 + 16);
  sub_1000DF484(*(void **)v9, v11, v12);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + swift_weakDestroy(v0 + 16) = v12;
  return a1;
}

uint64_t sub_1000DF574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = *(void **)v9;
  uint64_t v11 = *(void **)(v9 + 8);
  char v12 = *(_BYTE *)(v9 + 16);
  sub_1000DF484(*(void **)v9, v11, v12);
  char v13 = *(void **)v8;
  uint64_t v14 = *(void **)(v8 + 8);
  char v15 = *(_BYTE *)(v8 + 16);
  *(void *)uint64_t v8 = v10;
  *(void *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + swift_weakDestroy(v0 + 16) = v12;
  sub_1000DF4E0(v13, v14, v15);
  return a1;
}

uint64_t sub_1000DF604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + swift_weakDestroy(v0 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t sub_1000DF670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  char v10 = *(_BYTE *)(v9 + 16);
  uint64_t v11 = *(void **)v8;
  char v12 = *(void **)(v8 + 8);
  char v13 = *(_BYTE *)(v8 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + swift_weakDestroy(v0 + 16) = v10;
  sub_1000DF4E0(v11, v12, v13);
  return a1;
}

uint64_t sub_1000DF6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000DF6F4);
}

uint64_t sub_1000DF6F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unsigned int v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
  if (v9 > 1) {
    return (v9 ^ 0xFF) + 1;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000DF770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000DF77C);
}

uint64_t sub_1000DF77C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for ActionMetrics(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 20) + swift_weakDestroy(v0 + 16) = -(char)a2;
  return result;
}

uint64_t type metadata accessor for WatchReinstallAction(uint64_t a1)
{
  uint64_t result = qword_1001406C0;
  if (!qword_1001406C0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WatchReinstallAction);
  }
  return result;
}

uint64_t sub_1000DF834(uint64_t a1)
{
  uint64_t result = type metadata accessor for ActionMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_1000F19E8;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_1000DF8A4(uint64_t a1, uint64_t a2)
{
  return sub_1000DFA64( *(void **)a1,  *(void **)(a1 + 8),  *(_BYTE *)(a1 + 16),  *(void **)a2,  *(void **)(a2 + 8),  *(_BYTE *)(a2 + 16));
}

void destroy for WatchReinstallAction.Item(uint64_t a1)
{
}

uint64_t _s19appstorecomponentsd20WatchReinstallActionV4ItemOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_1000DF484(*(void **)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WatchReinstallAction.Item(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_1000DF484(*(void **)a2, v4, v5);
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(void **)(a1 + 8);
  char v8 = *(_BYTE *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v5;
  sub_1000DF4E0(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for WatchReinstallAction.Item(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void **)a1;
  char v5 = *(void **)(a1 + 8);
  char v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + swift_weakDestroy(v0 + 16) = v3;
  sub_1000DF4E0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WatchReinstallAction.Item(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WatchReinstallAction.Item( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1000DFA40(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1000DFA48(uint64_t result, char a2)
{
  *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for WatchReinstallAction.Item()
{
  return &type metadata for WatchReinstallAction.Item;
}

uint64_t sub_1000DFA64(void *a1, void *a2, char a3, void *a4, void *a5, char a6)
{
  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      sub_1000DFB50();
      sub_1000DF484(a1, a2, 0);
      sub_1000DF484(a4, a5, 0);
      char v10 = static NSObject.== infix(_:_:)(a1);
      sub_1000DF4E0(a4, a5, 0);
      sub_1000DF4E0(a1, a2, 0);
      return v10 & 1;
    }

    return 0LL;
  }

  if ((a6 & 1) == 0) {
    return 0LL;
  }
  if (a1 == a4 && a2 == a5) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0LL);
  }
}

unint64_t sub_1000DFB50()
{
  unint64_t result = qword_10013CB60;
  if (!qword_10013CB60)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSObject);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10013CB60);
  }

  return result;
}

ValueMetadata *type metadata accessor for WatchReinstallActionImplementation()
{
  return &type metadata for WatchReinstallActionImplementation;
}

unint64_t sub_1000DFBA0()
{
  unint64_t result = qword_10013CBA8;
  if (!qword_10013CBA8)
  {
    uint64_t v1 = type metadata accessor for WatchReinstallAction(255LL);
    unint64_t result = swift_getWitnessTable(&unk_1000F1A00, v1);
    atomic_store(result, (unint64_t *)&qword_10013CBA8);
  }

  return result;
}

uint64_t sub_1000DFBE8()
{
  uint64_t v0 = type metadata accessor for ActionOutcome(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unsigned int v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100029E18((uint64_t *)&unk_10013CC30);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for ActionOutcome.unsupported(_:), v0);
  return Promise.__allocating_init(value:)(v3);
}

id sub_1000DFC7C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8);
  char v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for OSLogger(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)aBlock - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_10013BC38 != -1) {
    swift_once(&qword_10013BC38, sub_1000D1514);
  }
  uint64_t v15 = sub_10002A768(v11, (uint64_t)qword_1001485E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  uint64_t v16 = sub_100029E18(&qword_10013EA00);
  uint64_t v17 = type metadata accessor for LogMessage(0LL);
  uint64_t v18 = swift_allocObject( v16,  ((*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL))
        + *(void *)(*(void *)(v17 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v18 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(25LL, 1LL);
  v19._object = (void *)0x8000000100102030LL;
  v19._uint64_t countAndFlagsBits = 0xD000000000000019LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v19);
  uint64_t ObjectType = &type metadata for XPCEntitledConnection;
  aBlock[0] = a3;
  id v20 = a3;
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(aBlock);
  sub_10004C810((uint64_t)aBlock);
  v21._uint64_t countAndFlagsBits = 0LL;
  v21._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  LogMessage.init(stringInterpolation:)(v10);
  Logger.info(_:)(v18, v11, &protocol witness table for OSLogger);
  __n128 v22 = swift_bridgeObjectRelease(v18);
  (*(void (**)(char *, uint64_t, __n128))(v12 + 8))(v14, v11, v22);
  uint64_t v23 = *(void **)(v4 + 16);
  [v23 lock];
  Swift::String v24 = *(char **)(v4 + 24);
  id v25 = v20;
  swift_unknownObjectRetain(a1);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
  *(void *)(v4 + 24) = v24;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    Swift::String v24 = sub_100051764(0LL, *((void *)v24 + 2) + 1LL, 1, v24);
    *(void *)(v4 + 24) = v24;
  }

  unint64_t v28 = *((void *)v24 + 2);
  unint64_t v27 = *((void *)v24 + 3);
  if (v28 >= v27 >> 1)
  {
    Swift::String v24 = sub_100051764((char *)(v27 > 1), v28 + 1, 1, v24);
    *(void *)(v4 + 24) = v24;
  }

  *((void *)v24 + 2) = v28 + 1;
  uint64_t v29 = &v24[16 * v28];
  *((void *)v29 + 4) = v25;
  *((void *)v29 + sub_100029F4C(v0 + 5) = a1;
  char v30 = &selRef_appendBytes_length_;
  [v23 unlock];
  [v25 setExportedInterface:a2];
  uint64_t ObjectType = (ValueMetadata *)swift_getObjectType(a1);
  aBlock[0] = a1;
  sub_1000ABE30((uint64_t)aBlock, (uint64_t)v51);
  uint64_t v31 = v52;
  if (v52)
  {
    char v32 = sub_100029EE0(v51, v52);
    uint64_t v33 = *(void *)(v31 - 8);
    __chkstk_darwin(v32);
    uint64_t v35 = (char *)aBlock - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *))(v33 + 16))(v35);
    id v36 = v25;
    swift_unknownObjectRetain(a1);
    uint64_t v37 = _bridgeAnythingToObjectiveC<A>(_:)(v35, v31);
    char v30 = &selRef_appendBytes_length_;
    (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v31);
    sub_100029F4C(v51);
  }

  else
  {
    id v38 = v25;
    swift_unknownObjectRetain(a1);
    uint64_t v37 = 0LL;
  }

  [v25 setExportedObject:v37];
  swift_unknownObjectRelease(v37);
  sub_10004C810((uint64_t)aBlock);

  uint64_t v39 = swift_allocObject(&unk_100126B30, 24LL, 7LL);
  swift_weakInit(v39 + 16, v4);
  uint64_t v40 = swift_allocObject(&unk_100126B58, 32LL, 7LL);
  *(void *)(v40 + swift_weakDestroy(v0 + 16) = v39;
  *(void *)(v40 + 24) = a1;
  uint64_t v41 = swift_allocObject(&unk_100126B80, 32LL, 7LL);
  *(void *)(v41 + swift_weakDestroy(v0 + 16) = sub_1000E05BC;
  *(void *)(v41 + 24) = v40;
  uint64_t v49 = sub_100099A38;
  uint64_t v50 = v41;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = sub_10008A71C;
  uint64_t ObjectType = (ValueMetadata *)&unk_100126B98;
  uint64_t v42 = _Block_copy(aBlock);
  uint64_t v43 = v50;
  swift_retain_n(v40, 2LL);
  id v44 = v25;
  swift_unknownObjectRetain(a1);
  swift_retain(v39);
  swift_release(v43);
  [v44 setInvalidationHandler:v42];
  _Block_release(v42);
  swift_release(v39);

  swift_release_n(v40, 2LL);
  [v23 lock];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v4 + 32);
  if (Strong) {
    swift_unknownObjectRelease(Strong);
  }
  return [v23 v30[349]];
}

uint64_t sub_1000E0154()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    *(void *)&double v3 = swift_bridgeObjectRetain(*(void *)(v0 + 24)).n128_u64[0];
    uint64_t v4 = 32LL;
    do
    {
      objc_msgSend(*(id *)(v1 + v4), "invalidate", v3);
      v4 += 16LL;
      --v2;
    }

    while (v2);
    swift_bridgeObjectRelease(v1);
  }

  swift_bridgeObjectRelease(*(void *)(v0 + 24));
  sub_1000E020C(v0 + 32);
  return swift_deallocClassInstance(v0, 48LL, 7LL);
}

uint64_t type metadata accessor for XPCConnectionOwner()
{
  return objc_opt_self(&OBJC_CLASS____TtC19appstorecomponentsd18XPCConnectionOwner);
}

ValueMetadata *type metadata accessor for XPCConnectionOwner.ActiveConnection()
{
  return &type metadata for XPCConnectionOwner.ActiveConnection;
}

uint64_t sub_1000E020C(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000E0230(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v3);
  if (result)
  {
    uint64_t v5 = result;
    char v6 = *(void **)(result + 16);
    [v6 lock];
    sub_1000E02C0(v5, a2);
    [v6 unlock];
    return swift_release(v5);
  }

  return result;
}

void sub_1000E02C0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for OSLogger(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(a1 + 24);
  unint64_t v13 = *(void *)(v12 + 16);
  if (!v13) {
    goto LABEL_11;
  }
  unint64_t v14 = 0LL;
  uint64_t v15 = (void *)(v12 + 40);
  while (*v15 != a2)
  {
    ++v14;
    v15 += 2;
    if (v13 == v14) {
      goto LABEL_11;
    }
  }

  if (v14 >= v13)
  {
    __break(1u);
    goto LABEL_16;
  }

  v32[5] = v2;
  uint64_t v16 = qword_10013BC38;
  id v31 = (id)*(v15 - 1);
  if (v16 != -1) {
LABEL_16:
  }
    swift_once(&qword_10013BC38, sub_1000D1514);
  uint64_t v17 = sub_10002A768(v8, (uint64_t)qword_1001485E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v17, v8);
  uint64_t v18 = sub_100029E18(&qword_10013EA00);
  uint64_t v19 = type metadata accessor for LogMessage(0LL);
  uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
        + *(void *)(*(void *)(v19 - 8) + 72LL),
          *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v20 + swift_weakDestroy(v0 + 16) = xmmword_1000EDBE0;
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(27LL, 1LL);
  v21._object = (void *)0x8000000100102050LL;
  v21._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  void v32[3] = &type metadata for XPCEntitledConnection;
  v32[0] = v31;
  id v31 = v31;
  LogMessage.StringInterpolation.appendInterpolation(traceableSensitive:)(v32);
  sub_10004C810((uint64_t)v32);
  v22._uint64_t countAndFlagsBits = 0LL;
  v22._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v22);
  LogMessage.init(stringInterpolation:)(v7);
  Logger.info(_:)(v20, v8, &protocol witness table for OSLogger);
  __n128 v23 = swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v11, v8, v23);
  Swift::String v24 = sub_10002CA04(v14);
  uint64_t v26 = v25;

  swift_unknownObjectRelease(v26);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a1 + 32);
  if (Strong) {
    swift_unknownObjectRelease(Strong);
  }

LABEL_11:
  if (!*(void *)(*(void *)(a1 + 24) + 16LL))
  {
    uint64_t v28 = swift_unknownObjectWeakLoadStrong(a1 + 32);
    if (v28)
    {
      uint64_t v29 = v28;
      sub_100089934();
      swift_unknownObjectRelease(v29);
    }
  }

uint64_t sub_1000E056C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_1000E0590()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000E05BC()
{
  return sub_1000E0230(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000E05C4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_1000E05E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000E05F8(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_1000E0600()
{
  id v1 = [*v0 description];
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v2;
}

void *sub_1000E0654(void *a1, uint64_t a2, uint64_t a3)
{
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = objc_msgSend(a1, "valueForEntitlement:", v5, swift_bridgeObjectRelease(a3).n128_f64[0]);

  if (v6)
  {
    _bridgeAnyObjectToAny(_:)(v12, v6);
    swift_unknownObjectRelease(v6);
  }

  else
  {
    memset(v12, 0, sizeof(v12));
  }

  sub_1000CC028((uint64_t)v12, (uint64_t)v13);
  if (!v14)
  {

    sub_10004C810((uint64_t)v13);
    return 0LL;
  }

  unint64_t v7 = sub_10006A178();
  if ((swift_dynamicCast(&v11, v13, (char *)&type metadata for Any + 8, v7, 6LL) & 1) == 0
    || (id v8 = v11, v9 = [v11 BOOLValue], v8, !v9))
  {

    return 0LL;
  }

  return a1;
}

ValueMetadata *type metadata accessor for XPCEntitledConnection()
{
  return &type metadata for XPCEntitledConnection;
}

void sub_1000E0770()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not decode ASCAdamID because stringValue was missing",  v0,  2u);
}

void sub_1000E07B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E07E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E081C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0850( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0884( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E08B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E08EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0920( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0954( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0988( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E09BC(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Unable to open product page, reason %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_1000E0A30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0A64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0A98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0ACC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0B00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0B34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0B68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0B9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0BD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0C04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0C38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0C6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0CA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0CD4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0D08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0D3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0D70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0DA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0DD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0E0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0E40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0E74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0EA8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0EDC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0F10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0F44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0F78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0FAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E0FE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1014( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1048( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E107C()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Current process is not eligible to use ASC",  v0,  2u);
}

void sub_1000E10C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E10F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1130()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not decode ASCLockupFeatureAd because productRating was missing",  v0,  2u);
}

void sub_1000E1174()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not decode ASCLockupFeatureSignpostTags because signpostTags was missing",  v0,  2u);
}

void sub_1000E11B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E11EC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1220( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1254( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1288()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not decode ASCMetricsActivity because fields was missing",  v0,  2u);
}

void sub_1000E12CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1300( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1334( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1368(const char *a1)
{
  int v1 = 136315138;
  Name = sel_getName(a1);
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "*** Could not get +[NSURLSessionConfiguration %s], appstorecomponentsd will not attribute network traffic to App Store",  (uint8_t *)&v1,  0xCu);
}

void sub_1000E13E8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "appstorecomponentsd will attribute network traffic to App Store",  v0,  2u);
}

void sub_1000E142C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1460( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1494( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E14C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E14FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1530( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1564( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1598(uint64_t a1)
{
  int v1 = sub_100026444(a1);
  int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001E57C();
  sub_10001E56C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%{public}s/notify_set_state failed: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10001E590();
}

void sub_1000E1620(uint64_t a1)
{
  int v1 = sub_100026444(a1);
  int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001E57C();
  sub_10001E56C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%{public}s/notify_get_state failed: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10001E590();
}

void sub_1000E16A8(uint64_t a1)
{
  int v1 = sub_100026444(a1);
  int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001E57C();
  sub_10001E56C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%{public}s/notify_register_dispatch failed: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10001E590();
}

void sub_1000E1730(uint64_t a1)
{
  int v1 = sub_100026444(a1);
  int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001E57C();
  sub_10001E56C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%{public}s/notify_cancel failed: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10001E590();
}

void sub_1000E17B8(uint64_t a1)
{
  int v1 = sub_100026444(a1);
  int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_10001E57C();
  sub_10001E56C( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "%{public}s/notify_register_check failed: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_10001E590();
}

void sub_1000E1840()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not initialize temporary directory, reason: %{darwin.errno}d",  (uint8_t *)v1,  8u);
}

void sub_1000E18C4()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "nano-malloc is enabled for appstorecomponentsd",  v0,  2u);
}

void sub_1000E1908( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1940( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1978(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Discarding span without valid range range %@",  buf,  0xCu);
}

void sub_1000E19C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E19F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1A30()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not decode ASCSignpostSpan because supplementaryTags was missing",  v0,  2u);
}

void sub_1000E1A74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 136446466;
  uint64_t v3 = "ASCSignpostTag ASCSignpostTagCreateForProcess(uint64_t, pid_t)_block_invoke";
  __int16 v4 = 2050;
  uint64_t v5 = v1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "*** %{public}s: Value %{public}llul exceeds 47 bits, break on _ASCSignpostTag_valueTooLarge to debug",  (uint8_t *)&v2,  0x16u);
}

void sub_1000E1B08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1B3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1B70( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1BA4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1BD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1C0C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1C44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1C7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1CB0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1CE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1D18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1D4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1D80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1DB8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1DF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1E24( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1E58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1E8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000E1EC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Found non-universal link, opening application",  v1,  2u);
}

void sub_1000E1F00(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([0 targetApplicationRecord]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  unsigned int v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Found valid universal link with mismatching bundle ID, source %{public}@, target %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_1000E1FC0(void *a1, os_log_s *a2)
{
}

void sub_1000E2044()
{
}

void sub_1000E20A4()
{
}

void sub_1000E2104()
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLForLockupID_ofKind_offerFlags_queryParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForLockupID:ofKind:offerFlags:queryParameters:");
}

id objc_msgSend_URLForLockupID_ofKind_withOfferFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForLockupID:ofKind:withOfferFlags:");
}

id objc_msgSend_URLPathAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLPathAllowedCharacterSet];
}

id objc_msgSend_URLTemplate(void *a1, const char *a2, ...)
{
  return _[a1 URLTemplate];
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

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithID_kind_context_clientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:clientID:");
}

id objc_msgSend__initWithID_kind_context_clientID_enableAppDistribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:clientID:enableAppDistribution:");
}

id objc_msgSend__initWithID_kind_context_clientID_productVariantID_enableAppDistribution_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:clientID:productVariantID:enableAppDistribution:");
}

id objc_msgSend__initWithID_kind_context_enableAppDistribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:enableAppDistribution:");
}

id objc_msgSend__initWithID_kind_context_minExternalVersionID_latestReleaseID_productVariantID_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:minExternalVersionID:latestReleaseID:productVariantID:");
}

id objc_msgSend__initWithID_kind_context_platformOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithID:kind:context:platformOverride:");
}

id objc_msgSend__initWithIDs_kind_context_clientID_enableAppDistribution_mediaQueryParams_platformOverride_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:");
}

id objc_msgSend__lockupRequestWithClientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockupRequestWithClientID:");
}

id objc_msgSend__lockupRequestWithPlatformOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockupRequestWithPlatformOverride:");
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _[a1 activeiTunesAccount];
}

id objc_msgSend_addBool_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBool:withName:");
}

id objc_msgSend_addDouble_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDouble:withName:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addInteger_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInteger:withName:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObject_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:withName:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addSensitiveObject_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSensitiveObject:withName:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_addUInt64_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addUInt64:withName:");
}

id objc_msgSend_additionalHeaders(void *a1, const char *a2, ...)
{
  return _[a1 additionalHeaders];
}

id objc_msgSend_ageRating(void *a1, const char *a2, ...)
{
  return _[a1 ageRating];
}

id objc_msgSend_alertButtonOffer(void *a1, const char *a2, ...)
{
  return _[a1 alertButtonOffer];
}

id objc_msgSend_alertButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 alertButtonTitle];
}

id objc_msgSend_alertFooterMessage(void *a1, const char *a2, ...)
{
  return _[a1 alertFooterMessage];
}

id objc_msgSend_alertMessage(void *a1, const char *a2, ...)
{
  return _[a1 alertMessage];
}

id objc_msgSend_alertTitle(void *a1, const char *a2, ...)
{
  return _[a1 alertTitle];
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_localiTunesAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_localiTunesAccount");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_animationName(void *a1, const char *a2, ...)
{
  return _[a1 animationName];
}

id objc_msgSend_appOffer(void *a1, const char *a2, ...)
{
  return _[a1 appOffer];
}

id objc_msgSend_appVersionId(void *a1, const char *a2, ...)
{
  return _[a1 appVersionId];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return _[a1 artwork];
}

id objc_msgSend_asc_dictionaryByMergingDictionary_uniquingKeysWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asc_dictionaryByMergingDictionary:uniquingKeysWithBlock:");
}

id objc_msgSend_asc_realMainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asc_realMainBundle");
}

id objc_msgSend_asc_sha246HashData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asc_sha246HashData");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_baseBuyParams(void *a1, const char *a2, ...)
{
  return _[a1 baseBuyParams];
}

id objc_msgSend_baseImageName(void *a1, const char *a2, ...)
{
  return _[a1 baseImageName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return _[a1 buffer];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_buyOffer(void *a1, const char *a2, ...)
{
  return _[a1 buyOffer];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedValues(void *a1, const char *a2, ...)
{
  return _[a1 cachedValues];
}

id objc_msgSend_cancellable(void *a1, const char *a2, ...)
{
  return _[a1 cancellable];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return _[a1 capabilities];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_checkRestrictionsForContentRating(void *a1, const char *a2, ...)
{
  return _[a1 checkRestrictionsForContentRating];
}

id objc_msgSend_clientID(void *a1, const char *a2, ...)
{
  return _[a1 clientID];
}

id objc_msgSend_clone(void *a1, const char *a2, ...)
{
  return _[a1 clone];
}

id objc_msgSend_combineBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineBool:");
}

id objc_msgSend_combineBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineBytes:length:");
}

id objc_msgSend_combineDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineDouble:");
}

id objc_msgSend_combineInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineInteger:");
}

id objc_msgSend_combineObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "combineObject:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completionOffer(void *a1, const char *a2, ...)
{
  return _[a1 completionOffer];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_contentProviderTeamID(void *a1, const char *a2, ...)
{
  return _[a1 contentProviderTeamID];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return _[a1 currentContext];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dateRange(void *a1, const char *a2, ...)
{
  return _[a1 dateRange];
}

id objc_msgSend_dateRanges(void *a1, const char *a2, ...)
{
  return _[a1 dateRanges];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeFloatForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decoration(void *a1, const char *a2, ...)
{
  return _[a1 decoration];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultFields(void *a1, const char *a2, ...)
{
  return _[a1 defaultFields];
}

id objc_msgSend_defaultOffer(void *a1, const char *a2, ...)
{
  return _[a1 defaultOffer];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_describeObject(void *a1, const char *a2, ...)
{
  return _[a1 describeObject];
}

id objc_msgSend_describeProperties(void *a1, const char *a2, ...)
{
  return _[a1 describeProperties];
}

id objc_msgSend_developerName(void *a1, const char *a2, ...)
{
  return _[a1 developerName];
}

id objc_msgSend_deviceCornerRadiusFactor(void *a1, const char *a2, ...)
{
  return _[a1 deviceCornerRadiusFactor];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_displayContext(void *a1, const char *a2, ...)
{
  return _[a1 displayContext];
}

id objc_msgSend_distributorId(void *a1, const char *a2, ...)
{
  return _[a1 distributorId];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_enableAppDistribution(void *a1, const char *a2, ...)
{
  return _[a1 enableAppDistribution];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeFloat:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _[a1 endDate];
}

id objc_msgSend_enqueueOpenApplicationOperation_pendingResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueOpenApplicationOperation:pendingResult:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eula(void *a1, const char *a2, ...)
{
  return _[a1 eula];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_excludingFields(void *a1, const char *a2, ...)
{
  return _[a1 excludingFields];
}

id objc_msgSend_executionSeed(void *a1, const char *a2, ...)
{
  return _[a1 executionSeed];
}

id objc_msgSend_externalDeepLinkURL(void *a1, const char *a2, ...)
{
  return _[a1 externalDeepLinkURL];
}

id objc_msgSend_featureWithClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureWithClass:");
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return _[a1 features];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return _[a1 fields];
}

id objc_msgSend_finalizeDescription(void *a1, const char *a2, ...)
{
  return _[a1 finalizeDescription];
}

id objc_msgSend_finalizeHash(void *a1, const char *a2, ...)
{
  return _[a1 finalizeHash];
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithResult:");
}

id objc_msgSend_finishWithSuccess(void *a1, const char *a2, ...)
{
  return _[a1 finishWithSuccess];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return _[a1 first];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _[a1 flags];
}

id objc_msgSend_genreID(void *a1, const char *a2, ...)
{
  return _[a1 genreID];
}

id objc_msgSend_genreName(void *a1, const char *a2, ...)
{
  return _[a1 genreName];
}

id objc_msgSend_getAppLinksWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppLinksWithURL:completionHandler:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heading(void *a1, const char *a2, ...)
{
  return _[a1 heading];
}

id objc_msgSend_headingKind(void *a1, const char *a2, ...)
{
  return _[a1 headingKind];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_iapItemID(void *a1, const char *a2, ...)
{
  return _[a1 iapItemID];
}

id objc_msgSend_iapItemName(void *a1, const char *a2, ...)
{
  return _[a1 iapItemName];
}

id objc_msgSend_iapProductName(void *a1, const char *a2, ...)
{
  return _[a1 iapProductName];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return _[a1 icon];
}

id objc_msgSend_id(void *a1, const char *a2, ...)
{
  return _[a1 id];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ids(void *a1, const char *a2, ...)
{
  return _[a1 ids];
}

id objc_msgSend_includingFields(void *a1, const char *a2, ...)
{
  return _[a1 includingFields];
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initIndeterminate(void *a1, const char *a2, ...)
{
  return _[a1 initIndeterminate];
}

id objc_msgSend_initWithAppOffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppOffer:");
}

id objc_msgSend_initWithBaseImageName_animationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBaseImageName:animationName:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContentProviderTeamID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentProviderTeamID:");
}

id objc_msgSend_initWithData_invocationPoints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:invocationPoints:");
}

id objc_msgSend_initWithDeveloperName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeveloperName:");
}

id objc_msgSend_initWithDisplayContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayContext:");
}

id objc_msgSend_initWithEditorsChoice_productRating_productRatingBadge_productDescription_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEditorsChoice:productRating:productRatingBadge:productDescription:");
}

id objc_msgSend_initWithFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFields:");
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFirst:second:");
}

id objc_msgSend_initWithFlags_presentingSceneIdentifier_presentingSceneBundleIdentifier_externalDeepLinkURL_paymentViewServiceListener_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithFlags:presentingSceneIdentifier:presentingSceneBundleIdentifier:externalDeepLinkURL:paymentViewServiceListener:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithGenreName_genreID_subgenres_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGenreName:genreID:subgenres:");
}

id objc_msgSend_initWithHeadingKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHeadingKind:");
}

id objc_msgSend_initWithID_kind_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:kind:context:");
}

id objc_msgSend_initWithID_kind_context_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:kind:context:limit:");
}

id objc_msgSend_initWithID_kind_metrics_icon_heading_title_subtitle_ageRating_offer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:");
}

id objc_msgSend_initWithID_kind_metrics_icon_heading_title_subtitle_ageRating_offer_features_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:kind:metrics:icon:heading:title:subtitle:ageRating:offer:features:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_alertTitle_alertMessage_alertButtonOffer_alertButtonTitle_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertButtonOffer:alertButtonTitle:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_alertTitle_alertMessage_alertFooterMessage_isCancelable_checkRestrictionsForContentRating_shouldCheckForAvailableDiskSpace_remoteControllerRequirement_shouldIncludeActiveAccountInFooterMessage_shouldPromptForConfirmation_completionOffer_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithID:titles:subtitles:flags:ageRating:metrics:alertTitle:alertMessage:alertFooterMessage:isCancelable:c heckRestrictionsForContentRating:shouldCheckForAvailableDiskSpace:remoteControllerRequirement:shouldIncludeAc tiveAccountInFooterMessage:shouldPromptForConfirmation:completionOffer:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_appVersionId_distributorId_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:titles:subtitles:flags:ageRating:metrics:appVersionId:distributorId:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_baseBuyParams_metricsBuyParams_additionalHeaders_preflightPackageURL_bundleID_itemName_vendorName_capabilities_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithID:titles:subtitles:flags:ageRating:metrics:baseBuyParams:metricsBuyParams:additionalHeaders:prefligh tPackageURL:bundleID:itemName:vendorName:capabilities:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_defaultOffer_buyOffer_openOffer_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:titles:subtitles:flags:ageRating:metrics:defaultOffer:buyOffer:openOffer:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_notSubscribedOffer_subscribedOffer_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:titles:subtitles:flags:ageRating:metrics:notSubscribedOffer:subscribedOffer:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_organicOffer_streamlinedOffer_offerID_iapItemID_iapItemName_iapProductName_offerType_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithID:titles:subtitles:flags:ageRating:metrics:organicOffer:streamlinedOffer:offerID:iapItemID:iapItemNa me:iapProductName:offerType:");
}

id objc_msgSend_initWithID_titles_subtitles_flags_ageRating_metrics_url_isSensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithID:titles:subtitles:flags:ageRating:metrics:url:isSensitive:");
}

id objc_msgSend_initWithIDs_kind_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDs:kind:context:");
}

id objc_msgSend_initWithInstructions_pageFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInstructions:pageFields:");
}

id objc_msgSend_initWithInt64_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInt64:");
}

id objc_msgSend_initWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLongLong:");
}

id objc_msgSend_initWithMetadata_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMetadata:description:");
}

id objc_msgSend_initWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:reason:userInfo:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPercent_cancellable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPercent:cancellable:");
}

id objc_msgSend_initWithPrivacyPolicyUrl_eula_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrivacyPolicyUrl:eula:");
}

id objc_msgSend_initWithProductVariantID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProductVariantID:");
}

id objc_msgSend_initWithScreenshots_trailers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScreenshots:trailers:");
}

id objc_msgSend_initWithShortName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithShortName:");
}

id objc_msgSend_initWithSignpostTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSignpostTags:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStringValue:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTags_dateRanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTags:dateRanges:");
}

id objc_msgSend_initWithTitle_subtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:subtitle:");
}

id objc_msgSend_initWithTopic_shouldFlush_fields_includingFields_excludingFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopic:shouldFlush:fields:includingFields:excludingFields:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_initWithWorkspace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkspace:");
}

id objc_msgSend_instructions(void *a1, const char *a2, ...)
{
  return _[a1 instructions];
}

id objc_msgSend_int64value(void *a1, const char *a2, ...)
{
  return _[a1 int64value];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidAdamID(void *a1, const char *a2, ...)
{
  return _[a1 invalidAdamID];
}

id objc_msgSend_invocationPoints(void *a1, const char *a2, ...)
{
  return _[a1 invocationPoints];
}

id objc_msgSend_isCancelable(void *a1, const char *a2, ...)
{
  return _[a1 isCancelable];
}

id objc_msgSend_isEditorsChoice(void *a1, const char *a2, ...)
{
  return _[a1 isEditorsChoice];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinalized(void *a1, const char *a2, ...)
{
  return _[a1 isFinalized];
}

id objc_msgSend_isSensitive(void *a1, const char *a2, ...)
{
  return _[a1 isSensitive];
}

id objc_msgSend_itemName(void *a1, const char *a2, ...)
{
  return _[a1 itemName];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return _[a1 limit];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockup(void *a1, const char *a2, ...)
{
  return _[a1 lockup];
}

id objc_msgSend_lockupByAddingFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupByAddingFeature:");
}

id objc_msgSend_lockupRequestByAddingMediaQueryParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupRequestByAddingMediaQueryParams:");
}

id objc_msgSend_lockupRequestWithAppDistributionEnabled(void *a1, const char *a2, ...)
{
  return _[a1 lockupRequestWithAppDistributionEnabled];
}

id objc_msgSend_lockupRequestWithClientID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupRequestWithClientID:");
}

id objc_msgSend_lockupRequestWithMediaQueryParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupRequestWithMediaQueryParams:");
}

id objc_msgSend_lockupRequestWithPlatformOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockupRequestWithPlatformOverride:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreenScale(void *a1, const char *a2, ...)
{
  return _[a1 mainScreenScale];
}

id objc_msgSend_mainScreenSize(void *a1, const char *a2, ...)
{
  return _[a1 mainScreenSize];
}

id objc_msgSend_mediaPlatform(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlatform];
}

id objc_msgSend_mediaQueryParams(void *a1, const char *a2, ...)
{
  return _[a1 mediaQueryParams];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return _[a1 metrics];
}

id objc_msgSend_metricsBuyParams(void *a1, const char *a2, ...)
{
  return _[a1 metricsBuyParams];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return _[a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableSupplementaryTags(void *a1, const char *a2, ...)
{
  return _[a1 mutableSupplementaryTags];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nilObject(void *a1, const char *a2, ...)
{
  return _[a1 nilObject];
}

id objc_msgSend_notSubscribedOffer(void *a1, const char *a2, ...)
{
  return _[a1 notSubscribedOffer];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offer(void *a1, const char *a2, ...)
{
  return _[a1 offer];
}

id objc_msgSend_offerID(void *a1, const char *a2, ...)
{
  return _[a1 offerID];
}

id objc_msgSend_offerType(void *a1, const char *a2, ...)
{
  return _[a1 offerType];
}

id objc_msgSend_openApplicationWithBundleIdentifier_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleIdentifier:configuration:completionHandler:");
}

id objc_msgSend_openApplicationWithBundleIdentifier_configuration_pendingResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleIdentifier:configuration:pendingResult:");
}

id objc_msgSend_openApplicationWithBundleIdentifier_payloadURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleIdentifier:payloadURL:");
}

id objc_msgSend_openApplicationWithBundleIdentifier_payloadURL_universalLinkRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleIdentifier:payloadURL:universalLinkRequired:");
}

id objc_msgSend_openApplicationWithBundleIdentifier_usingOpenResourceOperationWithPayloadURL_options_pendingResult_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "openApplicationWithBundleIdentifier:usingOpenResourceOperationWithPayloadURL:options:pendingResult:");
}

id objc_msgSend_openOffer(void *a1, const char *a2, ...)
{
  return _[a1 openOffer];
}

id objc_msgSend_openProductURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openProductURL:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_openWithConfiguration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openWithConfiguration:completionHandler:");
}

id objc_msgSend_operationToOpenResource_usingApplication_uniqueDocumentIdentifier_isContentManaged_sourceAuditToken_userInfo_options_delegate_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo: options:delegate:");
}

id objc_msgSend_organicOffer(void *a1, const char *a2, ...)
{
  return _[a1 organicOffer];
}

id objc_msgSend_pageFields(void *a1, const char *a2, ...)
{
  return _[a1 pageFields];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_paymentViewServiceListener(void *a1, const char *a2, ...)
{
  return _[a1 paymentViewServiceListener];
}

id objc_msgSend_pendingResults(void *a1, const char *a2, ...)
{
  return _[a1 pendingResults];
}

id objc_msgSend_percent(void *a1, const char *a2, ...)
{
  return _[a1 percent];
}

id objc_msgSend_platformOverride(void *a1, const char *a2, ...)
{
  return _[a1 platformOverride];
}

id objc_msgSend_popPendingResultForOperationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popPendingResultForOperationName:");
}

id objc_msgSend_preferredCrop(void *a1, const char *a2, ...)
{
  return _[a1 preferredCrop];
}

id objc_msgSend_preferredFormat(void *a1, const char *a2, ...)
{
  return _[a1 preferredFormat];
}

id objc_msgSend_preflightPackageURL(void *a1, const char *a2, ...)
{
  return _[a1 preflightPackageURL];
}

id objc_msgSend_presentingSceneBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 presentingSceneBundleIdentifier];
}

id objc_msgSend_presentingSceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 presentingSceneIdentifier];
}

id objc_msgSend_preview(void *a1, const char *a2, ...)
{
  return _[a1 preview];
}

id objc_msgSend_primaryTag(void *a1, const char *a2, ...)
{
  return _[a1 primaryTag];
}

id objc_msgSend_privacyPolicyUrl(void *a1, const char *a2, ...)
{
  return _[a1 privacyPolicyUrl];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_productDescription(void *a1, const char *a2, ...)
{
  return _[a1 productDescription];
}

id objc_msgSend_productPageDescription(void *a1, const char *a2, ...)
{
  return _[a1 productPageDescription];
}

id objc_msgSend_productPageMetadata(void *a1, const char *a2, ...)
{
  return _[a1 productPageMetadata];
}

id objc_msgSend_productPageURLForAdamId_deeplink_eventId_encodedMetrics_sourceApplication_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productPageURLForAdamId:deeplink:eventId:encodedMetrics:sourceApplication:");
}

id objc_msgSend_productRating(void *a1, const char *a2, ...)
{
  return _[a1 productRating];
}

id objc_msgSend_productRatingBadge(void *a1, const char *a2, ...)
{
  return _[a1 productRatingBadge];
}

id objc_msgSend_productVariantID(void *a1, const char *a2, ...)
{
  return _[a1 productVariantID];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return _[a1 queryItems];
}

id objc_msgSend_queryParametersForLockup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryParametersForLockup:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_remoteControllerRequirement(void *a1, const char *a2, ...)
{
  return _[a1 remoteControllerRequirement];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_requiresSSOEntitlement(void *a1, const char *a2, ...)
{
  return _[a1 requiresSSOEntitlement];
}

id objc_msgSend_screenshots(void *a1, const char *a2, ...)
{
  return _[a1 screenshots];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _[a1 second];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActiveiTunesAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveiTunesAccount:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setFrontBoardOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrontBoardOptions:");
}

id objc_msgSend_setIgnoreAppLinkEnabledProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreAppLinkEnabledProperty:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setIsFinalized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFinalized:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPercentEncodedHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentEncodedHost:");
}

id objc_msgSend_setPercentEncodedPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentEncodedPath:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSensitive:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_sharedWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 sharedWorkspace];
}

id objc_msgSend_shortName(void *a1, const char *a2, ...)
{
  return _[a1 shortName];
}

id objc_msgSend_shouldCheckForAvailableDiskSpace(void *a1, const char *a2, ...)
{
  return _[a1 shouldCheckForAvailableDiskSpace];
}

id objc_msgSend_shouldFlush(void *a1, const char *a2, ...)
{
  return _[a1 shouldFlush];
}

id objc_msgSend_shouldIncludeActiveAccountInFooterMessage(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludeActiveAccountInFooterMessage];
}

id objc_msgSend_shouldInstallParentApp(void *a1, const char *a2, ...)
{
  return _[a1 shouldInstallParentApp];
}

id objc_msgSend_shouldPromptForConfirmation(void *a1, const char *a2, ...)
{
  return _[a1 shouldPromptForConfirmation];
}

id objc_msgSend_signpostTags(void *a1, const char *a2, ...)
{
  return _[a1 signpostTags];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _[a1 startDate];
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return _[a1 stateLock];
}

id objc_msgSend_streamlinedOffer(void *a1, const char *a2, ...)
{
  return _[a1 streamlinedOffer];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByRemovingPercentEncoding(void *a1, const char *a2, ...)
{
  return _[a1 stringByRemovingPercentEncoding];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_subgenres(void *a1, const char *a2, ...)
{
  return _[a1 subgenres];
}

id objc_msgSend_subscribedOffer(void *a1, const char *a2, ...)
{
  return _[a1 subscribedOffer];
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return _[a1 subsystem];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subtitles(void *a1, const char *a2, ...)
{
  return _[a1 subtitles];
}

id objc_msgSend_supplementaryTags(void *a1, const char *a2, ...)
{
  return _[a1 supplementaryTags];
}

id objc_msgSend_supportsDSIDLessInstall(void *a1, const char *a2, ...)
{
  return _[a1 supportsDSIDLessInstall];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return _[a1 tags];
}

id objc_msgSend_targetApplicationRecord(void *a1, const char *a2, ...)
{
  return _[a1 targetApplicationRecord];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titles(void *a1, const char *a2, ...)
{
  return _[a1 titles];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _[a1 topic];
}

id objc_msgSend_trailers(void *a1, const char *a2, ...)
{
  return _[a1 trailers];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_universalLinkRequired(void *a1, const char *a2, ...)
{
  return _[a1 universalLinkRequired];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueWithBool_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithBool:inContext:");
}

id objc_msgSend_vendorName(void *a1, const char *a2, ...)
{
  return _[a1 vendorName];
}

id objc_msgSend_videoURL(void *a1, const char *a2, ...)
{
  return _[a1 videoURL];
}

id objc_msgSend_videos(void *a1, const char *a2, ...)
{
  return _[a1 videos];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _[a1 width];
}

id objc_msgSend_willEmitSignpostOfType_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willEmitSignpostOfType:withName:");
}