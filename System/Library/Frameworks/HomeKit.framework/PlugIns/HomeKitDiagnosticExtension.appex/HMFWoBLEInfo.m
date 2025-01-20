@interface HMFWoBLEInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMFWoBLEInfo)initWithBLEIdentifier:(id)a3;
- (HMFWoBLEInfo)initWithCoder:(id)a3;
- (NSData)bleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFWoBLEInfo

- (HMFWoBLEInfo)initWithBLEIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___HMFWoBLEInfo;
  v6 = -[HMFWoBLEInfo init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bleIdentifier, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HMFWoBLEInfo *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___HMFWoBLEInfo, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0) {
      v7 = v5;
    }
    else {
      v7 = 0LL;
    }
    v8 = v7;
    if (v8)
    {
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoBLEInfo bleIdentifier](v8, "bleIdentifier"));
      char v11 = HMFEqualObjects(v9, v10);
    }

    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier"));
  [v4 encodeObject:v5 forKey:@"HMFCI.woBLE.ID"];
}

- (HMFWoBLEInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSData, v5),  @"HMFCI.woBLE.ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = -[HMFWoBLEInfo initWithBLEIdentifier:](self, "initWithBLEIdentifier:", v7);
  return v8;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<BTLE Identifier: %@>",  v2));

  return v3;
}

- (NSData)bleIdentifier
{
  return self->_bleIdentifier;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end