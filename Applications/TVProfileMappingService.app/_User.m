@interface _User
- (NSNumber)assignedProfileIndex;
- (NSString)identifier;
- (NSString)name;
- (void)setAssignedProfileIndex:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation _User

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)assignedProfileIndex
{
  return self->_assignedProfileIndex;
}

- (void)setAssignedProfileIndex:(id)a3
{
  self->_assignedProfileIndex = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

@end