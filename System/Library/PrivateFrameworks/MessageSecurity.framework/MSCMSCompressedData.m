@interface MSCMSCompressedData
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
- (MSCMSCompressedData)init;
- (MSCMSCompressedData)initWithDataContent:(id)a3 error:(id *)a4;
- (MSCMSCompressedData)initWithEmbeddedContent:(id)a3 error:(id *)a4;
- (MSCMSMessage)embeddedContent;
- (MSOID)contentType;
- (MSOID)type;
- (NSData)dataContent;
- (id)encodeMessageSecurityObject:(id *)a3;
- (void)setContentType:(id)a3;
- (void)setDataContent:(id)a3;
- (void)setEmbeddedContent:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MSCMSCompressedData

- (MSOID)type
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_type);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setType:(id)a3
{
}

- (NSData)dataContent
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  v3 = 0LL;
  unint64_t v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    uint64_t v5 = *v2;
    sub_1811189A4(v5, v4);
    v3 = (void *)sub_18112953C();
    sub_18111DEC4(v5, v4);
  }

  return (NSData *)v3;
}

- (void)setDataContent:(id)a3
{
  v3 = a3;
  if (a3)
  {
    uint64_t v5 = self;
    id v6 = v3;
    v3 = (void *)sub_181129554();
    unint64_t v8 = v7;
  }

  else
  {
    v9 = self;
    unint64_t v8 = 0xF000000000000000LL;
  }

  v10 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  uint64_t *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_18111DEC4(v11, v12);
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)(id)swift_unknownObjectRetain();
}

- (void)setEmbeddedContent:(id)a3
{
  unint64_t v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  *unint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MSOID)contentType
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setContentType:(id)a3
{
}

- (MSCMSCompressedData)initWithDataContent:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = sub_181129554();
  unint64_t v7 = v6;

  return (MSCMSCompressedData *)MSCMSCompressedData.init(dataContent:)(v5, v7);
}

- (MSCMSCompressedData)initWithEmbeddedContent:(id)a3 error:(id *)a4
{
  return (MSCMSCompressedData *)MSCMSCompressedData.init(embeddedContent:)(a3);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v3 = self;
  uint64_t v4 = MSCMSCompressedData.encodeSecurityObject()();
  unint64_t v6 = v5;

  unint64_t v7 = (void *)sub_18112953C();
  sub_181118884(v4, v6);
  return v7;
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_181129554();
  unint64_t v10 = v9;

  uint64_t v11 = sub_181121C10(v8, v10, a4);
  sub_181118884(v8, v10);
  return v11;
}

- (MSCMSCompressedData)init
{
  result = (MSCMSCompressedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end