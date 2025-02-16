@interface NSTextCheckingKeyEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)characters;
- (NSString)charactersIgnoringModifiers;
- (NSString)keyboardLayoutIdentifier;
- (NSString)primaryLanguage;
- (NSTextCheckingKeyEvent)initWithCoder:(id)a3;
- (NSTextCheckingKeyEvent)initWithKeyboardLayoutType:(int64_t)a3 keyboardType:(unint64_t)a4 identifier:(id)a5 primaryLanguage:(id)a6 flags:(unint64_t)a7 timestamp:(double)a8 characters:(id)a9 charactersIgnoringModifiers:(id)a10;
- (double)timestamp;
- (id)description;
- (int64_t)keyboardLayoutType;
- (unint64_t)flags;
- (unint64_t)hash;
- (unint64_t)keyboardType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSTextCheckingKeyEvent

- (NSTextCheckingKeyEvent)initWithKeyboardLayoutType:(int64_t)a3 keyboardType:(unint64_t)a4 identifier:(id)a5 primaryLanguage:(id)a6 flags:(unint64_t)a7 timestamp:(double)a8 characters:(id)a9 charactersIgnoringModifiers:(id)a10
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___NSTextCheckingKeyEvent;
  v17 = -[NSTextCheckingKeyEvent init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_layoutType = a3;
    v17->_keyboardType = a4;
    v17->_identifier = (NSString *)[a5 copy];
    v18->_primaryLanguage = (NSString *)[a6 copy];
    v18->_flags = a7;
    v18->_time = a8;
    v18->_keys = (NSString *)[a9 copy];
    v18->_ukeys = (NSString *)[a10 copy];
  }

  return v18;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSTextCheckingKeyEvent;
  -[NSTextCheckingKeyEvent dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v14) = 1;
    return v14;
  }

  uint64_t v23 = v5;
  uint64_t v24 = v4;
  uint64_t v25 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_15;
  }
  identifier = self->_identifier;
  if (identifier == (NSString *)[a3 keyboardLayoutIdentifier]
    || (BOOL v14 = -[NSString isEqual:](self->_identifier, "isEqual:", [a3 keyboardLayoutIdentifier])))
  {
    primaryLanguage = self->_primaryLanguage;
    if (primaryLanguage == (NSString *)objc_msgSend(a3, "primaryLanguage", v10, v9, v6, v23, v24, v25, v7, v8)
      || (BOOL v14 = -[NSString isEqual:](self->_primaryLanguage, "isEqual:", [a3 primaryLanguage])))
    {
      keys = self->_keys;
      if (keys == (NSString *)[a3 characters]
        || (BOOL v14 = -[NSString isEqual:](self->_keys, "isEqual:", [a3 characters])))
      {
        ukeys = self->_ukeys;
        if (ukeys == (NSString *)[a3 charactersIgnoringModifiers]
          || (BOOL v14 = -[NSString isEqual:](self->_ukeys, "isEqual:", [a3 charactersIgnoringModifiers])))
        {
          int64_t layoutType = self->_layoutType;
          if (layoutType == [a3 keyboardLayoutType])
          {
            unint64_t flags = self->_flags;
            if (flags == [a3 flags])
            {
              double time = self->_time;
              [a3 timestamp];
              LOBYTE(v14) = time == v21;
              return v14;
            }
          }

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)((self->_time / 100000.0 - floor(self->_time / 100000.0)) * 1000000000.0);
  NSUInteger v4 = -[NSString hash](self->_identifier, "hash");
  NSUInteger v5 = -[NSString hash](self->_primaryLanguage, "hash") ^ v4;
  return v5 ^ -[NSString hash](self->_keys, "hash") ^ self->_layoutType ^ self->_flags ^ v3;
}

- (id)description
{
  if (-[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType"))
  {
    if (-[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType") == 1)
    {
      unint64_t v3 = @"ISO";
    }

    else if (-[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType") == 2)
    {
      unint64_t v3 = @"JIS";
    }

    else
    {
      unint64_t v3 = @"?";
    }
  }

  else
  {
    unint64_t v3 = @"ANSI";
  }

  NSUInteger v4 = -[NSTextCheckingKeyEvent keyboardLayoutIdentifier](self, "keyboardLayoutIdentifier");
  NSUInteger v5 = -[NSTextCheckingKeyEvent primaryLanguage](self, "primaryLanguage");
  unint64_t v6 = -[NSTextCheckingKeyEvent keyboardType](self, "keyboardType");
  unint64_t v7 = -[NSTextCheckingKeyEvent flags](self, "flags");
  -[NSTextCheckingKeyEvent timestamp](self, "timestamp");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"keyboard %@/%@/%@/%llu flags 0x%llx time %g <%@> <%@>",  v4,  v5,  v3,  v6,  v7,  v8,  -[NSTextCheckingKeyEvent characters](self, "characters"),  -[NSTextCheckingKeyEvent charactersIgnoringModifiers](self, "charactersIgnoringModifiers"));
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSTextCheckingKeyEvent keyboardLayoutType](self, "keyboardLayoutType"),  @"NSKeyboardLayoutType");
    objc_msgSend( a3,  "encodeInteger:forKey:",  -[NSTextCheckingKeyEvent keyboardType](self, "keyboardType"),  @"NSKeyboardType");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSTextCheckingKeyEvent keyboardLayoutIdentifier](self, "keyboardLayoutIdentifier"),  @"NSKeyboardLayoutIdentifier");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSTextCheckingKeyEvent primaryLanguage](self, "primaryLanguage"),  @"NSPrimaryLanguage");
    objc_msgSend(a3, "encodeInteger:forKey:", -[NSTextCheckingKeyEvent flags](self, "flags"), @"NSFlags");
    -[NSTextCheckingKeyEvent timestamp](self, "timestamp");
    objc_msgSend(a3, "encodeDouble:forKey:", @"NSTimestamp");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSTextCheckingKeyEvent characters](self, "characters"),  @"NSCharacters");
    objc_msgSend( a3,  "encodeObject:forKey:",  -[NSTextCheckingKeyEvent charactersIgnoringModifiers](self, "charactersIgnoringModifiers"),  @"NSCharactersIgnoringModifiers");
  }

  else
  {
    NSUInteger v5 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v5);
    -[NSTextCheckingKeyEvent initWithCoder:](v6, v7, v8);
  }

