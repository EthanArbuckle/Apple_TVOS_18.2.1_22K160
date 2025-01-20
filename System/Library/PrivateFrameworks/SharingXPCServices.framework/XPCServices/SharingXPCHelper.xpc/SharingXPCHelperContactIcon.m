@interface SharingXPCHelperContactIcon
+ (BOOL)supportsSecureCoding;
- (CGImage)icon;
- (CNContact)contact;
- (NSData)iconData;
- (SharingXPCHelperContactIcon)initWithCoder:(id)a3;
- (SharingXPCHelperContactIcon)initWithContact:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (SharingXPCHelperContactIcon)initWithContact:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (id)contactIDs;
- (id)description;
- (int64_t)iconIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharingXPCHelperContactIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperContactIcon)initWithContact:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SharingXPCHelperContactIcon;
  v12 = -[SharingXPCHelperImageItem initWithImageTitle:imageData:cacheLookupKey:]( &v15,  "initWithImageTitle:imageData:cacheLookupKey:",  0LL,  a4,  a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    v13->_iconIndex = a5;
  }

  return v13;
}

- (SharingXPCHelperContactIcon)initWithContact:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SharingXPCHelperContactIcon;
  v12 = -[SharingXPCHelperImageItem initWithImageTitle:image:cacheLookupKey:]( &v15,  "initWithImageTitle:image:cacheLookupKey:",  0LL,  a4,  a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    v13->_iconIndex = a5;
  }

  return v13;
}

- (SharingXPCHelperContactIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SharingXPCHelperContactIcon;
  v5 = -[SharingXPCHelperImageItem initWithCoder:](&v9, "initWithCoder:", v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___CNContact);
    NSDecodeObjectIfPresent(v4, @"cn", v6, &v5->_contact);
    id v7 = v4;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SharingXPCHelperContactIcon;
  -[SharingXPCHelperImageItem encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  contact = self->_contact;
  if (contact) {
    [v4 encodeObject:contact forKey:@"cn"];
  }
  [v4 encodeInteger:self->_iconIndex forKey:@"ici"];
}

- (NSData)iconData
{
  return -[SharingXPCHelperImageItem imageData](self, "imageData");
}

- (CGImage)icon
{
  return -[SharingXPCHelperImageItem image](self, "image");
}

- (id)contactIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon contact](self, "contact"));

  if (!v3)
  {
    uint64_t v7 = sharingXPCHelperLog(v4, v5, v6);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "monogramImagesForMultipleContacts called with nil contact, will use fallback.",  v16,  2u);
    }
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon contact](self, "contact"));
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 identifier]);
  id v11 = (void *)v10;
  v12 = @"FALLBACK";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  v17 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));

  return v14;
}

- (id)description
{
  id v8 = 0LL;
  contact = self->_contact;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon iconData](self, "iconData"));
  uint64_t v5 = @"has";
  if (!v4) {
    uint64_t v5 = @"does not have";
  }
  NSAppendPrintF( &v8,  "SharingXPCHelperContactIcon for contact %{private}@ %@ iconData at index %llu",  contact,  v5,  self->_iconIndex);
  id v6 = v8;

  return v6;
}

- (CNContact)contact
{
  return self->_contact;
}

- (int64_t)iconIndex
{
  return self->_iconIndex;
}

- (void).cxx_destruct
{
}

@end