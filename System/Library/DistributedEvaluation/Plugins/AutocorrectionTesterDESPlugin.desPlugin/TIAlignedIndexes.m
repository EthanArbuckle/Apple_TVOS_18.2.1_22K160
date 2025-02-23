@interface TIAlignedIndexes
- (id)description;
- (unint64_t)index1;
- (unint64_t)index2;
- (void)setIndex1:(unint64_t)a3;
- (void)setIndex2:(unint64_t)a3;
@end

@implementation TIAlignedIndexes

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu : %lu",  -[TIAlignedIndexes index1](self, "index1"),  -[TIAlignedIndexes index2](self, "index2"));
}

- (unint64_t)index1
{
  return self->_index1;
}

- (void)setIndex1:(unint64_t)a3
{
  self->_index1 = a3;
}

- (unint64_t)index2
{
  return self->_index2;
}

- (void)setIndex2:(unint64_t)a3
{
  self->_index2 = a3;
}

@end