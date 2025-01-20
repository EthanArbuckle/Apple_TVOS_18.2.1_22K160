@interface _LSChangeObserver
- (id).cxx_construct;
@end

@implementation _LSChangeObserver

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 5) = -1;
  return self;
}

@end