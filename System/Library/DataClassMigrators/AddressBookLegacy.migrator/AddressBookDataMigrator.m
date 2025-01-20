@interface AddressBookDataMigrator
- (AddressBookDataMigrator)init;
- (BOOL)migrateMainDatabase:(id)a3 index:(unint64_t)a4;
- (BOOL)performMigration;
- (__CFArray)changedImagePersonIdentifiers;
- (double)imageDbTime;
- (double)mainDbTime;
- (float)estimatedDuration;
- (id)dataClassName;
- (id)getDatabasePaths;
- (void)dealloc;
- (void)migrateContactMetadataDatabase;
- (void)migrateImagesDatabase:(id)a3 index:(unint64_t)a4;
- (void)migrateUserDefaultsToNSPersonNameComponentsFormatter;
- (void)resetContactProviderFeature;
- (void)setChangedImagePersonIdentifiers:(__CFArray *)a3;
- (void)setImageDbTime:(double)a3;
- (void)setMainDbTime:(double)a3;
@end

@implementation AddressBookDataMigrator

- (AddressBookDataMigrator)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AddressBookDataMigrator;
  v2 = -[AddressBookDataMigrator init](&v5, "init");
  if (v2)
  {
    v2->_changedImagePersonIdentifiers = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  changedImagePersonIdentifiers = self->_changedImagePersonIdentifiers;
  if (changedImagePersonIdentifiers) {
    CFRelease(changedImagePersonIdentifiers);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AddressBookDataMigrator;
  -[AddressBookDataMigrator dealloc](&v4, "dealloc");
}

- (id)dataClassName
{
  return @"contacts";
}

- (BOOL)performMigration
{
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AddressBookDataMigrator getDatabasePaths](self, "getDatabasePaths"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1B90;
  v14[3] = &unk_4240;
  v14[4] = self;
  v14[5] = &v15;
  [v3 enumerateObjectsUsingBlock:v14];
  -[AddressBookDataMigrator migrateUserDefaultsToNSPersonNameComponentsFormatter]( self,  "migrateUserDefaultsToNSPersonNameComponentsFormatter");
  -[AddressBookDataMigrator migrateContactMetadataDatabase](self, "migrateContactMetadataDatabase");
  id v4 = -[AddressBookDataMigrator resetContactProviderFeature](self, "resetContactProviderFeature");
  if (*((_BYTE *)v16 + 24))
  {
    uint64_t v5 = ABOSLogGeneral(v4);
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[AddressBookDataMigrator mainDbTime](self, "mainDbTime");
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AB Migration - main dbs migration took %fs", buf, 0xCu);
    }

    uint64_t v9 = ABOSLogGeneral(v8);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[AddressBookDataMigrator imageDbTime](self, "imageDbTime");
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AB Migration - image dbs migration took %fs", buf, 0xCu);
    }

    BOOL v12 = *((_BYTE *)v16 + 24) != 0;
  }

  else
  {
    BOOL v12 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (id)getDatabasePaths
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v3 = (void *)ABCAddressBookCopyDBDirectory();
  if (v3)
  {
    id v4 = (void *)ABCAddressBookCopyDelegateDBDirectories(-[NSMutableArray addObject:](v2, "addObject:", v3));
    if (v4) {
      -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", v4);
    }
  }

  id v5 = -[NSMutableArray copy](v2, "copy");

  return v5;
}

- (void)migrateImagesDatabase:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v8 = ABOSLogGeneral(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "AB Migration - migrating delegate images database", v17, 2u);
    }
  }

  uint64_t v10 = ABCImageStoreCopyDatabasePathForDatabaseDirectory(v7);
  if (v10)
  {
    uint64_t v11 = (const void *)v10;
    double Current = CFAbsoluteTimeGetCurrent();
    CFArrayRemoveAllValues(-[AddressBookDataMigrator changedImagePersonIdentifiers](self, "changedImagePersonIdentifiers"));
    uint64_t v13 = ABCImageStoreCreateWithPathAndForceInProcessMigration( v11,  1LL,  -[AddressBookDataMigrator changedImagePersonIdentifiers](self, "changedImagePersonIdentifiers"));
    if (v13)
    {
      uint64_t v14 = v13;
      ABCImageStoreGetCountOfImagesWithFormat(v13, 2LL);
      CPRecordStoreDestroy(v14);
    }

    CFRelease(v11);
    CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent() - Current;
    -[AddressBookDataMigrator imageDbTime](self, "imageDbTime");
    -[AddressBookDataMigrator setImageDbTime:](self, "setImageDbTime:", v16 + v15);
  }
}

