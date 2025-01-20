@interface TVSSVPNConfigurationRenderer
- (BOOL)dimCheckmark;
- (id)overrideStylingForIdentifier:(id)a3;
- (void)setDimCheckmark:(BOOL)a3;
@end

@implementation TVSSVPNConfigurationRenderer

- (void)setDimCheckmark:(BOOL)a3
{
  self->_dimCheckmark = a3;
  -[TVSSVPNConfigurationRenderer applyStylings](self, "applyStylings");
}

- (id)overrideStylingForIdentifier:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  *(_DWORD *)&v13[8] = 0;
  id v11 = location[0];
  id v12 = +[TVSPIdentifiers image1ID](&OBJC_CLASS___TVSPIdentifiers, "image1ID");
  *(void *)v13 = objc_msgSend(v11, "isEqualToString:");

  if ((v13[0] & 1) != 0)
  {
    id v10 = location[0];
    if (-[TVSSVPNConfigurationRenderer dimCheckmark](v15, "dimCheckmark")) {
      +[TVSPConstants defaultManagedSubviewDisabledAlpha]( &OBJC_CLASS___TVSPConstants,  "defaultManagedSubviewDisabledAlpha");
    }
    else {
      +[TVSPConstants defaultManagedSubviewAlpha](&OBJC_CLASS___TVSPConstants, "defaultManagedSubviewAlpha");
    }
    id v9 = +[TVSPViewAttribute alpha:](&OBJC_CLASS___TVSPViewAttribute, "alpha:", v3);
    id v16 = v9;
    v8 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL);
    v4 =  +[TVSPStyling stylingWithIdentifier:attributes:]( &OBJC_CLASS___TVSPStyling,  "stylingWithIdentifier:attributes:",  v10);
    v5 = *(void **)&v13[4];
    *(void *)&v13[4] = v4;
  }

  id v7 = *(id *)&v13[4];
  objc_storeStrong((id *)&v13[4], 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (BOOL)dimCheckmark
{
  return self->_dimCheckmark;
}

@end