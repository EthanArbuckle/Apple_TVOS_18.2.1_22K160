@interface PDARRUnifiedAccessSignatureProvider
- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3;
- (_TtC5passd35PDARRUnifiedAccessSignatureProvider)init;
- (_TtC5passd35PDARRUnifiedAccessSignatureProvider)initWithSubcredentialManager:(id)a3;
- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5;
- (void)requirementRegistrationFailed:(id)a3 forRequirement:(id)a4 context:(id)a5;
- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7;
- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation PDARRUnifiedAccessSignatureProvider

- (_TtC5passd35PDARRUnifiedAccessSignatureProvider)initWithSubcredentialManager:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5passd35PDARRUnifiedAccessSignatureProvider_subcredentialManager) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return -[PDARRUnifiedAccessSignatureProvider init](&v8, "init");
}

- (_TtC5passd35PDARRUnifiedAccessSignatureProvider)init
{
  result = (_TtC5passd35PDARRUnifiedAccessSignatureProvider *)_swift_stdlib_reportUnimplementedInitializer( "passd.PDARRUnifiedAccessSignatureProvider",  41LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5passd35PDARRUnifiedAccessSignatureProvider_subcredentialManager));
}

- (void)generateKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)requirementRegistrationFailed:(id)a3 forRequirement:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100439254(v8);
}

- (void)requirementRegistrationSuccess:(id)a3 serverKeyMaterial:(id)a4 forRequirement:(id)a5 context:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void (*)(void *, void))v12[2];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = self;
  v13(v12, 0LL);
  _Block_release(v12);
}

- (void)isRegisteredForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)existingKeyMaterialForRequirement:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (BOOL)requiresNFSESessionForOperation:(unint64_t)a3
{
  return 0;
}

- (void)requiresMetadataToGenerateKeyMaterial:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(void *, id, void))_Block_copy(a5);
  id v9 = objc_allocWithZone(&OBJC_CLASS___PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState);
  id v10 = a3;
  id v11 = a4;
  v13 = self;
  id v12 = [v9 initWithCapability:v10 currentVersion:0 targetVersion:0];
  v8[2](v8, v12, 0LL);

  _Block_release(v8);
}

@end