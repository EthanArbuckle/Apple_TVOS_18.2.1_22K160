@interface MobileAssetExclaveServicesManager
- (BOOL)checkManifestForFSTag:(unsigned int)a3 staged:(BOOL)a4 manifest:(id)a5 infoPlist:(id)a6 catalog:(id)a7 isValid:(BOOL *)a8 error:(id *)a9;
- (BOOL)commitStagedManifestForFSTags:(id)a3 error:(id *)a4;
- (BOOL)invalidateManifestForFSTag:(unsigned int)a3 error:(id *)a4;
- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6;
- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6;
- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)init;
- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)initWithConclave:(BOOL)a3;
- (id)proposeNonce:(id *)a3;
@end

@implementation MobileAssetExclaveServicesManager

- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)initWithConclave:(BOOL)a3
{
  return (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager *)sub_1892E8B90();
}

- (id)proposeNonce:(id *)a3
{
  v3 = self;
  sub_1892E47E4();

  v4 = (void *)sub_1892EC864();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)checkManifestForFSTag:(unsigned int)a3 staged:(BOOL)a4 manifest:(id)a5 infoPlist:(id)a6 catalog:(id)a7 isValid:(BOOL *)a8 error:(id *)a9
{
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  uint64_t v18 = sub_1892EC6D8();
  v20 = v19;

  uint64_t v21 = sub_1892EC6D8();
  v23 = v22;

  uint64_t v24 = sub_1892EC6D8();
  unint64_t v26 = v25;

  sub_1892E5558(a3, v11, v18, v20, v21, v23, v24, v26, a8);
  sub_1892E9710(v24, v26);
  sub_1892E9710(v21, (unint64_t)v23);
  sub_1892E9710(v18, (unint64_t)v20);
  return 1;
}

- (BOOL)storeManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  uint64_t v13 = sub_1892EC6D8();
  unint64_t v15 = v14;

  uint64_t v16 = sub_1892EC6D8();
  unint64_t v18 = v17;

  uint64_t v19 = sub_1892EC6D8();
  unint64_t v21 = v20;

  sub_1892E68B4(v13, v15, v16, v18, v19, v21);
  sub_1892E9710(v19, v21);
  sub_1892E9710(v16, v18);
  sub_1892E9710(v13, v15);
  return 1;
}

- (BOOL)stageManifest:(id)a3 infoPlist:(id)a4 catalog:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  uint64_t v13 = sub_1892EC6D8();
  unint64_t v15 = v14;

  uint64_t v16 = sub_1892EC6D8();
  unint64_t v18 = v17;

  uint64_t v19 = sub_1892EC6D8();
  unint64_t v21 = v20;

  sub_1892E68B4(v13, v15, v16, v18, v19, v21);
  sub_1892E9710(v19, v21);
  sub_1892E9710(v16, v18);
  sub_1892E9710(v13, v15);
  return 1;
}

- (BOOL)commitStagedManifestForFSTags:(id)a3 error:(id *)a4
{
  unint64_t v5 = sub_1892EC8AC();
  v6 = self;
  sub_1892E7110(v5);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)invalidateManifestForFSTag:(unsigned int)a3 error:(id *)a4
{
  unint64_t v5 = self;
  sub_1892E7804(a3);

  return 1;
}

- (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager)init
{
  result = (_TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_log;
  uint64_t v4 = sub_1892EC708();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24SecureMobileAssetExclave33MobileAssetExclaveServicesManager_lock));
  swift_release();
}

@end