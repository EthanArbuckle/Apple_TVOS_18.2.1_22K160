@interface AKApplicationMetadataService
- (AKApplicationMetadataService)init;
- (AKApplicationMetadataService)initWithServiceController:(id)a3;
- (void)fetchAuthorizationHTMLResponseTemplateWithCompletion:(id)a3;
- (void)performFetchPrimaryApplicationInformationForClientBundleID:(NSString *)a3 completion:(id)a4;
@end

@implementation AKApplicationMetadataService

- (AKApplicationMetadataService)initWithServiceController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKApplicationMetadataService_serviceController) = (Class)a3;
  v7.receiver = self;
  v7.super_class = ObjectType;
  swift_unknownObjectRetain(a3);
  return -[AKApplicationMetadataService init](&v7, "init");
}

- (void)performFetchPrimaryApplicationInformationForClientBundleID:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject(&unk_1001CB9A0, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CB9C8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020DD38;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CB9F0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020DD40;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020DD48, (uint64_t)v14);
  swift_release(v17);
}

- (void)fetchAuthorizationHTMLResponseTemplateWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject(&unk_1001CB910, 32LL, 7LL);
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 1LL, 1LL, v10);
  v11 = (void *)swift_allocObject(&unk_1001CB938, 48LL, 7LL);
  v11[2] = 0LL;
  v11[3] = 0LL;
  v11[4] = &unk_10020DD20;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject(&unk_1001CB960, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_10020D190;
  v12[5] = v11;
  v13 = self;
  uint64_t v14 = sub_100100A60((uint64_t)v7, (uint64_t)&unk_10020D470, (uint64_t)v12);
  swift_release(v14);
}

- (AKApplicationMetadataService)init
{
  result = (AKApplicationMetadataService *)_swift_stdlib_reportUnimplementedInitializer( "akd.ApplicationMetadataService",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKApplicationMetadataService_serviceController));
}

@end