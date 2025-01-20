@interface NSLocalizableString
+ (BOOL)supportsSecureCoding;
+ (id)localizableStringWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4;
- (Class)classForCoder;
- (NSLocalizableString)initWithCoder:(id)a3;
- (NSLocalizableString)initWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4;
- (NSString)developmentLanguageString;
- (NSString)stringsFileKey;
- (id)awakeAfterUsingCoder:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDevelopmentLanguageString:(id)a3;
- (void)setStringsFileKey:(id)a3;
@end

@implementation NSLocalizableString

- (id)awakeAfterUsingCoder:(id)a3
{
  uint64_t v4 = objc_msgSend( (id)objc_msgSend( (id)+[NSBundle currentNibPath](NSBundle, "currentNibPath", a3),  "lastPathComponent"),  "stringByDeletingPathExtension");
  uint64_t v5 = +[NSBundle currentNibLoadingBundle](&OBJC_CLASS___NSBundle, "currentNibLoadingBundle");
  if (v4)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x186E1FF60]();
    [v6 localizedStringsForTable:v4 localization:0];
    objc_autoreleasePoolPop(v7);
    developmentLanguageString = (NSString *)[v6 localizedStringForKey:self->_stringsFileKey value:self->_developmentLanguageString table:v4];
  }

  else
  {
    developmentLanguageString = self->_developmentLanguageString;
  }

  v9 = developmentLanguageString;

  return developmentLanguageString;
}

- (unint64_t)length
{
  return -[NSString length](self->_developmentLanguageString, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->_developmentLanguageString, "characterAtIndex:", a3);
}

- (NSLocalizableString)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSLocalizableString;
  uint64_t v4 = -[NSString init](&v6, sel_init);
  if (v4)
  {
    v4->_stringsFileKey = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSKey"),  "copy");
    v4->_developmentLanguageString = (NSString *)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSDev"),  "copy");
  }

  return v4;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSLocalizableString;
  -[NSString encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_stringsFileKey forKey:@"NSKey"];
  [a3 encodeObject:self->_developmentLanguageString forKey:@"NSDev"];
}

- (NSLocalizableString)initWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSLocalizableString;
  uint64_t v6 = -[NSString init](&v8, sel_init);
  if (v6)
  {
    v6->_stringsFileKey = (NSString *)[a3 copy];
    v6->_developmentLanguageString = (NSString *)[a4 copy];
  }

  return v6;
}

+ (id)localizableStringWithStringsFileKey:(id)a3 developmentLanguageString:(id)a4
{
  return (id)[objc_alloc((Class)a1) initWithStringsFileKey:a3 developmentLanguageString:a4];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSLocalizableString;
  -[NSLocalizableString dealloc](&v3, sel_dealloc);
}

- (NSString)stringsFileKey
{
  return self->_stringsFileKey;
}

- (void)setStringsFileKey:(id)a3
{
  stringsFileKey = self->_stringsFileKey;
  if (stringsFileKey != a3)
  {

    self->_stringsFileKey = (NSString *)[a3 copy];
  }

- (NSString)developmentLanguageString
{
  return self->_developmentLanguageString;
}

- (void)setDevelopmentLanguageString:(id)a3
{
  developmentLanguageString = self->_developmentLanguageString;
  if (developmentLanguageString != a3)
  {

    self->_developmentLanguageString = (NSString *)[a3 copy];
  }

@end