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
  v6.super_class = (Class)&OBJC_CLASS___BKTouchContactSet;
  v2 = -[BKTouchContactSet init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    contacts = v2->_contacts;
    v2->_contacts = v3;
  }

  return v2;
}

- (id)description
{
  return +[BSDescriptionStream descriptionForRootObject:]( &OBJC_CLASS___BSDescriptionStream,  "descriptionForRootObject:",  self->_contacts);
}

- (int64_t)count
{
  return (int64_t)-[NSMutableArray count](self->_contacts, "count");
}

- (id)copy
{
  v3 = objc_alloc_init(&OBJC_CLASS___BKTouchContactSet);
  v4 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_contacts, "mutableCopy");
  contacts = v3->_contacts;
  v3->_contacts = v4;

  for (uint64_t i = 2LL; i != 32; ++i)
    (&v3->super.isa)[i] = (&self->super.isa)[i];
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)-[NSMutableArray countByEnumeratingWithState:objects:count:]( self->_contacts,  "countByEnumeratingWithState:objects:count:",  a3,  a4,  a5);
}

- (void).cxx_destruct
{
}

@end