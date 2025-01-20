@interface PaymentSheetRequest
+ (BOOL)supportsSecureCoding;
- (PaymentSheetRequest)init;
- (PaymentSheetRequest)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PaymentSheetRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PaymentSheetRequest)initWithCoder:(id)a3
{
  return (PaymentSheetRequest *)sub_10011E0C8(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10011E268(v4);
}

- (PaymentSheetRequest)init
{
}

- (void).cxx_destruct
{
}

@end