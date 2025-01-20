@interface CSDLetMeInRequestorKeyAgreement
- (BOOL)isExhausted;
- (CSDLetMeInRequestorKeyAgreement)init;
@end

@implementation CSDLetMeInRequestorKeyAgreement

- (BOOL)isExhausted
{
  v2 = self;
  BOOL v3 = LetMeInRequestorKeyAgreement.isExhausted.getter();

  return v3;
}

- (CSDLetMeInRequestorKeyAgreement)init
{
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + OBJC_IVAR___CSDLetMeInRequestorKeyAgreement_localKey;
  uint64_t v4 = type metadata accessor for P256.KeyAgreement.PrivateKey(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  sub_1001BB478((uint64_t)self + OBJC_IVAR___CSDLetMeInRequestorKeyAgreement_requestKey, &qword_1004479D0);
  sub_1001BB478((uint64_t)self + OBJC_IVAR___CSDLetMeInRequestorKeyAgreement_responseKey, &qword_1004479D0);
}

@end