int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  v3 = type metadata accessor for Container.Environment(0LL, argv, envp);
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = sub_1000035C0(&qword_1000080C8);
  v8 = swift_allocObject(v7, 72LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_100003D70;
  v9 = type metadata accessor for AuthServiceAssembly();
  v10 = swift_allocObject(v9, 16LL, 7LL);
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = sub_100003600();
  *(void *)(v8 + 32) = v10;
  v11 = type metadata accessor for SingletonPool(0LL);
  sub_100003664(v11);
  v12 = SingletonPool.init()();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for Container.Environment.normal(_:), v3);
  v13 = type metadata accessor for Container(0LL);
  sub_100003664(v13);
  qword_100008188 = Container.init(bundleAssemblies:assemblies:singletonPool:environment:)( &_swiftEmptyArrayStorage,  v8,  v12,  v6);
  v14 = [(id)objc_opt_self(AMSEphemeralDefaults) setSuppressEngagement:1];
  Container.resolver.getter(qword_100008190, v14);
  qword_1000081B8 = (uint64_t)[(id)objc_opt_self(NSXPCListener) serviceListener];
  v15 = qword_1000081A8;
  v16 = unk_1000081B0;
  sub_100003640(qword_100008190, qword_1000081A8);
  v17 = type metadata accessor for WDSJWTAuthenticatorServiceListener(0LL);
  v18 = dispatch thunk of ResolverType.resolve<A>(_:)(v17, v17, v15, v16);
  if (v18)
  {
    qword_1000081C0 = v18;
    v19 = (void *)qword_1000081B8;
    [(id)qword_1000081B8 setDelegate:v18];
    [v19 activate];
    LODWORD(v18) = 0;
  }

  else
  {
    __break(1u);
  }

  return v18;
}

uint64_t sub_1000035C0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100003600()
{
  unint64_t result = qword_1000080D0;
  if (!qword_1000080D0)
  {
    uint64_t v1 = type metadata accessor for AuthServiceAssembly();
    unint64_t result = swift_getWitnessTable(&unk_100003DC4, v1);
    atomic_store(result, (unint64_t *)&qword_1000080D0);
  }

  return result;
}

void *sub_100003640(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_100003664(uint64_t a1)
{
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

uint64_t sub_100003670()
{
  uint64_t v0 = ProxyContainer.public.getter();
  uint64_t v1 = type metadata accessor for WDSJWTAuthenticatorServiceListener(0LL);
  uint64_t v2 = RegistrationContainer.register<A>(_:name:factory:)(v1, 0LL, 0LL, sub_1000036E8, 0LL, v1);
  swift_release(v2);
  uint64_t v3 = swift_release(v0);
  uint64_t v4 = ProxyContainer.private.getter(v3);
  RegistrationContainer.lazy(block:)(sub_1000038F4, 0LL);
  return swift_release(v4);
}

uint64_t sub_1000036E8(void *a1)
{
  uint64_t v2 = type metadata accessor for WDSVersion(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000035C0(&qword_100008180);
  __chkstk_darwin();
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  sub_100003640(a1, v8);
  unint64_t v10 = sub_100003B60();
  uint64_t result = dispatch thunk of ResolverType.resolve<A>(_:name:)( v10,  0x7672655368747561LL,  0xEB00000000656369LL,  v10,  v8,  v9);
  if (result)
  {
    v21[3] = v10;
    v21[4] = &protocol witness table for NSURLSession;
    v21[0] = result;
    uint64_t v12 = type metadata accessor for WDSJWTMescalSigner(0LL);
    swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
    uint64_t v13 = WDSJWTMescalSigner.init()();
    v20[3] = v12;
    v20[4] = &protocol witness table for WDSJWTMescalSigner;
    v20[0] = v13;
    uint64_t v14 = a1[3];
    uint64_t v15 = a1[4];
    sub_100003640(a1, v14);
    uint64_t v16 = type metadata accessor for WDSEndpoint(0LL);
    dispatch thunk of ResolverType.resolve<A>(_:)(v16, v16, v14, v15);
    uint64_t result = sub_100003B9C((uint64_t)v7, 1LL, v16);
    if ((_DWORD)result != 1)
    {
      (*(void (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for WDSVersion.tokenServiceVersion(_:),  v2);
      uint64_t v17 = type metadata accessor for WDSJWTAuthenticatorService(0LL);
      swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
      uint64_t v18 = WDSJWTAuthenticatorService.init(session:signer:endpoint:version:timeout:)(v21, v20, v7, v5, 0LL, 1LL);
      id v19 = objc_allocWithZone((Class)type metadata accessor for WDSJWTAuthenticatorServiceListener(0LL));
      return WDSJWTAuthenticatorServiceListener.init(delegate:)( v18,  &protocol witness table for WDSJWTAuthenticatorService);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_1000038F4()
{
  uint64_t v0 = type metadata accessor for Scope(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v4 = sub_100003B60();
  uint64_t v5 = RegistrationContainer.register<A>(_:name:factory:)( v4,  0x7672655368747561LL,  0xEB00000000656369LL,  sub_1000039F8,  0LL,  v4);
  swift_release(v5);
  uint64_t v6 = type metadata accessor for WDSEndpoint(0LL);
  uint64_t v7 = RegistrationContainer.register<A>(_:name:factory:)(v6, 0LL, 0LL, sub_100003A74, 0LL, v6);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for Scope.singleton(_:), v0);
  uint64_t v8 = Definition.inScope(_:)(v3);
  swift_release(v8);
  swift_release(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id sub_1000039F8()
{
  id v0 = [(id)objc_opt_self(NSURLSessionConfiguration) defaultSessionConfiguration];
  [v0 setRequestCachePolicy:4];
  id v1 = [(id)objc_opt_self(NSURLSession) sessionWithConfiguration:v0];

  return v1;
}

uint64_t sub_100003A74()
{
  id v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  URL.init(string:)(0xD00000000000001CLL, 0x8000000100003ED0LL);
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t result = sub_100003B9C((uint64_t)v1, 1LL, v2);
  if ((_DWORD)result != 1) {
    return WDSEndpoint.init(url:)(v1);
  }
  __break(1u);
  return result;
}

uint64_t sub_100003B1C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for AuthServiceAssembly()
{
  return objc_opt_self(&OBJC_CLASS____TtC32com_apple_weatherkit_authservice19AuthServiceAssembly);
}

uint64_t sub_100003B4C()
{
  return sub_100003670();
}

unint64_t sub_100003B60()
{
  unint64_t result = qword_100008170;
  if (!qword_100008170)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSURLSession);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100008170);
  }

  return result;
}

uint64_t sub_100003B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}