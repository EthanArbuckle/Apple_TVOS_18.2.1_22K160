@interface TVSettingsCertificateTrustFacade
+ (id)sharedInstance;
- (NSArray)trustCertificates;
- (TVSettingsCertificateTrustFacade)init;
- (id)_displayNameForCertificate:(__SecCertificate *)a3;
- (void)_updateCertificates;
- (void)setTrustCertificates:(id)a3;
@end

@implementation TVSettingsCertificateTrustFacade

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000361A0;
  block[3] = &unk_10018E7A8;
  block[4] = a1;
  if (qword_1001E16A0 != -1) {
    dispatch_once(&qword_1001E16A0, block);
  }
  return (id)qword_1001E1698;
}

- (TVSettingsCertificateTrustFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsCertificateTrustFacade;
  v2 = -[TVSettingsCertificateTrustFacade init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TVSettingsCertificateTrustFacade _updateCertificates](v2, "_updateCertificates");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"_updateCertificates" name:MCProfileListChangedNotification object:0];
  }

  return v3;
}

- (void)_updateCertificates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v21 = 0LL;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 lockedDownRootCertificatesWithOutLocalizedSourceDescription:&v21]);
  id v5 = v21;

  CFArrayRef theArray = 0LL;
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = SecTrustStoreForDomain(2LL, v7);
  if (!SecTrustStoreCopyAll(v8, &theArray) && theArray)
  {
    id v19 = v5;
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0LL; i != v10; ++i)
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(theArray, i);
        v13 = (const __CFData *)CFArrayGetValueAtIndex(ValueAtIndex, 0LL);
        id v14 = [v4 containsObject:v13];
        SecCertificateRef v15 = SecCertificateCreateWithData(kCFAllocatorDefault, v13);
        if (v15)
        {
          SecCertificateRef v16 = v15;
          v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsCertificateTrustFacade _displayNameForCertificate:]( self,  "_displayNameForCertificate:",  v15));
          if (v17)
          {
            v18 = objc_alloc_init(&OBJC_CLASS___TVSettingsCertificateTrustItem);
            -[TVSettingsCertificateTrustItem setDisplayName:](v18, "setDisplayName:", v17);
            -[TVSettingsCertificateTrustItem setCert:](v18, "setCert:", v16);
            -[TVSettingsCertificateTrustItem setRestricted:](v18, "setRestricted:", v14);
            -[NSMutableArray addObject:](v6, "addObject:", v18);
          }
        }
      }
    }

    CFRelease(theArray);
    id v5 = v19;
  }

  -[TVSettingsCertificateTrustFacade setTrustCertificates:](self, "setTrustCertificates:", v6);
}

- (id)_displayNameForCertificate:(__SecCertificate *)a3
{
  v3 = (void *)SecCertificateCopyCommonNames(a3, a2);
  if ([v3 count]) {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (NSArray)trustCertificates
{
  return self->_trustCertificates;
}

- (void)setTrustCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end