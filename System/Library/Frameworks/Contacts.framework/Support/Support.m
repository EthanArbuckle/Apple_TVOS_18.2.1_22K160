void sub_1000040D4(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(void);
  void *v6;
  id v7;
  v7 = a2;
  v5 = a3;
  v6 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v6);
  v5[2](v5);
}

void sub_1000041C0(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 regulatoryLogger]);
  [v5 logContactsDataAccessEvent];

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v4);
}

void sub_1000042B4(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) regulatoryLogger]);
  [v4 logContactsDataAccessEvent];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contactStore]);
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  objc_autoreleasePoolPop(v3);
  v7[2]();
}

void sub_100004558(_Unwind_Exception *a1)
{
}

uint64_t sub_100004574(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004584(uint64_t a1)
{
}

void sub_10000458C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) logger]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100004614;
  v5[3] = &unk_1000185B0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 servicingContactsRequest:v5];
}

void sub_100004614(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472LL;
  v8 = sub_10000469C;
  v9 = &unk_100018588;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  (*(void (**)(void))(v5 + 16))();
  objc_autoreleasePoolPop(v4);
}

void sub_10000469C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___CNInhibitor, a2, a3);
  id obj = (id)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stop];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0LL;

  objc_sync_exit(obj);
}

void sub_100004708( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100004824(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v5 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 unifiedContactCountWithError:&v5]);
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000497C(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100004A04;
  v3[3] = &unk_100018628;
  v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v4 performWorkWithDataMapper:v3];
}

void sub_100004A04(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 contactCountForFetchRequest:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t sub_100004A84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004B70(void *a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100004BE8;
  v3[3] = &unk_1000186A0;
  v2 = (void *)a1[5];
  uint64_t v1 = a1[6];
  id v4 = (id)a1[4];
  uint64_t v6 = v1;
  id v5 = v2;
  [v4 performWorkWithDataMapper:v3];
}

void sub_100004BE8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 sectionListOffsetsForSortOrder:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100004C68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100004E00(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100004E88;
  v3[3] = &unk_100018628;
  v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v4 performWorkWithDataMapper:v3];
}

void sub_100004E88(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v8 = 0LL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100004F50;
  v6[3] = &unk_1000186F0;
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  unsigned __int8 v4 = [v2 fetchContactsForFetchRequest:v3 error:&v8 batchHandler:v6];
  id v5 = v8;

  if ((v4 & 1) == 0) {
    (*(void (**)(void, void, void, id))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  0LL,  0LL,  v5);
  }
}

uint64_t sub_100004F50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004F60(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100004F78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005114(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000519C;
  v3[3] = &unk_100018740;
  v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v4 performAsyncWorkWithDataMapper:v3];
}

void sub_10000519C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_autoreleasePoolPush();
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v9 = *(void *)(a1 + 40);
  id v15 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 encodedContactsCursorForFetchRequest:v9 cursorCleanupBlock:v6 error:&v15]);
  id v11 = v15;

  if (v10)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000052D0;
    v12[3] = &unk_100018718;
    v12[4] = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 48);
    id v13 = v10;
    [v13 fetchNextBatchWithReply:v12];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  objc_autoreleasePoolPop(v7);
}

void sub_1000052D0(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = (void *)a1[4];
  id v8 = a4;
  id v9 = a2;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 regulatoryLogger]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 identifierAccountingData]);
  [v10 logContactsDataAccessEventWithAssetIdentifiers:v11];

  uint64_t v12 = a1[6];
  id v14 = (id)objc_claimAutoreleasedReturnValue([v9 data]);
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 matchInfo]);

  (*(void (**)(uint64_t, id, void *, void, uint64_t, id))(v12 + 16))(v12, v14, v13, a1[5], a3, v8);
}

uint64_t sub_1000053A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000053C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000054F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100005640;
  v16[3] = &unk_100018768;
  uint64_t v6 = *(void *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100005650;
  v13[3] = &unk_100018790;
  id v14 = *(id *)(a1 + 48);
  id v7 = v4;
  id v15 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 executeFetchRequest:v6 progressiveResults:v16 completion:v13]);

  [*(id *)(a1 + 56) addCancelable:v8];
  id v9 = *(void **)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100005680;
  v11[3] = &unk_1000187B8;
  id v12 = v7;
  id v10 = v7;
  [v9 addCancelationBlock:v11];
}

