;
}

id GPKAccountNotificationPlugin.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id GPKAccountNotificationPlugin.init()()
{
  id v5 = v0;
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType(v0);
  id v3 = objc_msgSendSuper2(&v4, "init");
  id v1 = v3;
  id v5 = v3;

  return v3;
}

id GPKAccountNotificationPlugin.__deallocating_deinit()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for GPKAccountNotificationPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC27GroupKitAccountNotification28GPKAccountNotificationPlugin);
}