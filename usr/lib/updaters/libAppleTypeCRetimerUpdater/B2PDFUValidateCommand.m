@interface B2PDFUValidateCommand
- (B2PDFUValidateCommand)init;
- (B2PDFUValidateCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5;
@end

@implementation B2PDFUValidateCommand

- (B2PDFUValidateCommand)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___B2PDFUValidateCommand;
  return -[B2PCommand initWithOpCode:](&v3, sel_initWithOpCode_, 12LL);
}

- (B2PDFUValidateCommand)initWithOpCode:(unsigned __int16)a3 route:(unsigned __int8)a4 data:(id)a5
{
  return 0LL;
}

@end