int main(int argc, const char **argv, const char **envp)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  dword_100008008 = 100;
  v3 = exclaves_boot(0LL, 100LL, envp);
  dword_10000800C = v3;
  if (v3)
  {
    v4 = v3;
    if (v3 != 46)
    {
      v5 = sub_100003EE4(&qword_100008000);
      v6 = swift_allocObject(v5, 96LL, 7LL);
      *(_OWORD *)(v6 + 16) = xmmword_100003F60;
      *(void *)(v6 + 56) = &type metadata for String;
      *(void *)(v6 + 32) = 0xD000000000000015LL;
      *(void *)(v6 + 40) = 0x8000000100003F60LL;
      *(void *)(v6 + 88) = &type metadata for Int32;
      *(_DWORD *)(v6 + 64) = v4;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease(v6);
    }
  }

  return 0;
}

uint64_t sub_100003EE4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}