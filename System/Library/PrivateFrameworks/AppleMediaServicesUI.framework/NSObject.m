@interface NSObject
- (id)valueForKeyPath:(id)a3 exception:(id *)a4;
@end

@implementation NSObject

- (id)valueForKeyPath:(id)a3 exception:(id *)a4
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject valueForKeyPath:](self, "valueForKeyPath:", v5));

  return v6;
}

@end