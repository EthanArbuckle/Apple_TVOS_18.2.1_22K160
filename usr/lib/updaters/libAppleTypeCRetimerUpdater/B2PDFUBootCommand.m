@interface B2PDFUBootCommand
- (B2PDFUBootCommand)init;
- (B2PDFUBootCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PDFUBootCommand

- (B2PDFUBootCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PDFUBootCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 14LL);
}

- (B2PDFUBootCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end