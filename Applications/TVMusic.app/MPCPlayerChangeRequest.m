@interface MPCPlayerChangeRequest
+ (void)performRequest:(id)a3 description:(id)a4 completion:(id)a5;
+ (void)performRequest:(id)a3 description:(id)a4 isUserInitiated:(BOOL)a5 completion:(id)a6;
+ (void)performRequest:(id)a3 description:(id)a4 notificationIdentifier:(id)a5 completion:(id)a6;
@end

@implementation MPCPlayerChangeRequest

+ (void)performRequest:(id)a3 description:(id)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  if (v8)
  {
    uint64_t v12 = swift_allocObject(&unk_100275928, 24LL, 7LL);
    *(void *)(v12 + 16) = v8;
    v8 = sub_10016DBA8;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v14 = (void *)objc_opt_self(&OBJC_CLASS___MPCPlayerChangeRequest);
  v15 = (void *)swift_allocObject(&unk_1002758D8, 72LL, 7LL);
  v15[2] = ObjCClassMetadata;
  v15[3] = v9;
  v15[4] = v11;
  v15[5] = 0LL;
  v15[6] = 0LL;
  v15[7] = v8;
  v15[8] = v12;
  v19[4] = sub_10016D80C;
  v20 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 1107296256LL;
  v19[2] = sub_100166124;
  v19[3] = &unk_1002758F0;
  v16 = _Block_copy(v19);
  v17 = v20;
  id v18 = a3;
  swift_bridgeObjectRetain(v11);
  sub_10011418C((uint64_t)v8, v12);
  objc_msgSend(v14, "performRequest:options:extendedStatusCompletion:", v18, 0, v16, swift_release(v17).n128_f64[0]);
  _Block_release(v16);
  sub_1000E03F0((uint64_t)v8, v12);

  swift_bridgeObjectRelease(v11);
}

+ (void)performRequest:(id)a3 description:(id)a4 isUserInitiated:(BOOL)a5 completion:(id)a6
{
  uint64_t v10 = (uint64_t (*)())_Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  if (v10)
  {
    uint64_t v14 = swift_allocObject(&unk_100275860, 24LL, 7LL);
    *(void *)(v14 + 16) = v10;
    uint64_t v10 = sub_10016DBA8;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  swift_getObjCClassMetadata(a1);
  id v15 = a3;
  sub_10016C19C((uint64_t)v15, v11, v13, a5, (uint64_t)v10, v14);
  sub_1000E03F0((uint64_t)v10, v14);

  swift_bridgeObjectRelease(v13);
}

+ (void)performRequest:(id)a3 description:(id)a4 notificationIdentifier:(id)a5 completion:(id)a6
{
  uint64_t v10 = _Block_copy(a6);
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v13 = v12;
  if (!a5)
  {
    uint64_t v14 = 0LL;
    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0LL;
    goto LABEL_6;
  }

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  a5 = v15;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = swift_allocObject(&unk_100275720, 24LL, 7LL);
  *(void *)(v16 + 16) = v10;
  uint64_t v10 = sub_10016D84C;
LABEL_6:
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  id v18 = (void *)objc_opt_self(&OBJC_CLASS___MPCPlayerChangeRequest);
  v19 = (void *)swift_allocObject(&unk_1002756D0, 72LL, 7LL);
  v19[2] = ObjCClassMetadata;
  v19[3] = v11;
  v19[4] = v13;
  void v19[5] = v14;
  v19[6] = a5;
  v19[7] = v10;
  v19[8] = v16;
  v23[4] = sub_10016D80C;
  v24 = v19;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 1107296256LL;
  v23[2] = sub_100166124;
  v23[3] = &unk_1002756E8;
  v20 = _Block_copy(v23);
  v21 = v24;
  swift_bridgeObjectRetain(a5);
  id v22 = a3;
  swift_bridgeObjectRetain(v13);
  sub_10011418C((uint64_t)v10, v16);
  objc_msgSend(v18, "performRequest:options:extendedStatusCompletion:", v22, 0, v20, swift_release(v21).n128_f64[0]);
  _Block_release(v20);
  sub_1000E03F0((uint64_t)v10, v16);

  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(a5);
}

@end