@interface _NSLocalizedStringResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSLocale)locale;
- (NSString)defaultValue;
- (NSString)key;
- (NSString)table;
- (NSURL)bundleURL;
- (_NSLocalizedStringResource)initWithCoder:(id)a3;
- (_NSLocalizedStringResource)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7;
- (_NSLocalizedStringResource)initWithKey:(id)a3 table:(id)a4 locale:(id)a5 bundleURL:(id)a6;
- (_NSLocalizedStringResource)initWithResource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localize;
- (id)localizeWithOptions:(id)a3;
- (id)resource;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setLocale:(id)a3;
@end

@implementation _NSLocalizedStringResource

- (_NSLocalizedStringResource)initWithKey:(id)a3 table:(id)a4 locale:(id)a5 bundleURL:(id)a6
{
  return -[_NSLocalizedStringResource initWithKey:defaultValue:table:locale:bundleURL:]( self,  "initWithKey:defaultValue:table:locale:bundleURL:",  a3,  0LL,  a4,  a5,  a6);
}

- (_NSLocalizedStringResource)initWithKey:(id)a3 defaultValue:(id)a4 table:(id)a5 locale:(id)a6 bundleURL:(id)a7
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (!a3 || !a6 || !a7)
  {
    v14 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v14);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS____NSLocalizedStringResource;
  v12 = -[_NSLocalizedStringResource init](&v15, sel_init);
  if (v12) {
    v12->_resource = -[_NSLocalizedStringResourceSwiftWrapper initWithKey:defaultValue:table:locale:bundleURL:]( objc_alloc(&OBJC_CLASS____NSLocalizedStringResourceSwiftWrapper),  "initWithKey:defaultValue:table:locale:bundleURL:",  a3,  a4,  a5,  a6,  a7);
  }
  return v12;
}

- (_NSLocalizedStringResource)initWithResource:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: nil argument",  _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_8;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: invalid argument",  _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_8:
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v8 userInfo:0]);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSLocalizedStringResource;
  v6 = -[_NSLocalizedStringResource init](&v9, sel_init);
  if (v6) {
    v6->_resource = (_NSLocalizedStringResourceSwiftWrapper *)[a3 copy];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSLocalizedStringResource;
  -[_NSLocalizedStringResource dealloc](&v3, sel_dealloc);
}

- (NSString)key
{
  return (NSString *)(id)-[NSString copy]( -[_NSLocalizedStringResourceSwiftWrapper key](self->_resource, "key"),  "copy");
}

- (NSString)defaultValue
{
  return (NSString *)(id)-[NSString copy]( -[_NSLocalizedStringResourceSwiftWrapper defaultValue]( self->_resource,  "defaultValue"),  "copy");
}

- (NSString)table
{
  return (NSString *)(id)-[NSString copy]( -[_NSLocalizedStringResourceSwiftWrapper table](self->_resource, "table"),  "copy");
}

- (NSLocale)locale
{
  return (NSLocale *)(id)-[NSLocale copy]( -[_NSLocalizedStringResourceSwiftWrapper locale](self->_resource, "locale"),  "copy");
}

- (void)setLocale:(id)a3
{
}

- (NSURL)bundleURL
{
  return (NSURL *)(id)-[NSURL copy]( -[_NSLocalizedStringResourceSwiftWrapper bundleURL]( self->_resource,  "bundleURL"),  "copy");
}

- (id)resource
{
  return (id)-[_NSLocalizedStringResourceSwiftWrapper copy](self->_resource, "copy");
}

- (id)localize
{
  return -[_NSLocalizedStringResourceSwiftWrapper localize](self->_resource, "localize");
}

- (id)localizeWithOptions:(id)a3
{
  return -[_NSLocalizedStringResourceSwiftWrapper localizeWithOptions:](self->_resource, "localizeWithOptions:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[_NSLocalizedStringResource initWithResource:]( objc_alloc(&OBJC_CLASS____NSLocalizedStringResource),  "initWithResource:",  self->_resource);
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<_NSStringLocalizationResource: %p>(%@)",  self,  -[_NSLocalizedStringResourceSwiftWrapper description](self->_resource, "description"));
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_resource forKey:@"NSResource"];
  }

  else
  {
    v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ cannot be encoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v5);
    -[_NSLocalizedStringResource initWithCoder:](v6, v7, v8);
  }

- (_NSLocalizedStringResource)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSResource"];
    if ([a3 error]) {
      return 0LL;
    }
    if (!v6)
    {
      [a3 failWithError:+[NSError _readCorruptErrorWithFormat:]( NSError, "_readCorruptErrorWithFormat:", @"%@: null value for key NSResource", _NSMethodExceptionProem((objc_class *)self, a2))];
      return 0LL;
    }

    return -[_NSLocalizedStringResource initWithResource:](self, "initWithResource:", v6);
  }

  else
  {
    id v8 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ cannot be encoded by non-keyed archivers", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v8);
    return (_NSLocalizedStringResource *)-[_NSLocalizedStringResource hash](v9, v10);
  }

- (unint64_t)hash
{
  uint64_t v3 = [(id)objc_opt_class() hash];
  return -[_NSLocalizedStringResourceSwiftWrapper hash](self->_resource, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[_NSLocalizedStringResourceSwiftWrapper isEqual:](self->_resource, "isEqual:", *((void *)a3 + 1));
}

@end