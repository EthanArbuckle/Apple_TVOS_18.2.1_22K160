@interface LACLocalization
+ (id)dtoErrorBiometryNotEnrolled;
+ (id)dtoErrorDeviceTypeNotSupported;
+ (id)dtoErrorPasscodeNotSet;
+ (id)dtoSecurityDelayEndedText:(id)a3 duration:(double)a4;
+ (id)faceID;
+ (id)opticID;
+ (id)touchID;
@end

@implementation LACLocalization

+ (id)faceID
{
  return @objc static LACLocalization.faceID()((int)a1, (int)a2, 0x44495F45434146LL, (void *)0xE700000000000000LL);
}

+ (id)touchID
{
  return @objc static LACLocalization.faceID()((int)a1, (int)a2, 0x44495F4843554F54LL, (void *)0xE800000000000000LL);
}

+ (id)opticID
{
  return @objc static LACLocalization.faceID()((int)a1, (int)a2, 0x44495F434954504FLL, (void *)0xE800000000000000LL);
}

+ (id)dtoSecurityDelayEndedText:(id)a3 duration:(double)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = specialized static LACLocalization.dtoSecurityDelayEndedText(_:duration:)(v5, v6, a4);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  v10 = (void *)MEMORY[0x1895E445C](v7, v9);
  swift_bridgeObjectRelease();
  return v10;
}

+ (id)dtoErrorPasscodeNotSet
{
  return @objc static LACLocalization.dtoErrorPasscodeNotSet()( (int)a1,  (int)a2,  0xD00000000000001ALL,  (void *)0x80000001892BC350LL);
}

+ (id)dtoErrorBiometryNotEnrolled
{
  return @objc static LACLocalization.dtoErrorPasscodeNotSet()( (int)a1,  (int)a2,  0xD00000000000001FLL,  (void *)0x80000001892BC370LL);
}

+ (id)dtoErrorDeviceTypeNotSupported
{
  return @objc static LACLocalization.dtoErrorPasscodeNotSet()( (int)a1,  (int)a2,  0xD000000000000023LL,  (void *)0x80000001892BC390LL);
}

@end