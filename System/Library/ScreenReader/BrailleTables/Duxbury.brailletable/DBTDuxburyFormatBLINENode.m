@interface DBTDuxburyFormatBLINENode
+ (id)beginCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatBLINENode

+ (id)beginCode
{
  return @"bline";
}

- (id)LaTeXRepresentation
{
  return &stru_34AD0;
}

@end