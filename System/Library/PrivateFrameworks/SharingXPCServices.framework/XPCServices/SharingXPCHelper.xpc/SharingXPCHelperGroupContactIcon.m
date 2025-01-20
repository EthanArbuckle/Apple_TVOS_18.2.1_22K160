@interface SharingXPCHelperGroupContactIcon
+ (BOOL)supportsSecureCoding;
- (NSArray)contacts;
- (SharingXPCHelperGroupContactIcon)initWithCoder:(id)a3;
- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6;
- (id)contactIDs;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharingXPCHelperGroupContactIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 iconData:(id)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SharingXPCHelperGroupContactIcon;
  v12 = -[SharingXPCHelperContactIcon initWithContact:iconData:atIndex:cacheLookupKey:]( &v15,  "initWithContact:iconData:atIndex:cacheLookupKey:",  0LL,  a4,  a5,  a6);
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_contacts, a3);
  }

  return v13;
}

- (SharingXPCHelperGroupContactIcon)initWithContacts:(id)a3 icon:(CGImage *)a4 atIndex:(int64_t)a5 cacheLookupKey:(id)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SharingXPCHelperGroupContactIcon;
  v12 = -[SharingXPCHelperContactIcon initWithContact:icon:atIndex:cacheLookupKey:]( &v15,  "initWithContact:icon:atIndex:cacheLookupKey:",  0LL,  a4,  a5,  a6);
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_contacts, a3);
  }

  return v13;
}

- (SharingXPCHelperGroupContactIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SharingXPCHelperGroupContactIcon;
  v5 = -[SharingXPCHelperContactIcon initWithCoder:](&v8, "initWithCoder:", v4);
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___CNContact);
    NSDecodeNSArrayOfClassIfPresent(v4, @"SharingXPCHelperGroupContactIcon-Contacts", v6, &v5->_contacts);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SharingXPCHelperGroupContactIcon;
  -[SharingXPCHelperContactIcon encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  contacts = self->_contacts;
  if (contacts) {
    [v4 encodeObject:contacts forKey:@"SharingXPCHelperGroupContactIcon-Contacts"];
  }
}

- (id)contactIDs
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperGroupContactIcon contacts](self, "contacts", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      objc_super v8 = 0LL;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) identifier]);
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        objc_super v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingSelector:](v3, "sortedArrayUsingSelector:", "compare:"));
  return v10;
}

- (id)description
{
  id v8 = 0LL;
  contacts = self->_contacts;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharingXPCHelperContactIcon iconData](self, "iconData"));
  if (v4) {
    id v5 = @"has";
  }
  else {
    id v5 = @"does not have";
  }
  NSAppendPrintF( &v8,  "SharingXPCHelperGroupContactIcon for contacts %{private}@ %@ iconData at index %llu",  contacts,  v5,  -[SharingXPCHelperContactIcon iconIndex](self, "iconIndex"));
  id v6 = v8;

  return v6;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void).cxx_destruct
{
}

@end