id sub_100005640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) receiveProgressiveContacts:a2 matchInfos:a3];
}

uint64_t sub_100005650(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100005680(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100005704(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v5 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifierWithError:&v5]);
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100005834(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000058A4;
  v2[3] = &unk_100018600;
  uint64_t v1 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v1;
  [v3 performWorkWithDataMapper:v2];
}

void sub_1000058A4(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v5 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 meContactIdentifiers:&v5]);
  id v4 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_100005920(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000059D8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contactStore]);
  id v9 = 0LL;
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessAuthorization]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 authorizer]);
  id v8 = 0LL;
  [v2 executeSaveRequest:v3 response:&v9 authorizationContext:v5 error:&v8];
  id v6 = v9;
  id v7 = v8;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100005B4C(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 containersMatchingPredicate:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100005C70(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 serverSearchContainersMatchingPredicate:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100005D94(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 policyForContainerWithIdentifier:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100005EB8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 accountsMatchingPredicate:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100005FDC(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 groupsMatchingPredicate:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100006100(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 subgroupsOfGroupWithIdentifier:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000061F8(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v3 = (id)objc_claimAutoreleasedReturnValue([v2 defaultContainerIdentifier]);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100006330(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000063B4;
  v3[3] = &unk_100018600;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v3];
}

void sub_1000063B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0LL;
  unsigned int v4 = [a2 setDefaultAccountIdentifier:v3 error:&v7];
  id v5 = v7;
  if (v4) {
    id v6 = &__kCFBooleanTrue;
  }
  else {
    id v6 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v6, v5);
}

uint64_t sub_100006428(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006518(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) regulatoryLogger]);
  [v2 logContactsDataAccessEvent];

  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contactStore]);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = 0LL;
  unsigned int v5 = [v3 setMeContact:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v7, v6);
}

uint64_t sub_1000065B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000066C8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100006764;
  v3[3] = &unk_100018858;
  v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 performWorkWithDataMapper:v3];
}

void sub_100006764(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contactStore]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0LL;
  unsigned int v5 = [v2 setMeContact:v3 forContainer:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16LL))(*(void *)(a1 + 56), v7, v6);
}

uint64_t sub_1000067E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006924(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000069D4;
  v3[3] = &unk_1000188A8;
  v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v4 performWorkWithDataMapper:v3];
}

void sub_1000069D4(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) contactStore]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v9 = 0LL;
  unsigned int v6 = [v2 setBestMeIfNeededForGivenName:v3 familyName:v4 email:v5 error:&v9];
  id v7 = v9;

  if (v6) {
    id v8 = &__kCFBooleanTrue;
  }
  else {
    id v8 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 64) + 16LL))(*(void *)(a1 + 64), v8, v7);
}

uint64_t sub_100006A5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100006B70(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006C10;
  v6[3] = &unk_1000188F8;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v9 = v3;
  void v6[4] = v4;
  id v7 = v5;
  id v8 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v6];
}

void sub_100006C10(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( [v4 contactWithUserActivityUserInfo:*(void *)(a1 + 40) keysToFetch:*(void *)(a1 + 48)]);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t sub_100006C70(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 logger]);
  [v5 internalError:v4];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100006DA8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006E34;
  v6[3] = &unk_100018948;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  void v6[4] = v4;
  id v7 = v5;
  [v2 performWorkWithDataMapper:v6];
}

void sub_100006E34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 userActivityUserInfoForContact:*(void *)(a1 + 40)]);
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

uint64_t sub_100006E94(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 logger]);
  [v5 internalError:v4];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100006FF0(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10000708C;
  v3[3] = &unk_100018858;
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 performWorkWithDataMapper:v3];
}

void sub_10000708C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0LL;
  unsigned int v5 = [v2 registerChangeHistoryClientIdentifier:v3 forContainerIdentifier:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16LL))(*(void *)(a1 + 56), v7, v6);
}