- (BOOL)migrateMainDatabase:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4)
  {
    uint64_t v8 = ABOSLogGeneral(v6);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "AB Migration - migrating delegate main database", buf, 2u);
    }
  }

  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v11 = (const void *)ABCCreateAddressBookWithDatabaseDirectoryAndForceInProcessMigrationInProcessLinkingAndResetSortKeys( v7,  1LL,  1LL,  0LL);
  BOOL v12 = v11;
  if (v11)
  {
    ABAddressBookGetGroupCount(v11);
    ABChangeHistoryInsertPersonImageChangeRecordForRecordsWithIdentifiers( v12,  -[AddressBookDataMigrator changedImagePersonIdentifiers](self, "changedImagePersonIdentifiers"));
    char v16 = 1;
    if ((ABCIsSortDataValid(v12, &v16) & 1) == 0 && !v16)
    {
      ABCRebuildSearchIndex(v12);
      ABCResetSortData(v12, 0x7FFFFFFFFFFFFFFFLL);
    }

    CFRelease(v12);
    CFAbsoluteTime v13 = CFAbsoluteTimeGetCurrent() - Current;
    -[AddressBookDataMigrator mainDbTime](self, "mainDbTime");
    -[AddressBookDataMigrator setMainDbTime:](self, "setMainDbTime:", v14 + v13);
  }

  return v12 != 0LL;
}

- (void)migrateUserDefaultsToNSPersonNameComponentsFormatter
{
  *(void *)keyExistsAndHasValidFormat = 0LL;
  v29 = keyExistsAndHasValidFormat;
  uint64_t v30 = 0x2050000000LL;
  v2 = (void *)qword_8288;
  uint64_t v31 = qword_8288;
  if (!qword_8288)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_290C;
    v27[3] = &unk_4268;
    v27[4] = keyExistsAndHasValidFormat;
    sub_290C((uint64_t)v27);
    v2 = (void *)*((void *)v29 + 3);
  }

  id v3 = v2;
  _Block_object_dispose(keyExistsAndHasValidFormat, 8);
  id v4 = (const __CFString *)((uint64_t (*)(void))ABPeoplePickerPrefs)();
  id v5 = (const __CFNumber *)CFPreferencesCopyAppValue(@"personNameOrdering", v4);
  BOOL v6 = v5 != 0LL;
  if (v5)
  {
    uint64_t v7 = v5;
    LODWORD(v27[0]) = 0;
    CFNumberGetValue(v5, kCFNumberIntType, v27);
    if (LODWORD(v27[0])) {
      uint64_t v8 = 2LL;
    }
    else {
      uint64_t v8 = 1LL;
    }
    uint64_t v9 = (const __CFString *)ABPeoplePickerPrefs([v3 setDefaultDisplayNameOrder:v8]);
    CFPreferencesSetAppValue(@"personNameOrdering", 0LL, v9);
    CFRelease(v7);
  }

  uint64_t v10 = (const __CFString *)ABPeoplePickerPrefs(v5);
  uint64_t v11 = (const __CFNumber *)CFPreferencesCopyAppValue(@"personShortNameFormat", v10);
  if (v11)
  {
    BOOL v12 = v11;
    LODWORD(v27[0]) = 0;
    id Value = (id)CFNumberGetValue(v11, kCFNumberIntType, v27);
    if (LODWORD(v27[0]) <= 3) {
      id Value = [v3 setShortNameFormat:LODWORD(v27[0]) + 1];
    }
    double v14 = (const __CFString *)ABPeoplePickerPrefs(Value);
    CFPreferencesSetAppValue(@"personShortNameFormat", 0LL, v14);
    CFRelease(v12);
    BOOL v6 = 1;
  }

  CFAbsoluteTime v15 = (const __CFString *)ABPeoplePickerPrefs(v11);
  AppBooleanid Value = CFPreferencesGetAppBooleanValue( @"personShortNameFormatEnabled",  v15,  keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
  {
    uint64_t v17 = (const __CFString *)ABPeoplePickerPrefs([v3 setShortNameIsEnabled:(_DWORD)AppBooleanValue != 0]);
    CFPreferencesSetAppValue(@"personShortNameFormatEnabled", 0LL, v17);
    BOOL v6 = 1;
  }

  char v18 = (const __CFString *)ABPeoplePickerPrefs(AppBooleanValue);
  uint64_t v19 = CFPreferencesGetAppBooleanValue(@"personShortNamePreferNicknames", v18, keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
  {
    uint64_t v20 = (const __CFString *)ABPeoplePickerPrefs([v3 setPreferNicknamesDefault:(_DWORD)v19 != 0]);
    CFPreferencesSetAppValue(@"personShortNamePreferNicknames", 0LL, v20);
    v22 = (const __CFString *)ABPeoplePickerPrefs(v21);
    uint64_t v23 = CFPreferencesAppSynchronize(v22);
  }

  else
  {
    v24 = (const __CFString *)ABPeoplePickerPrefs(v19);
    uint64_t v23 = CFPreferencesAppSynchronize(v24);
    if (!v6) {
      return;
    }
  }

  uint64_t v25 = ABOSLogGeneral(v23);
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27[0]) = 0;
    _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, "AB Migration - user defaults was migrated", (uint8_t *)v27, 2u);
  }
}

