void sub_44BC(id a1)
{
  os_log_t v1;
  void *v2;
  v1 = os_log_create("com.apple.contacts.accounts", "dataclass-owner");
  v2 = (void *)qword_15C98;
  qword_15C98 = (uint64_t)v1;
}

void sub_51CC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void sub_5434(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.accounts-plugin", "contacts-dataclass-owner");
  v2 = (void *)qword_15CA8;
  qword_15CA8 = (uint64_t)v1;
}

BOOL sub_5A58(id a1, ACAccount *a2)
{
  return -[ACAccount _cn_isCardDAV](a2, "_cn_isCardDAV");
}

NSArray *__cdecl sub_5A60(id a1, ACAccount *a2)
{
  return (NSArray *)-[ACAccount childAccounts](a2, "childAccounts");
}

CNPair *__cdecl sub_5A68(id a1, ACAccount *a2)
{
  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount identifier](v2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccount _cn_altDSID](v2, "_cn_altDSID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNPair pairWithFirst:second:](&OBJC_CLASS___CNPair, "pairWithFirst:second:", v3, v4));
  return (CNPair *)v5;
}
}

void sub_6960( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

uint64_t sub_69A0()
{
  return v0;
}

  ;
}

void sub_69F8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.accounts-plugin", "contacts-dataclass-owner");
  v2 = (void *)qword_15CB8;
  qword_15CB8 = (uint64_t)v1;
}

void sub_6E5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_6ED8;
  v6[3] = &unk_10430;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v6);
}

id sub_6ED8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateContainer:a2];
}

void sub_6EE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A190();
  }
}

id sub_6FF8(uint64_t a1, void *a2)
{
  return [a2 updateContainer:*(void *)(a1 + 32)];
}

void sub_7004(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32)), "os_log");
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_A1F0();
  }
}

id sub_7284(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containersInAccountWithExternalIdentifier:a2];
}

uint64_t sub_7290(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isContainerEmpty:a2] ^ 1;
}

void sub_74A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_751C;
  v6[3] = &unk_104F8;
  id v7 = v3;
  id v5 = v3;
  objc_msgSend(v4, "_cn_each:", v6);
}

id sub_751C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteContact:a2];
}

void sub_7528(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_A3F8(a1, v4, (uint64_t)v3);
  }
}

void sub_77C0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
  [v4 addContainer:v2 toAccountWithIdentifier:v5];
}

void sub_781C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A550();
  }
}

void sub_7868(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 identifier]);
  [v4 setContainer:v2 asDefaultContainerOfAccountWithIdentifier:v5];
}

void sub_78C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A5B0();
  }
}

id sub_7C90(uint64_t a1, void *a2)
{
  return [a2 addAccount:*(void *)(a1 + 32)];
}

void sub_7C9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
    sub_A610();
  }
}

void sub_7E20(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [(id)objc_opt_class(v2) removeDelegate:v3];
}

id sub_80C4(uint64_t a1, void *a2)
{
  return [a2 removeAccount:*(void *)(a1 + 32)];
}

void sub_80D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
    sub_A800(a1, v4, (uint64_t)v3);
  }
}

void sub_8610( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

id sub_8638(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 contactsInContainer:v3]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_cn_map:", &stru_106D0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CNPair pairWithFirst:second:](&OBJC_CLASS___CNPair, "pairWithFirst:second:", v3, v5));

  return v6;
}

void sub_86BC(void *a1, void *a2)
{
  id v6 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v6 second]);
  if (((*(uint64_t (**)(void, void *))(CNIsArrayEmpty + 16LL))(CNIsArrayEmpty, v3) & 1) == 0)
  {
    id v4 = (void *)a1[4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 first]);
    LOBYTE(v4) = [v4 moveContacts:v3 fromContainer:v5 toContainer:a1[5]];
  }
}

LABEL_15:
  return v10;
}

void sub_8CB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_8CD0(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  *a3 = 1;
  return result;
}

