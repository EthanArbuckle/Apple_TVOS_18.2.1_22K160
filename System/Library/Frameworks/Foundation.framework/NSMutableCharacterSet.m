@interface NSMutableCharacterSet
+ (BOOL)supportsSecureCoding;
+ (NSMutableCharacterSet)alphanumericCharacterSet;
+ (NSMutableCharacterSet)capitalizedLetterCharacterSet;
+ (NSMutableCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data;
+ (NSMutableCharacterSet)characterSetWithCharactersInString:(NSString *)aString;
+ (NSMutableCharacterSet)characterSetWithContentsOfFile:(NSString *)fName;
+ (NSMutableCharacterSet)characterSetWithRange:(NSRange)aRange;
+ (NSMutableCharacterSet)controlCharacterSet;
+ (NSMutableCharacterSet)decimalDigitCharacterSet;
+ (NSMutableCharacterSet)decomposableCharacterSet;
+ (NSMutableCharacterSet)illegalCharacterSet;
+ (NSMutableCharacterSet)letterCharacterSet;
+ (NSMutableCharacterSet)lowercaseLetterCharacterSet;
+ (NSMutableCharacterSet)newlineCharacterSet;
+ (NSMutableCharacterSet)nonBaseCharacterSet;
+ (NSMutableCharacterSet)punctuationCharacterSet;
+ (NSMutableCharacterSet)symbolCharacterSet;
+ (NSMutableCharacterSet)uppercaseLetterCharacterSet;
+ (NSMutableCharacterSet)whitespaceAndNewlineCharacterSet;
+ (NSMutableCharacterSet)whitespaceCharacterSet;
- (BOOL)isMutable;
- (NSMutableCharacterSet)init;
- (NSMutableCharacterSet)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)addCharactersInRange:(NSRange)aRange;
- (void)addCharactersInString:(NSString *)aString;
- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet;
- (void)invert;
- (void)removeCharactersInRange:(NSRange)aRange;
- (void)removeCharactersInString:(NSString *)aString;
@end

@implementation NSMutableCharacterSet

+ (NSMutableCharacterSet)characterSetWithRange:(NSRange)aRange
{
  CFIndex length = aRange.length;
  CFIndex location = aRange.location;
  Mutable = CFCharacterSetCreateMutable(0LL);
  v7.CFIndex location = location;
  v7.CFIndex length = length;
  CFCharacterSetAddCharactersInRange(Mutable, v7);
  return (NSMutableCharacterSet *)Mutable;
}

+ (NSMutableCharacterSet)characterSetWithCharactersInString:(NSString *)aString
{
  Mutable = CFCharacterSetCreateMutable(0LL);
  CFCharacterSetAddCharactersInString(Mutable, (CFStringRef)aString);
  return (NSMutableCharacterSet *)Mutable;
}

- (NSMutableCharacterSet)init
{
  if (!init___NSMutableCharacterSetClass) {
    init___NSMutableCharacterSetClass = objc_opt_class();
  }
  Mutable = (NSMutableCharacterSet *)CFCharacterSetCreateMutable(0LL);

  return Mutable;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = -[NSMutableCharacterSet mutableCopyWithZone:](self, "mutableCopyWithZone:", a3);
  [v3 makeImmutable];
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0LL;
}

- (void)addCharactersInRange:(NSRange)aRange
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)removeCharactersInRange:(NSRange)aRange
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)addCharactersInString:(NSString *)aString
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)removeCharactersInString:(NSString *)aString
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)formUnionWithCharacterSet:(NSCharacterSet *)otherSet
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)formIntersectionWithCharacterSet:(NSCharacterSet *)otherSet
{
  uint64_t v5 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v5,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)invert
{
  uint64_t v4 = objc_opt_class();
  Name = sel_getName(a2);
  NSLog( (NSString *)@"Abstract class %@ does not implement method %s; it must be implemented in subclasses.",
    v4,
    Name);
  -[NSMutableCharacterSet doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isMutable
{
  return 1;
}

+ (NSMutableCharacterSet)controlCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet controlCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "controlCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)whitespaceCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet whitespaceCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)whitespaceAndNewlineCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)decimalDigitCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet decimalDigitCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decimalDigitCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)letterCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet letterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "letterCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)lowercaseLetterCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet lowercaseLetterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "lowercaseLetterCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)uppercaseLetterCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet uppercaseLetterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "uppercaseLetterCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)nonBaseCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet nonBaseCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "nonBaseCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)alphanumericCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet alphanumericCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "alphanumericCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)decomposableCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet decomposableCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "decomposableCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)illegalCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet illegalCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "illegalCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)punctuationCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet punctuationCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "punctuationCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)capitalizedLetterCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet capitalizedLetterCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "capitalizedLetterCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)symbolCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet symbolCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "symbolCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)newlineCharacterSet
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet newlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "newlineCharacterSet"),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)characterSetWithBitmapRepresentation:(NSData *)data
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet characterSetWithBitmapRepresentation:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithBitmapRepresentation:",  data),  "mutableCopyWithZone:",  0LL);
}

+ (NSMutableCharacterSet)characterSetWithContentsOfFile:(NSString *)fName
{
  return (NSMutableCharacterSet *) -[NSCharacterSet mutableCopyWithZone:]( +[NSCharacterSet characterSetWithContentsOfFile:]( &OBJC_CLASS___NSCharacterSet,  "characterSetWithContentsOfFile:",  fName),  "mutableCopyWithZone:",  0LL);
}

- (NSMutableCharacterSet)initWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSMutableCharacterSet;
  uint64_t v4 = -[NSCharacterSet initWithCoder:](&v8, sel_initWithCoder_);
  uint64_t v5 = -[NSMutableCharacterSet mutableCopyWithZone:](v4, "mutableCopyWithZone:", 0LL);
  if (v5)
  {
  }

  else
  {
    v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to create mutable copy of the character set %p!",  v4);

    v9 = @"NSLocalizedDescription";
    v10[0] = v6;
    objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end