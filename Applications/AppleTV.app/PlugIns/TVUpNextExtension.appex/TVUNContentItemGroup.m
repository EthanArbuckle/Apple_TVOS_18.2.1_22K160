@interface TVUNContentItemGroup
- (NSArray)items;
- (NSDate)expirationDate;
- (NSString)title;
- (void)setExpirationDate:(id)a3;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVUNContentItemGroup

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end