@interface NSString
- (id)tvda_key;
- (void)tvda_setKey:(id)a3;
@end

@implementation NSString

- (void)tvda_setKey:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_setAssociatedObject(v4, off_100029930, location[0], (void *)3);
  objc_storeStrong(location, 0LL);
}

- (id)tvda_key
{
  return objc_getAssociatedObject(self, off_100029930);
}

@end