- (void)migrateContactMetadataDatabase
{
  uint64_t v12 = 0LL;
  CFAbsoluteTime v13 = &v12;
  uint64_t v14 = 0x2050000000LL;
  v2 = (void *)qword_8298;
  uint64_t v15 = qword_8298;
  if (!qword_8298)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    uint64_t v17 = sub_29E8;
    char v18 = &unk_4268;
    uint64_t v19 = &v12;
    sub_29E8((uint64_t)&buf);
    v2 = (void *)v13[3];
  }

  id v3 = v2;
  _Block_object_dispose(&v12, 8);
  double Current = CFAbsoluteTimeGetCurrent();
  id v11 = 0LL;
  unsigned int v5 = [v3 performLightweightMigrationIfNeededError:&v11];
  id v6 = v11;
  uint64_t v7 = ABOSLogGeneral(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFAbsoluteTime v10 = CFAbsoluteTimeGetCurrent();
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v10 - Current;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "AB Migration - Contact metadata db was migrated, took %fs",  (uint8_t *)&buf,  0xCu);
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_2AD0(v6, v9);
  }
}

- (void)resetContactProviderFeature
{
  ABAddressBookRef v2 = ABAddressBookCreate();
  uint64_t IntegerProperty = ABAddressBookGetIntegerProperty(v2, @"ResetContactProviderFeature");
  if ((_DWORD)IntegerProperty == 1)
  {
    uint64_t v4 = ABOSLogGeneral(IntegerProperty);
    unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "AB Migration - Contact Provider will reset", buf, 2u);
    }

    double Current = CFAbsoluteTimeGetCurrent();
    CFErrorRef error = 0LL;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    uint64_t v7 = ABAddressBookCopyArrayOfAllSources(v2);
    id v8 = -[__CFArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v24,  v31,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v25;
      char v11 = 1;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          CFAbsoluteTime v13 = *(const void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          if (ABRecordGetIntValue(v13, kABSourceTypeProperty) == 7)
          {
            BOOL v14 = ABAddressBookRemoveRecord(v2, v13, &error);
            if (error)
            {
              uint64_t v15 = ABOSLogGeneral(v14);
              char v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)__int128 buf = 138412290;
                double v30 = *(double *)&error;
                _os_log_error_impl( &dword_0,  v16,  OS_LOG_TYPE_ERROR,  "AB Migration - Contact Provider container was not deleted, %@",  buf,  0xCu);
              }

              char v11 = 0;
              CFErrorRef error = 0LL;
            }
          }
        }

        id v9 = -[__CFArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v24,  v31,  16LL);
      }

      while (v9);
    }

    else
    {
      char v11 = 1;
    }

    BOOL HasUnsavedChanges = ABAddressBookHasUnsavedChanges(v2);
    if (HasUnsavedChanges && (BOOL HasUnsavedChanges = ABAddressBookSave(v2, &error), error))
    {
      uint64_t v18 = ABOSLogGeneral(HasUnsavedChanges);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_2B60((uint64_t *)&error, v19, v20);
      }
    }

    else if ((v11 & 1) != 0)
    {
      uint64_t v21 = ABOSLogGeneral(HasUnsavedChanges);
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v23 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)__int128 buf = 134217984;
        double v30 = v23 - Current;
        _os_log_impl( &dword_0,  v22,  OS_LOG_TYPE_DEFAULT,  "AB Migration - Contact Provider did reset, took %fs",  buf,  0xCu);
      }

      ABAddressBookSetIntegerProperty(v2, @"ResetContactProviderFeature", 0LL);
    }

    if (v2) {
      CFRelease(v2);
    }
  }

  else if (v2)
  {
    CFRelease(v2);
  }

