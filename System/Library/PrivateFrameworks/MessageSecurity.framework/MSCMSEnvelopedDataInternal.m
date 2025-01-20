@interface MSCMSEnvelopedDataInternal
- (MSCMSEnvelopedDataInternal)init;
- (MSCMSEnvelopedDataInternal)initWithEnvelopedData:(id)a3;
- (id)encodeMessageSecurityObject:(id *)a3;
@end

@implementation MSCMSEnvelopedDataInternal

- (MSCMSEnvelopedDataInternal)initWithEnvelopedData:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MSCMSEnvelopedDataInternal_envelopedData) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return -[MSCMSEnvelopedDataInternal init](&v8, sel_init);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  v4 = self;
  v5.super.isa = MSCMSEnvelopedDataInternal.encodeMessageSecurityObject()().super.isa;

  if (v6.super.isa)
  {
    if (a3)
    {
      v7 = (void *)sub_1811294F4();

      id v8 = v7;
      v5.super.isa = 0LL;
      *a3 = v7;
    }

    else
    {

      v5.super.isa = 0LL;
    }
  }

  return v5.super.isa;
}

- (MSCMSEnvelopedDataInternal)init
{
  result = (MSCMSEnvelopedDataInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end