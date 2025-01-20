@interface APSNoOpClientIdentityProvider
- (APSNoOpClientIdentityProvider)init;
- (BOOL)hasUnderlyingIdentityChanged;
- (BOOL)isIdentityAvailable;
- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4;
- (id)identityAvailabilityDidChangeBlock;
- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4;
- (void)setIdentityAvailabilityDidChangeBlock:(id)a3;
@end

@implementation APSNoOpClientIdentityProvider

- (APSNoOpClientIdentityProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NoOpClientIdentityProvider();
  return -[APSNoOpClientIdentityProvider init](&v3, "init");
}

- (id)fetchHostVMCertAndSignNonce:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  unint64_t v10 = v9;

  unint64_t v11 = sub_1000AC284();
  v12 = (void *)static OS_os_log.default.getter(v11);
  uint64_t v13 = static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)( "No host identity to fetch with no op identity provider, returning empty host certificate info which will be ignored by the courier",  130LL,  2LL,  &_mh_execute_header,  v12,  v13,  &_swiftEmptyArrayStorage);

  id result = [objc_allocWithZone((Class)APSDProtoHostCertificateInfo) init];
  if (result)
  {
    id v15 = result;

    sub_1000B03F0(v8, v10);
    return v15;
  }

  else
  {
    __break(1u);
  }

  return result;
}

- (void)fetchClientIdentityForcingNewCert:(BOOL)a3 withCompletion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    id v6 = (void (**)(void, void, void))v5;
    uint64_t v8 = self;
    _Block_copy(v6);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(void, void, Class))v6)[2](v6, 0LL, isa);

    _Block_release(v6);
    _Block_release(v6);
  }

- (id)identityAvailabilityDidChangeBlock
{
  return 0LL;
}

- (void)setIdentityAvailabilityDidChangeBlock:(id)a3
{
  objc_super v3 = _Block_copy(a3);
  if (v3) {
    _Block_release(v3);
  }
}

- (BOOL)isIdentityAvailable
{
  return 1;
}

- (BOOL)hasUnderlyingIdentityChanged
{
  return 0;
}

@end