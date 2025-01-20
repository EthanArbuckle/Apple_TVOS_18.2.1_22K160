@interface SDAirDropUserSafetyInterventionAlert
- (_TtC16DaemoniOSLibrary36SDAirDropUserSafetyInterventionAlert)init;
- (void)showInterventionWithIsSend:(BOOL)a3 completion:(id)a4;
@end

@implementation SDAirDropUserSafetyInterventionAlert

- (void)showInterventionWithIsSend:(BOOL)a3 completion:(id)a4
{
  uint64_t v7 = sub_100183098(&qword_100646560);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject(&unk_1005DAD40, 24LL, 7LL);
  *(void *)(v11 + 16) = v10;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  uint64_t v13 = swift_allocObject(&unk_1005DAD68, 64LL, 7LL);
  *(void *)(v13 + 16) = 0LL;
  *(void *)(v13 + 24) = 0LL;
  *(_BYTE *)(v13 + 32) = a3;
  *(void *)(v13 + 40) = self;
  *(void *)(v13 + 48) = sub_100316B98;
  *(void *)(v13 + 56) = v11;
  v14 = self;
  swift_retain(v11);
  uint64_t v15 = sub_1001B37E8((uint64_t)v9, (uint64_t)&unk_10064E890, v13);

  swift_release(v11);
  swift_release(v15);
}

- (_TtC16DaemoniOSLibrary36SDAirDropUserSafetyInterventionAlert)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[SDAirDropUserSafetyInterventionAlert init](&v3, "init");
}

@end