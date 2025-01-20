@interface AppLaunchEvent
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppLaunchEvent

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___AppLaunchEvent);
  v6 = (NSString *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = v6;

  v8 = (NSString *)-[NSString copyWithZone:](self->_bundleVersion, "copyWithZone:", a3);
  bundleVersion = v5->_bundleVersion;
  v5->_bundleVersion = v8;

  v10 = (NSString *)-[NSString copyWithZone:](self->_clipBundleID, "copyWithZone:", a3);
  clipBundleID = v5->_clipBundleID;
  v5->_clipBundleID = v10;

  v12 = (NSString *)-[NSString copyWithZone:](self->_clipLaunchReason, "copyWithZone:", a3);
  clipLaunchReason = v5->_clipLaunchReason;
  v5->_clipLaunchReason = v12;

  v14 = (NSURL *)-[NSURL copyWithZone:](self->_clipFullURL, "copyWithZone:", a3);
  clipFullURL = v5->_clipFullURL;
  v5->_clipFullURL = v14;

  v16 = (NSString *)-[NSString copyWithZone:](self->_clipReferrerBundleID, "copyWithZone:", a3);
  clipReferrerBundleID = v5->_clipReferrerBundleID;
  v5->_clipReferrerBundleID = v16;

  v18 = (NSURL *)-[NSURL copyWithZone:](self->_clipReferrerURL, "copyWithZone:", a3);
  clipReferrerURL = v5->_clipReferrerURL;
  v5->_clipReferrerURL = v18;

  v20 = (NSString *)-[NSString copyWithZone:](self->_clipWebAppBundleID, "copyWithZone:", a3);
  clipWebAppBundleID = v5->_clipWebAppBundleID;
  v5->_clipWebAppBundleID = v20;

  v22 = (NSString *)-[NSString copyWithZone:](self->_containingBundleID, "copyWithZone:", a3);
  containingBundleID = v5->_containingBundleID;
  v5->_containingBundleID = v22;

  v24 = (NSDate *)-[NSDate copyWithZone:](self->_endDate, "copyWithZone:", a3);
  endDate = v5->_endDate;
  v5->_endDate = v24;

  v26 = (NSNumber *)-[NSNumber copyWithZone:](self->_evid, "copyWithZone:", a3);
  evid = v5->_evid;
  v5->_evid = v26;

  v5->_isExtensionUsage = self->_isExtensionUsage;
  v5->_clip = self->_clip;
  v28 = (NSNumber *)-[NSNumber copyWithZone:](self->_itemID, "copyWithZone:", a3);
  itemID = v5->_itemID;
  v5->_itemID = v28;

  v30 = (NSString *)-[NSString copyWithZone:](self->_itemName, "copyWithZone:", a3);
  itemName = v5->_itemName;
  v5->_itemName = v30;

  v32 = (NSString *)-[NSString copyWithZone:](self->_launchReason, "copyWithZone:", a3);
  launchReason = v5->_launchReason;
  v5->_launchReason = v32;

  v5->_sourceStream = self->_sourceStream;
  v34 = (NSDate *)-[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
  startDate = v5->_startDate;
  v5->_startDate = v34;

  *(_OWORD *)&v5->_usageTime = *(_OWORD *)&self->_usageTime;
  return v5;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (self) {
    bundleID = self->_bundleID;
  }
  else {
    bundleID = 0LL;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundleID: %@",  bundleID));
  [v3 addObject:v5];

  if (self) {
    startDate = self->_startDate;
  }
  else {
    startDate = 0LL;
  }
  id v7 = sub_1001E83D8(startDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"startTime: %@", v8));
  [v3 addObject:v9];

  if (self) {
    endDate = self->_endDate;
  }
  else {
    endDate = 0LL;
  }
  id v11 = sub_1001E83D8(endDate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"endTime: %@", v12));
  [v3 addObject:v13];

  if (self)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"type: %ld",  self->_sourceStream));
    [v3 addObject:v14];

    if (self->_isExtensionUsage) {
      [v3 addObject:@"isExtensionUsage: Y"];
    }
    containingBundleID = self->_containingBundleID;
  }

  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"type: %ld", 0LL));
    [v3 addObject:v24];

    containingBundleID = 0LL;
  }

  if (-[NSString length](containingBundleID, "length"))
  {
    if (self) {
      v16 = self->_containingBundleID;
    }
    else {
      v16 = 0LL;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundleID: %@",  v16));
    [v3 addObject:v17];
  }

  if (self) {
    launchReason = self->_launchReason;
  }
  else {
    launchReason = 0LL;
  }
  if (-[NSString length](launchReason, "length"))
  {
    if (self) {
      v19 = self->_launchReason;
    }
    else {
      v19 = 0LL;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"launchReason: %@",  v19));
    [v3 addObject:v20];
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", @", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"{ %@ }", v21));

  return v22;
}

- (void).cxx_destruct
{
}

@end