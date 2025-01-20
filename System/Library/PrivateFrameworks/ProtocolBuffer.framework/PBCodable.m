@interface PBCodable
+ (BOOL)supportsSecureCoding;
+ (id)options;
- (BOOL)readFrom:(id)a3;
- (NSData)data;
- (PBCodable)init;
- (PBCodable)initWithCoder:(id)a3;
- (PBCodable)initWithData:(id)a3;
- (id)dictionaryRepresentation;
- (id)formattedText;
- (void)encodeWithCoder:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBCodable

- (PBCodable)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBCodable;
  return -[PBCodable init](&v3, sel_init);
}

- (PBCodable)initWithData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBCodable;
  v5 = -[PBCodable init](&v10, sel_init);
  if (!v5) {
    goto LABEL_4;
  }
  v6 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", v4);
  if (!-[PBCodable readFrom:](v5, "readFrom:", v6))
  {

    goto LABEL_6;
  }

  BOOL v7 = -[PBDataReader hasError](v6, "hasError");

  if (v7)
  {
LABEL_6:
    v8 = 0LL;
    goto LABEL_7;
  }

- (NSData)data
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___PBDataWriter);
  -[PBCodable writeTo:](self, "writeTo:", v3);
  -[PBDataWriter immutableData](v3, "immutableData");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (PBCodable)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PBCodable initWithData:](self, "initWithData:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[PBCodable data](self, "data");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"data"];
}

- (BOOL)readFrom:(id)a3
{
  return 0;
}

- (void)writeTo:(id)a3
{
}

- (id)dictionaryRepresentation
{
  return 0LL;
}

- (id)formattedText
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = objc_msgSend(MEMORY[0x189607940], "string", 0, 0);
  objc_super v3 = (void *)MEMORY[0x186E22E88]();
  _textFormatDictionary(v2, 0LL, (uint64_t)&v6);
  objc_autoreleasePoolPop(v3);
  id v4 = (void *)v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)options
{
  return 0LL;
}

@end