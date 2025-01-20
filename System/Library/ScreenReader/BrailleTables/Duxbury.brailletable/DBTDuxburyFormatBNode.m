@interface DBTDuxburyFormatBNode
+ (id)beginCode;
+ (id)endCode;
- (id)LaTeXRepresentation;
@end

@implementation DBTDuxburyFormatBNode

+ (id)beginCode
{
  return @"bs";
}

+ (id)endCode
{
  return @"be";
}

- (id)LaTeXRepresentation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DBTDuxburyFormatBNode;
  id v2 = -[DBTDuxburyFormatNode LaTeXRepresentation](&v6, "LaTeXRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"_{%@}", v3));

  return v4;
}

@end