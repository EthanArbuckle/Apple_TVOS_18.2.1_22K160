@interface _NSClStr
- (_NSClStr)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (_NSClStr)initWithString:(id)a3;
- (_NSClStr)initWithUTF8String:(const char *)a3;
- (const)_fastCharacterContents;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _NSClStr

- (_NSClStr)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a3)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NULL argument" userInfo:0]);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSClStr;
  v6 = -[NSString init](&v9, sel_init);
  v6->length = a4;
  a4 *= 2LL;
  v7 = (unsigned __int16 *)malloc(a4);
  v6->characters = v7;
  memcpy(v7, a3, a4);
  return v6;
}

- (_NSClStr)initWithString:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (!a3)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"nil argument" userInfo:0]);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSClStr;
  v4 = -[NSString init](&v8, sel_init);
  uint64_t v5 = [a3 length];
  v4->length = v5;
  v6 = (unsigned __int16 *)malloc(2 * v5);
  v4->characters = v6;
  objc_msgSend(a3, "getCharacters:range:", v6, 0, v5);
  return v4;
}

- (_NSClStr)initWithUTF8String:(const char *)a3
{
  if (a3)
  {
    size_t v5 = strlen(a3);
    rsize_t v6 = 2 * v5;
    v7 = (UniChar *)malloc(2 * v5);
    if (v7)
    {
      objc_super v8 = v7;
      MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy( 0LL,  v7,  0LL,  v5,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
      if (MutableWithExternalCharactersNoCopy)
      {
        uint64_t v10 = MutableWithExternalCharactersNoCopy;
        CFStringAppendCString(MutableWithExternalCharactersNoCopy, a3, 0x8000100u);
        v11 = -[_NSClStr initWithCharacters:length:](self, "initWithCharacters:length:", v8, CFStringGetLength(v10));
        CFRelease(v10);
        memset_s(v8, v6, 0, v6);
        free(v8);
        return v11;
      }

      free(v8);
    }

    else
    {
    }

    v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    v15 = @"Invalid argument";
  }

  else
  {

    v13 = (void *)MEMORY[0x189603F70];
    uint64_t v14 = *MEMORY[0x189603A60];
    v15 = @"NULL argument";
  }

  objc_exception_throw((id)[v13 exceptionWithName:v14 reason:v15 userInfo:0]);
  -[_NSClStr dealloc](v16, v17);
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  memset_s(self->characters, 2 * self->length, 0, 2 * self->length);
  free(self->characters);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSClStr;
  -[_NSClStr dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return self->length;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->length > a3) {
    return self->characters[a3];
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:@"Index out of bounds" userInfo:0]);
  -[_NSClStr getCharacters:range:](v4, v5, v6, v7);
  return result;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = self->length;
  BOOL v5 = length >= a4.length;
  NSUInteger v6 = length - a4.length;
  if (!v5 || a4.location > v6)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B40] reason:@"Range out of bounds" userInfo:0]);
    -[_NSClStr copyWithZone:](v8, v9, v10);
  }

  else
  {
    memcpy(a3, &self->characters[a4.location], 2 * a4.length);
  }

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = self;
  return self;
}

- (const)_fastCharacterContents
{
  return self->characters;
}

@end