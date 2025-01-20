@interface AKAppleIDPasskeyVerificationController
- (AKAppleIDPasskeyVerificationController)init;
- (AKAppleIDPasskeyVerificationController)initWithPasskeyValidator:(id)a3 verificationProvider:(id)a4;
@end

@implementation AKAppleIDPasskeyVerificationController

- (AKAppleIDPasskeyVerificationController)initWithPasskeyValidator:(id)a3 verificationProvider:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyVerificationController_passkeyValidator) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKAppleIDPasskeyVerificationController_verificationProvider) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  return -[AKAppleIDPasskeyVerificationController init](&v9, "init");
}

- (AKAppleIDPasskeyVerificationController)init
{
  result = (AKAppleIDPasskeyVerificationController *)_swift_stdlib_reportUnimplementedInitializer( "akd.AppleIDPasskeyVerificationController",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKAppleIDPasskeyVerificationController_passkeyValidator));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___AKAppleIDPasskeyVerificationController_verificationProvider));
}

@end