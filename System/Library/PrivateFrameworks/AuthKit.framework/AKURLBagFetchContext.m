@interface AKURLBagFetchContext
+ (id)contextWithAltDSID:(id)a3;
- (NSString)altDSID;
- (void)setAltDSID:(id)a3;
@end

@implementation AKURLBagFetchContext

+ (id)contextWithAltDSID:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init((Class)objc_opt_class(a1, v5));
  [v6 setAltDSID:v4];

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end