uint64_t sub_100007110(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007224(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000072C0;
  v3[3] = &unk_100018858;
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  [v4 performWorkWithDataMapper:v3];
}

void sub_1000072C0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v8 = 0LL;
  unsigned int v5 = [v2 unregisterChangeHistoryClientIdentifier:v3 forContainerIdentifier:v4 error:&v8];
  id v6 = v8;

  if (v5) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 56) + 16LL))(*(void *)(a1 + 56), v7, v6);
}

uint64_t sub_100007344(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000073FC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0LL;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v2 changeHistoryWithFetchRequest:v3 error:&v6]);
  id v5 = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100007558(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000075E0;
  v3[3] = &unk_100018628;
  uint64_t v2 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  [v4 performWorkWithDataMapper:v3];
}

void sub_1000075E0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = *(void *)(a1 + 40);
  id v7 = 0LL;
  unsigned int v4 = [v2 executeChangeHistoryClearRequest:v3 error:&v7];
  id v5 = v7;

  if (v4) {
    id v6 = &__kCFBooleanTrue;
  }
  else {
    id v6 = 0LL;
  }
  (*(void (**)(void, void *, id))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), v6, v5);
}

uint64_t sub_100007664(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000076F0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentHistoryToken]);
  unsigned int v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v6 = v5;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_1000077F0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) dataMapper]);
  id v6 = (id)objc_claimAutoreleasedReturnValue([v2 currentHistoryAnchor]);

  uint64_t v3 = *(void *)(a1 + 40);
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
}

void sub_100007A8C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100007AFC;
  v2[3] = &unk_100018600;
  uint64_t v1 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  id v4 = v1;
  [v3 performWorkWithDataMapper:v2];
}

void sub_100007AFC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNFavorites favoritesPath](&OBJC_CLASS___CNFavorites, "favoritesPath"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v2, 0LL));
  id v10 = 0LL;
  id v4 = -[NSArray initWithContentsOfURL:error:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithContentsOfURL:error:",  v3,  &v10);
  id v5 = v10;
  if (v4)
  {
    ABDiagnosticsEnabled();
    -[NSArray count](v4, "count");
    id v6 = @"Read favorites file %@, count = %ld";
    uint64_t v7 = 754LL;
  }

  else
  {
    if (![*(id *)(a1 + 32) shouldNotReportFavoritesError:v5])
    {
      id v8 = *(void **)(a1 + 32);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error reading favorites file. Add a favorite as workaround. Please open a radar to PEP Contacts (New Bugs).\n\n%@",  v5));
      [v8 reportFavoritesIssue:v9];

      goto LABEL_7;
    }

    ABDiagnosticsEnabled();
    id v6 = @"Error reading favorites file, error: %@";
    uint64_t v7 = 757LL;
  }

  _ABLog2(4LL, "-[ContactsService favoritesEntryDictionariesAtPath:withReply:]_block_invoke_2", v7, 0LL, v6);
LABEL_7:
  (*(void (**)(void, NSArray *))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v4);
}

uint64_t sub_100007C68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100007D58(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100007DE0;
  v5[3] = &unk_100018628;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 performWorkWithDataMapper:v5];
}

void sub_100007DE0(uint64_t a1)
{
  uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue(+[CNFavorites favoritesPath](&OBJC_CLASS___CNFavorites, "favoritesPath"));
  id v3 = *(void **)(a1 + 32);
  id v17 = 0LL;
  id v4 = [v3 writeToFile:v2 options:1073741825 error:&v17];
  id v5 = (__CFString *)v17;
  if (!(_DWORD)v4)
  {
    if ([*(id *)(a1 + 40) shouldNotReportFavoritesError:v5])
    {
      ABDiagnosticsEnabled();
      id v10 = @"no error returned";
      if (v5) {
        id v10 = v5;
      }
      id v8 = @"Error saving favorites file, error: %@";
      v16 = v10;
      uint64_t v9 = 795LL;
      goto LABEL_8;
    }

    id v11 = *(void **)(a1 + 40);
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error saving favorites file. Please open a radar to PEP Contacts (New Bugs).\n\n%@",  v5);
LABEL_11:
    id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v11 reportFavoritesIssue:v13];

    goto LABEL_12;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v7 = [v6 fileExistsAtPath:v2];

  if (!v7)
  {
    id v11 = *(void **)(a1 + 40);
    id v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error saving favorites file\x10. File does not exist after saving. Please open a radar to PEP Contacts (New Bugs).\n\nexpected file: %@",  v2);
    goto LABEL_11;
  }

  ABDiagnosticsEnabled();
  id v8 = @"Saved favorites file %@.";
  v16 = v2;
  uint64_t v9 = 789LL;
LABEL_8:
  _ABLog2(4LL, "-[ContactsService writeFavoritesPropertyListData:toPath:withReply:]_block_invoke_2", v9, 0LL, v8);
LABEL_12:
  uint64_t v14 = *(void *)(a1 + 48);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4, v16));
  (*(void (**)(uint64_t, void *, __CFString *))(v14 + 16))(v14, v15, v5);
}

