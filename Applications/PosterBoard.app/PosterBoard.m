uint64_t sub_100002134(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  v3 = a2;
  v4 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v3 delegate]);
    v8 = objc_opt_isKindOfClass(v7, *(void *)(a1 + 32));
  }

  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

id sub_10000229C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ApplicationDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = type metadata accessor for ApplicationDelegate();
  uint64_t v4 = static CommandLine.unsafeArgv.getter();
  uint64_t v5 = ((uint64_t (*)(void))static CommandLine.argc.getter)();
  uint64_t v6 = static CommandLine.argc.getter(v5);
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata(v3);
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  LODWORD(v8) = UIApplicationMain(_:_:_:_:)(v6, v4, 0LL, 0LL, v9, v11);
  swift_bridgeObjectRelease(v11);
  exit((int)v8);
}

uint64_t type metadata accessor for ApplicationDelegate()
{
  return objc_opt_self(&OBJC_CLASS____TtC11PosterBoard19ApplicationDelegate);
}

uint64_t sub_100002384()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC11PosterBoardP33_D37C83C3E98BBC3E1BFE304CC5018F5119ResourceBundleClass);
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bs_firstObjectPassingTest:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_posterRackViewController(void *a1, const char *a2, ...)
{
  return _[a1 posterRackViewController];
}

id objc_msgSend_posterSwitcherWindowScene(void *a1, const char *a2, ...)
{
  return _[a1 posterSwitcherWindowScene];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}