- (NSTextCheckingKeyEvent)initWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v5 = [a3 decodeIntegerForKey:@"NSKeyboardLayoutType"];
    uint64_t v6 = [a3 decodeIntegerForKey:@"NSKeyboardType"];
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSKeyboardLayoutIdentifier"];
    uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPrimaryLanguage"];
    uint64_t v9 = [a3 decodeIntegerForKey:@"NSFlags"];
    [a3 decodeDoubleForKey:@"NSTimestamp"];
    double v11 = v10;
    uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCharacters"];
    uint64_t v13 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSCharactersIgnoringModifiers"];
    if (v7 && (_NSIsNSString() & 1) == 0)
    {

      v15 = @"Identifier is not a string";
    }

    else if (v8 && (_NSIsNSString() & 1) == 0)
    {

      v15 = @"Primary language is not a string";
    }

    else if (v12 && (_NSIsNSString() & 1) == 0)
    {

      v15 = @"Characters is not a string";
    }

    else
    {
      if (!v13 || (_NSIsNSString() & 1) != 0) {
        return -[NSTextCheckingKeyEvent initWithKeyboardLayoutType:keyboardType:identifier:primaryLanguage:flags:timestamp:characters:charactersIgnoringModifiers:]( self,  "initWithKeyboardLayoutType:keyboardType:identifier:primaryLanguage:flags:timestamp:characters:character sIgnoringModifiers:",  v5,  v6,  v7,  v8,  v9,  v12,  v11,  v13);
      }

      v15 = @"Characters ignoring modifiers is not a string";
    }

    objc_msgSend( a3,  "failWithError:",  +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", v15));
    return 0LL;
  }

  else
  {
    v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@ requires keyed coding", objc_opt_class()), 0 reason userInfo];
    objc_exception_throw(v16);
    return (NSTextCheckingKeyEvent *)+[NSTextCheckingKeyEvent supportsSecureCoding](v17, v18);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)keyboardLayoutType
{
  return self->_layoutType;
}

- (unint64_t)keyboardType
{
  return self->_keyboardType;
}

- (NSString)keyboardLayoutIdentifier
{
  return self->_identifier;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (double)timestamp
{
  return self->_time;
}

- (NSString)characters
{
  return self->_keys;
}

- (NSString)charactersIgnoringModifiers
{
  return self->_ukeys;
}

@end