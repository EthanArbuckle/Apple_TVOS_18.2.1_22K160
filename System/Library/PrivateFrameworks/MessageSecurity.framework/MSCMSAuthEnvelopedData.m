@interface MSCMSAuthEnvelopedData
+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5;
- (MSCMSAuthEnvelopedData)init;
- (MSCMSAuthEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4;
- (MSCMSAuthEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5;
- (MSCMSAuthEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4;
- (MSCMSAuthEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5;
- (MSCMSAuthEnvelopedData)initWithEncryptionAlgorithm:(id)a3;
- (MSCMSMessage)embeddedContent;
- (MSOID)contentType;
- (MSOID)encryptionAlgorithm;
- (NSArray)originatorCertificates;
- (NSArray)protectedAttributes;
- (NSArray)recipients;
- (NSArray)unprotectedAttributes;
- (NSData)dataContent;
- (id)encodeMessageSecurityObject:(id *)a3;
- (id)getAttributesWithOID:(id)a3;
- (id)type;
- (void)addProtectedAttribute:(id)a3;
- (void)addRecipient:(id)a3;
- (void)addUnprotectedAttribute:(id)a3;
- (void)setContentType:(id)a3;
- (void)setContentTypeWithType:(id)a3;
- (void)setDataContent:(id)a3;
- (void)setEmbeddedContent:(id)a3;
- (void)setEncryptionAlgorithm:(id)a3;
- (void)setOriginatorCertificates:(id)a3;
- (void)setProtectedAttributes:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setUnprotectedAttributes:(id)a3;
@end

@implementation MSCMSAuthEnvelopedData

- (NSData)dataContent
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  uint64_t v4 = *v2;
  unint64_t v3 = v2[1];
  sub_1811189A4(v4, v3);
  v5 = (void *)sub_18112953C();
  sub_181118884(v4, v3);
  return (NSData *)v5;
}

- (void)setDataContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_181129554();
  uint64_t v8 = v7;

  v9 = (uint64_t *)((char *)v5 + OBJC_IVAR___MSCMSAuthEnvelopedData_dataContent);
  swift_beginAccess();
  uint64_t v10 = *v9;
  unint64_t v11 = v9[1];
  uint64_t *v9 = v6;
  v9[1] = v8;
  sub_181118884(v10, v11);
}

- (NSArray)recipients
{
  return (NSArray *)sub_181118CB4( (uint64_t)self,  (uint64_t)a2,  (uint64_t)&OBJC_IVAR___MSCMSAuthEnvelopedData_recipients,  &qword_18C548198);
}

- (void)setRecipients:(id)a3
{
}

- (MSOID)encryptionAlgorithm
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptionAlgorithm);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setEncryptionAlgorithm:(id)a3
{
}

- (NSArray)protectedAttributes
{
  return (NSArray *)sub_181118CB4( (uint64_t)self,  (uint64_t)a2,  (uint64_t)&OBJC_IVAR___MSCMSAuthEnvelopedData_protectedAttributes,  &qword_18C548190);
}

- (void)setProtectedAttributes:(id)a3
{
}

- (NSArray)unprotectedAttributes
{
  return (NSArray *)sub_181118CB4( (uint64_t)self,  (uint64_t)a2,  (uint64_t)&OBJC_IVAR___MSCMSAuthEnvelopedData_unprotectedAttributes,  &qword_18C548190);
}

- (void)setUnprotectedAttributes:(id)a3
{
}

- (NSArray)originatorCertificates
{
  v2 = (void *)sub_1811295CC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setOriginatorCertificates:(id)a3
{
  uint64_t v4 = sub_1811295D8();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSAuthEnvelopedData_originatorCertificates);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (MSOID)contentType
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_contentType);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setContentType:(id)a3
{
}

- (MSCMSMessage)embeddedContent
{
  return (MSCMSMessage *)(id)swift_unknownObjectRetain();
}

- (void)setEmbeddedContent:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_embeddedContent);
  swift_beginAccess();
  *uint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MSCMSAuthEnvelopedData)initWithEncryptionAlgorithm:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (MSCMSAuthEnvelopedData *)sub_18111D444(v3);

  return v4;
}

- (MSCMSAuthEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = sub_181129554();
  unint64_t v9 = v8;

  uint64_t v10 = (MSCMSAuthEnvelopedData *)sub_18111D5AC(v7, v9, v6);
  sub_181118884(v7, v9);
  return v10;
}

- (MSCMSAuthEnvelopedData)initWithDataContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_181129554();
  unint64_t v12 = v11;

  v13 = (MSCMSAuthEnvelopedData *)sub_18111D870(v10, v12, a4, v9);
  sub_181118884(v10, v12);
  return v13;
}

- (MSCMSAuthEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4
{
  id v7 = a4;
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v8 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v9 = sub_18111CD44();
  uint64_t v10 = -[MSCMSAuthEnvelopedData initWithEmbeddedContent:recipient:encryptionAlgorithm:]( self,  sel_initWithEmbeddedContent_recipient_encryptionAlgorithm_,  a3,  v7,  v9);

  swift_unknownObjectRelease();
  return v10;
}

- (MSCMSAuthEnvelopedData)initWithEmbeddedContent:(id)a3 recipient:(id)a4 encryptionAlgorithm:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (MSCMSAuthEnvelopedData *)sub_18111DAAC(a3, v8, v9);
  swift_unknownObjectRelease();

  return v10;
}

- (void)addRecipient:(id)a3
{
}

- (id)getAttributesWithOID:(id)a3
{
  uint64_t v4 = (MSOID *)a3;
  id v5 = self;
  unint64_t v6 = (unint64_t)MSCMSAuthEnvelopedData.getAttributes(OID:)(v4);

  if (v6)
  {
    sub_18112057C(0LL, &qword_18C548190);
    id v7 = (void *)sub_1811295CC();
    swift_bridgeObjectRelease();
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)addProtectedAttribute:(id)a3
{
}

- (void)addUnprotectedAttribute:(id)a3
{
}

- (void)setContentTypeWithType:(id)a3
{
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  id v3 = self;
  uint64_t v4 = MSCMSAuthEnvelopedData.encodeMessageSecurityObject()();
  unint64_t v6 = v5;

  id v7 = (void *)sub_18112953C();
  sub_181118884(v4, v6);
  return v7;
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)sub_18111E900(v6, (uint64_t)a4);

  return v8;
}

- (id)type
{
  id v3 = self;
  sub_181129584();
  swift_bridgeObjectRelease();
  sub_18112959C();
  id v4 = objc_allocWithZone((Class)&OBJC_CLASS___MSOID);
  id v5 = sub_18111CD44();

  return v5;
}

- (MSCMSAuthEnvelopedData)init
{
  result = (MSCMSAuthEnvelopedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_181118884( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent),  *(void *)&self->dataContent[OBJC_IVAR___MSCMSAuthEnvelopedData_encryptedContent]);
}

@end