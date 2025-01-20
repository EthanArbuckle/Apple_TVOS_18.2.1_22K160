@interface TVSettingsUserProfilePhotosSharingFilterItem
+ (id)_identifierForSharingFilter:(int64_t)a3;
- (BOOL)isSelected;
- (NSString)identifier;
- (NSString)localizedName;
- (TVSettingsUserProfilePhotosSharingFilterItem)initWithSharingFilter:(int64_t)a3 localizedName:(id)a4;
- (int64_t)sharingFilter;
- (void)setSelected:(BOOL)a3;
@end

@implementation TVSettingsUserProfilePhotosSharingFilterItem

- (TVSettingsUserProfilePhotosSharingFilterItem)initWithSharingFilter:(int64_t)a3 localizedName:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVSettingsUserProfilePhotosSharingFilterItem;
  v7 = -[TVSettingsUserProfilePhotosSharingFilterItem init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    v7->_sharingFilter = a3;
    id v9 = [(id)objc_opt_class(v7) _identifierForSharingFilter:a3];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v10;

    v12 = (NSString *)[v6 copy];
    localizedName = v8->_localizedName;
    v8->_localizedName = v12;
  }

  return v8;
}

+ (id)_identifierForSharingFilter:(int64_t)a3
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TVSPhotosPreferenceSharingFilter.%ld",  a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (int64_t)sharingFilter
{
  return self->_sharingFilter;
}

- (void).cxx_destruct
{
}

@end