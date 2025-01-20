@interface RDUserData
+ (BOOL)supportsSecureCoding;
+ (void)fetchUserDataWithLanguage:(id)a3 completion:(id)a4;
+ (void)fetchUserDataWithLanguage:(id)a3 keepGoing:(id)a4 completion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)contactsWords;
- (NSDictionary)dictionaryRepresentation;
- (NSString)language;
- (RDUserData)initWithCoder:(id)a3;
- (id)_initWithLanguage:(id)a3;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)_fetchContactsWithKeepGoing:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RDUserData

- (id)_initWithLanguage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___RDUserData;
  v4 = -[RDUserData init](&v6, "init");
  if (v4)
  {
    v4->_language = (NSString *)[a3 copy];
    v4->_contactsWords = (NSArray *)&__NSArray0__struct;
  }

  return v4;
}

- (void)dealloc
{
  language = self->_language;
  if (language) {

  }
  contactsWords = self->_contactsWords;
  if (contactsWords) {

  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RDUserData;
  -[RDUserData dealloc](&v5, "dealloc");
}

- (void)_fetchContactsWithKeepGoing:(id)a3
{
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  uint64_t v32 = 0LL;
  objc_super v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v28 = 0LL;
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  -[CNContactStore requestAccessForEntityType:completionHandler:]( v6,  "requestAccessForEntityType:completionHandler:",  0LL,  &stru_1000CF120);
  v41[0] = CNContactGivenNameKey;
  v41[1] = CNContactMiddleNameKey;
  v41[2] = CNContactFamilyNameKey;
  v41[3] = CNContactNicknameKey;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100037BB4;
  v27[3] = &unk_1000CF148;
  v27[4] = v5;
  v27[5] = a3;
  v27[6] = &v29;
  v27[7] = &v33;
  LODWORD(a3) = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]( v6,  "enumerateContactsWithFetchRequest:error:usingBlock:",  -[CNContactFetchRequest initWithKeysToFetch:]( objc_alloc(&OBJC_CLASS___CNContactFetchRequest),  "initWithKeysToFetch:",  +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 4LL)),  &v28,  v27);
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x2020000000LL;
  uint64_t v22 = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100037D20;
  v18[3] = &unk_1000CF170;
  v18[4] = v5;
  v18[5] = &v29;
  v18[6] = &v23;
  v18[7] = &v19;
  +[_INVocabulary enumerateVocabularyUsingBlock:](&OBJC_CLASS____INVocabulary, "enumerateVocabularyUsingBlock:", v18);
  if ((_DWORD)a3)
  {
    v7 = (os_log_s *)RXOSLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v8 = v34[3];
    uint64_t v9 = v30[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v38 = v8;
    __int16 v39 = 2048;
    uint64_t v40 = v9;
    v10 = "Found %lu and added %lu contact(s) for offline recognition";
    v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    uint32_t v13 = 22;
  }

  else
  {
    v14 = (os_log_s *)RXOSLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v38 = v28;
    v10 = "Could not get contacts for offline recognition: %@";
    v11 = v14;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
LABEL_7:
  v15 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v24[3];
    uint64_t v17 = v20[3];
    *(_DWORD *)buf = 134218240;
    uint64_t v38 = v16;
    __int16 v39 = 2048;
    uint64_t v40 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Found %lu and added %lu contact(s) from INVocabulary for offline recognition",  buf,  0x16u);
  }

  self->_contactsWords = (NSArray *)-[NSMutableArray copy](v5, "copy");
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

+ (void)fetchUserDataWithLanguage:(id)a3 completion:(id)a4
{
}

+ (void)fetchUserDataWithLanguage:(id)a3 keepGoing:(id)a4 completion:(id)a5
{
  id v9 = -[RDUserData _initWithLanguage:](objc_alloc(&OBJC_CLASS___RDUserData), "_initWithLanguage:", a3);
  v10 = dispatch_group_create();
  v11 = (objc_class *)objc_opt_class(a1);
  os_log_type_t v12 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s.%@",  class_getName(v11),  a3),  "UTF8String");
  uint32_t v13 = dispatch_queue_create(v12, 0LL);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10003839C;
  v20[3] = &unk_1000CF1D8;
  v20[4] = v9;
  v20[5] = a4;
  if (qword_1000DDD90 != -1) {
    dispatch_once(&qword_1000DDD90, &stru_1000CF220);
  }
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003882C;
  block[3] = &unk_1000CF248;
  block[4] = @"Contacts";
  block[5] = &v26;
  dispatch_sync((dispatch_queue_t)qword_1000DDD98, block);
  if (*((_BYTE *)v27 + 24))
  {
    v14 = (os_log_s *)RXOSLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"Contacts";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Skipping fetch for  %@ because another fetch is still active",  (uint8_t *)&buf,  0xCu);
    }
  }

  else
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100038880;
    v24[3] = &unk_1000CDBC8;
    v24[4] = @"Contacts";
    v22[0] = 0LL;
    v22[1] = v22;
    v22[2] = 0x2020000000LL;
    char v23 = 0;
    -[NSProcessInfo systemUptime]( +[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"),  "systemUptime");
    uint64_t v16 = v15;
    dispatch_time_t v17 = dispatch_time(0LL, 15000000000LL);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10003899C;
    v21[3] = &unk_1000CF270;
    v21[6] = v24;
    v21[7] = v22;
    v21[4] = @"Contacts";
    v21[5] = v10;
    dispatch_after(v17, v13, v21);
    dispatch_group_enter(v10);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    uint64_t v31 = sub_100038A74;
    uint64_t v32 = &unk_1000CF2E8;
    uint64_t v39 = v16;
    v37 = v24;
    uint64_t v38 = v22;
    uint64_t v33 = v13;
    v34 = @"Contacts";
    uint64_t v35 = v10;
    uint64_t v36 = v20;
    dispatch_async(global_queue, &buf);
    _Block_object_dispose(v22, 8);
  }

  _Block_object_dispose(&v26, 8);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000383CC;
  v19[3] = &unk_1000CF200;
  v19[5] = a5;
  v19[6] = a4;
  v19[4] = v9;
  dispatch_group_notify(v10, v13, v19);
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_language, "hash");
  return (unint64_t)-[NSArray hash](self->_contactsWords, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    goto LABEL_7;
  }
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___RDUserData);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0)
  {
    LOBYTE(v7) = 0;
    return v7;
  }

  language = self->_language;
  if (language == *((NSString **)a3 + 2) || (unsigned int v7 = -[NSString isEqual:](language, "isEqual:")) != 0)
  {
    contactsWords = self->_contactsWords;
    if (contactsWords != *((NSArray **)a3 + 3))
    {
      LOBYTE(v7) = -[NSArray isEqual:](contactsWords, "isEqual:");
      return v7;
    }

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RDUserData;
  return objc_msgSend( -[RDUserData description](&v3, "description"),  "stringByAppendingFormat:",  @"language=%@, contactsWords count=%ld",  self->_language,  -[NSArray count](self->_contactsWords, "count"));
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RDUserData;
  return objc_msgSend( -[RDUserData description](&v3, "description"),  "stringByAppendingFormat:",  @"language=%@, contactsWords=%@",  self->_language,  self->_contactsWords);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RDUserData)initWithCoder:(id)a3
{
  v4 = -[RDUserData init](self, "init");
  if (v4)
  {
    v4->_language = (NSString *)[a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"_language"];
    uint64_t v5 = (NSArray *)[a3 decodePropertyListForKey:@"_contactsWords"];
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
      if (!v7)
      {
LABEL_14:
        v4->_contactsWords = v5;
        return v4;
      }

      uint64_t v8 = *(void *)v20;
LABEL_5:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0) {
          break;
        }
        uint64_t v15 = 0LL;
        uint64_t v16 = &v15;
        uint64_t v17 = 0x2020000000LL;
        char v18 = 0;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100038CC4;
        v14[3] = &unk_1000CF310;
        v14[4] = &v15;
        [v10 enumerateKeysAndObjectsUsingBlock:v14];
        int v12 = *((unsigned __int8 *)v16 + 24);
        _Block_object_dispose(&v15, 8);
        if (v12) {
          break;
        }
        if (v7 == (id)++v9)
        {
          id v7 = -[NSArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_14;
        }
      }
    }

    uint64_t v5 = 0LL;
    goto LABEL_14;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (NSString)language
{
  return self->_language;
}

- (NSArray)contactsWords
{
  return self->_contactsWords;
}

@end