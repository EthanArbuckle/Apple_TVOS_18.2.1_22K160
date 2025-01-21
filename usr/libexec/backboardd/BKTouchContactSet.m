@interface BKTouchContactSet
- (BKTouchContactSet)init;
- (id)copy;
- (id)description;
- (int64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
@end

@implementation BKTouchContactSet

- (BKTouchContactSet)init
{
  v6.receiver = self;
  v6.super_class = [BKTouchContactSet class];
  BKTouchContactSet *v2 = [[BKTouchContactSet alloc] init];
  if (v2)
  {
    NSMutableArray *v3 = [[NSMutableArray alloc] init];
    contacts = v2->_contacts;
    v2->_contacts = v3;
  }

  return v2;
}

- (id)description
{
  return [BSDescriptionStream descriptionForRootObject:self->_contacts];
}

- (int64_t)count
{
  return [self->_contacts count];
}

- (id)copy
{
  BKTouchContactSet *v3 = [[BKTouchContactSet alloc] init];
  v4 = [self->_contacts mutableCopy];
  contacts = v3->_contacts;
  v3->_contacts = v4;

  for (uint64_t i = 2LL; i != 32; ++i)
    (&v3->super.isa)[i] = (&self->super.isa)[i];
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [self->_contacts countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end