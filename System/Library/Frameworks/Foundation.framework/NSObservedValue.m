@interface NSObservedValue
- (BOOL)_isToManyChangeInformation;
- (BOOL)finished;
- (NSError)error;
- (id)copyToHeap;
- (id)debugDescription;
- (id)value;
- (void)dealloc;
- (void)setError:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation NSObservedValue

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSObservedValue;
  -[NSObservedValue dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3
{
  self->_tag = 1;
  id contents = self->_contents;
  if (contents != a3)
  {

    self->_id contents = a3;
  }

- (id)value
{
  if (self->_tag == 1) {
    return self->_contents;
  }
  else {
    return 0LL;
  }
}

- (void)setError:(id)a3
{
  self->_tag = 2;
  id contents = self->_contents;
  if (contents != a3)
  {

    self->_id contents = a3;
  }

- (NSError)error
{
  if (self->_tag == 2) {
    return (NSError *)self->_contents;
  }
  else {
    return 0LL;
  }
}

- (void)setFinished:(BOOL)a3
{
  self->_tag = 3;

  self->_id contents = (id)*MEMORY[0x189604DE8];
}

- (BOOL)finished
{
  return self->_tag == 3;
}

- (BOOL)_isToManyChangeInformation
{
  return [self->_contents _isToManyChangeInformation];
}

- (id)debugDescription
{
  int tag = self->_tag;
  if (tag == 2) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error %@ in observed value %p",  self->_contents,  self);
  }
  if (tag != 1) {
    return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid observed value: %p",  self,  v6);
  }
  if (-[NSObservedValue _isToManyChangeInformation](self, "_isToManyChangeInformation")) {
    uint64_t v4 = @"To-many collection changes %@ in observed value %p";
  }
  else {
    uint64_t v4 = @"Value %@ in observed value wrapper %p";
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, self->_contents, self);
}

- (id)copyToHeap
{
  if (qword_18C4966F0 != -1) {
    dispatch_once(&qword_18C4966F0, &__block_literal_global_9);
  }
  Instance = class_createInstance((Class)qword_18C4966E8, 0LL);
  Instance[6] = self->_tag;
  *((void *)Instance + 1) = self->_contents;
  return Instance;
}

uint64_t __29__NSObservedValue_copyToHeap__block_invoke()
{
  uint64_t result = objc_opt_class();
  qword_18C4966E8 = result;
  return result;
}

@end