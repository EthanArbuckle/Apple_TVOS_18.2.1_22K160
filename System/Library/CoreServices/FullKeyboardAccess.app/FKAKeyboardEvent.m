@interface FKAKeyboardEvent
- (AXEventRepresentation)eventRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setEventRepresentation:(id)a3;
@end

@implementation FKAKeyboardEvent

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___FKAKeyboardEvent;
  id v4 = -[FKAKeyboardEvent copyWithZone:](&v7, "copyWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FKAKeyboardEvent eventRepresentation](self, "eventRepresentation"));
  [v4 setEventRepresentation:v5];

  return v4;
}

- (AXEventRepresentation)eventRepresentation
{
  return self->_eventRepresentation;
}

- (void)setEventRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end