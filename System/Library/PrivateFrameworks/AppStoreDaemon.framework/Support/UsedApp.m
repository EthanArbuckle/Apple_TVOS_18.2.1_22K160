@interface UsedApp
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation UsedApp

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___UsedApp);
  v6 = (NSString *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = v6;

  v8 = (NSDate *)-[NSDate copyWithZone:](self->_lastExtensionLaunched, "copyWithZone:", a3);
  lastExtensionLaunched = v5->_lastExtensionLaunched;
  v5->_lastExtensionLaunched = v8;

  v10 = (NSDate *)-[NSDate copyWithZone:](self->_lastLaunched, "copyWithZone:", a3);
  lastLaunched = v5->_lastLaunched;
  v5->_lastLaunched = v10;

  return v5;
}

- (id)description
{
  bundleID = self->_bundleID;
  int64_t usageWindowMatchType = self->_usageWindowMatchType;
  id v5 = sub_1001E83D8(self->_lastLaunched);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_1001E83D8(self->_lastExtensionLaunched);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ id: %@ matchType: %ld lastLaunched: %@ lasExtensionLaunch: %@ }",  bundleID,  usageWindowMatchType,  v6,  v8));

  return v9;
}

- (void).cxx_destruct
{
}

@end