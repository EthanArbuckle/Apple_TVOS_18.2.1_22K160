@interface AMSDevice
+ (BOOL)sk_isAppleVirtualMachine;
+ (id)sk_bootSession;
+ (id)sk_defaultMediaAPIPlatform;
+ (id)sk_hardwareFamily;
+ (id)sk_hardwareModel;
+ (void)setSk_isAppleVirtualMachine:(BOOL)a3;
@end

@implementation AMSDevice

+ (id)sk_bootSession
{
  uint64_t v2 = sub_10007B1FC(&qword_10032A3D0);
  __chkstk_darwin(v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000CF140((uint64_t)v4);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  Class isa = 0LL;
  if (sub_10007D824((uint64_t)v4, 1LL, v5) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }

  return isa;
}

+ (BOOL)sk_isAppleVirtualMachine
{
  return sub_1000CF60C() & 1;
}

+ (void)setSk_isAppleVirtualMachine:(BOOL)a3
{
}

+ (id)sk_hardwareFamily
{
  return sub_1000CF7F8((uint64_t)a1, (uint64_t)a2, (void (*)(void))sub_1000CF6D4);
}

+ (id)sk_hardwareModel
{
  return sub_1000CF7F8((uint64_t)a1, (uint64_t)a2, sub_1000CF838);
}

+ (id)sk_defaultMediaAPIPlatform
{
  return sub_1000CF050();
}

@end