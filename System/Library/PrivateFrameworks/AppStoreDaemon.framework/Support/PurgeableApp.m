@interface PurgeableApp
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation PurgeableApp

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_new(&OBJC_CLASS___PurgeableApp);
  v6 = (NSString *)-[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  bundleID = v5->_bundleID;
  v5->_bundleID = v6;

  v8 = (NSNumber *)-[NSNumber copyWithZone:](self->_diskUsage, "copyWithZone:", a3);
  diskUsage = v5->_diskUsage;
  v5->_diskUsage = v8;

  v5->_order = self->_order;
  v10 = (NSArray *)-[NSArray copyWithZone:](self->_plugins, "copyWithZone:", a3);
  plugins = v5->_plugins;
  v5->_plugins = v10;

  v12 = (NSString *)-[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  reason = v5->_reason;
  v5->_reason = v12;

  v14 = (NSNumber *)-[NSNumber copyWithZone:](self->_storeItemID, "copyWithZone:", a3);
  storeItemID = v5->_storeItemID;
  v5->_storeItemID = v14;

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ id: %@ usage: %@ reason: %@ }",  self->_bundleID,  self->_diskUsage,  self->_reason);
}

- (void).cxx_destruct
{
}

@end