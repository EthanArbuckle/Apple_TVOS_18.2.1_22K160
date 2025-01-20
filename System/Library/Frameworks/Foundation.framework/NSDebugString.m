@interface NSDebugString
- (NSDebugString)initWithString:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation NSDebugString

- (NSDebugString)initWithString:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSDebugString;
  v4 = -[NSString init](&v6, sel_init);
  v4->string = (NSString *)objc_msgSend(a3, "copyWithZone:", -[NSDebugString zone](v4, "zone"));
  return v4;
}

- (unint64_t)length
{
  return -[NSString length](self->string, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](self->string, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDebugString;
  -[NSDebugString dealloc](&v3, sel_dealloc);
}

@end