id sub_9398(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

BOOL sub_9470(id a1, CNContainer *a2)
{
  return -[CNContainer isEnabled](a2, "isEnabled");
}

CNMutableContainer *__cdecl sub_9478(id a1, CNContainer *a2)
{
  return (CNMutableContainer *)-[CNContainer mutableCopy](a2, "mutableCopy");
}

CNMutableContact *__cdecl sub_9490(id a1, CNMutableContact *a2)
{
  return (CNMutableContact *)-[CNMutableContact mutableCopy](a2, "mutableCopy");
}

void sub_94A8(id a1, CNMutableContainer *a2)
{
}

void sub_9504( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_9514(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_9520( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_9580( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_9594( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_95A8()
{
  return [v0 iOSLegacyIdentifier];
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_9610()
{
  return v0;
}

id sub_961C(uint64_t a1, void *a2)
{
  return a2;
}

void sub_9668(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.accounts", "dataclass-owner-plugin");
  uint64_t v2 = (void *)qword_15CC8;
  qword_15CC8 = (uint64_t)v1;
}

Class sub_9A30()
{
  if (qword_15CE0 != -1) {
    dispatch_once(&qword_15CE0, &stru_10750);
  }
  Class result = objc_getClass("DMFiCloudPolicyMonitor");
  qword_15CD0 = (uint64_t)result;
  off_15C88 = (uint64_t (*)())sub_9A8C;
  return result;
}

id sub_9A8C()
{
  return (id)qword_15CD0;
}

void sub_9A98(id a1)
{
  qword_15CD8 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement", 1);
  if (!qword_15CD8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_AFC0();
  }
}

void sub_9AE0()
{
}

void sub_9B40()
{
}

void sub_9BA0()
{
}

void sub_9C00()
{
}

void sub_9C60()
{
}

void sub_9CC0()
{
}

void sub_9D20()
{
}

void sub_9D80()
{
}

void sub_9DE0()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 account]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountType]);
  objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v4 = [(id)sub_69A0() account];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  sub_6988();
  sub_6960(&dword_0, v7, v8, "Failed to create an Contacts account for iCloud account %@ (%@)", v9, v10, v11, v12, v13);

  sub_6974();
}

void sub_9EA0()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 account]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountType]);
  objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v4 = [(id)sub_69A0() account];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  sub_6988();
  sub_6960( &dword_0,  v7,  v8,  "Could not from the Contacts container for iCloud account %@ (%@) into the Contacts local container",  v9,  v10,  v11,  v12,  v13);

  sub_6974();
}

void sub_9F60()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 account]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountType]);
  objc_claimAutoreleasedReturnValue([v3 identifier]);
  id v4 = [(id)sub_69A0() account];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  sub_6988();
  sub_6960(&dword_0, v7, v8, "Failed to remove the Contacts account for iCloud account %@ (%@)", v9, v10, v11, v12, v13);

  sub_6974();
}

void sub_A020()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 account]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accountType]);
  objc_claimAutoreleasedReturnValue([v3 description]);
  id v4 = [(id)sub_69A0() account];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
  sub_6988();
  sub_6960(&dword_0, v7, v8, "Failed to remove the Contacts account for account %@ (%@)", v9, v10, v11, v12, v13);

  sub_6974();
}

void sub_A0E0()
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v1 valueForKey:@"identifier"]);
  int v6 = 138543618;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = v4;
  sub_9514( &dword_0,  v0,  v5,  "Could not find local CN account for account with external identifier  %{public}@  and child external identifiers  %{ public}@. Skipping container enablement.",  (uint8_t *)&v6);

  sub_94F4();
}

void sub_A190()
{
}

void sub_A1F0()
{
}

void sub_A250()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 identifier]);
  sub_9534();
  __int16 v5 = 2114;
  uint64_t v6 = v3;
  _os_log_debug_impl( &dword_0,  v0,  OS_LOG_TYPE_DEBUG,  "Containers associated with account (external identifier = %{public}@) are %{public}@",  v4,  0x16u);

  sub_94F4();
}

void sub_A300()
{
  sub_9520( &dword_0,  v1,  v2,  "emptyLocalContainer deleted %ld contacts from the local store (legacy id = %d).",  v3,  v4,  v5,  v6,  v7);
  sub_94F4();
}

void sub_A378(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "emptyLocalContainer encountered a nil result while fetching local container contacts.",  v1,  2u);
}

void sub_A3B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( &dword_0,  log,  OS_LOG_TYPE_DEBUG,  "emptyLocalContainer found 0 contacts in the local store, no need to delete anything.",  v1,  2u);
}

void sub_A3F8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = a3;
  sub_9514(&dword_0, v3, v5, "error deleting %ld contacts: %{public}@", v6);

  sub_94F4();
}

void sub_A47C(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([0 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 valueForKey:@"identifier"]);
  sub_9580( &dword_0,  v4,  v5,  "defaultContainerForParentACAccountWithIdentifier could not find a CN account associated with external identifier %{p ublic}@ and child account external idententfiers %{public}@ (createIfNecessary = %{public}@)",  v6,  v7,  v8,  v9,  2u);

  sub_9570();
}

