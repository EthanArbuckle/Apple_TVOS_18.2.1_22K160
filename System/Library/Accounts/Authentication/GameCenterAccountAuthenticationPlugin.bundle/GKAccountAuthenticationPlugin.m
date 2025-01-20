@interface GKAccountAuthenticationPlugin
- (BOOL)isPushSupportedForAccount:(id)a3;
- (GKAccountAuthenticationPlugin)init;
- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6;
- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6;
@end

@implementation GKAccountAuthenticationPlugin

- (GKAccountAuthenticationPlugin)init
{
  return result;
}

- (void)verifyCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  v16 = sub_CD40(v10, v11, v12, v13, v14, v15);
  if (v8) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v8,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8);
  }
  if (v16) {
    *(void *)(sub_CD00((uint64_t)&unk_10808, 24LL) + 16) = v16;
  }
  id v17 = v7;
  id v18 = v6;
  v9;
  sub_5878();
  sub_CDAC();

  sub_CA1C(v8);
}

- (void)renewCredentialsForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  v16 = sub_CD40(v10, v11, v12, v13, v14, v15);
  if (v8) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v8,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8);
  }
  if (v16) {
    *(void *)(sub_CD00((uint64_t)&unk_107E0, 24LL) + 16) = v16;
  }
  id v17 = v7;
  id v18 = v6;
  v9;
  sub_60F0();
  sub_CDAC();

  sub_CA1C(v8);
}

- (BOOL)isPushSupportedForAccount:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_8C24();

  return 1;
}

- (id)credentialForAccount:(id)a3 client:(id)a4 store:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = self;
  int v14 = (void *)sub_8D08((uint64_t)a3, a4);

  return v14;
}

- (void)discoverPropertiesForAccount:(id)a3 accountStore:(id)a4 options:(id)a5 completion:(id)a6
{
  uint64_t v7 = v6;
  v9 = v8;
  id v11 = v10;
  int v13 = v12;
  v15 = (void (*)(void, id))_Block_copy(v14);
  if (v7) {
    uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v7,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8);
  }
  if (v15)
  {
    *(void *)(sub_CD00((uint64_t)&unk_107B8, 24LL) + 16) = v15;
    v15 = (void (*)(void, id))sub_C840;
  }

  v11;
  id v16 = v9;
  id v17 = v13;
  sub_9094((uint64_t)v17, (uint64_t)v9, v18, v15);
  sub_CDAC();

  sub_CA1C(v7);
}

- (void).cxx_destruct
{
}

@end