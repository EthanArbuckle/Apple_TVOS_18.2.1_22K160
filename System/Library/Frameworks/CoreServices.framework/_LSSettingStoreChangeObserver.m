@interface _LSSettingStoreChangeObserver
- (id).cxx_construct;
@end

@implementation _LSSettingStoreChangeObserver

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = -1;
  return self;
}

@end