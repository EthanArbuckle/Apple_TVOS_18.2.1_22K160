@interface NEIKEv2CryptoKitSPAKE2Plus
- (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus)init;
- (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus)initWithSeed:(id)a3 initiatorID:(id)a4 responderID:(id)a5 salt:(id)a6 context:(id)a7 forInitiator:(BOOL)a8 error:(id *)a9;
- (id)getFirstMessageAndReturnError:(id *)a3;
- (id)processFirstPeerMessage:(id)a3 error:(id *)a4;
- (id)processSecondPeerMessage:(id)a3 error:(id *)a4;
@end

@implementation NEIKEv2CryptoKitSPAKE2Plus

- (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus)initWithSeed:(id)a3 initiatorID:(id)a4 responderID:(id)a5 salt:(id)a6 context:(id)a7 forInitiator:(BOOL)a8 error:(id *)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v33 = sub_187860750();
  unint64_t v19 = v18;

  uint64_t v20 = sub_187860750();
  unint64_t v22 = v21;

  uint64_t v23 = sub_187860750();
  unint64_t v25 = v24;

  uint64_t v26 = sub_187860750();
  unint64_t v28 = v27;

  uint64_t v29 = sub_187860750();
  unint64_t v31 = v30;

  return (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *)NEIKEv2CryptoKitSPAKE2Plus.init(seed:initiatorID:responderID:salt:context:forInitiator:)( v33,  v19,  v20,  v22,  v23,  v25,  v26,  v28,  v29,  v31,  a8);
}

- (id)getFirstMessageAndReturnError:(id *)a3
{
  return sub_1876B5AE4(self, (uint64_t)a2, (uint64_t)a3, NEIKEv2CryptoKitSPAKE2Plus.getFirstMessage());
}

- (id)processFirstPeerMessage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_187860750();
  unint64_t v9 = v8;

  uint64_t v10 = NEIKEv2CryptoKitSPAKE2Plus.processFirstPeerMessage(_:)();
  unint64_t v12 = v11;

  sub_1876B8E88(v7, v9);
  id v13 = (void *)sub_187860744();
  sub_1876B8E88(v10, v12);
  return v13;
}

- (id)processSecondPeerMessage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  uint64_t v7 = sub_187860750();
  unint64_t v9 = v8;

  uint64_t v10 = (void *)NEIKEv2CryptoKitSPAKE2Plus.processSecondPeerMessage(_:)();
  sub_1876B8E88(v7, v9);
  return v10;
}

- (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus)init
{
  result = (_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end