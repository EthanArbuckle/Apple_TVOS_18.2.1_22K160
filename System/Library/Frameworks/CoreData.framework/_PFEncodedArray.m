@interface _PFEncodedArray
+ (Class)classForKeyedUnarchiver;
- (Class)classForCoder;
- (_PFEncodedArray)init;
- (const)_values;
- (id)description;
- (id)mutableCopy;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)_replaceObject:(id)a3 atIndex:(unint64_t)a4;
- (void)dealloc;
@end

@implementation _PFEncodedArray

- (_PFEncodedArray)init
{
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"You're doing it wrong" reason:@"Skanky class can only be used skankily." userInfo:0]);
  -[_PFEncodedArray dealloc](v2, v3);
  return result;
}

- (void)dealloc
{
  if (self->_count)
  {
    unint64_t v3 = 0LL;
    do

    while (v3 < self->_count);
  }

- (id)description
{
  return -[_PFEncodedArray copy](self, "copy");
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)mutableCopy
{
  return (id)[objc_alloc(MEMORY[0x189603FA8]) initWithObjects:&self[1] count:self->_count];
}

- (unint64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (&self[1].super.super.isa)[a3];
}

- (void)_replaceObject:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  v8 = (id *)&(&self->super.super.isa)[a4];

  v8[3] = a3;
}

- (const)_values
{
  return (const void **)&self[1].super.super.isa;
}

@end