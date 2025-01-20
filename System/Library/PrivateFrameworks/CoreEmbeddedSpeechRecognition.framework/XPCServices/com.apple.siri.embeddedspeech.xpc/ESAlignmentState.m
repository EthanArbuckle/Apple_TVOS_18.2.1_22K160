@interface ESAlignmentState
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)numberOfDeletions;
- (int64_t)numberOfInsertions;
- (int64_t)numberOfSubstitutions;
- (int64_t)totalCost;
- (void)incrementCost;
- (void)incrementDeletions;
- (void)incrementInsertions;
- (void)incrementSubstitutions;
- (void)setNumberOfDeletions:(int64_t)a3;
- (void)setNumberOfInsertions:(int64_t)a3;
- (void)setNumberOfSubstitutions:(int64_t)a3;
- (void)setTotalCost:(int64_t)a3;
@end

@implementation ESAlignmentState

- (void)incrementInsertions
{
}

- (void)incrementDeletions
{
}

- (void)incrementSubstitutions
{
}

- (void)incrementCost
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[ESAlignmentState init]( +[ESAlignmentState allocWithZone:](&OBJC_CLASS___ESAlignmentState, "allocWithZone:", a3),  "init");
  -[ESAlignmentState setNumberOfInsertions:]( v4,  "setNumberOfInsertions:",  -[ESAlignmentState numberOfInsertions](self, "numberOfInsertions"));
  -[ESAlignmentState setNumberOfSubstitutions:]( v4,  "setNumberOfSubstitutions:",  -[ESAlignmentState numberOfSubstitutions](self, "numberOfSubstitutions"));
  -[ESAlignmentState setNumberOfDeletions:]( v4,  "setNumberOfDeletions:",  -[ESAlignmentState numberOfDeletions](self, "numberOfDeletions"));
  -[ESAlignmentState setTotalCost:](v4, "setTotalCost:", -[ESAlignmentState totalCost](self, "totalCost"));
  return v4;
}

- (int64_t)numberOfInsertions
{
  return self->_numberOfInsertions;
}

- (void)setNumberOfInsertions:(int64_t)a3
{
  self->_numberOfInsertions = a3;
}

- (int64_t)numberOfDeletions
{
  return self->_numberOfDeletions;
}

- (void)setNumberOfDeletions:(int64_t)a3
{
  self->_numberOfDeletions = a3;
}

- (int64_t)numberOfSubstitutions
{
  return self->_numberOfSubstitutions;
}

- (void)setNumberOfSubstitutions:(int64_t)a3
{
  self->_numberOfSubstitutions = a3;
}

- (int64_t)totalCost
{
  return self->_totalCost;
}

- (void)setTotalCost:(int64_t)a3
{
  self->_totalCost = a3;
}

@end