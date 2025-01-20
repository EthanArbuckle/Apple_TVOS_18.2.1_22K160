@interface TCCDAccessIndirectObject
+ (id)unusedIndirectObject;
- (TCCDAccessIndirectObject)initWithType:(int64_t)a3;
- (id)description;
- (int64_t)type;
- (void)setType:(int64_t)a3;
@end

@implementation TCCDAccessIndirectObject

+ (id)unusedIndirectObject
{
  if (qword_100078258 != -1) {
    dispatch_once(&qword_100078258, &stru_100065250);
  }
  return (id)qword_100078260;
}

- (TCCDAccessIndirectObject)initWithType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TCCDAccessIndirectObject;
  v4 = -[TCCDAccessIndirectObject init](&v7, "init");
  v5 = v4;
  if (v4) {
    -[TCCDAccessIndirectObject setType:](v4, "setType:", a3);
  }
  return v5;
}

- (id)description
{
  if (-[TCCDAccessIndirectObject type](self, "type")) {
    return @"<Unknown>";
  }
  else {
    return @"Unused";
  }
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

@end