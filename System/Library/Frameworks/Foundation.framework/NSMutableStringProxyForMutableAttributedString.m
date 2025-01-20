@interface NSMutableStringProxyForMutableAttributedString
- (NSMutableStringProxyForMutableAttributedString)initWithMutableAttributedString:(id)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
@end

@implementation NSMutableStringProxyForMutableAttributedString

- (NSMutableStringProxyForMutableAttributedString)initWithMutableAttributedString:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSMutableStringProxyForMutableAttributedString;
  v4 = -[NSString init](&v6, sel_init);
  if (v4) {
    v4->mutableAttributedString = (NSMutableAttributedString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSMutableStringProxyForMutableAttributedString;
  -[NSMutableStringProxyForMutableAttributedString dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return -[NSString length](-[NSAttributedString string](self->mutableAttributedString, "string"), "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:]( -[NSAttributedString string](self->mutableAttributedString, "string"),  "characterAtIndex:",  a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
}

@end