- (float)estimatedDuration
{
  uint64_t v2 = ABCAddressBookCopyDBPath(self, a2);
  if (v2)
  {
    id v3 = (const void *)v2;
    int SchemaVersionAtPath = CPSqliteUtilitiesGetSchemaVersionAtPath();
    uint64_t IntegerQueryResultAtPath = CPSqliteUtilitiesGetIntegerQueryResultAtPath("SELECT count() from ABPerson()", v3);
    if (SchemaVersionAtPath == 102)
    {
      int v6 = 0;
      float v7 = (float)(int)IntegerQueryResultAtPath;
      double v8 = 0.0;
    }

    else
    {
      uint64_t IntegerQueryResultAtPath = sub_2858();
      int v6 = IntegerQueryResultAtPath;
      float v7 = (float)(int)IntegerQueryResultAtPath / 1536.0;
      double v8 = v7 * 0.0022 + (float)(int)IntegerQueryResultAtPath * 0.0000458984375;
    }

    float v9 = v8 + 0.0;
    uint64_t v10 = ABOSLogGeneral(IntegerQueryResultAtPath);
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67110144;
      int v22 = SchemaVersionAtPath;
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 2048;
      double v26 = v8;
      __int16 v27 = 2048;
      double v28 = v7 * 0.0022;
      __int16 v29 = 2048;
      double v30 = v9;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "AB Migration estimate - Regular DB (v%i) Size: %i - estimated duration: %f (%f) (total: %f)",  (uint8_t *)&v21,  0x2Cu);
    }

    CFRelease(v3);
  }

  else
  {
    float v9 = 0.0;
  }

  uint64_t v12 = ABCImageStoreCopyPath(0LL);
  if (v12)
  {
    CFAbsoluteTime v13 = (const void *)v12;
    uint64_t v14 = CPSqliteUtilitiesGetSchemaVersionAtPath();
    int v15 = v14;
    if ((_DWORD)v14 == 8)
    {
      int v16 = 0;
      double v17 = 0.0;
    }

    else
    {
      uint64_t v14 = sub_2858();
      int v16 = v14;
      double v17 = (float)(int)v14 * 0.0000303441828;
    }

    float v9 = v17 + v9;
    uint64_t v18 = ABOSLogGeneral(v14);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 67109888;
      int v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      __int16 v25 = 2048;
      double v26 = v17;
      __int16 v27 = 2048;
      double v28 = v9;
      _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "AB Migration estimate - Images DB (v%i) Size: %i - duration: %f (total: %f)",  (uint8_t *)&v21,  0x22u);
    }

    CFRelease(v13);
  }

  return v9;
}

- (double)mainDbTime
{
  return self->_mainDbTime;
}

- (void)setMainDbTime:(double)a3
{
  self->_mainDbTime = a3;
}

- (double)imageDbTime
{
  return self->_imageDbTime;
}

- (void)setImageDbTime:(double)a3
{
  self->_imageDbTime = a3;
}

- (__CFArray)changedImagePersonIdentifiers
{
  return self->_changedImagePersonIdentifiers;
}

- (void)setChangedImagePersonIdentifiers:(__CFArray *)a3
{
  self->_changedImagePersonIdentifiers = a3;
}

@end