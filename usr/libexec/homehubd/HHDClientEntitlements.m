@interface HHDClientEntitlements
+ (unint64_t)getNotificationEntitlementForSelector:(SEL)a3;
+ (unint64_t)getRequestEntitlementForSelector:(SEL)a3;
@end

@implementation HHDClientEntitlements

+ (unint64_t)getRequestEntitlementForSelector:(SEL)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_10002E5B0);
  if ((v3 & 1) == 0)
  {
    v10 = a3;
    int v11 = __cxa_guard_acquire(&qword_10002E5B0);
    a3 = v10;
    if (v11)
    {
      v16[0] = (unint64_t)"createEndpointWithAccessoryIdentifier:mediaRouteId:callback:";
      v16[1] = 0LL;
      v16[2] = (unint64_t)"activateEndpointWithIdentifier:callback:";
      v16[3] = 0LL;
      v16[4] = (unint64_t)"deactivateEndpointWithIdentifier:callback:";
      v16[5] = 0LL;
      v16[6] = (unint64_t)"deleteEndpointWithIdentifier:callback:";
      v16[7] = 0LL;
      v16[8] = (unint64_t)"getDaemonVersionInformationWithCallback:";
      v16[9] = 0LL;
      v16[10] = (unint64_t)"registerForNotifications:callback:";
      v16[11] = 1LL;
      v16[12] = (unint64_t)"getEndpointWithIdentifier:callback:";
      v16[13] = 1LL;
      v16[14] = (unint64_t)"getEndpointWithBubbleIdentifier:callback:";
      v16[15] = 1LL;
      v16[16] = (unint64_t)"listEndpointsWithCallback:";
      v16[17] = 1LL;
      v16[18] = (unint64_t)"getEndpointAppStateListWithCallback:";
      v16[19] = 1LL;
      sub_10000691C((uint64_t)&v13, v16, 10LL);
      v12 = (void *)v14;
      qword_10002E598 = (uint64_t)v13;
      qword_10002E5A0 = v14;
      qword_10002E5A8 = v15;
      if (v15)
      {
        *(void *)(v14 + 16) = &qword_10002E5A0;
        v13 = &v14;
        uint64_t v14 = 0LL;
        uint64_t v15 = 0LL;
        v12 = 0LL;
      }

      else
      {
        qword_10002E598 = (uint64_t)&qword_10002E5A0;
      }

      sub_100006DB0((uint64_t)&v13, v12);
      __cxa_guard_release(&qword_10002E5B0);
      a3 = v10;
    }
  }

  uint64_t v4 = qword_10002E5A0;
  if (!qword_10002E5A0) {
    return 2LL;
  }
  v5 = &qword_10002E5A0;
  do
  {
    unint64_t v6 = *(void *)(v4 + 32);
    BOOL v7 = v6 >= (unint64_t)a3;
    else {
      v8 = (uint64_t *)(v4 + 8);
    }
    if (v7) {
      v5 = (uint64_t *)v4;
    }
    uint64_t v4 = *v8;
  }

  while (*v8);
  else {
    return 2LL;
  }
}

+ (unint64_t)getNotificationEntitlementForSelector:(SEL)a3
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_10002E5D0);
  if ((v3 & 1) == 0)
  {
    v10 = a3;
    int v11 = __cxa_guard_acquire(&qword_10002E5D0);
    a3 = v10;
    if (v11)
    {
      v16[0] = (unint64_t)"endpointListChanged:";
      v16[1] = 1LL;
      v16[2] = (unint64_t)"endpointAppStateListChanged:";
      v16[3] = 1LL;
      sub_10000691C((uint64_t)&v13, v16, 2LL);
      v12 = (void *)v14;
      qword_10002E5B8 = (uint64_t)v13;
      qword_10002E5C0 = v14;
      qword_10002E5C8 = v15;
      if (v15)
      {
        *(void *)(v14 + 16) = &qword_10002E5C0;
        v13 = &v14;
        uint64_t v14 = 0LL;
        uint64_t v15 = 0LL;
        v12 = 0LL;
      }

      else
      {
        qword_10002E5B8 = (uint64_t)&qword_10002E5C0;
      }

      sub_100006DB0((uint64_t)&v13, v12);
      __cxa_guard_release(&qword_10002E5D0);
      a3 = v10;
    }
  }

  uint64_t v4 = qword_10002E5C0;
  if (!qword_10002E5C0) {
    return 2LL;
  }
  v5 = &qword_10002E5C0;
  do
  {
    unint64_t v6 = *(void *)(v4 + 32);
    BOOL v7 = v6 >= (unint64_t)a3;
    else {
      v8 = (uint64_t *)(v4 + 8);
    }
    if (v7) {
      v5 = (uint64_t *)v4;
    }
    uint64_t v4 = *v8;
  }

  while (*v8);
  else {
    return 2LL;
  }
}

@end