void sub_100007F7C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v4, v3);
}

CNContactStore *__cdecl sub_1000082C4(id a1)
{
  return (CNContactStore *)+[CNEnvironment makeDefaultContactStore]( &OBJC_CLASS___CNEnvironment,  "makeDefaultContactStore");
}
}

void sub_10000854C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "analyze-database");
  uint64_t v2 = (void *)qword_10001F5A8;
  qword_10001F5A8 = (uint64_t)v1;
}

void sub_1000085F0(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10001F5B8;
  qword_10001F5B8 = (uint64_t)v1;
}

void sub_10000891C(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) coalescer]);
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  [v2 observerDidReceiveResult:v1];
}

void sub_100008A50(uint64_t a1)
{
  id v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000DF58(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  id v10 = *(void **)(a1 + 40);
  id v23 = 0LL;
  unsigned int v11 = [v10 shouldAnalyzeDatabaseWithError:&v23];
  id v12 = v23;
  id v13 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    sub_10000DED0(v11, v13);
    if (v12)
    {
LABEL_5:
      uint64_t v14 = *(os_log_s **)(a1 + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10000DE6C((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);
      }
      goto LABEL_10;
    }
  }

  else if (v12)
  {
    goto LABEL_5;
  }

  if (v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) analyzer]);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    [v21 observerDidReceiveResult:v22];
  }

LABEL_10:
}

void sub_100008C20(uint64_t a1)
{
  id v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E01C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  id v10 = *(void **)(a1 + 40);
  id v28 = 0LL;
  unsigned __int8 v11 = [v10 analyzeDatabaseWithError:&v28];
  id v12 = v28;
  id v13 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    sub_10000DFEC(v13, v14, v15, v16, v17, v18, v19, v20);
    if ((v11 & 1) != 0) {
      goto LABEL_7;
    }
  }

  else if ((v11 & 1) != 0)
  {
    goto LABEL_7;
  }

  v21 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10000DF88((uint64_t)v12, v21, v22, v23, v24, v25, v26, v27);
  }
LABEL_7:
}

void sub_100008D9C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100008DAC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100008E0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "support-connections");
  id v2 = (void *)qword_10001F5C8;
  qword_10001F5C8 = (uint64_t)v1;
}

ContactsSupportService *__cdecl sub_100008EB4(id a1, CNScheduler *a2, NSXPCConnection *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = a2;
  uint64_t v6 = -[ContactsSupportService initWithWorkQueue:connection:]( objc_alloc(&OBJC_CLASS___ContactsSupportService),  "initWithWorkQueue:connection:",  v5,  v4);

  return v6;
}

void sub_1000091CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "xpc");
  id v2 = (void *)qword_10001F5D8;
  qword_10001F5D8 = (uint64_t)v1;
}

void sub_10000923C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "backup");
  id v2 = (void *)qword_10001F5E8;
  qword_10001F5E8 = (uint64_t)v1;
}

void sub_1000092AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "purge-history");
  id v2 = (void *)qword_10001F5F8;
  qword_10001F5F8 = (uint64_t)v1;
}

void sub_10000931C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "launch-services");
  id v2 = (void *)qword_10001F608;
  qword_10001F608 = (uint64_t)v1;
}

