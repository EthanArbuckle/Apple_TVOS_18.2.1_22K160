@interface RPRSDDeviceInfo_Internal
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (NSUUID)uuid;
- (RPRSDDeviceInfo_Internal)init;
- (int64_t)hash;
@end

@implementation RPRSDDeviceInfo_Internal

- (NSString)name
{
  v2 = (void *)sub_1884CA040();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSUUID)uuid
{
  uint64_t v2 = sub_1884C97F4();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  RSDDeviceInfo.uuid.getter((uint64_t)v5);
  v6 = (void *)sub_1884C97D0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSUUID *)v6;
}

- (int64_t)hash
{
  uint64_t v2 = self;
  int64_t v3 = sub_188431708();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1884CA46C();
    swift_unknownObjectRelease();
  }

  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }

  char v6 = sub_1884317B8((uint64_t)v8);

  sub_188431884((uint64_t)v8);
  return v6 & 1;
}

- (RPRSDDeviceInfo_Internal)init
{
}

- (void).cxx_destruct
{
  int64_t v3 = (char *)self + OBJC_IVAR___RPRSDDeviceInfo_Internal_uuid;
  uint64_t v4 = OUTLINED_FUNCTION_31_0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end