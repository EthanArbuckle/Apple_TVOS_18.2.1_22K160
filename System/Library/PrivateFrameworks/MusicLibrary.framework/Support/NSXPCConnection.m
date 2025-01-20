@interface NSXPCConnection
- (BOOL)ml_isValid;
- (void)ml_setValid:(BOOL)a3;
@end

@implementation NSXPCConnection

- (BOOL)ml_isValid
{
  id AssociatedObject = objc_getAssociatedObject(self, "MLNSXPCConnectionIsValidKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)ml_setValid:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, "MLNSXPCConnectionIsValidKey", v4, (void *)1);
}

@end