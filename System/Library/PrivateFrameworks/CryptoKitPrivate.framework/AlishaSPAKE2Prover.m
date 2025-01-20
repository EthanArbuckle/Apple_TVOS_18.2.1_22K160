@interface AlishaSPAKE2Prover
- (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover)init;
- (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover)initWithPassword:(id)a3 salt:(id)a4 authenticatedData:(id)a5 keyDerivationCost:(unint64_t)a6;
- (id)getX;
- (id)processResponseWithY:(id)a3 M1:(id)a4;
@end

@implementation AlishaSPAKE2Prover

- (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover)initWithPassword:(id)a3 salt:(id)a4 authenticatedData:(id)a5 keyDerivationCost:(unint64_t)a6
{
  return (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover *)AlishaSPAKE2Prover.init(password:salt:authenticatedData:keyDerivationCost:)( a3,  (uint64_t *)a4,  a5,  (uint64_t *)a6);
}

- (id)getX
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16CryptoKitPrivate18AlishaSPAKE2Prover_X);
  return  objc_msgSend( objc_allocWithZone(MEMORY[0x189603F48]),  sel_initWithBytes_length_,  v2 + 32,  *(void *)(v2 + 16));
}

- (id)processResponseWithY:(id)a3 M1:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_18765A63C(v6, v7);

  return v9;
}

- (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover)init
{
  result = (_TtC16CryptoKitPrivate18AlishaSPAKE2Prover *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end