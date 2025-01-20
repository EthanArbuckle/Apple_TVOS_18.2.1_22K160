@interface SharingXPCHelperContactIcon
+ (BOOL)supportsSecureCoding;
- (CNContact)contact;
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
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SharingXPCHelperContactIcon;
  v6 = -[SharingXPCHelperImageItem initWithCoder:](&v10, "initWithCoder:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___CNContact, v5);
    NSDecodeObjectIfPresent(v4, @"cn", v7, &v6->_contact);
    id v8 = v4;
  }

  return v6;
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

- (id)contactIDs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon contact](self, "contact"));

  if (!v3)
  {
    uint64_t v4 = sharingXPCHelperLog();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "monogramImagesForMultipleContacts called with nil contact, will use fallback.",  v13,  2u);
    }
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon contact](self, "contact"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 identifier]);
  id v8 = (void *)v7;
  v9 = @"FALLBACK";
  if (v7) {
    v9 = (__CFString *)v7;
  }
  objc_super v10 = v9;

  v14 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));

  return v11;
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