@interface TVDADataReporter
- (TVDADataReporter)initWithPresentationRequest:(id)a3;
- (void)_reportResult:(id)a3 reason:(id)a4 dynamicRange:(id)a5 HDMIVersion:(id)a6;
- (void)recordConfirmUpgradedMode;
- (void)recordInsufficientNetworkBandwidthWarning;
- (void)recordNetworkInterferenceWarning;
- (void)recordReset;
- (void)recordRevert;
@end

@implementation TVDADataReporter

- (TVDADataReporter)initWithPresentationRequest:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v10;
  id v10 = 0LL;
  v8.receiver = v3;
  v8.super_class = (Class)&OBJC_CLASS___TVDADataReporter;
  id v10 = -[TVDADataReporter init](&v8, "init");
  objc_storeStrong(&v10, v10);
  if (!v10
    || (id v4 = objc_msgSend(location[0], "tvda_aggregatorKind"),
        *((void *)v10 + 1) = v4,
        v7 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance"),
        unsigned __int8 v5 = -[PBSDisplayManager isAdvertisingHDMI2](v7, "isAdvertisingHDMI2"),
        *((_BYTE *)v10 + 16) = v5 & 1,
        v7,
        *((void *)v10 + 1)))
  {
    v11 = (TVDADataReporter *)v10;
  }

  else
  {
    v11 = 0LL;
  }

  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v10, 0LL);
  return v11;
}

- (void)recordRevert
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = @"n/a";
  if (v10->_advertisingHDMI2) {
    v2 = @"2.0";
  }
  else {
    v2 = @"1.4";
  }
  objc_super v8 = v2;
  id location = @"n/a";
  unsigned __int8 v5 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v4 = -[PBSDisplayManager currentDisplayMode](v5, "currentDisplayMode");
  v6 = (char *)[v4 dynamicRange];

  if ((unint64_t)(v6 - 538423554) <= 1)
  {
    objc_storeStrong(&location, @"dolby");
  }

  else if (v6 == (char *)538423556)
  {
    objc_storeStrong(&location, @"hdr");
  }

  else if (v6 == (char *)538423557)
  {
    objc_storeStrong(&location, @"sdr");
  }

  int64_t aggKind = v10->_aggKind;
  switch(aggKind)
  {
    case 1LL:
      objc_storeStrong(v9, @"oob");
      break;
    case 2LL:
      objc_storeStrong(v9, @"settings");
      break;
    case 3LL:
      objc_storeStrong(v9, @"crossbandwidth");
      break;
  }

  -[TVDADataReporter _reportResult:reason:dynamicRange:HDMIVersion:]( v10,  "_reportResult:reason:dynamicRange:HDMIVersion:",  @"revert",  v9[0],  location,  v8);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(v9, 0LL);
}

- (void)recordConfirmUpgradedMode
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = @"success";
  id v11 = @"n/a";
  id location = @"n/a";
  if (v13->_advertisingHDMI2) {
    v2 = @"2.0";
  }
  else {
    v2 = @"1.4";
  }
  v9 = v2;
  v7 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v6 = -[PBSDisplayManager currentDisplayMode](v7, "currentDisplayMode");
  objc_super v8 = (char *)[v6 dynamicRange];

  if ((unint64_t)(v8 - 538423554) <= 1)
  {
    objc_storeStrong(&location, @"dolby");
    int64_t aggKind = v13->_aggKind;
    if (aggKind != 1)
    {
      if (aggKind != 2)
      {
        if (aggKind != 3) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }

- (void)recordReset
{
  objc_super v8 = self;
  v7[1] = (id)a2;
  if (self->_advertisingHDMI2) {
    v2 = @"2.0";
  }
  else {
    v2 = @"1.4";
  }
  v7[0] = v2;
  id location = @"n/a";
  int64_t v4 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v3 = -[PBSDisplayManager currentDisplayMode](v4, "currentDisplayMode");
  unsigned __int8 v5 = (char *)[v3 dynamicRange];

  if ((unint64_t)(v5 - 538423554) <= 1)
  {
    objc_storeStrong(&location, @"dolby");
  }

  else if (v5 == (char *)538423556)
  {
    objc_storeStrong(&location, @"hdr");
  }

  else if (v5 == (char *)538423557)
  {
    objc_storeStrong(&location, @"sdr");
  }

  -[TVDADataReporter _reportResult:reason:dynamicRange:HDMIVersion:]( v8,  "_reportResult:reason:dynamicRange:HDMIVersion:",  @"reset",  @"settings",  location,  v7[0]);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(v7, 0LL);
}

- (void)recordInsufficientNetworkBandwidthWarning
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = @"warning";
  objc_super v8 = @"insufficientnetworkbandwidth";
  id location = @"n/a";
  if (v10->_advertisingHDMI2) {
    v2 = @"2.0";
  }
  else {
    v2 = @"1.4";
  }
  id v6 = v2;
  int64_t v4 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v3 = -[PBSDisplayManager currentDisplayMode](v4, "currentDisplayMode");
  unsigned __int8 v5 = (char *)[v3 dynamicRange];

  if ((unint64_t)(v5 - 538423554) <= 1)
  {
    objc_storeStrong(&location, @"dolby");
  }

  else if (v5 == (char *)538423556)
  {
    objc_storeStrong(&location, @"hdr");
  }

  else if (v5 == (char *)538423557)
  {
    objc_storeStrong(&location, @"sdr");
  }

  -[TVDADataReporter _reportResult:reason:dynamicRange:HDMIVersion:]( v10,  "_reportResult:reason:dynamicRange:HDMIVersion:",  v9[0],  v8,  location,  v6);
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(v9, 0LL);
}

- (void)recordNetworkInterferenceWarning
{
  id v10 = self;
  v9[1] = (id)a2;
  v9[0] = @"warning";
  objc_super v8 = @"networkinterference";
  id location = @"n/a";
  if (v10->_advertisingHDMI2) {
    v2 = @"2.0";
  }
  else {
    v2 = @"1.4";
  }
  id v6 = v2;
  int64_t v4 = +[PBSDisplayManager sharedInstance](&OBJC_CLASS___PBSDisplayManager, "sharedInstance");
  id v3 = -[PBSDisplayManager currentDisplayMode](v4, "currentDisplayMode");
  unsigned __int8 v5 = (char *)[v3 dynamicRange];

  if ((unint64_t)(v5 - 538423554) <= 1)
  {
    objc_storeStrong(&location, @"dolby");
  }

  else if (v5 == (char *)538423556)
  {
    objc_storeStrong(&location, @"hdr");
  }

  else if (v5 == (char *)538423557)
  {
    objc_storeStrong(&location, @"sdr");
  }

  -[TVDADataReporter _reportResult:reason:dynamicRange:HDMIVersion:]( v10,  "_reportResult:reason:dynamicRange:HDMIVersion:",  v9[0],  v8,  location,  v6);
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(v9, 0LL);
}

- (void)_reportResult:(id)a3 reason:(id)a4 dynamicRange:(id)a5 HDMIVersion:(id)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_100006308;
  v13 = &unk_100028648;
  id v14 = location[0];
  id v15 = v20;
  id v16 = v18;
  id v17 = v19;
  AnalyticsSendEventLazy(@"com.apple.appletv.displayassistant.invocation");
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
}

@end