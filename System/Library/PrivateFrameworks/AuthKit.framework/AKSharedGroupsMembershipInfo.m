@interface AKSharedGroupsMembershipInfo
- (AKSharedGroupsMembershipInfo)init;
- (BOOL)isEqual:(id)a3;
@end

@implementation AKSharedGroupsMembershipInfo

- (AKSharedGroupsMembershipInfo)init
{
  result = (AKSharedGroupsMembershipInfo *)_swift_stdlib_reportUnimplementedInitializer( "akd.SharedGroupsMembershipInfo",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___AKSharedGroupsMembershipInfo_groupsAndParticipants));
  v3 = (char *)self + OBJC_IVAR___AKSharedGroupsMembershipInfo_savedDate;
  uint64_t v4 = type metadata accessor for Date(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }

  char v8 = sub_1000C4ACC((uint64_t)v10);

  sub_1000BE490((uint64_t)v10);
  return v8 & 1;
}

@end