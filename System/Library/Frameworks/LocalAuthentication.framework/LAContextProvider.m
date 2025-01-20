@interface LAContextProvider
- (id)createContext;
@end

@implementation LAContextProvider

- (id)createContext
{
  return objc_alloc_init(&OBJC_CLASS___LAContext);
}

@end