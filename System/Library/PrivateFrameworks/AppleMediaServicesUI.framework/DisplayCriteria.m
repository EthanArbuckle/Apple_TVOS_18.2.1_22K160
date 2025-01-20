@interface DisplayCriteria
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (_TtC14amsengagementd15DisplayCriteria)init;
- (_TtC14amsengagementd15DisplayCriteria)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DisplayCriteria

+ (BOOL)supportsSecureCoding
{
  return sub_1000FC154() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000FC19C(v4);
}

- (_TtC14amsengagementd15DisplayCriteria)initWithCoder:(id)a3
{
  return (_TtC14amsengagementd15DisplayCriteria *)sub_1000FC2FC(a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }

  char v8 = sub_1000FC54C((uint64_t)v10);

  sub_1000FDB4C((uint64_t)v10, &qword_1001CAAD0);
  return v8 & 1;
}

- (_TtC14amsengagementd15DisplayCriteria)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14amsengagementd15DisplayCriteria_notificationSettingsForTopics));
}

@end