void sub_A550()
{
}

void sub_A5B0()
{
}

void sub_A610()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_9514(&dword_0, v1, (uint64_t)v1, "error creating account %@: %@", v2);
  sub_51F8();
}

void sub_A688()
{
}

void sub_A6E8()
{
}

void sub_A750(void *a1, os_log_s *a2)
{
  id v4 = [(id)sub_9610() externalIdentifierString];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_95A8();
  sub_95C4();
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_debug_impl( &dword_0,  a2,  OS_LOG_TYPE_DEBUG,  "Removing CN account (identifier %{public}@  external identifier = %{public}@  legacy id = %d)",  v7,  0x1Cu);

  sub_9570();
}

void sub_A800(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [(id)sub_9610() externalIdentifierString];
  int v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_9534();
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  sub_9514(&dword_0, v3, v7, "cound not remove account %@: %@", v8);

  sub_94F4();
}

void sub_A898(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_95A8();
  sub_9558();
  sub_9520( &dword_0,  v2,  v3,  "contactsInContainer returned 0 contacts for local container, no need to merge contacts from container (identifier = %{public}@ legacy id: %d)",  v4,  v5,  v6,  v7,  v8);

  sub_94F4();
}

void sub_A91C()
{
}

void sub_A984(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_9534();
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "no account syncing Contacts found on parent account %@",  v4,  0xCu);
}

void sub_AA14()
{
}

void sub_AA74(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  sub_95A8();
  sub_9558();
  sub_9520(&dword_0, v2, v3, "Found local container, identifier: %{public}@ legacy id = %d", v4, v5, v6, v7, v8);

  sub_94F4();
}

void sub_AAF8(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 externalIdentifierString]);
  sub_95E8();
  sub_9580( &dword_0,  v4,  v5,  "did not find a default container for account with CN identifier: %{public}@ external identifier: %{public}@ error: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_9570();
}

void sub_AB9C(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  LODWORD(v5) = [v5 iOSLegacyIdentifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 externalIdentifierString]);
  int v9 = 138544386;
  uint8_t v10 = v6;
  __int16 v11 = 1024;
  int v12 = (int)v5;
  __int16 v13 = 2114;
  v14 = v7;
  __int16 v15 = 2114;
  v16 = v8;
  __int16 v17 = 1024;
  unsigned int v18 = [a2 iOSLegacyIdentifier];
  _os_log_debug_impl( &dword_0,  a3,  OS_LOG_TYPE_DEBUG,  "Found default container (identifier: %{public}@  legacy id = %d) for account (identifier: %{public}@  external ident ifier: %{public}@ legacy id = %d)",  (uint8_t *)&v9,  0x2Cu);
}

void sub_ACAC()
{
}

void sub_AD14(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a1 identifier]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 externalIdentifierString]);
  [a1 iOSLegacyIdentifier];
  sub_95E8();
  sub_9594( &dword_0,  v4,  v5,  "Matched CNAccount (identifier: %{public}@ external identifier: %{public}@ legacy id = %d) to account with external i dentifier %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_95B0();
}

void sub_ADD0()
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 externalIdentifierString]);
  sub_95FC();
  uint64_t v6 = v1;
  sub_9514( &dword_0,  v0,  v4,  "error fetching containers for account with external identifier %{public}@ error: %{public}@",  v5);

  sub_94F4();
}

void sub_AE58()
{
  id v2 = [(id)sub_9610() identifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v0 externalIdentifierString]);
  sub_95A8();
  sub_95C4();
  sub_9594( &dword_0,  v5,  v6,  "Found %ld containers associated with account (identifier: %{public}@ external identifier: %{public}@ legacy id = %d)",  v7,  v8,  v9,  v10,  v11);

  sub_95B0();
}

void sub_AF0C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Will continue as though logout is not restricted", v1, 2u);
}

void sub_AF4C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error requesting iCloud logout policy: %@", (uint8_t *)&v2, 0xCu);
}

void sub_AFC0()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to Soft Link: /System/Library/PrivateFrameworks/DeviceManagement.framework/DeviceManagement (%d)",  (uint8_t *)v1,  8u);
}

id objc_msgSend_predicateForContainersInAccountWithIdentifier_includingDisabledContainers_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForContainersInAccountWithIdentifier:includingDisabledContainers:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}