void sub_10000938C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "persistence");
  id v2 = (void *)qword_10001F618;
  qword_10001F618 = (uint64_t)v1;
}

void sub_1000093FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "exchange");
  id v2 = (void *)qword_10001F628;
  qword_10001F628 = (uint64_t)v1;
}

void sub_10000946C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "accounts");
  id v2 = (void *)qword_10001F638;
  qword_10001F638 = (uint64_t)v1;
}

void sub_1000094DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd.persistence", "removal");
  id v2 = (void *)qword_10001F648;
  qword_10001F648 = (uint64_t)v1;
}

void sub_10000954C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.provider", "synchronize-contact-providers-service");
  id v2 = (void *)qword_10001F658;
  qword_10001F658 = (uint64_t)v1;
}

void sub_1000095BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.backgroundColors", "background-colors");
  id v2 = (void *)qword_10001F668;
  qword_10001F668 = (uint64_t)v1;
}

void sub_10000962C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "settingsDefaultApps");
  id v2 = (void *)qword_10001F678;
  qword_10001F678 = (uint64_t)v1;
}

void sub_100009708(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[CNInhibitor os_transactionInhibitorWithLabel:]( &OBJC_CLASS___CNInhibitor,  "os_transactionInhibitorWithLabel:",  *(void *)(a1 + 32)));
  [v4 start];
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10000E1A0(a1, state);
  }

  if (state == 2)
  {
    [*(id *)(a1 + 48) run];
  }

  else if (state)
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10000E04C(a1, state);
    }
  }

  else
  {
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = xpc_copy_description(v7);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  1LL));
      unsigned __int8 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10000E100(a1);
      }

      free(v9);
    }
  }

  [v4 stop];
}

void sub_10000993C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100009B20(id a1, CNPair *a2)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CNPair first](a2, "first"));
  [v2 resume];
}

BOOL sub_100009BA8(id a1, _TtP9contactsd22CNRegisteredXPCService_ *a2)
{
  return -[CNRegisteredXPCService beginListening](a2, "beginListening");
}

void sub_100009C6C(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v3 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_dictionary_get_string(xdict, _xpc_event_key_name),  1LL);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000E328((uint64_t)v4, v5);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:v4]);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) handleNotificationName:v4];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

void sub_100009E68(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.LaunchServices.applicationUnregistered"))
  {
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10000E3CC(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    xpc_object_t value = xpc_dictionary_get_value(v3, "UserInfo");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(value);
    uint64_t v15 = v14;
    if (v14 && xpc_get_type(v14) == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v16 = (void *)_CFXPCCreateCFObjectFromXPCObject(v15);
      uint64_t v17 = v16;
      if (v16)
      {
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"isPlaceholder"]);
        uint64_t v19 = v18;
        if (!v18 || ([v18 BOOLValue] & 1) == 0)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:@"bundleIDs"]);
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v33 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "received application unregistered notification, bundle ids %{public}@",  buf,  0xCu);
          }

          __int128 v29 = 0u;
          __int128 v30 = 0u;
          __int128 v27 = 0u;
          __int128 v28 = 0u;
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationUnregisteredListeners", 0));
          id v23 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v28;
            do
            {
              uint64_t v26 = 0LL;
              do
              {
                if (*(void *)v28 != v25) {
                  objc_enumerationMutation(v22);
                }
                [*(id *)(*((void *)&v27 + 1) + 8 * (void)v26) handleBundleIdentifiers:v20];
                uint64_t v26 = (char *)v26 + 1;
              }

              while (v24 != v26);
              id v24 = [v22 countByEnumeratingWithState:&v27 objects:v31 count:16];
            }

            while (v24);
          }
        }
      }
    }
  }
}

void sub_10000A3A4(id a1, Class a2)
{
}

void sub_10000A3E0(id a1, _TtP9contactsd30CNBackgroundSystemTaskProtocol_ *a2)
{
  id v2 = a2;
  -[CNBackgroundSystemTaskProtocol register](v2, "register");
  if ((objc_opt_respondsToSelector(v2, "daemonDidLaunch") & 1) != 0) {
    -[CNBackgroundSystemTaskProtocol daemonDidLaunch](v2, "daemonDidLaunch");
  }
}

