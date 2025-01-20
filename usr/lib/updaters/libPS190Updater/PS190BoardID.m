@interface PS190BoardID
- (PS190BoardID)initWithBoardID:(unsigned int)a3;
- (id)description;
- (unsigned)boardID;
@end

@implementation PS190BoardID

- (PS190BoardID)initWithBoardID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190BoardID;
  result = -[PS190BoardID init](&v5, sel_init);
  if (result) {
    result->_boardID = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", self->_boardID);
}

- (unsigned)boardID
{
  return self->_boardID;
}

@end