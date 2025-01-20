@interface _NSPersonNameComponentsData
+ (BOOL)supportsSecureCoding;
- (NSPersonNameComponents)phoneticRepresentation;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (_NSPersonNameComponentsData)init;
- (_NSPersonNameComponentsData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPhoneticRepresentation:(id)a3;
@end

@implementation _NSPersonNameComponentsData

- (_NSPersonNameComponentsData)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsData;
  result = -[_NSPersonNameComponentsData init](&v3, sel_init);
  if (result)
  {
    result->_phoneticRepresentation = 0LL;
    *(_OWORD *)&result->_nameSuffix = 0u;
    *(_OWORD *)&result->_middleName = 0u;
    *(_OWORD *)&result->_givenName = 0u;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(&OBJC_CLASS____NSPersonNameComponentsData);
  v5->_givenName = (NSString *)-[NSString copyWithZone:](self->_givenName, "copyWithZone:", a3);
  v5->_familyName = (NSString *)-[NSString copyWithZone:](self->_familyName, "copyWithZone:", a3);
  v5->_middleName = (NSString *)-[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v5->_namePrefix = (NSString *)-[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  v5->_nameSuffix = (NSString *)-[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  v5->_nickname = (NSString *)-[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v5->_phoneticRepresentation = (NSPersonNameComponents *)-[NSPersonNameComponents copyWithZone:]( self->_phoneticRepresentation,  "copyWithZone:",  a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersonNameComponentsData)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    if (self)
    {
      if ([a3 containsValueForKey:@"NS.givenName"]) {
        self->_givenName = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.givenName"),  "copy");
      }
      if ([a3 containsValueForKey:@"NS.familyName"]) {
        self->_familyName = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.familyName"),  "copy");
      }
      if ([a3 containsValueForKey:@"NS.middleName"]) {
        self->_middleName = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.middleName"),  "copy");
      }
      if ([a3 containsValueForKey:@"NS.namePrefix"]) {
        self->_namePrefix = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.namePrefix"),  "copy");
      }
      if ([a3 containsValueForKey:@"NS.nameSuffix"]) {
        self->_nameSuffix = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.nameSuffix"),  "copy");
      }
      if ([a3 containsValueForKey:@"NS.nickname"]) {
        self->_nickname = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.nickname"),  "copy");
      }
      if ([a3 containsValueForKey:@"NS.phoneticRepresentation"]) {
        self->_phoneticRepresentation = (NSPersonNameComponents *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NS.phoneticRepresentation"),  "copy");
      }
    }

    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersonNameComponents cannot be decoded by non-keyed archivers" userInfo:0]);
    -[_NSPersonNameComponentsData encodeWithCoder:](v6, v7, v8);
  }

  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_givenName forKey:@"NS.givenName"];
    [a3 encodeObject:self->_familyName forKey:@"NS.familyName"];
    [a3 encodeObject:self->_middleName forKey:@"NS.middleName"];
    [a3 encodeObject:self->_namePrefix forKey:@"NS.namePrefix"];
    [a3 encodeObject:self->_nameSuffix forKey:@"NS.nameSuffix"];
    [a3 encodeObject:self->_nickname forKey:@"NS.nickname"];
    [a3 encodeObject:self->_phoneticRepresentation forKey:@"NS.phoneticRepresentation"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSPersonNameComponents cannot be encoded by non-keyed archivers" userInfo:0]);
    -[_NSPersonNameComponentsData dealloc](v5, v6);
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if (self)
  {

    self->_givenName = 0LL;
    self->_familyName = 0LL;

    self->_middleName = 0LL;
    self->_namePrefix = 0LL;

    self->_nameSuffix = 0LL;
    self->_nickname = 0LL;

    self->_phoneticRepresentation = 0LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersonNameComponentsData;
  -[_NSPersonNameComponentsData dealloc](&v3, sel_dealloc);
}

- (NSString)givenName
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)middleName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)namePrefix
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setNamePrefix:(id)a3
{
}

- (NSString)nameSuffix
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNameSuffix:(id)a3
{
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setNickname:(id)a3
{
}

- (NSPersonNameComponents)phoneticRepresentation
{
  return (NSPersonNameComponents *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setPhoneticRepresentation:(id)a3
{
}

@end