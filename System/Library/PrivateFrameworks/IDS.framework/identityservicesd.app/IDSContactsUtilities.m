@interface IDSContactsUtilities
- (CNContactStore)contactStore;
- (IDSContactsUtilities)init;
- (id)nameForContactMatchingURI:(id)a3;
- (id)predicateForURI:(id)a3;
- (int64_t)countOfHandles;
- (void)setContactStore:(id)a3;
@end

@implementation IDSContactsUtilities

- (IDSContactsUtilities)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___IDSContactsUtilities;
  v2 = -[IDSContactsUtilities init](&v8, "init");
  if (v2)
  {
    uint64_t v10 = 0LL;
    v11 = &v10;
    uint64_t v12 = 0x2050000000LL;
    v3 = (void *)qword_1009BEDA0;
    uint64_t v13 = qword_1009BEDA0;
    if (!qword_1009BEDA0)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1001CD1C0;
      v9[3] = &unk_1008F6878;
      v9[4] = &v10;
      sub_1001CD1C0((uint64_t)v9);
      v3 = (void *)v11[3];
    }

    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (CNContactStore *)objc_alloc_init(v4);
    contactStore = v2->_contactStore;
    v2->_contactStore = v5;
  }

  return v2;
}

- (id)predicateForURI:(id)a3
{
  id v3 = a3;
  id v4 = [v3 FZIDType];
  if (v4)
  {
    if (v4 == (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue([v3 unprefixedURI]);
      id v6 = [sub_1001CC4C4() predicateForContactsMatchingEmailAddress:v5];
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    }

    else
    {
      v7 = 0LL;
    }
  }

  else
  {
    uint64_t v15 = 0LL;
    v16 = &v15;
    uint64_t v17 = 0x2050000000LL;
    objc_super v8 = (void *)qword_1009BEDB8;
    uint64_t v18 = qword_1009BEDB8;
    if (!qword_1009BEDB8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_1001CD310;
      v14[3] = &unk_1008F6878;
      v14[4] = &v15;
      sub_1001CD310((uint64_t)v14);
      objc_super v8 = (void *)v16[3];
    }

    id v9 = v8;
    _Block_object_dispose(&v15, 8);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 unprefixedURI]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v9 phoneNumberWithStringValue:v10]);

    id v12 = [sub_1001CC4C4() predicateForContactsMatchingPhoneNumber:v11];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v12);
  }

  return v7;
}

- (id)nameForContactMatchingURI:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSContactsUtilities predicateForURI:](self, "predicateForURI:", v4));
  if (v5)
  {
    *(void *)&__int128 v38 = 0LL;
    *((void *)&v38 + 1) = &v38;
    uint64_t v39 = 0x3032000000LL;
    v40 = sub_1001CCA9C;
    v41 = sub_1001CCAAC;
    id v42 = 0LL;
    id v6 = [sub_1001CCAB4() descriptorForRequiredKeysForStyle:0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v37[0] = v7;
    id v8 = sub_1001CCB70();
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v37[1] = v9;
    id v10 = sub_1001CCC0C();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v37[2] = v11;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    id v12 = (id *)qword_1009BEDD8;
    uint64_t v44 = qword_1009BEDD8;
    if (!qword_1009BEDD8)
    {
      uint64_t v13 = (void *)sub_1001CD214();
      id v12 = (id *)dlsym(v13, "CNContactGivenNameKey");
      *(void *)(*(void *)&buf[8] + 24LL) = v12;
      qword_1009BEDD8 = (uint64_t)v12;
    }

    _Block_object_dispose(buf, 8);
    if (v12)
    {
      id v14 = *v12;
      v37[3] = v14;
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v15 = (id *)qword_1009BEDE0;
      uint64_t v44 = qword_1009BEDE0;
      if (!qword_1009BEDE0)
      {
        v16 = (void *)sub_1001CD214();
        uint64_t v15 = (id *)dlsym(v16, "CNContactFamilyNameKey");
        *(void *)(*(void *)&buf[8] + 24LL) = v15;
        qword_1009BEDE0 = (uint64_t)v15;
      }

      _Block_object_dispose(buf, 8);
      if (v15)
      {
        id v17 = *v15;
        v37[4] = v17;
        id v18 = sub_1001CCCA8();
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v37[5] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 6LL));

        id v21 = [objc_alloc((Class)sub_1001CCD44()) initWithKeysToFetch:v20];
        [v21 setPredicate:v5];
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ContactsUtilities](&OBJC_CLASS___IDSFoundationLog, "ContactsUtilities"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Fetching contacts for predicate %@",  buf,  0xCu);
        }

        contactStore = self->_contactStore;
        id v36 = 0LL;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_1001CCE00;
        v35[3] = &unk_1008FD538;
        v35[4] = &v38;
        -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]( contactStore,  "enumerateContactsWithFetchRequest:error:usingBlock:",  v21,  &v36,  v35);
        id v24 = v36;
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ContactsUtilities](&OBJC_CLASS___IDSFoundationLog, "ContactsUtilities"));
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 40LL);
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v4;
          *(_WORD *)&buf[22] = 2112;
          uint64_t v44 = (uint64_t)v24;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Found contact %@, for URI %@ with error %@",  buf,  0x20u);
        }

        if (*(void *)(*((void *)&v38 + 1) + 40LL))
        {
          id v27 = [sub_1001CCAB4() stringFromContact:*(void *)(*((void *)&v38 + 1) + 40) style:0];
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
        }

        else
        {
          v28 = 0LL;
        }

        _Block_object_dispose(&v38, 8);
        goto LABEL_19;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getCNContactFamilyNameKey(void)"));
      objc_msgSend( v33,  "handleFailureInFunction:file:lineNumber:description:",  v34,  @"IDSContactsUtilities.m",  25,  @"%s",  dlerror());
    }

    else
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getCNContactGivenNameKey(void)"));
      objc_msgSend( v31,  "handleFailureInFunction:file:lineNumber:description:",  v32,  @"IDSContactsUtilities.m",  24,  @"%s",  dlerror());
    }

    __break(1u);
  }

  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ContactsUtilities](&OBJC_CLASS___IDSFoundationLog, "ContactsUtilities"));
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v38) = 138412290;
    *(void *)((char *)&v38 + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "No predicate found for URI %@",  (uint8_t *)&v38,  0xCu);
  }

  v28 = 0LL;
LABEL_19:

  return v28;
}

- (int64_t)countOfHandles
{
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 0LL;
  id v3 = sub_1001CCB70();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v24[0] = v4;
  id v5 = sub_1001CCC0C();
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v24[1] = v6;
  id v7 = sub_1001CCCA8();
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v24[2] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 3LL));

  id v10 = [objc_alloc((Class)sub_1001CCD44()) initWithKeysToFetch:v9];
  contactStore = self->_contactStore;
  id v17 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001CD110;
  v16[3] = &unk_1008FD538;
  v16[4] = &v18;
  -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:]( contactStore,  "enumerateContactsWithFetchRequest:error:usingBlock:",  v10,  &v17,  v16);
  id v12 = v17;
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog ContactsUtilities](&OBJC_CLASS___IDSFoundationLog, "ContactsUtilities"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Enumerated contact handles with error %@",  buf,  0xCu);
  }

  int64_t v14 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end