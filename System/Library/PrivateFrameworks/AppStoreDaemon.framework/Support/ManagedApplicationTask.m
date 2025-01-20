@interface ManagedApplicationTask
- (void)main;
@end

@implementation ManagedApplicationTask

- (void)main
{
  v3 = self;
  unint64_t v154 = 0LL;
  if (self) {
    self = (ManagedApplicationTask *)objc_getProperty(self, a2, 136LL, 1);
  }
  if (-[ManagedApplicationTask requestType](self, "requestType") == (id)3
    || (!v3 ? (id Property = 0LL) : (id Property = objc_getProperty(v3, v4, 136LL, 1)),
        [Property requestType] == (id)1))
  {
    if (!v3)
    {
      v9 = 0LL;
      LODWORD(v21) = 0;
      unsigned int v149 = 0;
      id v20 = 0LL;
      BOOL v11 = 0LL;
      goto LABEL_78;
    }

    if (v3->_externalVersionIdentifier) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  externalVersionIdentifier = v3->_externalVersionIdentifier;
  if (!externalVersionIdentifier)
  {
    applicationVariant = v3->_applicationVariant;
    if (!applicationVariant)
    {
      BOOL v11 = 0LL;
      id v10 = 0LL;
      v9 = 0LL;
      int v12 = 1;
      goto LABEL_106;
    }

- (void).cxx_destruct
{
}

@end