void sub_10000A6F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t sub_10000A710(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000A720(uint64_t a1)
{
}

void sub_10000A728(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v6);

  -[NSXPCListener setDelegate:](v8, "setDelegate:", v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNPair pairWithFirst:second:](&OBJC_CLASS___CNPair, "pairWithFirst:second:", v8, v5));

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
}

uint64_t start()
{
  v0 = objc_autoreleasePoolPush();
  +[CNIOSContactsDaemon enterSandbox](&OBJC_CLASS___CNIOSContactsDaemon, "enterSandbox");
  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v2);
  dispatch_source_set_event_handler(v3, &stru_100018E10);
  dispatch_activate(v3);
  uint64_t v4 = objc_alloc_init(&OBJC_CLASS___CNIOSContactsDaemon);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  -[CNContactsDaemon runOnRunLoop:](v4, "runOnRunLoop:", v5);

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

LABEL_13:
    uint64_t v22 = 0;
    goto LABEL_25;
  }

  __int128 v28 = NSURLIsExcludedFromBackupKey;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
  __int128 v27 = 0LL;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceValuesForKeys:v12 error:&v27]);
  __int128 v14 = (os_log_s *)v27;

  if (v13)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:NSURLIsExcludedFromBackupKey]);
    uint64_t v16 = [v15 BOOLValue];

    if (v16)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
      uint64_t v26 = v14;
      uint64_t v18 = [v8 setResourceValue:v17 forKey:NSURLIsExcludedFromBackupKey error:&v26];
      uint64_t v19 = v26;

      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
      v21 = v20;
      if ((v18 & 1) != 0)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_10000E5F4(v8);
        }
        uint64_t v22 = 1;
      }

      else
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_10000E694(v8);
        }
        uint64_t v22 = 0;
      }

      __int128 v14 = v19;
    }

    else
    {
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10000E714(v8);
      }
      uint64_t v22 = 1;
    }
  }

  else
  {
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs backup](&OBJC_CLASS___CNContactsDaemonLogs, "backup"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10000E574(v8);
    }
    uint64_t v22 = 0;
  }

LABEL_25:
  return v22;
}

void sub_10000B5CC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_10000B610(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_10000B668(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts", "contactsSync");
  id v2 = (void *)qword_10001F688;
  qword_10001F688 = (uint64_t)v1;
}

void sub_10000B70C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_10001F698;
  qword_10001F698 = (uint64_t)v1;
}

void sub_10000B924(_Unwind_Exception *a1)
{
}

void sub_10000B954(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained onRapportDeviceFound:v3];
}

void sub_10000B99C(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained onRapportDeviceLost:v3];
}

void sub_10000B9E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v4, v5), "log");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000E820((uint64_t)v3, v8);
    }

    [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  }

  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "activateWithCompletion success", v9, 2u);
    }
  }
}

void sub_10000C060(uint64_t a1)
{
  id v1 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "connectWithCompanionDevice client invalidated",  v2,  2u);
  }

void sub_10000C0BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_ERROR)) {
      sub_10000E8C0();
    }
  }

  else
  {
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) fDispatchQueue]);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10000C17C;
    v7[3] = &unk_100018A88;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, v7);
  }
}

id sub_10000C17C(uint64_t a1)
{
  id v2 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "connectWithCompanionDevice activated, sendSyncRequest",  v4,  2u);
  }

  return [*(id *)(a1 + 40) sendSyncRequest];
}

void sub_10000C3C8(uint64_t a1)
{
  id v1 = *(os_log_s **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_INFO,  "connectWithCompanionDevice client invalidation",  v2,  2u);
  }

void sub_10000C424(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
    id v4 = objc_msgSend((id)objc_opt_class(v3, a2), "log");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10000E8C0();
    }
  }

  else
  {
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 fDispatchQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000C4CC;
    block[3] = &unk_100018A38;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v6, block);
  }

