@interface AKAccountsMetadataController
- (AKAccountsMetadataController)init;
- (AKAccountsMetadataController)initWithMediaServiceController:(id)a3 localStorageController:(id)a4 metadataService:(id)a5;
- (void)cancelAppIconRequestForClientID:(NSString *)a3 completionHandler:(id)a4;
- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completionHandler:(id)a5;
- (void)updatePrimaryAppsMetadataWithDeveloperTeams:(NSArray *)a3 forAltDSID:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation AKAccountsMetadataController

- (AKAccountsMetadataController)initWithMediaServiceController:(id)a3 localStorageController:(id)a4 metadataService:(id)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAccountsMetadataController_mediaServicesController) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAccountsMetadataController_localStorageController) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAccountsMetadataController_metadataService) = (Class)a5;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AccountsMetadataController();
  id v8 = a3;
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  return -[AKAccountsMetadataController init](&v10, "init");
}

- (void)fetchAppIconForClientID:(NSString *)a3 iconSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  uint64_t v10 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject(&unk_1001CC7F8, 56LL, 7LL);
  *((void *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = self;
  uint64_t v15 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56LL))(v12, 1LL, 1LL, v15);
  v16 = (void *)swift_allocObject(&unk_1001CC820, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10020EC30;
  v16[5] = v14;
  v17 = (void *)swift_allocObject(&unk_1001CC848, 48LL, 7LL);
  v17[2] = 0LL;
  v17[3] = 0LL;
  v17[4] = &unk_10020EC38;
  v17[5] = v16;
  v18 = a3;
  v19 = self;
  uint64_t v20 = sub_100100A60((uint64_t)v12, (uint64_t)&unk_10020EC40, (uint64_t)v17);
  swift_release(v20);
}

- (void)cancelAppIconRequestForClientID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject(&unk_1001CC780, 40LL, 7LL);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
  v13 = (void *)swift_allocObject(&unk_1001CC7A8, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_10020EC10;
  v13[5] = v11;
  v14 = (void *)swift_allocObject(&unk_1001CC7D0, 48LL, 7LL);
  v14[2] = 0LL;
  v14[3] = 0LL;
  v14[4] = &unk_10020EC18;
  v14[5] = v13;
  uint64_t v15 = a3;
  v16 = self;
  uint64_t v17 = sub_100100A60((uint64_t)v9, (uint64_t)&unk_10020EC20, (uint64_t)v14);
  swift_release(v17);
}

- (void)updatePrimaryAppsMetadataWithDeveloperTeams:(NSArray *)a3 forAltDSID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_1000B86DC(&qword_10020D450);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject(&unk_1001CC708, 48LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v11, 1LL, 1LL, v14);
  uint64_t v15 = (void *)swift_allocObject(&unk_1001CC730, 48LL, 7LL);
  v15[2] = 0LL;
  v15[3] = 0LL;
  v15[4] = &unk_10020EC00;
  v15[5] = v13;
  v16 = (void *)swift_allocObject(&unk_1001CC758, 48LL, 7LL);
  v16[2] = 0LL;
  v16[3] = 0LL;
  v16[4] = &unk_10020D190;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  v19 = self;
  uint64_t v20 = sub_100100A60((uint64_t)v11, (uint64_t)&unk_10020D470, (uint64_t)v16);
  swift_release(v20);
}

- (AKAccountsMetadataController)init
{
  result = (AKAccountsMetadataController *)_swift_stdlib_reportUnimplementedInitializer( "akd.AccountsMetadataController",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKAccountsMetadataController_localStorageController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKAccountsMetadataController_metadataService));
}

@end