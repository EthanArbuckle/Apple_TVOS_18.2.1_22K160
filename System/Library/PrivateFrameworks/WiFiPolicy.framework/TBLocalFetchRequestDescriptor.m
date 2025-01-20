@interface TBLocalFetchRequestDescriptor
- (NSFetchRequest)fetchRequest;
- (NSFetchRequest)localFetchRequest;
- (TBLocalFetchRequestDescriptor)initWithFetchRequest:(id)a3;
- (void)setLocalFetchRequest:(id)a3;
@end

@implementation TBLocalFetchRequestDescriptor

- (TBLocalFetchRequestDescriptor)initWithFetchRequest:(id)a3
{
  v4 = (NSFetchRequest *)a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TBLocalFetchRequestDescriptor;
  v5 = -[TBLocalFetchRequestDescriptor init](&v8, sel_init);
  fetchRequest = v5->_fetchRequest;
  v5->_fetchRequest = v4;

  return v5;
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (NSFetchRequest)localFetchRequest
{
  return self->_localFetchRequest;
}

- (void)setLocalFetchRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end