void sub_10000C4CC(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), a2), "log");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "sendSyncTableUpdateEvent", buf, 2u);
  }

  uint64_t v11 = RPOptionStatusFlags;
  uint64_t v12 = &off_1000195F8;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v6 setObject:@"SyncTableUpdate" forKeyedSubscript:@"kABLimitedAccessEventKeyType"];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000C62C;
  v9[3] = &unk_100018E80;
  v9[4] = v7;
  [v8 sendEventID:@"com.apple.contacts.LimitedAccessSync" event:v6 options:v5 completion:v9];
}

id sub_10000C62C(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), a2), "log");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "sendEventID Completed", v6, 2u);
  }

  return [*(id *)(a1 + 32) invalidateCompanionClient];
}

void sub_10000C7D8(uint64_t a1)
{
  id v2 = objc_alloc_init(&OBJC_CLASS___CNContactStore);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
        if (v9)
        {
          id v10 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), v5), "log");
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v17 = v9;
            _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "handleBundleIdentifiers unregistered app, purge records for %@",  buf,  0xCu);
          }

          -[CNContactStore purgeLimitedAccessRecordsForBundle:](v2, "purgeLimitedAccessRecordsForBundle:", v9);
        }
      }

      id v6 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }

    while (v6);
  }
}

void sub_10000CD40(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fDispatchQueue]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000CE10;
  v13[3] = &unk_100018ED0;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v14 = v7;
  uint64_t v15 = v9;
  id v16 = v6;
  id v17 = v10;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v8, v13);
}

void sub_10000CE10(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), a2), "log");
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000E970();
    }

    [*(id *)(*(void *)(a1 + 40) + 16) invalidate];
  }

  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), a2), "log");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    id v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "sendSyncRequest, received response, update LimitedAccessTable",  buf,  2u);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKey:@"PhoneSyncData"]);
      id v26 = 0LL;
      id v10 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v9,  &v26);
      id v11 = v26;
      uint64_t v12 = objc_opt_self(&OBJC_CLASS___CNLimitedAccessSyncData);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  v13,  @"PhoneSyncData"));

      if ([v14 fullSyncRequired])
      {
        id v16 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), v15), "log");
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10000E944();
        }

        [*(id *)(a1 + 56) dropAllLimitedAccessRows];
      }

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v14 syncEvents]);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 allObjects]);

      [*(id *)(a1 + 56) applyLimitedAccessSyncEvents:v19];
      signed int v20 = [v14 currentSequenceNumber];
      id v22 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 40), v21), "log");
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        signed int v28 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "applyLimitedAccessSyncEvents success, save %d",  buf,  8u);
      }

      id v24 = *(void **)(a1 + 56);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v20));
      [v24 setLimitedAccessTableCurrentSequenceNumber:v25];
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000E918();
      }
    }
  }

id sub_10000D188(uint64_t a1, uint64_t a2)
{
  id v3 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), a2), "log");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "fLimitedAccessTableUpdateEventNotifyTimer Timeout Callback.",  v6,  2u);
  }

  [*(id *)(a1 + 32) cancelLimitedAccessTableUpdateEventNotifyWatchTimer];
  return [*(id *)(a1 + 32) notifyConnectedWatch];
}

void sub_10000D348( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_10000D64C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.contacts.contactsd", "contacts-connections");
  id v2 = (void *)qword_10001F6A8;
  qword_10001F6A8 = (uint64_t)v1;
}

ContactsService *__cdecl sub_10000D710(id a1, CNScheduler *a2, CNScheduler *a3, NSXPCConnection *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = -[ContactsService initWithWorkQueue:highPriorityWorkQueue:connection:]( objc_alloc(&OBJC_CLASS___ContactsService),  "initWithWorkQueue:highPriorityWorkQueue:connection:",  v8,  v7,  v6);

  return v9;
}

void sub_10000DD6C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "An error occurred while configuring sandbox storage for contactsd. tmp and cache directories will be unavailable.",  v1,  2u);
}

void sub_10000DDAC(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [a1 activityIdentifier]));
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%@ has failed to purge change history: %@",  (uint8_t *)&v6,  0x16u);
}

void sub_10000DE6C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DED0(char a1, os_log_s *a2)
{
  id v2 = @"NO";
  if ((a1 & 1) != 0) {
    id v2 = @"YES";
  }
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[contactsd] Done deciding if we should analyze database. Decision: %@",  (uint8_t *)&v3,  0xCu);
  sub_100008DC4();
}

void sub_10000DF58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DF88( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DFEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E01C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E04C(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _stringFromXPCActivityState:a2]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 40)));
  sub_10000993C((void *)&_mh_execute_header, v4, v5, "%@ not processing state %@.", v6, v7, v8, v9, 2u);

  sub_100009950();
}

void sub_10000E100(uint64_t a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 40)));
  sub_10000993C((void *)&_mh_execute_header, v2, v3, "%@ has criteria %@.", v4, v5, v6, v7, 2u);

  sub_100009950();
}

void sub_10000E1A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  *(void *)(a1 + 40)));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _stringFromXPCActivityState:a2]);
  sub_10000993C((void *)&_mh_execute_header, v5, v6, "%@ is in state %@.", v7, v8, v9, v10, 2u);

  sub_100009950();
}

void sub_10000E258(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", a1));
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Faild to convert unrecognized state %@ to a string. Returning nil as a result.",  (uint8_t *)&v4,  0xCu);
}

void sub_10000E2F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E328(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "com.apple.notifyd.matching notification named %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000E39C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E3CC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E3FC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Registering maintenance activities.", v1, 2u);
}

void sub_10000E43C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [a1 activityIdentifier]));
  int v5 = 138412290;
  uint64_t v6 = v3;
  sub_10000B610((void *)&_mh_execute_header, a2, v4, "%@ failed to perform backup configuration.", (uint8_t *)&v5);

  sub_10000B61C();
}

void sub_10000E4D4(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( NSString,  "stringWithUTF8String:",  [a1 activityIdentifier]));
  int v4 = 138412290;
  int v5 = v3;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%@ is running backup configuration.",  (uint8_t *)&v4,  0xCu);

  sub_10000B61C();
}

void sub_10000E574(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_10000B5F8();
  sub_10000B5CC( (void *)&_mh_execute_header,  v2,  v3,  "Failed to read resources values for %@, error: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100009950();
}

void sub_10000E5F4(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_10000B5E0();
  sub_10000993C( (void *)&_mh_execute_header,  v4,  v5,  "Set NSURLIsExcludedFromBackupKey to %@ for %@",  v6,  v7,  v8,  v9,  v10);

  sub_100009950();
}

void sub_10000E694(void *a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_10000B5F8();
  sub_10000B5CC( (void *)&_mh_execute_header,  v2,  v3,  "Failed to set resources values for %@, error: %@",  v4,  v5,  v6,  v7,  v8);

  sub_100009950();
}

void sub_10000E714(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  sub_10000B5E0();
  sub_10000993C( (void *)&_mh_execute_header,  v4,  v5,  "No change needed, NSURLIsExcludedFromBackupKey already set to %@ for %@",  v6,  v7,  v8,  v9,  v10);

  sub_100009950();
}

void sub_10000E7B4(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10000B610((void *)&_mh_execute_header, a2, a3, "AddressBook database is nil, error %@.", (uint8_t *)&v3);
}

void sub_10000E820(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "failed to activate Rapport link Error %@",  (uint8_t *)&v2,  0xCu);
}

void sub_10000E894()
{
}

void sub_10000E8C0()
{
}

void sub_10000E8EC()
{
}

void sub_10000E918()
{
}

void sub_10000E944()
{
}

void sub_10000E970()
{
}

void sub_10000E99C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "shouldAcceptNewConnection: Failed check for TCC uncoupled process %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_initWithDataMapper_dataMapperConfiguration_workQueue_highPriorityWorkQueue_connection_accessAuthorization_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithDataMapper:dataMapperConfiguration:workQueue:highPriorityWorkQueue:connection:accessAuthorization:");
}

id objc_msgSend_initWithServiceProvider_schedulerProvider_highPrioritySchedulerProvider_tccServices_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceProvider:schedulerProvider:highPrioritySchedulerProvider:tccServices:");
}

id objc_msgSend_xpc(void *a1, const char *a2, ...)
{
  return [a1 xpc];
}