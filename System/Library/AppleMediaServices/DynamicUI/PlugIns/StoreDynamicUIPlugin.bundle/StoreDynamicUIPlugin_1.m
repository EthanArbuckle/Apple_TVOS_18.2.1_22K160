void sub_75C88(uint64_t a1)
{
  sub_75DF0(a1, (uint64_t (*)(uint64_t))sub_588F4);
}

void sub_75C94(uint64_t a1)
{
}

void sub_75CA0(uint64_t a1)
{
  v1 = sub_586B0(a1);
  sub_77C40((uint64_t)v1);
  sub_77ABC();
  sub_58684();
}

void sub_75CCC()
{
}

void sub_75CE8(char a1)
{
}

void sub_75CF4(uint64_t a1)
{
}

void sub_75D08(char a1)
{
}

void sub_75D14()
{
}

void sub_75D34(uint64_t a1)
{
}

void sub_75D68(uint64_t a1)
{
}

Swift::Int sub_75D74(char a1)
{
  return sub_76888(0LL, a1 & 1);
}

void sub_75D80(uint64_t a1)
{
}

void sub_75DA8(uint64_t a1)
{
}

void sub_75DB4(uint64_t a1)
{
}

void sub_75DC0(uint64_t a1)
{
}

void sub_75DCC(char a1)
{
}

void sub_75DD8(char a1)
{
}

void sub_75DE4(uint64_t a1)
{
}

void sub_75DF0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4 = a2(a1);
  sub_77A84((uint64_t)v5, v4);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_75E38(uint64_t a1)
{
}

uint64_t sub_75E48(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 1954047348LL;
  }
  else {
    uint64_t v3 = 0x656E6961746E6F63LL;
  }
  if (v2) {
    uint64_t v4 = 0xE900000000000064LL;
  }
  else {
    uint64_t v4 = 0xE400000000000000LL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_75E98(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x656372756F736572LL;
  }
  else {
    uint64_t v3 = 0x6C6F626D7973LL;
  }
  if (v2) {
    uint64_t v4 = 0xE600000000000000LL;
  }
  else {
    uint64_t v4 = 0xE800000000000000LL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_75EE4(uint64_t a1, unsigned __int8 a2)
{
  int v3 = a2;
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v4 = 0x697461676976616ELL;
    }
    else {
      uint64_t v4 = 1701736302LL;
    }
    if (v3 == 1) {
      uint64_t v2 = 0xEA00000000006E6FLL;
    }
    else {
      uint64_t v2 = 0xE400000000000000LL;
    }
  }

  else
  {
    sub_77C4C();
  }

  sub_77A84(a1, v4);
  return sub_77A7C(v2);
}

uint64_t sub_75F40(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_77BFC();
    unint64_t v6 = v5 & 0xFFFFFFFFFFFFLL | 0xE900000000000000LL;
    if (v3) {
      uint64_t v7 = 0x6C65685379646F62LL;
    }
    else {
      uint64_t v7 = 0x79646F427473616CLL;
    }
    if (v3) {
      uint64_t v2 = v6;
    }
    else {
      uint64_t v2 = 0xED0000666C656853LL;
    }
  }

  else
  {
    sub_77B04();
  }

  sub_77A84(v4, v7);
  return sub_77A7C(v2);
}

uint64_t sub_75FAC(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 1668184435LL;
  }
  else {
    uint64_t v3 = 0x636E797361LL;
  }
  if (v2) {
    uint64_t v4 = 0xE500000000000000LL;
  }
  else {
    uint64_t v4 = 0xE400000000000000LL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_75FF0(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x656E696C64616568LL;
  }
  else {
    uint64_t v3 = 0x53736E6F74747562LL;
  }
  if (v2) {
    uint64_t v4 = 0xEC000000666C6568LL;
  }
  else {
    uint64_t v4 = 0xED0000666C656853LL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_76058(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_77BFC();
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFLL | 0xE900000000000000LL;
    if (v2) {
      uint64_t v6 = 0x6C65685379646F62LL;
    }
    else {
      uint64_t v6 = 0x79646F427473616CLL;
    }
    if (v2) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = 0xED0000666C656853LL;
    }
  }

  else
  {
    uint64_t v7 = 0xEB00000000666C65LL;
    sub_77B7C();
  }

  sub_77A84(v3, v6);
  return sub_77A7C(v7);
}

void sub_760D0(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_76114()
{
  return sub_77A7C(v0);
}

void sub_76148()
{
  __asm { BR              X10 }

uint64_t sub_76178()
{
  return sub_77A7C(v0);
}

uint64_t sub_761D8(uint64_t a1)
{
  return String.hash(into:)(a1, 0x68537265746F6F66LL, 0xEB00000000666C65LL);
}

uint64_t sub_761F8()
{
  if (v1)
  {
    sub_77BFC();
    unint64_t v5 = v4 & 0xFFFFFFFFFFFFLL | 0xE900000000000000LL;
    if (v2) {
      uint64_t v6 = 0x6C65685379646F62LL;
    }
    else {
      uint64_t v6 = 0x68537265746F6F66LL;
    }
    if (v2) {
      uint64_t v0 = v5;
    }
  }

  else
  {
    sub_77B7C();
  }

  sub_77A84(v3, v6);
  return sub_77A7C(v0);
}

void sub_7625C(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_762AC(uint64_t a1)
{
  return sub_77A7C(0xEA0000000000666CLL);
}

uint64_t sub_76318(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_77ACC();
    if (v7) {
      uint64_t v2 = v5;
    }
    else {
      uint64_t v2 = v6;
    }
  }

  else
  {
    sub_77A8C();
  }

  sub_77A84(v3, v4);
  return sub_77A7C(v2);
}

void sub_76354()
{
  __asm { BR              X10 }

uint64_t sub_76384()
{
  return sub_77A7C(v0);
}

uint64_t sub_763C4(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x6F74747542656E6FLL;
  }
  else {
    uint64_t v3 = 0x53736E6F74747562LL;
  }
  if (v2) {
    uint64_t v4 = 0xEC000000666C6568LL;
  }
  else {
    uint64_t v4 = 0xEE00666C6568536ELL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_76428(uint64_t a1)
{
  return String.hash(into:)(a1, 0x656853656C746974LL, 0xEA0000000000666CLL);
}

uint64_t sub_76444(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x6C6C41776F6873LL;
  }
  else {
    uint64_t v3 = 0x73726946776F6873LL;
  }
  if (v2) {
    uint64_t v4 = 0xE900000000000074LL;
  }
  else {
    uint64_t v4 = 0xE700000000000000LL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_76498(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x6572616873LL;
  }
  else {
    uint64_t v3 = 0x6E656D6D6F636572LL;
  }
  if (v2) {
    uint64_t v4 = 0xEB00000000646564LL;
  }
  else {
    uint64_t v4 = 0xE500000000000000LL;
  }
  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

void sub_764F0(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_7652C(uint64_t a1)
{
  return sub_77A7C(0xEB0000000073756CLL);
}

uint64_t sub_765B4(uint64_t a1, unsigned __int8 a2)
{
  int v2 = a2;
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v3 = 0x746867696CLL;
    }
    else {
      uint64_t v3 = 0x65766974616ELL;
    }
    if (v2 == 1) {
      uint64_t v4 = 0xE500000000000000LL;
    }
    else {
      uint64_t v4 = 0xE600000000000000LL;
    }
  }

  else
  {
    uint64_t v4 = 0xE400000000000000LL;
    uint64_t v3 = 1802658148LL;
  }

  sub_77A84(a1, v3);
  return sub_77A7C(v4);
}

uint64_t sub_76614(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x7261646E6F636573LL;
  }
  else {
    uint64_t v3 = 0x7972616D697270LL;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000LL;
  }
  else {
    unint64_t v4 = 0xE900000000000079LL;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

void sub_76670(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_766B0(uint64_t a1)
{
  return sub_77A7C(0xE400000000000000LL);
}

void sub_766FC(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_76734(uint64_t a1)
{
  return sub_77A7C(0xE600000000000000LL);
}

uint64_t sub_76780(uint64_t a1, unsigned __int8 a2)
{
  int v3 = a2;
  if (a2)
  {
    if (a2 == 1) {
      uint64_t v4 = 0x6C6F626D7973LL;
    }
    else {
      uint64_t v4 = 1952671090LL;
    }
    if (v3 == 1) {
      uint64_t v2 = 0xE600000000000000LL;
    }
    else {
      uint64_t v2 = 0xE400000000000000LL;
    }
  }

  else
  {
    sub_77C60();
  }

  sub_77A84(a1, v4);
  return sub_77A7C(v2);
}

uint64_t sub_767D4(uint64_t a1)
{
  return String.hash(into:)(a1, 0x656E6961746E6F63LL, 0xE900000000000064LL);
}

void sub_767F0(uint64_t a1)
{
}

void sub_7680C(uint64_t a1, uint64_t a2)
{
  if (v2)
  {
    if (v2 == 1) {
      uint64_t v3 = 0x6C6F626D7973LL;
    }
    else {
      uint64_t v3 = 1952671090LL;
    }
  }

  else
  {
    sub_77C60();
  }

  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76870(uint64_t a1, uint64_t a2)
{
}

void sub_7687C(uint64_t a1, uint64_t a2)
{
}

Swift::Int sub_76888(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x7261646E6F636573LL;
  }
  else {
    uint64_t v3 = 0x7972616D697270LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v4 = 0xE900000000000079LL;
  }
  else {
    unint64_t v4 = 0xE700000000000000LL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

void sub_76910(uint64_t a1, uint64_t a2)
{
}

void sub_7691C(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 0x6572616873LL;
  }
  else {
    uint64_t v3 = 0x6E656D6D6F636572LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76980(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 0x6C6C41776F6873LL;
  }
  else {
    uint64_t v3 = 0x73726946776F6873LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_769E4(uint64_t a1)
{
}

void sub_76A04(uint64_t a1, uint64_t a2)
{
}

void sub_76A2C(uint64_t a1, uint64_t a2)
{
}

void sub_76A3C(uint64_t a1, uint64_t a2)
{
}

void sub_76A48(uint64_t a1, uint64_t a2)
{
  if (v2) {
    sub_77ACC();
  }
  else {
    sub_77A8C();
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76A94(uint64_t a1, char a2)
{
  if (a2)
  {
    sub_77BFC();
    if (v5) {
      uint64_t v6 = 0x6C65685379646F62LL;
    }
    else {
      uint64_t v6 = 0x68537265746F6F66LL;
    }
  }

  else
  {
    sub_77B7C();
  }

  sub_77A84((uint64_t)v7, v6);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76B08(uint64_t a1)
{
}

void sub_76B28(uint64_t a1, uint64_t a2)
{
}

void sub_76B5C(uint64_t a1, uint64_t a2)
{
}

void sub_76B68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = a3(a2);
  sub_77A84((uint64_t)v6, v5);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76BB0(uint64_t a1, uint64_t a2)
{
}

void sub_76BBC(uint64_t a1, uint64_t a2)
{
  char v2 = sub_77AC4(a1, a2);
  sub_77C40((uint64_t)v2);
  sub_77ABC();
  sub_58684();
}

void sub_76BE8(uint64_t a1, uint64_t a2)
{
  if (v2)
  {
    sub_77BFC();
    if (v3) {
      uint64_t v4 = 0x6C65685379646F62LL;
    }
    else {
      uint64_t v4 = 0x79646F427473616CLL;
    }
  }

  else
  {
    sub_77B7C();
  }

  sub_77A84((uint64_t)v5, v4);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76C70(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 0x6F74747542656E6FLL;
  }
  else {
    uint64_t v3 = 0x53736E6F74747562LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76CE4(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 0x656E696C64616568LL;
  }
  else {
    uint64_t v3 = 0x53736E6F74747562LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76D5C(uint64_t a1, uint64_t a2)
{
  if (v2)
  {
    sub_77BFC();
    if (v3) {
      uint64_t v4 = 0x6C65685379646F62LL;
    }
    else {
      uint64_t v4 = 0x79646F427473616CLL;
    }
  }

  else
  {
    sub_77B04();
  }

  sub_77A84((uint64_t)v5, v4);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76DD8(uint64_t a1, uint64_t a2)
{
  if (v2)
  {
    if (v2 == 1) {
      uint64_t v3 = 0x697461676976616ELL;
    }
    else {
      uint64_t v3 = 1701736302LL;
    }
  }

  else
  {
    sub_77C4C();
  }

  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76E44(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 0x656372756F736572LL;
  }
  else {
    uint64_t v3 = 0x6C6F626D7973LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76EA0(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 1668184435LL;
  }
  else {
    uint64_t v3 = 0x636E797361LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76EF4(uint64_t a1, uint64_t a2)
{
  if ((v2 & 1) != 0) {
    uint64_t v3 = 1954047348LL;
  }
  else {
    uint64_t v3 = 0x656E6961746E6F63LL;
  }
  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

void sub_76F50(uint64_t a1, uint64_t a2)
{
  if (v2)
  {
    if (v2 == 1) {
      uint64_t v3 = 0x746867696CLL;
    }
    else {
      uint64_t v3 = 0x65766974616ELL;
    }
  }

  else
  {
    uint64_t v3 = 1802658148LL;
  }

  sub_77A84((uint64_t)v4, v3);
  sub_34DD0();
  sub_77ABC();
  sub_58684();
}

uint64_t sub_76FC0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DED50, v2);
  sub_34DD0();
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_7700C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x7261646E6F636573LL;
  }
  else {
    return 0x7972616D697270LL;
  }
}

void sub_77048(char *a1, unsigned __int8 *a2)
{
}

Swift::Int sub_77054()
{
  return sub_75D74(*v0);
}

uint64_t sub_7705C(uint64_t a1)
{
  return sub_76614(a1, *v1);
}

Swift::Int sub_77064(uint64_t a1)
{
  return sub_76888(a1, *v1);
}

uint64_t sub_7706C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_76FC0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_77098@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_7700C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_770C4()
{
  unint64_t result = qword_F6EA8;
  if (!qword_F6EA8)
  {
    unint64_t result = swift_getWitnessTable(&unk_BA4C8, &type metadata for OfferPlatter.Style);
    atomic_store(result, (unint64_t *)&qword_F6EA8);
  }

  return result;
}

uint64_t sub_77100@<X0>(uint64_t a1@<X8>)
{
  return sub_8260(v1 + 200, a1);
}

uint64_t sub_7710C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 56));
}

unint64_t sub_7711C()
{
  unint64_t result = qword_F6EB0;
  if (!qword_F6EB0)
  {
    uint64_t v1 = type metadata accessor for OfferPlatter(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BA4F0, v1);
    atomic_store(result, (unint64_t *)&qword_F6EB0);
  }

  return result;
}

void sub_7715C(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  char v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = sub_E9C0(v8);
  uint64_t v10 = type metadata accessor for DynamicTextFactory(0LL);
  uint64_t v11 = sub_E9C0(v10);
  v12 = (int *)type metadata accessor for OfferPlatter(0LL);
  uint64_t v13 = sub_77C28();
  if (v2)
  {
    sub_847C();
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
  }

  *(void *)a2 = v13;
  *(void *)(a2 + 8) = v14;
  __chkstk_darwin(v13);
  sub_1991C();
  *(void *)(v15 - 16) = a1;
  sub_5A94(0x6B726F77747261LL, 0xE700000000000000LL, (uint64_t)v12, (uint64_t)sub_16924, v16, v17, v18, v19);
  *(void *)(a2 + 16) = v20;
  __chkstk_darwin(v20);
  sub_1991C();
  *(void *)(v21 - 16) = a1;
  sub_63B4();
  uint64_t v63 = a1;
  uint64_t v58 = v9;
  __int128 v22 = v62[1];
  *(_OWORD *)(a2 + 24) = v62[0];
  *(_OWORD *)(a2 + 40) = v22;
  *(_OWORD *)(a2 + 56) = v62[2];
  *(void *)&v62[0] = sub_77C28();
  *((void *)&v62[0] + 1) = v23;
  uint64_t v24 = AnyHashable.init<A>(_:)(v62, &type metadata for String, &protocol witness table for String);
  __chkstk_darwin(v24);
  sub_77C08();
  *(void *)(v25 - 16) = v26;
  sub_77C1C();
  sub_5868(v27, v28, v29, v30, v31, v32, v33, v34);
  sub_D970((uint64_t)v7, a2 + v12[12], &qword_F3838);
  __chkstk_darwin(v35);
  sub_1991C();
  uint64_t v36 = v11;
  uint64_t v37 = v63;
  *(void *)(v38 - 16) = v11;
  *(void *)(v38 - 8) = v37;
  sub_2F3A4();
  sub_D970((uint64_t)v62, a2 + 72, &qword_F3930);
  sub_77C1C();
  uint64_t v39 = sub_6F368();
  *(_BYTE *)(a2 + v12[14]) = v39 & 1;
  __chkstk_darwin(v39);
  sub_1991C();
  uint64_t v40 = v63;
  *(void *)(v41 - 16) = v58;
  *(void *)(v41 - 8) = v40;
  sub_77C1C();
  sub_5844();
  sub_D970((uint64_t)&v61, a2 + v12[13], &qword_F38F8);
  __chkstk_darwin(v42);
  sub_77C08();
  *(void *)(v43 - 16) = v11;
  *(void *)(v43 - 8) = v44;
  sub_2F3A4();
  sub_D970((uint64_t)&v60, a2 + 112, &qword_F3930);
  sub_77C1C();
  sub_6CFC(v45, v46, v47, v48, v49, v50, v51, v52);
  *(_BYTE *)(a2 + 152) = v53 & 1;
  __chkstk_darwin(v53);
  sub_1991C();
  uint64_t v54 = v63;
  *(void *)(v55 - 16) = v36;
  *(void *)(v55 - 8) = v54;
  sub_397F4();
  sub_58A0();
  uint64_t v56 = type metadata accessor for JSONObject(0LL);
  sub_851C(v56);
  sub_E9EC();
  sub_77B90();
  uint64_t v57 = sub_8484();
  sub_2F360(v57);
  sub_7CF4(&v59, a2 + 160);
}

void sub_77780(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_77794(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ColorFactory(0LL);
  uint64_t v6 = sub_E9C0(v5);
  uint64_t v7 = type metadata accessor for DynamicTextFactory(0LL);
  uint64_t v8 = sub_E9C0(v7);
  uint64_t v17 = v6;
  uint64_t v18 = a1;
  sub_588C( 0x726F6C6F63LL,  0xE500000000000000LL,  (uint64_t)&type metadata for OfferPlatter.Button,  (uint64_t)sub_77928,  (uint64_t)v16,  v9,  v10,  v11);
  if (v2)
  {
    sub_847C();
    uint64_t v12 = 0LL;
  }

  *a2 = v12;
  __chkstk_darwin(v12);
  sub_1991C();
  *(void *)(v13 - 16) = v8;
  *(void *)(v13 - 8) = a1;
  sub_397F4();
  sub_58A0();
  uint64_t v14 = type metadata accessor for JSONObject(0LL);
  sub_851C(v14);
  swift_release();
  sub_21400();
  uint64_t v15 = sub_8484();
  sub_E998(v15);
  sub_7CF4(&v19, (uint64_t)(a2 + 1));
}

void sub_778E0(uint64_t a1@<X1>, void *a2@<X8>)
{
}

void sub_778F4()
{
}

id *sub_778FC(id *a1)
{
  return a1;
}

uint64_t sub_77928@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_6783C(a1, *(void *)(v2 + 16), *(void *)(v2 + 24), a2);
}

uint64_t destroy for OfferPlatter.Button(id *a1)
{
  uint64_t v1 = a1 + 1;

  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v1);
}

uint64_t initializeWithCopy for OfferPlatter.Button(uint64_t a1, uint64_t a2)
{
  Swift::Int v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = a1 + 8;
  uint64_t v5 = a2 + 8;
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v6;
  uint64_t v7 = v6;
  uint64_t v8 = **(void (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);
  id v9 = v3;
  v8(v4, v5, v7);
  return a1;
}

void **assignWithCopy for OfferPlatter.Button(void **a1, void **a2)
{
  Swift::Int v3 = *a1;
  uint64_t v5 = a2 + 1;
  uint64_t v4 = *a2;
  *a1 = *a2;
  __int128 v6 = a1 + 1;
  id v7 = v4;

  sub_4290(v6, v5);
  return a1;
}

uint64_t assignWithTake for OfferPlatter.Button(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 8));
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

ValueMetadata *type metadata accessor for OfferPlatter.Button()
{
  return &type metadata for OfferPlatter.Button;
}

uint64_t sub_77A7C(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_77A84(uint64_t a1, uint64_t a2)
{
  return String.hash(into:)(a1, a2, v2);
}

  ;
}

void *sub_77AB0(uint64_t a1, uint64_t a2, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, a1);
}

Swift::Int sub_77ABC()
{
  return Hasher._finalize()();
}

void *sub_77AC4(uint64_t a1, uint64_t a2, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, a1);
}

  ;
}

  ;
}

void sub_77B20()
{
}

  ;
}

void sub_77B4C(uint64_t a1)
{
}

uint64_t sub_77B64(uint64_t a1)
{
  return String.hash(into:)(a1, 0x647261646E617473LL, 0xE800000000000000LL);
}

  ;
}

uint64_t sub_77B90()
{
  return swift_release(*(void *)(v0 - 288));
}

  ;
}

  ;
}

uint64_t sub_77BCC(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 - 8) + 8LL))(*(void *)(v1 - 72), a1);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_77C28()
{
  return sub_6F270();
}

void sub_77C34()
{
}

uint64_t sub_77C40(uint64_t a1, ...)
{
  return v1(va, v2);
}

  ;
}

  ;
}

void sub_77C74(uint64_t a1)
{
}

void sub_77C80(uint64_t a1)
{
}

void sub_77C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t KeyPath = swift_getKeyPath(&unk_BA600);
  uint64_t v7 = sub_44DC(&qword_F6F00);
  sub_19D8C(KeyPath);
  sub_E9EC();
  sub_78A34(v67);
  uint64_t v8 = swift_getKeyPath(&off_BA620);
  sub_19D8C(v8);
  sub_E9EC();
  if (v59)
  {
    sub_7CF4(&v57, (uint64_t)&v67);
    uint64_t v9 = sub_78290( OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel,  v54,  v57,  *((uint64_t *)&v57 + 1),  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v65,  v66);
    sub_782B0(v9, v10, v11, v12, v13, v14, v15, v16, v55, v57, *((uint64_t *)&v57 + 1), v58);
  }

  else
  {
    sub_19D4C((uint64_t)&v57);
  }

  uint64_t v17 = swift_getKeyPath(&unk_BA640);
  sub_19D8C(v17);
  sub_E9EC();
  if (v59)
  {
    sub_7CF4(&v57, (uint64_t)&v67);
    uint64_t v18 = sub_78290( OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel,  v54,  v57,  *((uint64_t *)&v57 + 1),  v58,  v59,  v60,  v61,  v62,  v63,  v64,  v65,  v66);
    sub_782B0(v18, v19, v20, v21, v22, v23, v24, v25, v56, v57, *((uint64_t *)&v57 + 1), v58);
  }

  else
  {
    sub_19D4C((uint64_t)&v57);
  }

  uint64_t v26 = *(void **)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel];
  uint64_t v27 = swift_getKeyPath(&unk_BA660);
  sub_19D8C(v27);
  swift_release();
  uint64_t v28 = (*(uint64_t (**)(id *, uint64_t))&stru_158.sectname[swift_isaMask & *v26])(&v67, a3);
  sub_782B0(v28, v29, v30, v31, v32, v33, v34, v35, v54, v57, *((uint64_t *)&v57 + 1), v58);
  uint64_t v36 = swift_getKeyPath(&unk_BA680);
  sub_19D8C(v36);
  swift_release();
  sub_460C((uint64_t)&v68, (uint64_t)&v62);
  sub_778FC(&v67);
  uint64_t v37 = swift_getKeyPath(&unk_BA680);
  DiffableLens.subscript.getter(v37, v7);
  sub_E9EC();
  id v38 = (id)v57;
  sub_778FC((id *)&v57);
  (*(void (**)(uint64_t *, uint64_t))&stru_158.sectname[swift_isaMask & **(void **)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel]])( &v62,  a3);

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v62);
  uint64_t v39 = swift_getKeyPath(&unk_BA6A0);
  uint64_t v40 = sub_44DC(&qword_F6F08);
  unint64_t v41 = sub_20DB8();
  StateLens<A>.subscript.getter(&v67, v39, v40, v41);
  sub_E9EC();
  int v42 = v67;
  uint64_t v43 = swift_getKeyPath(&unk_BA6C0);
  sub_19D8C(v43);
  sub_8770();
  if (v42)
  {
    if (v42 == 1) {
      char v44 = v57;
    }
    else {
      char v44 = 0;
    }
  }

  else
  {
    char v44 = 1;
  }

  uint64_t v45 = &v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled];
  swift_beginAccess(&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled], &v67, 1LL, 0LL);
  *uint64_t v45 = v44;
  sub_78928();
  uint64_t v46 = swift_getKeyPath(&unk_BA600);
  sub_19D8C(v46);
  sub_8770();
  if (v57 == 1)
  {
    swift_bridgeObjectRelease();
  }

  else
  {
    char v47 = _stringCompareWithSmolCheck(_:_:expecting:)( 0x7972616D697270LL,  0xE700000000000000LL,  0x7261646E6F636573LL,  0xE900000000000079LL,  0LL);
    swift_bridgeObjectRelease();
    if ((v47 & 1) == 0)
    {
      uint64_t v48 = swift_getKeyPath(&unk_BA6E0);
      sub_19D8C(v48);
      sub_8770();
      uint64_t v49 = v57;
      if ((void)v57)
      {
        uint64_t v50 = *(void **)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView];
        uint64_t v51 = *(void (**)(uint64_t, uint64_t))&stru_108.segname[(swift_isaMask & *v50) + 16];
        uint64_t v52 = v50;
        v51(v49, a3);
        swift_release();
      }
    }
  }

  objc_msgSend(v4, "setIsAccessibilityElement:", 0, sub_79334());
  id v53 = [v4 contentView];
  [v53 setIsAccessibilityElement:0];
}

uint64_t sub_78090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for OfferPlatterComponent();
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_780E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for OfferPlatterComponent();
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_78138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BA5E0, a4);
  return ComponentCell.apply(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_78194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BA5E0, a4);
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_781F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BA5E0, a4);
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

unint64_t sub_78250()
{
  unint64_t result = qword_F6D60;
  if (!qword_F6D60)
  {
    uint64_t v1 = type metadata accessor for OfferPlatter(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BA528, v1);
    atomic_store(result, (unint64_t *)&qword_F6D60);
  }

  return result;
}

uint64_t sub_78290@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  return (*(uint64_t (**)(char *, uint64_t))&stru_158.sectname[*v15 & **(void **)(v13 + a1)])(va, v14);
}

uint64_t sub_782B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t *)va);
}

void sub_782B8(void (*a1)(void))
{
}

void sub_782D4(uint64_t a1)
{
}

id sub_782F0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel;
  sub_11998();
  objc_opt_self(&OBJC_CLASS___UIColor);
  uint64_t v10 = v4;
  id v11 = sub_2AE08((uint64_t)v10, "ams_primaryText");
  uint64_t v12 = type metadata accessor for FontSource(0LL);
  uint64_t v85 = v12;
  v86 = &protocol witness table for FontSource;
  uint64_t v13 = sub_AE98(&v82);
  *uint64_t v13 = UIFontTextStyleCallout;
  v13[1] = *(void *)&UIFontWeightSemibold;
  uint64_t v14 = enum case for FontUseCase.preferredFontDerivative(_:);
  uint64_t v15 = sub_7ACE4();
  uint64_t v68 = *(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104LL);
  uint64_t v72 = v15;
  v68(v13, v14, v15);
  HIDWORD(v63) = enum case for FontSource.useCase(_:);
  sub_7AC2C((uint64_t)v13, enum case for FontSource.useCase(_:));
  uint64_t v16 = UIFontTextStyleCallout;
  uint64_t v17 = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v11, &v82);
  *(void *)&v4[v9] = v17;
  uint64_t v18 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel;
  id v19 = sub_2AE08(v17, "ams_secondaryText");
  uint64_t v20 = sub_7AC8C( (uint64_t)&protocol witness table for FontSource,  v59,  v63,  (uint64_t)v68,  v72,  v76,  (uint64_t)v81.receiver,  (uint64_t)v81.super_class,  v82,  v83,  v84,  v12,  (uint64_t)v86);
  *uint64_t v20 = UIFontTextStyleCaption2;
  uint64_t v21 = enum case for FontSource.textStyle(_:);
  sub_7AC2C((uint64_t)v20, enum case for FontSource.textStyle(_:));
  uint64_t v22 = UIFontTextStyleCaption2;
  uint64_t v29 = sub_7ACAC((uint64_t)v22, v23, v24, v25, v26, v27, v28);
  *(void *)&v10[v18] = v29;
  uint64_t v30 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel;
  id v31 = sub_2AE08(v29, "ams_secondaryText");
  uint64_t v32 = sub_7AC8C( (uint64_t)&protocol witness table for FontSource,  v60,  v64,  v69,  v73,  v77,  (uint64_t)v81.receiver,  (uint64_t)v81.super_class,  v82,  v83,  v84,  v12,  (uint64_t)v86);
  *uint64_t v32 = v16;
  sub_7AC2C((uint64_t)v32, v21);
  uint64_t v33 = v16;
  uint64_t v40 = sub_7ACAC((uint64_t)v33, v34, v35, v36, v37, v38, v39);
  *(void *)&v10[v30] = v40;
  uint64_t v41 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel;
  id v42 = sub_2AE08(v40, "ams_secondaryText");
  uint64_t v43 = sub_7AC8C( (uint64_t)&protocol witness table for FontSource,  v61,  v65,  v70,  v74,  v78,  (uint64_t)v81.receiver,  (uint64_t)v81.super_class,  v82,  v83,  v84,  v12,  (uint64_t)v86);
  *uint64_t v43 = v33;
  v43[1] = *(void *)&UIFontWeightSemibold;
  sub_7ACCC((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50, v62, v66, v71, v75, v79, v80);
  sub_7AC2C((uint64_t)v43, v67);
  uint64_t v51 = v33;
  *(void *)&v10[v41] = sub_7ACD8((uint64_t)v51, v52, (uint64_t)&v82);
  uint64_t v53 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView;
  id v54 = objc_allocWithZone((Class)sub_11930());
  *(void *)&v10[v53] = sub_7AC0C(242.0);
  uint64_t v55 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_containerView;
  *(void *)&v10[v55] = sub_7ACA4(objc_allocWithZone(&OBJC_CLASS___UIView));
  uint64_t v56 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView;
  *(void *)&v10[v56] = sub_7ACA4(objc_allocWithZone(&OBJC_CLASS___AMSUICommonView));
  sub_7AC44(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_computedSize);
  v10[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled] = 0;
  v10[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style] = 0;

  v81.receiver = v10;
  v81.super_class = (Class)type metadata accessor for OfferPlatterComponent();
  id v57 = objc_msgSendSuper2(&v81, "initWithFrame:", a1, a2, a3, a4);
  sub_793A8((uint64_t)v57);

  return v57;
}

void sub_78630()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel;
  sub_11998();
  id v3 = objc_msgSend((id)objc_opt_self(UIColor), "ams_primaryText");
  uint64_t v4 = type metadata accessor for FontSource(0LL);
  uint64_t v72 = v4;
  uint64_t v73 = &protocol witness table for FontSource;
  uint64_t v9 = sub_7ACBC(v4, v5, v6, v7, v8);
  *uint64_t v9 = UIFontTextStyleCallout;
  v9[1] = *(void *)&UIFontWeightSemibold;
  uint64_t v10 = enum case for FontUseCase.preferredFontDerivative(_:);
  uint64_t v11 = sub_7ACE4();
  uint64_t v68 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 104LL);
  uint64_t v69 = v11;
  v68((uint64_t)v9, v10, v11);
  HIDWORD(v66) = enum case for FontSource.useCase(_:);
  sub_7AC2C((uint64_t)v9, enum case for FontSource.useCase(_:));
  uint64_t v12 = UIFontTextStyleCallout;
  uint64_t v17 = sub_7AC34((uint64_t)v12, v13, v14, v15, v16);
  *(void *)&v0[v2] = v17;
  uint64_t v18 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel;
  id v19 = sub_2AE08(v17, "ams_secondaryText");
  uint64_t v24 = sub_7ACBC((uint64_t)v19, v20, v21, v22, v23);
  *uint64_t v24 = UIFontTextStyleCaption2;
  uint64_t v25 = enum case for FontSource.textStyle(_:);
  sub_7AC2C((uint64_t)v24, enum case for FontSource.textStyle(_:));
  uint64_t v26 = UIFontTextStyleCaption2;
  uint64_t v31 = sub_7AC34((uint64_t)v26, v27, v28, v29, v30);
  *(void *)&v0[v18] = v31;
  uint64_t v32 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel;
  id v33 = sub_2AE08(v31, "ams_secondaryText");
  uint64_t v38 = sub_7ACBC((uint64_t)v33, v34, v35, v36, v37);
  *uint64_t v38 = v12;
  sub_7AC2C((uint64_t)v38, v25);
  uint64_t v39 = v12;
  uint64_t v44 = sub_7AC34((uint64_t)v39, v40, v41, v42, v43);
  *(void *)&v0[v32] = v44;
  uint64_t v45 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel;
  id v46 = sub_2AE08(v44, "ams_secondaryText");
  uint64_t v72 = v4;
  uint64_t v73 = &protocol witness table for FontSource;
  uint64_t v51 = sub_7ACBC((uint64_t)v46, v47, v48, v49, v50);
  *uint64_t v51 = v39;
  v51[1] = *(void *)&UIFontWeightSemibold;
  sub_7ACCC((uint64_t)v51, v52, v53, v54, v55, v56, v57, v58, v65, v66, v68, v69, v70, HIDWORD(v70));
  sub_7AC2C((uint64_t)v51, v67);
  uint64_t v59 = v39;
  *(void *)&v0[v45] = sub_7ACD8((uint64_t)v59, v60, (uint64_t)v71);
  uint64_t v61 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView;
  id v62 = objc_allocWithZone((Class)sub_11930());
  *(void *)&v0[v61] = sub_7AC0C(242.0);
  uint64_t v63 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_containerView;
  *(void *)&v1[v63] = sub_7ACA4(objc_allocWithZone(&OBJC_CLASS___UIView));
  uint64_t v64 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView;
  *(void *)&v1[v64] = sub_7ACA4(objc_allocWithZone(&OBJC_CLASS___AMSUICommonView));
  sub_7AC44(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_computedSize);
  v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled] = 0;
  v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style] = 0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/OfferPlatterComponent_tvOS.swift",  53LL,  2LL,  35LL,  0);
  __break(1u);
}

void sub_78928()
{
  uint64_t v0 = sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2);
  id v1 = sub_118D0(v0, "contentView");
  sub_11820((uint64_t)v1, "setAccessibilityTraits:");

  sub_535AC();
}

uint64_t sub_789BC()
{
  return *v0;
}

void sub_789EC(char a1)
{
  id v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled);
  swift_beginAccess(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v4, 1LL, 0LL);
  *id v3 = a1;
  sub_78928();
  sub_535AC();
}

id sub_78A34(uint64_t a1)
{
  v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style] = a1 & 1;
  sub_794F4(a1);
  sub_798AC();
  sub_79758();
  return [v1 setNeedsLayout];
}

double sub_78A6C()
{
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for OfferPlatterComponent();
  id v1 = objc_msgSendSuper2(&v6, "prepareForReuse");
  sub_11808(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel);
  sub_11808(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel);
  sub_11808(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel);
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView];
  id v3 = *(void (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v2));
  uint64_t v4 = v2;
  v3();

  return sub_7AC44(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_computedSize);
}

id sub_78B68(uint64_t a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for OfferPlatterComponent();
  id v3 = objc_msgSendSuper2(&v5, "traitCollectionDidChange:", a1);
  sub_794F4((uint64_t)v3);
  sub_798AC();
  sub_79758();
  return [v1 setNeedsLayout];
}

void sub_78C3C(uint64_t a1, void *a2)
{
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for OfferPlatterComponent();
  objc_msgSendSuper2(&v9, "didUpdateFocusInContext:withAnimationCoordinator:", a1, a2);
  uint64_t v5 = sub_4968((uint64_t)&unk_E5190, 24LL);
  *(void *)(v5 + 16) = v2;
  v8[4] = sub_7ABB8;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256LL;
  v8[2] = sub_8807C;
  v8[3] = &unk_E51A8;
  objc_super v6 = _Block_copy(v8);
  id v7 = v2;
  swift_release();
  [a2 addCoordinatedFocusingAnimations:v6 completion:0];
  _Block_release(v6);
}

id sub_78D14(uint64_t a1, void *a2)
{
  return [a2 layoutIfNeeded];
}

uint64_t sub_78DC0()
{
  v62.receiver = v0;
  v62.super_class = (Class)type metadata accessor for OfferPlatterComponent();
  id v5 = objc_msgSendSuper2(&v62, "layoutSubviews");
  objc_super v6 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_containerView];
  id v7 = sub_118D0((uint64_t)v5, "contentView");
  [v7 bounds];
  sub_11878();

  objc_msgSend(v6, "setFrame:", v1, v2, v3, v4);
  id v8 = sub_79758();
  sub_118D0((uint64_t)v8, "isFocused");
  sub_79B50((uint64_t)&v61);
  objc_super v9 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView];
  *((void *)&__src[1] + 1) = sub_11930();
  *(void *)&__src[2] = &protocol witness table for UIView;
  *(void *)&__src[0] = v9;
  uint64_t v10 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel];
  uint64_t v39 = (void *)sub_11998();
  uint64_t v40 = sub_8A80( (unint64_t *)&qword_F3E80,  (uint64_t (*)(uint64_t))&type metadata accessor for DynamicLabel,  (uint64_t)&protocol conformance descriptor for DynamicLabel);
  *(void *)&__int128 aBlock = v10;
  uint64_t v54 = &protocol witness table for UIView;
  unint64_t v53 = sub_31544();
  *(void *)&__int128 v52 = v6;
  uint64_t v11 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel];
  uint64_t v51 = v40;
  uint64_t v50 = v39;
  *(void *)&__int128 v49 = v11;
  uint64_t v12 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel];
  uint64_t v48 = v40;
  uint64_t v47 = v39;
  *(void *)&__int128 v46 = v12;
  uint64_t v13 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel];
  uint64_t v45 = v40;
  uint64_t v44 = v39;
  *(void *)&__int128 v43 = v13;
  if (v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style]) {
    uint64_t v14 = 0x7261646E6F636573LL;
  }
  else {
    uint64_t v14 = 0x7972616D697270LL;
  }
  if (v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style]) {
    unint64_t v15 = 0xE900000000000079LL;
  }
  else {
    unint64_t v15 = 0xE700000000000000LL;
  }
  sub_7CF4(__src, (uint64_t)v55);
  uint64_t v16 = sub_7CF4(&v52, (uint64_t)&v56);
  sub_7ACC4(v16, (uint64_t)&v57, v17, v18, v19, v20, v21, v22, v36, aBlock);
  sub_7CF4(&v49, (uint64_t)&v58);
  sub_7CF4(&v46, (uint64_t)&v59);
  sub_7CF4(&v43, (uint64_t)v60);
  v60[5] = v14;
  v60[6] = v15;
  id v23 = v9;
  id v24 = v10;
  id v25 = v6;
  id v26 = v11;
  id v27 = v12;
  id v28 = sub_118D0((uint64_t)v13, "contentView");
  [v28 bounds];
  sub_11878();

  CGRect.subtracting(insets:)(20.0, 20.0, 20.0, 40.0, v1, v2, v3, v4);
  sub_11878();
  uint64_t v29 = (void *)objc_opt_self(&OBJC_CLASS___UIView);
  sub_7AA88((uint64_t)v55, (uint64_t)__src);
  uint64_t v30 = (double *)sub_4968((uint64_t)&unk_E5118, 600LL);
  memcpy(v30 + 2, __src, 0x220uLL);
  v30[70] = v1;
  v30[71] = v2;
  v30[72] = v3;
  v30[73] = v4;
  *((void *)v30 + 74) = v0;
  uint64_t v31 = sub_4968((uint64_t)&unk_E5140, 32LL);
  *(void *)(v31 + 16) = sub_7AB50;
  *(void *)(v31 + 24) = v30;
  uint64_t v40 = (uint64_t)sub_3E644;
  uint64_t v41 = v31;
  *(void *)&__int128 aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256LL;
  uint64_t v38 = sub_782D4;
  uint64_t v39 = &unk_E5158;
  uint64_t v32 = _Block_copy(&aBlock);
  id v33 = v0;
  swift_retain(v31);
  swift_release();
  [v29 performWithoutAnimation:v32];
  _Block_release(v32);
  sub_7AA54(v55);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v31, "", 150LL, 135LL, 40LL, 1LL);
  swift_release();
  uint64_t result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0) {
    __break(1u);
  }
  return result;
}

uint64_t sub_7918C(double a1, CGFloat a2, CGFloat a3, CGFloat a4, uint64_t a5, void *a6)
{
  uint64_t v11 = type metadata accessor for LayoutRect(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  OfferPlatterComponentLayout.placeChildren(relativeTo:in:)(a6, a1, a2, a3, a4);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

id sub_79278()
{
  return sub_118D0(v0, "isFocused");
}

double sub_79334()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_computedSize;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_computedSize + 32) & 1) == 0) {
    return *(double *)v1;
  }
  double v2 = sub_79930(0);
  uint64_t v4 = v3;
  double v5 = sub_79930(1);
  *(double *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v4;
  *(double *)(v1 + 16) = v5;
  *(void *)(v1 + 24) = v6;
  *(_BYTE *)(v1 + 32) = 0;
  return v2;
}

id sub_793A8(uint64_t a1)
{
  double v2 = v1;
  id v3 = sub_118D0(a1, "contentView");
  sub_AD130(12.0);

  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_containerView];
  sub_AD130(12.0);
  id v5 = [v2 contentView];
  [v5 addSubview:v4];

  sub_7ABC8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView);
  sub_7ABC8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel);
  sub_7ABC8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel);
  sub_7ABC8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel);
  sub_7ABC8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel);
  sub_7ABC8(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView);
  sub_79498();
  sub_794F4(v6);
  sub_798AC();
  sub_79758();
  return [v2 setNeedsLayout];
}

void sub_79498()
{
  id v0 = objc_msgSend((id)objc_opt_self(UIColor), "ams_mediaBorder");
  sub_11820((uint64_t)v0, "setBackgroundColor:");
  sub_7AC5C(v0);
}

void sub_794F4(uint64_t a1)
{
  char v2 = sub_118D0(a1, "isFocused");
  id v3 = sub_7954C(v2, *(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style));
  sub_11820((uint64_t)v3, "setBackgroundColor:");
  sub_7AC5C(v3);
}

id sub_7954C(char a1, char a2)
{
  if ((a1 & 1) != 0)
  {
    char v2 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
    id v3 = [v2 blackColor];
    id v4 = [v3 colorWithAlphaComponent:0.5];

    id v5 = [v2 whiteColor];
    id v6 = [v5 colorWithAlphaComponent:0.5];

    id v7 = objc_msgSend(v2, "ams_dynamicColorWithLightColor:darkColor:", v4, v6);
LABEL_7:
    id v12 = v7;

    return v12;
  }

  if ((a2 & 1) == 0)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
LABEL_6:
    objc_super v9 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
    id v10 = [v9 blackColor];
    id v4 = [v10 colorWithAlphaComponent:0.1];

    id v11 = [v9 whiteColor];
    id v6 = [v11 colorWithAlphaComponent:0.1];

    id v7 = objc_msgSend(v9, "ams_dynamicColorWithLightColor:darkColor:", v4, v6);
    goto LABEL_7;
  }

  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)( 0x7261646E6F636573LL,  0xE900000000000079LL,  0x7972616D697270LL,  0xE700000000000000LL,  0LL);
  swift_bridgeObjectRelease(0xE900000000000079LL);
  if ((v8 & 1) != 0) {
    goto LABEL_6;
  }
  return objc_msgSend((id)objc_opt_self(UIColor), "ams_clear");
}

id sub_79758()
{
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style) == 1)
  {
    uint64_t v1 = sub_7AC80();
  }

  else
  {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)( 0x7972616D697270LL,  0xE700000000000000LL,  0x7261646E6F636573LL,  0xE900000000000079LL,  0LL);
    uint64_t v1 = sub_537B0();
    if ((v2 & 1) == 0)
    {
      id v10 = *(void **)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView);
      uint64_t v11 = 1LL;
      return [v10 setHidden:v11];
    }
  }

  id v3 = sub_118D0(v1, "contentView");
  id v4 = [v3 layer];
  LODWORD(v5) = 0;
  [v4 setShadowOpacity:v5];

  sub_7AC98();
  double MinX = CGRectGetMinX(v13);
  sub_7AC98();
  double MinY = CGRectGetMinY(v14);
  sub_7AC98();
  CGFloat Width = CGRectGetWidth(v15);
  objc_super v9 = *(void **)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_separatorView);
  objc_msgSend(v9, "setFrame:", MinX, MinY, Width, 2.0);
  id v10 = v9;
  uint64_t v11 = 0LL;
  return [v10 setHidden:v11];
}

void sub_798AC()
{
  uint64_t v1 = v0;
  char v2 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel];
  unsigned int v3 = [v1 isFocused];
  id v4 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  double v5 = &selRef_ams_primaryText;
  if (!v3) {
    double v5 = &selRef_ams_secondaryText;
  }
  id v6 = [v4 *v5];
  (*(void (**)(id))((char *)&stru_68.reserved2 + (swift_isaMask & *v2)))(v6);
  sub_4960();
}

double sub_79930(int a1)
{
  HIDWORD(v29) = a1;
  sub_79B50((uint64_t)&v53);
  char v2 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_artworkView);
  uint64_t v45 = sub_11930();
  __int128 v46 = &protocol witness table for UIView;
  *(void *)&__int128 v44 = v2;
  unsigned int v3 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_buttonLabel);
  uint64_t v42 = sub_11998();
  uint64_t v43 = sub_8A80( (unint64_t *)&qword_F3E80,  (uint64_t (*)(uint64_t))&type metadata accessor for DynamicLabel,  (uint64_t)&protocol conformance descriptor for DynamicLabel);
  *(void *)&__int128 v41 = v3;
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_containerView);
  unint64_t v39 = sub_31544();
  uint64_t v40 = &protocol witness table for UIView;
  uint64_t v37 = v43;
  *(void *)&__int128 v38 = v4;
  double v5 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_infoLabel);
  uint64_t v36 = v42;
  uint64_t v34 = v43;
  *(void *)&__int128 v35 = v5;
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_subtitleLabel);
  uint64_t v33 = v42;
  *(void *)&__int128 v32 = v6;
  id v7 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_titleLabel);
  *(void *)&__int128 v31 = v7;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style)) {
    uint64_t v8 = 0x7261646E6F636573LL;
  }
  else {
    uint64_t v8 = 0x7972616D697270LL;
  }
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style)) {
    unint64_t v9 = 0xE900000000000079LL;
  }
  else {
    unint64_t v9 = 0xE700000000000000LL;
  }
  sub_7CF4(&v44, (uint64_t)v47);
  sub_7CF4(&v38, (uint64_t)&v48);
  sub_7CF4(&v41, (uint64_t)&v49);
  sub_7CF4(&v35, (uint64_t)&v50);
  uint64_t v10 = sub_7CF4(&v32, (uint64_t)&v51);
  sub_7ACC4(v10, (uint64_t)v52, v11, v12, v13, v14, v15, v16, v29, v31);
  v52[5] = v8;
  v52[6] = v9;
  if ((v30 & 1) != 0) {
    double v17 = 1310.0;
  }
  else {
    double v17 = 1280.0;
  }
  id v18 = v2;
  id v19 = v3;
  id v20 = v4;
  id v21 = v5;
  id v22 = v6;
  id v23 = v7;
  double v24 = sub_7ACF0();
  double v25 = CGSize.subtracting(insets:)(v24);
  sub_79F1C(v1, (uint64_t)v47, v25, v26);
  double v27 = sub_7ACF0();
  CGSize.adding(outsets:)(v27);
  sub_7AA54(v47);
  return v17;
}

uint64_t sub_79B50@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_style) & 1) != 0)
  {
    char v4 = sub_7ABD8();
    sub_7AC80();
    if ((v4 & 1) == 0)
    {
      CGFloat width = CGSizeZero.width;
      CGFloat height = CGSizeZero.height;
      goto LABEL_6;
    }
  }

  else
  {
    sub_537B0();
  }

  CGFloat height = 136.0;
  CGFloat width = 242.0;
LABEL_6:
  if ((*(_BYTE *)(v1 + v3) & 1) != 0)
  {
    char v7 = sub_7ABD8();
    sub_7AC80();
    double v8 = 7.0;
    if ((v7 & 1) != 0) {
      double v8 = 20.0;
    }
  }

  else
  {
    sub_537B0();
    double v8 = 20.0;
  }

  v37[3] = &type metadata for Double;
  v37[4] = &protocol witness table for Double;
  *(double *)uint64_t v37 = v8;
  sub_460C((uint64_t)v37, (uint64_t)v36);
  uint64_t v34 = &type metadata for Double;
  __int128 v35 = &protocol witness table for Double;
  *(void *)&__int128 v33 = 0x4044000000000000LL;
  __int128 v31 = &type metadata for CGFloat;
  __int128 v32 = &protocol witness table for CGFloat;
  uint64_t v29 = &protocol witness table for Double;
  *(void *)&__int128 v30 = 0x406B000000000000LL;
  id v28 = &type metadata for Double;
  double v26 = &protocol witness table for Double;
  *(void *)&__int128 v27 = 0x4000000000000000LL;
  double v25 = &type metadata for Double;
  *(void *)&__int128 v24 = 0x403C000000000000LL;
  *(void *)&__int128 v23 = 0x4034000000000000LL;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v37);
  *(CGFloat *)a1 = width;
  *(CGFloat *)(a1 + 8) = height;
  __asm { FMOV            V0.2D, #20.0 }

  *(_OWORD *)(a1 + 16) = _Q0;
  *(_OWORD *)(a1 + 32) = xmmword_B9090;
  sub_7CF4(v36, a1 + 48);
  sub_7CF4(&v33, a1 + 88);
  sub_7CF4(&v30, a1 + 128);
  sub_7CF4(&v27, a1 + 168);
  uint64_t v14 = sub_7CF4(&v24, a1 + 248);
  return sub_7ACC4(v14, a1 + 208, v15, v16, v17, v18, v19, v20, v22, v23);
}

id sub_79CD0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for OfferPlatterComponent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for OfferPlatterComponent()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin21OfferPlatterComponent);
}

ValueMetadata *type metadata accessor for OfferPlatterComponent.DynamicCellSize()
{
  return &type metadata for OfferPlatterComponent.DynamicCellSize;
}

uint64_t sub_79DA4()
{
  return sub_789BC() & 1;
}

void sub_79DC8(char a1)
{
}

void (*sub_79DE8(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v2 = *v1;
  *(void *)(a1 + 24) = *v1;
  swift_beginAccess(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, a1, 33LL, 0LL);
  return sub_79E34;
}

void sub_79E34(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    sub_78928();
  }
  sub_4960();
}

id sub_79E60()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSCollectionLayoutDimension);
  id v1 = [v0 estimatedDimension:1310.0];
  id v2 = [v0 estimatedDimension:300.0];
  id v3 =  [(id)objc_opt_self(NSCollectionLayoutSize) sizeWithWidthDimension:v1 heightDimension:v2];

  return v3;
}

id sub_79F08()
{
  return sub_79E60();
}

double sub_79F1C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v109 = a1;
  uint64_t v105 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v103 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v108 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v107 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  v106 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v110 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v101 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v111 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v122 = _swiftEmptyArrayStorage;
  uint64_t v18 = *(void *)(a2 + 240);
  uint64_t v19 = *(void *)(a2 + 248);
  BOOL v20 = v18 == 0x7972616D697270LL && v19 == 0xE700000000000000LL;
  uint64_t v100 = v9;
  if (v20
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v18, v19, 0x7972616D697270LL, 0xE700000000000000LL, 0LL) & 1) != 0)
  {
    uint64_t v21 = sub_44DC(&qword_F3E88);
    uint64_t v22 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
    uint64_t v23 = *(void *)(v22 + 72);
    uint64_t v24 = *(unsigned __int8 *)(v22 + 80);
    uint64_t v25 = (v24 + 32) & ~v24;
    uint64_t v26 = swift_allocObject(v21, v25 + v23, v24 | 7);
    *(_OWORD *)(v26 + 16) = xmmword_B5B40;
    uint64_t v102 = v26;
    v99 = (void (*)(char *))(v26 + v25);
    uint64_t v27 = *(void *)(a2 + 144);
    uint64_t v28 = *(void *)(a2 + 152);
    uint64_t v29 = sub_ACA0((void *)(a2 + 120), v27);
    uint64_t v120 = v27;
    uint64_t v121 = *(void *)(v28 + 8);
    __int128 v30 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16LL))(v30, v29, v27);
    uint64_t v31 = *(void *)(a2 + 328);
    uint64_t v32 = *(void *)(a2 + 336);
    sub_ACA0((void *)(a2 + 304), v31);
    uint64_t v98 = v15;
    uint64_t v33 = v109;
    double v34 = dispatch thunk of AnyDimension.rawValue(in:)(v109, v31, v32);
    double v35 = *(double *)(a2 + 264);
    *((void *)&v117 + 1) = &type metadata for CGFloat;
    v118 = &protocol witness table for CGFloat;
    *(double *)&__int128 v116 = v34 + v35;
    uint64_t v115 = 0LL;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    (*(void (**)(char *, void, uint64_t))(v111 + 104))( v17,  enum case for VerticalFlowLayout.VerticalPlacement.top(_:),  v15);
    uint64_t v36 = sub_44DC(&qword_F3E90);
    uint64_t v37 = v101;
    uint64_t v38 = swift_allocObject( v36,  ((*(unsigned __int8 *)(v101 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))
          + 2LL * *(void *)(v101 + 72),
            *(unsigned __int8 *)(v101 + 80) | 7LL);
    *(_OWORD *)(v38 + 16) = xmmword_B5050;
    uint64_t v39 = static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5050);
    static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v39);
    uint64_t v112 = v38;
    uint64_t v40 = sub_8A80( (unint64_t *)&qword_F3E98,  (uint64_t (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition,  (uint64_t)&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition);
    uint64_t v41 = sub_44DC(&qword_F3EA0);
    unint64_t v42 = sub_11744();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v112, v41, v42, v12, v40);
    uint64_t v43 = v110;
    uint64_t v44 = v100;
    (*(void (**)(char *, void, uint64_t))(v110 + 104))( v11,  enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:),  v100);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  &v116,  &v113,  v17,  v11,  v14);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v12);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v17, v98);
    sub_11788((uint64_t)&v113);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
  }

  else
  {
    uint64_t v45 = sub_44DC(&qword_F3E88);
    uint64_t v46 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
    uint64_t v86 = *(void *)(v46 + 72);
    uint64_t v47 = *(unsigned __int8 *)(v46 + 80);
    uint64_t v48 = (v47 + 32) & ~v47;
    uint64_t v49 = swift_allocObject(v45, v48 + 3 * v86, v47 | 7);
    *(_OWORD *)(v49 + 16) = xmmword_B5060;
    uint64_t v102 = v49;
    uint64_t v85 = v49 + v48;
    uint64_t v50 = *(void *)(a2 + 224);
    uint64_t v51 = *(void *)(a2 + 232);
    __int128 v52 = sub_ACA0((void *)(a2 + 200), v50);
    uint64_t v120 = v50;
    uint64_t v121 = *(void *)(v51 + 8);
    uint64_t v53 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v50 - 8) + 16LL))(v53, v52, v50);
    *((void *)&v117 + 1) = &type metadata for Double;
    v118 = &protocol witness table for Double;
    *(void *)&__int128 v116 = 0LL;
    uint64_t v115 = 0LL;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    unsigned int v97 = enum case for VerticalFlowLayout.VerticalPlacement.top(_:);
    v99 = *(void (**)(char *))(v111 + 104);
    v99(v17);
    unsigned int v95 = enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:);
    v96 = *(void (**)(char *))(v110 + 104);
    v96(v11);
    uint64_t v94 = sub_44DC(&qword_F3E90);
    uint64_t v54 = v101;
    uint64_t v55 = *(unsigned __int8 *)(v101 + 80);
    uint64_t v93 = ((v55 + 32) & ~v55) + *(void *)(v101 + 72);
    uint64_t v91 = (v55 + 32) & ~v55;
    uint64_t v92 = v55 | 7;
    uint64_t v56 = swift_allocObject(v94, v93, v55 | 7);
    __int128 v90 = xmmword_B5B40;
    *(_OWORD *)(v56 + 16) = xmmword_B5B40;
    static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5B40);
    uint64_t v112 = v56;
    uint64_t v57 = sub_8A80( (unint64_t *)&qword_F3E98,  (uint64_t (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition,  (uint64_t)&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition);
    uint64_t v89 = v57;
    uint64_t v58 = sub_44DC(&qword_F3EA0);
    uint64_t v88 = v58;
    unint64_t v87 = sub_11744();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v112, v58, v87, v12, v57);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  &v116,  &v113,  v17,  v11,  v14);
    uint64_t v101 = *(void *)(v54 + 8);
    ((void (*)(char *, uint64_t))v101)(v14, v12);
    uint64_t v110 = *(void *)(v110 + 8);
    ((void (*)(char *, uint64_t))v110)(v11, v9);
    uint64_t v111 = *(void *)(v111 + 8);
    ((void (*)(char *, uint64_t))v111)(v17, v15);
    sub_11788((uint64_t)&v113);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
    uint64_t v59 = v15;
    uint64_t v60 = v17;
    uint64_t v61 = *(void *)(a2 + 184);
    uint64_t v62 = *(void *)(a2 + 192);
    uint64_t v63 = sub_ACA0((void *)(a2 + 160), v61);
    uint64_t v120 = v61;
    uint64_t v121 = *(void *)(v62 + 8);
    uint64_t v64 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v61 - 8) + 16LL))(v64, v63, v61);
    v118 = 0LL;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    ((void (*)(char *, void, uint64_t))v99)(v60, v97, v15);
    uint64_t v65 = v100;
    ((void (*)(char *, void, uint64_t))v96)(v11, v95, v100);
    uint64_t v66 = swift_allocObject(v94, v93, v92);
    __n128 v67 = (__n128)v90;
    *(_OWORD *)(v66 + 16) = v90;
    static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v67);
    *(void *)&__int128 v113 = v66;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v113, v88, v87, v12, v89);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  a2 + 424,  &v116,  v60,  v11,  v14);
    ((void (*)(char *, uint64_t))v101)(v14, v12);
    uint64_t v68 = v65;
    ((void (*)(char *, uint64_t))v110)(v11, v65);
    ((void (*)(char *, uint64_t))v111)(v60, v59);
    sub_11788((uint64_t)&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
    uint64_t v86 = v85 + 2 * v86;
    uint64_t v69 = *(void *)(a2 + 144);
    uint64_t v70 = *(void *)(a2 + 152);
    v71 = sub_ACA0((void *)(a2 + 120), v69);
    uint64_t v120 = v69;
    uint64_t v121 = *(void *)(v70 + 8);
    uint64_t v72 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v69 - 8) + 16LL))(v72, v71, v69);
    v118 = 0LL;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    ((void (*)(char *, void, uint64_t))v99)(v60, v97, v59);
    ((void (*)(char *, void, uint64_t))v96)(v11, v95, v68);
    uint64_t v73 = swift_allocObject(v94, v93, v92);
    __n128 v74 = (__n128)v90;
    *(_OWORD *)(v73 + 16) = v90;
    static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v74);
    *(void *)&__int128 v113 = v73;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v113, v88, v87, v12, v89);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  a2 + 304,  &v116,  v60,  v11,  v14);
    ((void (*)(char *, uint64_t))v101)(v14, v12);
    ((void (*)(char *, uint64_t))v110)(v11, v68);
    ((void (*)(char *, uint64_t))v111)(v60, v59);
    sub_11788((uint64_t)&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
    uint64_t v33 = v109;
  }

  sub_3317C();
  uint64_t v75 = v106;
  VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, v122);
  uint64_t v76 = *(void *)(a2 + 368);
  uint64_t v77 = *(void *)(a2 + 376);
  sub_ACA0((void *)(a2 + 344), v76);
  uint64_t v78 = v103;
  j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v76, v77);
  double v79 = AnyDimension.value(in:rounded:)(v33, v78, v76, v77);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v78, v105);
  uint64_t v80 = *(void *)(a2 + 104);
  sub_ACA0((void *)(a2 + 80), v80);
  double v81 = dispatch thunk of Measurable.measurements(fitting:in:)(v33, v80);
  double v82 = VerticalFlowLayout.measurements(fitting:in:)(v33, a3 - v79 - v81, a4);
  (*(void (**)(char *, uint64_t, double))(v107 + 8))(v75, v108, v82);
  return a3;
}

void *sub_7AA54(void *a1)
{
  return a1;
}

uint64_t sub_7AA88(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_7AAC4()
{
  return swift_deallocObject(v0, 600LL, 7LL);
}

uint64_t sub_7AB50()
{
  return sub_7918C( *(double *)(v0 + 560),  *(CGFloat *)(v0 + 568),  *(CGFloat *)(v0 + 576),  *(CGFloat *)(v0 + 584),  v0 + 16,  *(void **)(v0 + 592));
}

uint64_t sub_7AB6C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_7AB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_7AB8C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_7AB94()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_7ABB8(uint64_t a1)
{
  return sub_78D14(a1, *(void **)(v1 + 16));
}

id sub_7ABC8@<X0>(uint64_t a1@<X8>)
{
  return objc_msgSend(v2, *(SEL *)(v3 + 8), *(void *)(v1 + a1));
}

uint64_t sub_7ABD8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)( 0x7261646E6F636573LL,  0xE900000000000079LL,  0x7972616D697270LL,  0xE700000000000000LL,  0LL);
}

uint64_t sub_7AC0C(double a1)
{
  return ArtworkImageView.init(artworkSize:frame:)(a1, 136.0, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_7AC2C(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_7AC34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v5, va);
}

double sub_7AC44@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1 + a1;
  double result = 0.0;
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_BYTE *)(v2 + 32) = 1;
  return result;
}

void sub_7AC5C(id a1)
{
}

uint64_t sub_7AC68@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  return swift_beginAccess(v2 + a1, va, 0LL, 0LL);
}

uint64_t sub_7AC80()
{
  return swift_bridgeObjectRelease(0xE900000000000079LL);
}

void *sub_7AC8C@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  a13 = a1;
  return sub_AE98(&a9);
}

id sub_7AC98()
{
  return [v0 *(SEL *)(v1 + 4040)];
}

id sub_7ACA4(void *a1)
{
  return [a1 *(SEL *)(v1 + 176)];
}

uint64_t sub_7ACAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  return DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v7, va);
}

void *sub_7ACBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  return sub_AE98((uint64_t *)va);
}

uint64_t sub_7ACC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 a10)
{
  return sub_7CF4(&a10, a2);
}

uint64_t sub_7ACCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, void, uint64_t), uint64_t a12, int a13, unsigned int a14)
{
  return a11(a1, a14, a12);
}

uint64_t sub_7ACD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v3, a3);
}

uint64_t sub_7ACE4()
{
  return type metadata accessor for FontUseCase(0LL);
}

double sub_7ACF0()
{
  return 20.0;
}

uint64_t OfferPlatterComponentLayout.init(metrics:artworkView:buttonView:blurView:infoView:subtitleView:titleView:style:)@<X0>( void *__src@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, __int128 *a5@<X4>, __int128 *a6@<X5>, __int128 *a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, uint64_t a10)
{
  uint64_t result = sub_7CF4(a7, (uint64_t)(a9 + 25));
  a9[30] = a8;
  a9[31] = a10;
  return result;
}

uint64_t OfferPlatterComponentLayout.placeChildren(relativeTo:in:)( void *a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v6 = v5;
  uint64_t v12 = v5[13];
  uint64_t v13 = v5 + 10;
  sub_ACA0(v5 + 10, v12);
  dispatch thunk of Measurable.measurements(fitting:in:)(a1, v12);
  sub_7CDF8();
  id v14 = [a1 traitCollection];
  id v15 = [v14 layoutDirection];

  double v89 = sub_7CD98(v6 + 38);
  sub_7CD98(v6 + 43);
  double v90 = sub_7CD98(v6 + 53);
  uint64_t v16 = v6[30];
  uint64_t v17 = v6[31];
  BOOL v18 = v16 == 0x7972616D697270LL && v17 == 0xE700000000000000LL;
  unint64_t v87 = v13;
  if (v18
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, 0x7972616D697270LL, 0xE700000000000000LL, 0LL) & 1) != 0)
  {
    sub_7CDF8();
    double v19 = sub_7CE00();
    if (v15) {
      CGRectGetMaxX(*(CGRect *)&v19);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v19);
    }
    uint64_t v23 = v6[3];
    sub_ACA0(v6, v23);
    sub_7CE14();
    sub_7CDF8();
    dispatch thunk of LayoutView.frame.setter(v23);
    sub_7CD98(v6 + 58);
    sub_7CD98(v6 + 63);
    sub_7CDDC(a2);
    uint64_t v24 = v6[3];
    uint64_t v25 = v6[4];
    sub_ACA0(v6, v24);
    v91.origin.x = dispatch thunk of LayoutView.frame.getter(v24, v25);
    CGRectGetWidth(v91);
    v92.origin.x = a2;
    v92.origin.y = a3;
    v92.size.CGFloat width = a4;
    v92.size.CGFloat height = a5;
    CGRectGetHeight(v92);
    uint64_t v26 = v6[28];
    sub_7CEF8();
    dispatch thunk of Measurable.measurements(fitting:in:)(a1, v26);
    sub_7CDF8();
    uint64_t v27 = v6[3];
    uint64_t v28 = v6[4];
    sub_ACA0(v6, v27);
    double v29 = dispatch thunk of LayoutView.frame.getter(v27, v28);
    if (v15) {
      CGRectGetMinX(*(CGRect *)&v29);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v29);
    }
    uint64_t v33 = v6[28];
    sub_7CEF8();
    uint64_t v35 = v6[3];
    uint64_t v34 = v6[4];
    sub_ACA0(v6, v35);
    v93.origin.x = dispatch thunk of LayoutView.frame.getter(v35, v34);
    CGRectGetMinY(v93);
    sub_7CE80();
    sub_7CE9C();
    dispatch thunk of LayoutView.frame.setter(v33);
    v94.origin.x = sub_7CD78(v6 + 25);
    CGRectGetHeight(v94);
    sub_7CDBC(v6 + 20);
    sub_7CDEC();
    sub_7CDF8();
    double v36 = sub_7CD78(v6 + 25);
    if (v15) {
      CGRectGetMaxX(*(CGRect *)&v36);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v36);
    }
    sub_7CEB4();
    uint64_t v40 = v6[28];
    sub_7CEC4(v6 + 25, v40);
    v95.origin.x = dispatch thunk of LayoutView.frame.getter(v40, v41);
    CGRectGetMaxY(v95);
    sub_7CE8C();
    sub_7CEE4();
    sub_7CE44();
    sub_7CDDC(a2);
    sub_7CE28();
    uint64_t v42 = v6[3];
    uint64_t v43 = v6[4];
    sub_ACA0(v6, v42);
    v96.origin.x = dispatch thunk of LayoutView.frame.getter(v42, v43);
    CGRectGetHeight(v96);
    sub_7CDBC(v6 + 15);
    sub_7CDEC();
    sub_7CDF8();
    double v44 = sub_7CE58();
    if (v15) {
      CGRectGetMaxX(*(CGRect *)&v44);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v44);
    }
    sub_ACA0(v6 + 15, v6[18]);
    uint64_t v48 = v6[3];
    uint64_t v49 = v6[4];
    sub_ACA0(v6, v48);
    v97.origin.x = dispatch thunk of LayoutView.frame.getter(v48, v49);
    CGRectGetMaxY(v97);
    sub_7CE80();
    sub_7CE44();
    v98.origin.x = sub_7CE58();
    double Height = CGRectGetHeight(v98);
    double v51 = sub_7CD78(v6 + 15);
    uint64_t v55 = v87;
  }

  else
  {
    uint64_t v56 = v6[3];
    sub_7CEDC(v6);
    dispatch thunk of LayoutView.frame.setter(v56);
    sub_7CDDC(a2);
    sub_7CE28();
    sub_7CDBC(v6 + 25);
    sub_7CDEC();
    sub_7CDF8();
    double v57 = sub_7CE00();
    if (v15) {
      CGRectGetMaxX(*(CGRect *)&v57);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v57);
    }
    sub_ACA0(v6 + 25, v6[28]);
    sub_7CE14();
    sub_7CE80();
    sub_7CE9C();
    sub_7CE44();
    v99.origin.x = sub_7CD78(v6 + 25);
    CGRectGetHeight(v99);
    sub_7CDBC(v6 + 20);
    sub_7CDEC();
    sub_7CDF8();
    double v61 = sub_7CD78(v6 + 25);
    if (v15) {
      CGRectGetMaxX(*(CGRect *)&v61);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v61);
    }
    sub_7CEB4();
    uint64_t v65 = v6[28];
    sub_7CEC4(v6 + 25, v65);
    v100.origin.x = dispatch thunk of LayoutView.frame.getter(v65, v66);
    CGRectGetMaxY(v100);
    CGFloat.rawValue(in:)(a1);
    sub_7CEE4();
    sub_7CE44();
    v101.origin.x = sub_7CD78(v6 + 20);
    CGRectGetHeight(v101);
    sub_7CDBC(v6 + 15);
    sub_7CDEC();
    sub_7CDF8();
    double v67 = sub_7CD78(v6 + 20);
    id v88 = v15;
    if (v15)
    {
      v71 = v6 + 25;
      CGRectGetMaxX(*(CGRect *)&v67);
    }

    else
    {
      v71 = v6 + 25;
      CGRectGetMinX(*(CGRect *)&v67);
    }

    sub_7CEDC(v6 + 15);
    uint64_t v72 = v6[23];
    sub_7CEC4(v6 + 20, v72);
    v102.origin.x = dispatch thunk of LayoutView.frame.getter(v72, v73);
    CGRectGetMaxY(v102);
    sub_7CE8C();
    sub_7CE44();
    v103.origin.x = sub_7CD78(v71);
    double v74 = v90 + CGRectGetHeight(v103);
    v104.origin.x = sub_7CD78(v6 + 20);
    double Height = v74 + CGRectGetHeight(v104);
    double v51 = sub_7CD78(v6 + 15);
    uint64_t v55 = v87;
    id v15 = v88;
  }

  double v75 = CGRectGetHeight(*(CGRect *)&v51);
  double v76 = sub_7CE00();
  if (v15) {
    CGRectGetMinX(*(CGRect *)&v76);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v76);
  }
  double v80 = v89 + Height + v75;
  sub_7CEDC(v55);
  uint64_t v81 = v6[28];
  sub_7CEC4(v6 + 25, v81);
  v105.origin.x = dispatch thunk of LayoutView.frame.getter(v81, v82);
  CGRectGetMaxY(v105);
  CGFloat.rawValue(in:)(a1);
  sub_7CE44();
  v106.origin.x = sub_7CE00();
  double MinX = CGRectGetMinX(v106);
  double v84 = sub_7CE14();
  double v85 = sub_7CDDC(a2);
  return LayoutRect.init(x:y:width:height:firstBaseline:lastBaseline:)(MinX, v84, v85, v80, 0.0, 0.0);
}

uint64_t OfferPlatterComponentLayout.Metrics.init(artworkSize:contentInsets:infoTopSpace:infoTrailingSpace:secondaryMinimumHeight:subtitleTopSpace:titleTopSpace:titleLeadingSpace:)@<X0>( __int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, __int128 *a5@<X4>, __int128 *a6@<X5>, double *a7@<X8>, double a8@<D0>, double a9@<D1>, double a10@<D2>, double a11@<D3>, double a12@<D4>, double a13@<D5>)
{
  *a7 = a8;
  a7[1] = a9;
  a7[2] = a10;
  a7[3] = a11;
  a7[4] = a12;
  a7[5] = a13;
  sub_7CF4(a1, (uint64_t)(a7 + 6));
  sub_7CF4(a2, (uint64_t)(a7 + 11));
  sub_7CF4(a3, (uint64_t)(a7 + 16));
  sub_7CF4(a4, (uint64_t)(a7 + 21));
  sub_7CF4(a5, (uint64_t)(a7 + 31));
  return sub_7CF4(a6, (uint64_t)(a7 + 26));
}

double OfferPlatterComponentLayout.Metrics.contentInsets.getter()
{
  return *(double *)(v0 + 16);
}

void OfferPlatterComponentLayout.Metrics.contentInsets.setter(double a1, double a2, double a3, double a4)
{
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
}

uint64_t OfferPlatterComponentLayout.Metrics.infoTopSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 48, a1);
}

uint64_t OfferPlatterComponentLayout.Metrics.infoTopSpace.setter()
{
  uint64_t v0 = (__int128 *)sub_15460();
  return sub_1543C(v0, v1);
}

uint64_t OfferPlatterComponentLayout.Metrics.infoTrailingSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 88, a1);
}

uint64_t OfferPlatterComponentLayout.Metrics.infoTrailingSpace.setter()
{
  uint64_t v0 = (__int128 *)sub_15460();
  return sub_1543C(v0, v1);
}

uint64_t OfferPlatterComponentLayout.Metrics.secondaryMinimumHeight.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 128, a1);
}

uint64_t OfferPlatterComponentLayout.Metrics.secondaryMinimumHeight.setter()
{
  uint64_t v0 = (__int128 *)sub_15460();
  return sub_1543C(v0, v1);
}

uint64_t OfferPlatterComponentLayout.Metrics.subtitleTopSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 168, a1);
}

uint64_t OfferPlatterComponentLayout.Metrics.subtitleTopSpace.setter()
{
  uint64_t v0 = (__int128 *)sub_15460();
  return sub_1543C(v0, v1);
}

uint64_t OfferPlatterComponentLayout.Metrics.titleLeadingSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 208, a1);
}

uint64_t OfferPlatterComponentLayout.Metrics.titleLeadingSpace.setter()
{
  uint64_t v0 = (__int128 *)sub_15460();
  return sub_1543C(v0, v1);
}

double (*OfferPlatterComponentLayout.Metrics.titleLeadingSpace.modify())(double, double)
{
  return NSDirectionalEdgeInsets.edgeInsets.getter;
}

uint64_t OfferPlatterComponentLayout.Metrics.titleTopSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 248, a1);
}

uint64_t OfferPlatterComponentLayout.Metrics.titleTopSpace.setter()
{
  uint64_t v0 = (__int128 *)sub_15460();
  return sub_1543C(v0, v1);
}

double (*OfferPlatterComponentLayout.Metrics.titleTopSpace.modify())(double, double)
{
  return NSDirectionalEdgeInsets.edgeInsets.getter;
}

_OWORD *OfferPlatterComponentLayout.metrics.getter@<X0>(_OWORD *a1@<X8>)
{
  return sub_7B83C((_OWORD *)(v1 + 256), a1);
}

double static OfferPlatterComponentLayout.estimatedMeasurements(fitting:using:in:)()
{
  return 1280.0;
}

double OfferPlatterComponentLayout.measurements(fitting:in:)(uint64_t a1)
{
  uint64_t v1 = sub_156B4();
  return sub_7CE4C(v1, v2, v3, v4);
}

_OWORD *sub_7B83C(_OWORD *a1, _OWORD *a2)
{
  return a2;
}

double sub_7B870(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v109 = a1;
  uint64_t v105 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  CGRect v103 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v108 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v107 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  CGRect v106 = (char *)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v110 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v101 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v111 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v122 = _swiftEmptyArrayStorage;
  uint64_t v18 = *(void *)(a2 + 240);
  uint64_t v19 = *(void *)(a2 + 248);
  BOOL v20 = v18 == 0x7972616D697270LL && v19 == 0xE700000000000000LL;
  uint64_t v100 = v9;
  if (v20
    || (_stringCompareWithSmolCheck(_:_:expecting:)(v18, v19, 0x7972616D697270LL, 0xE700000000000000LL, 0LL) & 1) != 0)
  {
    uint64_t v21 = sub_44DC(&qword_F3E88);
    uint64_t v22 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
    uint64_t v23 = *(void *)(v22 + 72);
    uint64_t v24 = *(unsigned __int8 *)(v22 + 80);
    uint64_t v25 = (v24 + 32) & ~v24;
    uint64_t v26 = swift_allocObject(v21, v25 + v23, v24 | 7);
    *(_OWORD *)(v26 + 16) = xmmword_B5B40;
    uint64_t v102 = v26;
    CGRect v99 = (void (*)(char *))(v26 + v25);
    uint64_t v27 = *(void *)(a2 + 144);
    uint64_t v28 = *(void *)(a2 + 152);
    double v29 = sub_ACA0((void *)(a2 + 120), v27);
    uint64_t v120 = v27;
    uint64_t v121 = *(void *)(v28 + 8);
    __int128 v30 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v27 - 8) + 16LL))(v30, v29, v27);
    uint64_t v31 = *(void *)(a2 + 328);
    uint64_t v32 = *(void *)(a2 + 336);
    sub_ACA0((void *)(a2 + 304), v31);
    uint64_t v98 = v15;
    uint64_t v33 = v109;
    double v34 = dispatch thunk of AnyDimension.rawValue(in:)(v109, v31, v32);
    double v35 = *(double *)(a2 + 264);
    *((void *)&v117 + 1) = &type metadata for CGFloat;
    v118 = &protocol witness table for CGFloat;
    *(double *)&__int128 v116 = v34 + v35;
    uint64_t v115 = 0LL;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    (*(void (**)(char *, void, uint64_t))(v111 + 104))( v17,  enum case for VerticalFlowLayout.VerticalPlacement.top(_:),  v15);
    uint64_t v36 = sub_44DC(&qword_F3E90);
    uint64_t v37 = v101;
    uint64_t v38 = swift_allocObject( v36,  ((*(unsigned __int8 *)(v101 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v101 + 80))
          + 2LL * *(void *)(v101 + 72),
            *(unsigned __int8 *)(v101 + 80) | 7LL);
    *(_OWORD *)(v38 + 16) = xmmword_B5050;
    uint64_t v39 = static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5050);
    static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v39);
    uint64_t v112 = v38;
    unint64_t v40 = sub_13958();
    uint64_t v41 = sub_44DC(&qword_F3EA0);
    unint64_t v42 = sub_11744();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v112, v41, v42, v12, v40);
    uint64_t v43 = v110;
    uint64_t v44 = v100;
    (*(void (**)(char *, void, uint64_t))(v110 + 104))( v11,  enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:),  v100);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  &v116,  &v113,  v17,  v11,  v14);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v11, v44);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v14, v12);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v17, v98);
    sub_11788((uint64_t)&v113);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
  }

  else
  {
    uint64_t v45 = sub_44DC(&qword_F3E88);
    uint64_t v46 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
    uint64_t v86 = *(void *)(v46 + 72);
    uint64_t v47 = *(unsigned __int8 *)(v46 + 80);
    uint64_t v48 = (v47 + 32) & ~v47;
    uint64_t v49 = swift_allocObject(v45, v48 + 3 * v86, v47 | 7);
    *(_OWORD *)(v49 + 16) = xmmword_B5060;
    uint64_t v102 = v49;
    uint64_t v85 = v49 + v48;
    uint64_t v50 = *(void *)(a2 + 224);
    uint64_t v51 = *(void *)(a2 + 232);
    __int128 v52 = sub_ACA0((void *)(a2 + 200), v50);
    uint64_t v120 = v50;
    uint64_t v121 = *(void *)(v51 + 8);
    uint64_t v53 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v50 - 8) + 16LL))(v53, v52, v50);
    *((void *)&v117 + 1) = &type metadata for Double;
    v118 = &protocol witness table for Double;
    *(void *)&__int128 v116 = 0LL;
    uint64_t v115 = 0LL;
    __int128 v113 = 0u;
    __int128 v114 = 0u;
    unsigned int v97 = enum case for VerticalFlowLayout.VerticalPlacement.top(_:);
    CGRect v99 = *(void (**)(char *))(v111 + 104);
    v99(v17);
    unsigned int v95 = enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:);
    CGRect v96 = *(void (**)(char *))(v110 + 104);
    v96(v11);
    uint64_t v94 = sub_44DC(&qword_F3E90);
    uint64_t v54 = v101;
    uint64_t v55 = *(unsigned __int8 *)(v101 + 80);
    uint64_t v93 = ((v55 + 32) & ~v55) + *(void *)(v101 + 72);
    uint64_t v91 = (v55 + 32) & ~v55;
    uint64_t v92 = v55 | 7;
    uint64_t v56 = swift_allocObject(v94, v93, v55 | 7);
    __int128 v90 = xmmword_B5B40;
    *(_OWORD *)(v56 + 16) = xmmword_B5B40;
    static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5B40);
    uint64_t v112 = v56;
    unint64_t v57 = sub_13958();
    unint64_t v89 = v57;
    uint64_t v58 = sub_44DC(&qword_F3EA0);
    uint64_t v88 = v58;
    unint64_t v87 = sub_11744();
    dispatch thunk of SetAlgebra.init<A>(_:)(&v112, v58, v87, v12, v57);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  &v116,  &v113,  v17,  v11,  v14);
    uint64_t v101 = *(void *)(v54 + 8);
    ((void (*)(char *, uint64_t))v101)(v14, v12);
    uint64_t v110 = *(void *)(v110 + 8);
    ((void (*)(char *, uint64_t))v110)(v11, v9);
    uint64_t v111 = *(void *)(v111 + 8);
    ((void (*)(char *, uint64_t))v111)(v17, v15);
    sub_11788((uint64_t)&v113);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
    uint64_t v59 = v15;
    uint64_t v60 = v17;
    uint64_t v61 = *(void *)(a2 + 184);
    uint64_t v62 = *(void *)(a2 + 192);
    uint64_t v63 = sub_ACA0((void *)(a2 + 160), v61);
    uint64_t v120 = v61;
    uint64_t v121 = *(void *)(v62 + 8);
    uint64_t v64 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v61 - 8) + 16LL))(v64, v63, v61);
    v118 = 0LL;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    ((void (*)(char *, void, uint64_t))v99)(v60, v97, v15);
    uint64_t v65 = v100;
    ((void (*)(char *, void, uint64_t))v96)(v11, v95, v100);
    uint64_t v66 = swift_allocObject(v94, v93, v92);
    __n128 v67 = (__n128)v90;
    *(_OWORD *)(v66 + 16) = v90;
    static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v67);
    *(void *)&__int128 v113 = v66;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v113, v88, v87, v12, v89);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  a2 + 424,  &v116,  v60,  v11,  v14);
    ((void (*)(char *, uint64_t))v101)(v14, v12);
    uint64_t v68 = v65;
    ((void (*)(char *, uint64_t))v110)(v11, v65);
    ((void (*)(char *, uint64_t))v111)(v60, v59);
    sub_11788((uint64_t)&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
    uint64_t v86 = v85 + 2 * v86;
    uint64_t v69 = *(void *)(a2 + 144);
    uint64_t v70 = *(void *)(a2 + 152);
    v71 = sub_ACA0((void *)(a2 + 120), v69);
    uint64_t v120 = v69;
    uint64_t v121 = *(void *)(v70 + 8);
    uint64_t v72 = sub_AE98(&v119);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v69 - 8) + 16LL))(v72, v71, v69);
    v118 = 0LL;
    __int128 v116 = 0u;
    __int128 v117 = 0u;
    ((void (*)(char *, void, uint64_t))v99)(v60, v97, v59);
    ((void (*)(char *, void, uint64_t))v96)(v11, v95, v68);
    uint64_t v73 = swift_allocObject(v94, v93, v92);
    __n128 v74 = (__n128)v90;
    *(_OWORD *)(v73 + 16) = v90;
    static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v74);
    *(void *)&__int128 v113 = v73;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v113, v88, v87, v12, v89);
    static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v119,  a2 + 304,  &v116,  v60,  v11,  v14);
    ((void (*)(char *, uint64_t))v101)(v14, v12);
    ((void (*)(char *, uint64_t))v110)(v11, v68);
    ((void (*)(char *, uint64_t))v111)(v60, v59);
    sub_11788((uint64_t)&v116);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v119);
    uint64_t v33 = v109;
  }

  sub_3317C();
  double v75 = v106;
  VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, v122);
  uint64_t v76 = *(void *)(a2 + 368);
  uint64_t v77 = *(void *)(a2 + 376);
  sub_ACA0((void *)(a2 + 344), v76);
  uint64_t v78 = v103;
  j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v76, v77);
  double v79 = AnyDimension.value(in:rounded:)(v33, v78, v76, v77);
  (*(void (**)(char *, uint64_t))(v104 + 8))(v78, v105);
  uint64_t v80 = *(void *)(a2 + 104);
  sub_ACA0((void *)(a2 + 80), v80);
  double v81 = dispatch thunk of Measurable.measurements(fitting:in:)(v33, v80);
  double v82 = VerticalFlowLayout.measurements(fitting:in:)(v33, a3 - v79 - v81, a4);
  (*(void (**)(char *, uint64_t, double))(v107 + 8))(v75, v108, v82);
  return a3;
}

unint64_t sub_7C37C()
{
  unint64_t result = qword_F6F88;
  if (!qword_F6F88)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for OfferPlatterComponentLayout,  &type metadata for OfferPlatterComponentLayout);
    atomic_store(result, (unint64_t *)&qword_F6F88);
  }

  return result;
}

uint64_t destroy for OfferPlatterComponentLayout(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 63);
}

uint64_t initializeWithCopy for OfferPlatterComponentLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  __int128 v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  __int128 v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  __int128 v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  __int128 v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 248);
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  *(void *)(a1 + 248) = v10;
  __int128 v11 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v11;
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  uint64_t v13 = *(void *)(a2 + 328);
  uint64_t v12 = *(void *)(a2 + 336);
  *(void *)(a1 + 328) = v13;
  *(void *)(a1 + 336) = v12;
  id v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
  swift_bridgeObjectRetain(v10);
  v14(a1 + 304, a2 + 304, v13);
  __int128 v15 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 368) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 344, a2 + 344);
  uint64_t v16 = *(void *)(a2 + 408);
  uint64_t v17 = *(void *)(a2 + 416);
  *(void *)(a1 + 408) = v16;
  *(void *)(a1 + 416) = v17;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 384, a2 + 384);
  __int128 v18 = *(_OWORD *)(a2 + 448);
  *(_OWORD *)(a1 + 448) = v18;
  (**(void (***)(uint64_t, uint64_t))(v18 - 8))(a1 + 424, a2 + 424);
  uint64_t v19 = *(void *)(a2 + 488);
  uint64_t v20 = *(void *)(a2 + 496);
  *(void *)(a1 + 488) = v19;
  *(void *)(a1 + 496) = v20;
  (**(void (***)(uint64_t, uint64_t))(v19 - 8))(a1 + 464, a2 + 464);
  __int128 v21 = *(_OWORD *)(a2 + 528);
  *(_OWORD *)(a1 + 528) = v21;
  (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 504, a2 + 504);
  return a1;
}

void *assignWithCopy for OfferPlatterComponentLayout(void *a1, void *a2)
{
  a1[30] = a2[30];
  uint64_t v4 = a2[31];
  a1[31] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease();
  a1[32] = a2[32];
  a1[33] = a2[33];
  a1[34] = a2[34];
  a1[35] = a2[35];
  a1[36] = a2[36];
  a1[37] = a2[37];
  sub_4290(a1 + 38, a2 + 38);
  sub_4290(a1 + 43, a2 + 43);
  sub_4290(a1 + 48, a2 + 48);
  sub_4290(a1 + 53, a2 + 53);
  sub_4290(a1 + 58, a2 + 58);
  sub_4290(a1 + 63, a2 + 63);
  return a1;
}

void *initializeWithTake for OfferPlatterComponentLayout(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x220uLL);
}

uint64_t assignWithTake for OfferPlatterComponentLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 80));
  __int128 v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 120));
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 160));
  __int128 v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 200));
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  swift_bridgeObjectRelease();
  __int128 v7 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v7;
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 304));
  __int128 v8 = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 304) = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 320) = v8;
  *(void *)(a1 + 336) = *(void *)(a2 + 336);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 344));
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = *(_OWORD *)(a2 + 360);
  *(void *)(a1 + 376) = *(void *)(a2 + 376);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 384));
  __int128 v9 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v9;
  *(void *)(a1 + 416) = *(void *)(a2 + 416);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 424));
  *(_OWORD *)(a1 + 424) = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(a1 + 440) = *(_OWORD *)(a2 + 440);
  *(void *)(a1 + 456) = *(void *)(a2 + 456);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 464));
  __int128 v10 = *(_OWORD *)(a2 + 480);
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a2 + 464);
  *(_OWORD *)(a1 + 480) = v10;
  *(void *)(a1 + 496) = *(void *)(a2 + 496);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 504));
  *(_OWORD *)(a1 + 504) = *(_OWORD *)(a2 + 504);
  *(_OWORD *)(a1 + 520) = *(_OWORD *)(a2 + 520);
  *(void *)(a1 + 536) = *(void *)(a2 + 536);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferPlatterComponentLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 544))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferPlatterComponentLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 536) = 0LL;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 544) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 544) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OfferPlatterComponentLayout()
{
  return &type metadata for OfferPlatterComponentLayout;
}

uint64_t destroy for OfferPlatterComponentLayout.Metrics(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 31);
}

_OWORD *initializeWithCopy for OfferPlatterComponentLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  __int128 v5 = *(_OWORD *)((char *)a2 + 72);
  *(_OWORD *)((char *)a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)(a1 + 3), (uint64_t)(a2 + 3));
  __int128 v6 = a2[7];
  a1[7] = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)a1 + 88, (uint64_t)a2 + 88);
  __int128 v7 = *(_OWORD *)((char *)a2 + 152);
  *(_OWORD *)((char *)a1 + 152) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)(a1 + 8), (uint64_t)(a2 + 8));
  __int128 v8 = a2[12];
  a1[12] = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)a1 + 168, (uint64_t)a2 + 168);
  __int128 v9 = *(_OWORD *)((char *)a2 + 232);
  *(_OWORD *)((char *)a1 + 232) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)(a1 + 13), (uint64_t)(a2 + 13));
  __int128 v10 = a2[17];
  a1[17] = v10;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))((uint64_t)a1 + 248, (uint64_t)a2 + 248);
  return a1;
}

void *assignWithCopy for OfferPlatterComponentLayout.Metrics(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  sub_4290(a1 + 6, a2 + 6);
  sub_4290(a1 + 11, a2 + 11);
  sub_4290(a1 + 16, a2 + 16);
  sub_4290(a1 + 21, a2 + 21);
  sub_4290(a1 + 26, a2 + 26);
  sub_4290(a1 + 31, a2 + 31);
  return a1;
}

uint64_t assignWithTake for OfferPlatterComponentLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 48));
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 88));
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 128));
  __int128 v6 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v6;
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 168));
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 208));
  __int128 v7 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v7;
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 248));
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(void *)(a1 + 280) = *(void *)(a2 + 280);
  return a1;
}

uint64_t getEnumTagSinglePayload for OfferPlatterComponentLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 288))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 72);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfferPlatterComponentLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 280) = 0LL;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 288) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 72) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 288) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for OfferPlatterComponentLayout.Metrics()
{
  return &type metadata for OfferPlatterComponentLayout.Metrics;
}

double sub_7CD78(void *a1)
{
  return dispatch thunk of LayoutView.frame.getter(v1, *(void *)(v2 + 8));
}

double sub_7CD98(void *a1)
{
  return dispatch thunk of AnyDimension.rawValue(in:)(v1, v2, v3);
}

void *sub_7CDBC(void *a1)
{
  return sub_ACA0(a1, v1);
}

double sub_7CDDC(double a1)
{
  uint64_t v4 = v3;
  uint64_t v5 = v2;
  uint64_t v6 = v1;
  return CGRectGetWidth(*(CGRect *)&a1);
}

uint64_t sub_7CDEC()
{
  return dispatch thunk of Measurable.measurements(fitting:in:)(v1, v0);
}

uint64_t sub_7CDF8()
{
  return CGFloat.rawValue(in:)(v0);
}

double sub_7CE00()
{
  return v0;
}

double sub_7CE14()
{
  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.CGFloat width = v1;
  v5.size.CGFloat height = v0;
  return CGRectGetMinY(v5);
}

double sub_7CE28()
{
  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.CGFloat width = v1;
  v5.size.CGFloat height = v0;
  return CGRectGetHeight(v5);
}

uint64_t sub_7CE44()
{
  return dispatch thunk of LayoutView.frame.setter(v0);
}

double sub_7CE4C(uint64_t a1, uint64_t a2, double a3, double a4)
{
  return sub_7B870(a1, a2, a3, a4);
}

double sub_7CE58()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  sub_ACA0(v0, v1);
  return dispatch thunk of LayoutView.frame.getter(v1, v2);
}

uint64_t sub_7CE80()
{
  return CGFloat.rawValue(in:)(v0);
}

uint64_t sub_7CE8C()
{
  return CGFloat.rawValue(in:)(v0);
}

double sub_7CE9C()
{
  return v0;
}

void *sub_7CEB4()
{
  return sub_ACA0(v1, *(void *)(v0 + 184));
}

void *sub_7CEC4(void *a1, uint64_t a2)
{
  return sub_ACA0(a1, a2);
}

void *sub_7CEDC(void *a1)
{
  return sub_ACA0(a1, v1);
}

double sub_7CEE4()
{
  return v0;
}

void *sub_7CEF8()
{
  return sub_ACA0(v0, v1);
}

double sub_7CF04()
{
  unsigned int v1 = [v0 isFocused];
  double result = 20.0;
  if (v1) {
    return 0.0;
  }
  return result;
}

double sub_7CF3C()
{
  unsigned int v1 = [v0 isFocused];
  double result = 32.0;
  if (v1) {
    return 52.0;
  }
  return result;
}

unint64_t sub_7CF80(unint64_t result)
{
  if (result >= 3) {
    return 3LL;
  }
  return result;
}

uint64_t sub_7CF90(uint64_t result)
{
  return result;
}

void sub_7CF98()
{
}

void sub_7CFA0(uint64_t a1)
{
}

unint64_t sub_7CFA8@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_7CF80(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_7CFD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_7CF90(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_7CFF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_460B4(v2 + *(int *)(a1 + 36), a2);
}

uint64_t sub_7D008@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = type metadata accessor for ActionMetrics(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

uint64_t sub_7D048@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = type metadata accessor for ActionFactory(0LL);
  swift_allocObject(v7, 16LL, 7LL);
  __int128 v8 = (int *)type metadata accessor for PromptLocationAction(0LL);
  sub_7DC84();
  sub_5D6C();
  if (v2)
  {
    uint64_t v9 = sub_8440();
    sub_851C(v9);
    sub_8770();
    uint64_t v10 = sub_8484();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(a1, v10);
  }

  else
  {
    uint64_t v12 = *(void (**)(void))(v6 + 32);
    uint64_t v25 = a2 + v8[7];
    v12();
    sub_7DC84();
    sub_6F428(v13, v14, v15);
    if (v16 >= 3) {
      char v17 = 1;
    }
    else {
      char v17 = v16;
    }
    *(_BYTE *)a2 = v17;
    sub_7DC84();
    *(void *)(a2 + 8) = sub_6F270();
    *(void *)(a2 + 16) = v18;
    sub_7DC84();
    uint64_t v19 = sub_6F368();
    *(_BYTE *)(a2 + 24) = v19 & 1;
    __chkstk_darwin(v19);
    sub_2C130();
    sub_7DC68();
    uint64_t v20 = sub_53EE0((uint64_t)&v24, a2 + v8[8]);
    __chkstk_darwin(v20);
    sub_2C130();
    sub_7DC68();
    uint64_t v21 = sub_8440();
    sub_851C(v21);
    sub_8770();
    uint64_t v22 = sub_8484();
    sub_85AC(v22);
    return sub_53EE0((uint64_t)&v23, a2 + v8[9]);
  }

uint64_t sub_7D364@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_7D048(a1, a2);
}

uint64_t type metadata accessor for PromptLocationAction(uint64_t a1)
{
  uint64_t result = qword_F6FE8;
  if (!qword_F6FE8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PromptLocationAction);
  }
  return result;
}

void *sub_7D3B0(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v18);
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 8) = a2[1];
    *(void *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    uint64_t v8 = a3[7];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for ActionMetrics(0LL);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
    swift_bridgeObjectRetain(v7);
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 24);
    if (v16)
    {
      uint64_t v17 = *(void *)(v15 + 32);
      *((void *)v14 + 3) = v16;
      *((void *)v14 + 4) = v17;
      (**(void (***)(void))(v16 - 8))();
    }

    else
    {
      __int128 v19 = *(_OWORD *)(v15 + 16);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      *((_OWORD *)v14 + 1) = v19;
      *((void *)v14 + 4) = *(void *)(v15 + 32);
    }

    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (uint64_t)a2 + v20;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 24);
    if (v23)
    {
      uint64_t v24 = *(void *)(v22 + 32);
      *((void *)v21 + 3) = v23;
      *((void *)v21 + 4) = v24;
      (**(void (***)(void))(v23 - 8))();
    }

    else
    {
      __int128 v25 = *(_OWORD *)(v22 + 16);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v25;
      *((void *)v21 + 4) = *(void *)(v22 + 32);
    }
  }

  return v4;
}

void *sub_7D4E4(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = (void *)(a1 + a2[8]);
  if (v6[3]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v6);
  }
  uint64_t result = (void *)(a1 + a2[9]);
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t sub_7D56C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12 + 24);
  if (v15)
  {
    uint64_t v16 = *(void *)(v14 + 32);
    *(void *)(v13 + 24) = v15;
    *(void *)(v13 + 32) = v16;
    (**(void (***)(void))(v15 - 8))();
  }

  else
  {
    __int128 v17 = *(_OWORD *)(v14 + 16);
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    *(_OWORD *)(v13 + 16) = v17;
    *(void *)(v13 + 32) = *(void *)(v14 + 32);
  }

  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)(a2 + v18 + 24);
  if (v21)
  {
    uint64_t v22 = *(void *)(v20 + 32);
    *(void *)(v19 + 24) = v21;
    *(void *)(v19 + 32) = v22;
    (**(void (***)(void))(v21 - 8))();
  }

  else
  {
    __int128 v23 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v23;
    *(void *)(v19 + 32) = *(void *)(v20 + 32);
  }

  return a1;
}

uint64_t sub_7D674(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (__int128 *)(a2 + v11);
  uint64_t v14 = *(void *)(a2 + v11 + 24);
  if (*(void *)(a1 + v11 + 24))
  {
    if (v14)
    {
      sub_4290((void *)v12, v13);
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v12);
  }

  else if (v14)
  {
    *(void *)(v12 + 24) = v14;
    *(void *)(v12 + 32) = *((void *)v13 + 4);
    (**(void (***)(uint64_t, __int128 *))(v14 - 8))(v12, v13);
    goto LABEL_8;
  }

  __int128 v15 = *v13;
  __int128 v16 = v13[1];
  *(void *)(v12 + 32) = *((void *)v13 + 4);
  *(_OWORD *)uint64_t v12 = v15;
  *(_OWORD *)(v12 + 16) = v16;
LABEL_8:
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (__int128 *)(a2 + v17);
  uint64_t v20 = *((void *)v19 + 3);
  if (!*(void *)(a1 + v17 + 24))
  {
    if (v20)
    {
      *(void *)(v18 + 24) = v20;
      *(void *)(v18 + 32) = *((void *)v19 + 4);
      (**(void (***)(uint64_t, __int128 *))(v20 - 8))(v18, v19);
      return a1;
    }

uint64_t sub_7D7E0(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  __int128 v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  uint64_t v15 = a1 + v11;
  uint64_t v16 = a2 + v11;
  __int128 v17 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v17;
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  return a1;
}

uint64_t sub_7D890(uint64_t a1, uint64_t a2, int *a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  if (*(void *)(a1 + v11 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v12);
  }
  __int128 v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  uint64_t v15 = a3[9];
  uint64_t v16 = a1 + v15;
  if (*(void *)(a1 + v15 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v15));
  }
  __int128 v17 = *(_OWORD *)(a2 + v15 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)(a2 + v15);
  *(_OWORD *)(v16 + 16) = v17;
  *(void *)(v16 + 32) = *(void *)(a2 + v15 + 32);
  return a1;
}

uint64_t sub_7D96C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7D978);
}

uint64_t sub_7D978(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for ActionMetrics(0LL);
    return sub_4AC4(a1 + *(int *)(a3 + 28), a2, v8);
  }

uint64_t sub_7D9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7D9F8);
}

uint64_t sub_7D9F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics(0LL);
    return sub_4AD0(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }

  return result;
}

uint64_t sub_7DA64(uint64_t a1)
{
  v4[0] = &unk_BA8F8;
  v4[1] = &unk_BA910;
  v4[2] = &unk_BA928;
  uint64_t result = type metadata accessor for ActionMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(result - 8) + 64LL;
    v4[4] = &unk_BA940;
    v4[5] = &unk_BA940;
    swift_initStructMetadata(a1, 256LL, 6LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

unint64_t sub_7DAF8(uint64_t a1)
{
  unint64_t result = sub_7DB1C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_7DB1C()
{
  unint64_t result = qword_F6CE0;
  if (!qword_F6CE0)
  {
    uint64_t v1 = type metadata accessor for PromptLocationAction(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BA87C, v1);
    atomic_store(result, (unint64_t *)&qword_F6CE0);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for PromptLocationAction.AuthorizationType( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_7DBA8 + 4 * byte_BA875[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_7DBDC + 4 * asc_BA870[v4]))();
}

uint64_t sub_7DBDC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_7DBE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x7DBECLL);
  }
  return result;
}

uint64_t sub_7DBF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x7DC00LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_7DC04(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_7DC0C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PromptLocationAction.AuthorizationType()
{
  return &type metadata for PromptLocationAction.AuthorizationType;
}

unint64_t sub_7DC2C()
{
  unint64_t result = qword_F7030;
  if (!qword_F7030)
  {
    unint64_t result = swift_getWitnessTable(&unk_BAA0C, &type metadata for PromptLocationAction.AuthorizationType);
    atomic_store(result, (unint64_t *)&qword_F7030);
  }

  return result;
}

void sub_7DC68()
{
}

  ;
}

void sub_7DC90(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_manager);
  *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_manager) = a1;
}

void sub_7DCA4()
{
  uint64_t v4 = v3;
  sub_B210();
  sub_8690();
  __chkstk_darwin(v5);
  sub_7EDD8();
  sub_44DC((uint64_t *)&unk_F7110);
  uint64_t v6 = *(void *)(sub_7EDA4() - 8);
  uint64_t v7 = *(void *)(v6 + 72);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 32) & ~v8;
  uint64_t v52 = v2;
  uint64_t v50 = v8 | 7;
  uint64_t v10 = swift_allocObject(v2, v9 + 2 * v7, v8 | 7);
  *(_OWORD *)(v10 + 16) = xmmword_B5050;
  uint64_t v51 = v9;
  uint64_t v49 = type metadata accessor for PromptLocationActionImplementation();
  *((void *)&v54 + 1) = v49;
  *(void *)&__int128 v53 = v1;
  uint64_t v11 = v1;
  id v12 = (id)AMSLogKey(v11);
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    uint64_t v15 = v4;
    uint64_t v16 = v7;
    uint64_t v18 = v17;

    sub_B0C4();
    sub_B1A0();
    sub_7ED1C();
    uint64_t v19 = sub_B094();
    sub_7ED40(v19);
    sub_7ED54();
    sub_B078();
    uint64_t v58 = &type metadata for String;
    uint64_t v56 = v14;
    uint64_t v57 = v18;
    uint64_t v7 = v16;
    uint64_t v4 = v15;
    sub_5C8F8();
    sub_7ED54();
    uint64_t v20 = 93LL;
  }

  else
  {
    sub_B154();
    sub_B1A0();
    sub_7ED1C();
    uint64_t v21 = sub_B094();
    uint64_t v22 = sub_7ED40(v21);
    sub_7EDBC(v22, &qword_F6300);
    uint64_t v20 = 58LL;
  }

  sub_7EE6C(v20);
  LogMessage.init(stringInterpolation:)(v0);
  sub_B200();
  sub_7EE50();
  sub_B24C(30LL);
  sub_70594(v10);
  sub_7EDF0();
  uint64_t v23 = v7;
  uint64_t v24 = *((void *)v4 + 1);
  uint64_t v25 = *((void *)v4 + 2);
  uint64_t v26 = *(void **)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_queue];
  objc_allocWithZone(&OBJC_CLASS___CLLocationManager);
  uint64_t v27 = v11;
  swift_bridgeObjectRetain(v25);
  id v28 = v26;
  id v29 = sub_7EB00(v24, v25, (uint64_t)v11, v26);
  sub_7DC90((uint64_t)v29);
  __int128 v30 = *(void **)&v27[OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_manager];
  if (v30)
  {
    id v31 = v30;
    unsigned int v32 = [v31 authorizationStatus];
    uint64_t v33 = &v27[OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_originalAuthorizationStatus];
    *(_DWORD *)uint64_t v33 = v32;
    v33[4] = 0;
    objc_msgSend(v31, *off_E5530[*v4]);
    if (v4[24] == 1)
    {
      sub_7ED84();

      sub_7ED9C(v34, &qword_F7120);
    }

    else
    {
    }
  }

  else
  {
    uint64_t v35 = swift_allocObject(v52, v51 + 3 * v23, v50);
    *(_OWORD *)(v35 + 16) = xmmword_B5060;
    *((void *)&v54 + 1) = v49;
    *(void *)&__int128 v53 = v27;
    id v36 = (id)AMSLogKey(v27);
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v36);
      uint64_t v40 = v39;

      sub_B0C4();
      sub_B1A0();
      sub_7ED1C();
      uint64_t v41 = sub_B094();
      sub_7ED40(v41);
      sub_7EE2C();
      sub_B078();
      uint64_t v58 = &type metadata for String;
      uint64_t v56 = v38;
      uint64_t v57 = v40;
      sub_5C8F8();
      sub_7EE2C();
      uint64_t v42 = 93LL;
    }

    else
    {
      sub_B154();
      sub_B1A0();
      sub_7ED1C();
      uint64_t v43 = sub_B094();
      uint64_t v44 = sub_7ED40(v43);
      sub_7EDBC(v44, &qword_F6300);
      uint64_t v42 = 58LL;
    }

    sub_7EE6C(v42);
    LogMessage.init(stringInterpolation:)(v0);
    sub_7EE50();
    sub_7EE44(0xD000000000000027LL);
    *((void *)&v54 + 1) = &type metadata for PromptLocationActionImplementation.PerformError;
    uint64_t v45 = static LogMessage.safe(_:)(&v53);
    sub_7ED9C(v45, &qword_F6300);
    sub_705B4(v35);
    swift_bridgeObjectRelease();
    unint64_t v46 = sub_7EB88();
    uint64_t v47 = swift_allocError(&type metadata for PromptLocationActionImplementation.PerformError, v46, 0LL, 0LL);
    uint64_t v55 = 0LL;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    uint64_t v48 = sub_7F900(v47);
    sub_7ED9C(v48, &qword_F7120);
    swift_errorRelease(v47);
  }

  *((void *)&v54 + 1) = type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v55 = &protocol witness table for SyncTaskScheduler;
  sub_7EBC4(&v53);
  SyncTaskScheduler.init()();
  Promise.map<A>(on:_:)(&v53, sub_5C61C, 0LL, &type metadata for ResultingActionOutcome);
  sub_7EE50();
  sub_855C();
}

void sub_7E110()
{
  uint64_t v3 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  sub_8690();
  __chkstk_darwin(v4);
  sub_7EDD8();
  uint64_t v5 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_53740();
  type metadata accessor for DispatchQoS(0LL);
  sub_8690();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_manager] = 0LL;
  uint64_t v10 = &v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_originalAuthorizationStatus];
  *(_DWORD *)uint64_t v10 = 0;
  v10[4] = 1;
  uint64_t v11 = OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_promise;
  sub_44DC((uint64_t *)&unk_F7130);
  id v12 = v1;
  *(void *)&v1[v11] = Promise.__allocating_init()(v12);
  uint64_t v19 = OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_queue;
  sub_3C6F8();
  static DispatchQoS.userInitiated.getter();
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))( v2,  enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:),  v5);
  uint64_t v21 = _swiftEmptyArrayStorage;
  sub_8018( &qword_F7140,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v14 = v13;
  uint64_t v15 = sub_44DC(&qword_F7148);
  unint64_t v16 = sub_7EBFC();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v15, v16, v3, v14);
  uint64_t v17 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)( 0xD000000000000048LL,  0x80000000000BF4F0LL,  v9,  v0,  v2,  0LL);
  *(void *)&v12[v19] = v17;

  uint64_t v18 = (objc_class *)type metadata accessor for PromptLocationActionImplementation();
  v20.receiver = v12;
  v20.super_class = v18;
  objc_msgSendSuper2(&v20, "init");
  sub_855C();
}

id sub_7E308()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PromptLocationActionImplementation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PromptLocationActionImplementation()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation);
}

void sub_7E3A0()
{
}

void sub_7E3C0()
{
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_queue);
  *objc_super v2 = v6;
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v2, enum case for DispatchPredicate.onQueue(_:), v1);
  id v7 = v6;
  LOBYTE(v6) = _dispatchPreconditionTest(_:)(v2);
  (*(void (**)(void *, uint64_t))(v3 + 8))(v2, v1);
  if ((v6 & 1) != 0)
  {
    int v8 = *(_DWORD *)(v0
                   + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_originalAuthorizationStatus);
    char v9 = *(_BYTE *)(v0
                  + OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_originalAuthorizationStatus
                  + 4);
    id v10 = sub_7EDB0();
    sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v11 = *(void *)(sub_7EDA4() - 8);
    uint64_t v12 = sub_7EE58( ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
          + 3LL * *(void *)(v11 + 72),
            *(unsigned __int8 *)(v11 + 80));
    *(_OWORD *)(v12 + 16) = xmmword_B5060;
    if ((v9 & 1) != 0 || v8 != (_DWORD)v10)
    {
      uint64_t v20 = type metadata accessor for PromptLocationActionImplementation();
      id v21 = sub_7EE38(v20);
      id v22 = (id)AMSLogKey(v21);
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
        uint64_t v26 = v25;

        sub_B0C4();
        sub_5C8E0();
        uint64_t v27 = v45;
        id v28 = sub_ACA0(v44, v45);
        uint64_t v29 = sub_7ED60((uint64_t)v28, v27);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v46 = v29;
        sub_5C8F8();
        sub_7EE20();
        sub_B078();
        MetatypeMetadata = &type metadata for String;
        uint64_t v46 = v24;
        id v47 = v26;
        sub_5C8F8();
        sub_7EE20();
        uint64_t v30 = 93LL;
      }

      else
      {
        sub_B154();
        sub_5C8E0();
        uint64_t v37 = v45;
        uint64_t v38 = sub_ACA0(v44, v45);
        uint64_t v39 = sub_7ED60((uint64_t)v38, v37);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v46 = v39;
        uint64_t v40 = sub_5C8F8();
        sub_7EDBC(v40, &qword_F6300);
        uint64_t v30 = 58LL;
      }

      sub_7EE64(v30);
      sub_7EDF8();
      sub_B200();
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v44);
      sub_7EE44(0xD000000000000064LL);
      int v41 = sub_7EDB0();
      uint64_t v42 = sub_7EDC4(v41, (uint64_t)&type metadata for Int32);
      sub_7ED9C(v42, &qword_F6300);
      sub_70594(v12);
      sub_7EDF0();
      uint64_t v43 = sub_7ED84();
      sub_7ED9C(v43, &qword_F7120);
    }

    else
    {
      uint64_t v13 = type metadata accessor for PromptLocationActionImplementation();
      id v14 = sub_7EE38(v13);
      id v15 = (id)AMSLogKey(v14);
      if (v15)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
        sub_7EE14();
        sub_B0C4();
        sub_5C8E0();
        uint64_t v16 = v45;
        uint64_t v17 = sub_ACA0(v44, v45);
        uint64_t v18 = sub_7ED60((uint64_t)v17, v16);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v46 = v18;
        sub_5C8F8();
        sub_7ED54();
        sub_B078();
        MetatypeMetadata = &type metadata for String;
        uint64_t v46 = v0;
        id v47 = v10;
        sub_5C8F8();
        sub_7ED54();
        uint64_t v19 = 93LL;
      }

      else
      {
        sub_B154();
        sub_5C8E0();
        uint64_t v31 = v45;
        unsigned int v32 = sub_ACA0(v44, v45);
        uint64_t v33 = sub_7ED60((uint64_t)v32, v31);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v46 = v33;
        uint64_t v34 = sub_5C8F8();
        sub_7EDBC(v34, &qword_F6300);
        uint64_t v19 = 58LL;
      }

      sub_7EE64(v19);
      sub_7EDF8();
      sub_B200();
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v44);
      sub_B24C(42LL);
      int v35 = sub_7EDB0();
      uint64_t v36 = sub_7EDC4(v35, (uint64_t)&type metadata for Int32);
      sub_7ED9C(v36, &qword_F6300);
      sub_70594(v12);
      sub_7EDF0();
    }

    sub_855C();
  }

  else
  {
    __break(1u);
  }

void sub_7E7CC()
{
  uint64_t v4 = v3;
  sub_B210();
  sub_8690();
  __chkstk_darwin(v5);
  sub_7ED68();
  sub_7EE00();
  __n128 v7 = __chkstk_darwin(v6);
  char v9 = (void *)((char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  id v10 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin34PromptLocationActionImplementation_queue];
  *char v9 = v10;
  (*(void (**)(void *, void, uint64_t, __n128))(v2 + 104))( v9,  enum case for DispatchPredicate.onQueue(_:),  v1,  v7);
  id v11 = v10;
  uint64_t v12 = _dispatchPreconditionTest(_:)(v9);
  (*(void (**)(void *, uint64_t))(v2 + 8))(v9, v1);
  if ((v12 & 1) != 0)
  {
    sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v13 = *(void *)(sub_7EDA4() - 8);
    uint64_t v14 = sub_7EE58( ((*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80))
          + 3LL * *(void *)(v13 + 72),
            *(unsigned __int8 *)(v13 + 80));
    *(_OWORD *)(v14 + 16) = xmmword_B5060;
    *((void *)&v26 + 1) = type metadata accessor for PromptLocationActionImplementation();
    *(void *)&__int128 v25 = v0;
    id v15 = (id)AMSLogKey(v0);
    if (v15)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      sub_7EE14();
      sub_B0C4();
      sub_5C8E0();
      uint64_t v16 = *((void *)&v26 + 1);
      uint64_t v17 = sub_ACA0(&v25, *((uint64_t *)&v26 + 1));
      uint64_t v18 = sub_7ED60((uint64_t)v17, v16);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v31 = (void *)v18;
      sub_5C8F8();
      sub_7ED54();
      sub_B078();
      MetatypeMetadata = &type metadata for String;
      uint64_t v31 = v9;
      uint64_t v32 = v12;
      sub_5C8F8();
      sub_7ED54();
      uint64_t v19 = 93LL;
    }

    else
    {
      sub_B154();
      sub_5C8E0();
      uint64_t v20 = *((void *)&v26 + 1);
      id v21 = sub_ACA0(&v25, *((uint64_t *)&v26 + 1));
      uint64_t v22 = sub_7ED60((uint64_t)v21, v20);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v31 = (void *)v22;
      uint64_t v23 = sub_5C8F8();
      sub_7EDBC(v23, &qword_F6300);
      uint64_t v19 = 58LL;
    }

    sub_7EE64(v19);
    sub_7EDF8();
    sub_B200();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v25);
    sub_B24C(39LL);
    swift_getErrorValue(v4, &v30, &v28);
    uint64_t v24 = v29;
    *((void *)&v26 + 1) = v29;
    sub_7EBC4(&v25);
    (*(void (**)(void))(*(void *)(v24 - 8) + 16LL))();
    static LogMessage.safe(_:)(&v25);
    sub_8144((uint64_t)&v25, &qword_F6300);
    sub_705B4(v14);
    sub_7EDF0();
    uint64_t v27 = 0LL;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    sub_7F900(v4);
    sub_8144((uint64_t)&v25, &qword_F7120);
    sub_855C();
  }

  else
  {
    __break(1u);
  }

void sub_7EAD4()
{
}

id sub_7EB00(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v9 = 0LL;
  }

  id v10 = [v5 initWithEffectiveBundleIdentifier:v9 delegate:a3 onQueue:a4];

  swift_unknownObjectRelease(a3);
  return v10;
}

unint64_t sub_7EB88()
{
  unint64_t result = qword_F7128;
  if (!qword_F7128)
  {
    unint64_t result = swift_getWitnessTable(&unk_BAB28, &type metadata for PromptLocationActionImplementation.PerformError);
    atomic_store(result, (unint64_t *)&qword_F7128);
  }

  return result;
}

void sub_7EBC4(void *a1)
{
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0) {
    *a1 = swift_allocBox();
  }
  sub_4960();
}

unint64_t sub_7EBFC()
{
  unint64_t result = qword_F7150;
  if (!qword_F7150)
  {
    uint64_t v1 = sub_ABD0(&qword_F7148);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_F7150);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for PromptLocationActionImplementation.PerformError( uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_7EC80 + 4 * byte_BAA40[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_7ECA0 + 4 * byte_BAA45[v4]))();
  }
}

_BYTE *sub_7EC80(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_7ECA0(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_7ECA8(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_7ECB0(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_7ECB8(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_7ECC0(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PromptLocationActionImplementation.PerformError()
{
  return &type metadata for PromptLocationActionImplementation.PerformError;
}

unint64_t sub_7ECE0()
{
  unint64_t result = qword_F7158;
  if (!qword_F7158)
  {
    unint64_t result = swift_getWitnessTable(&unk_BAB00, &type metadata for PromptLocationActionImplementation.PerformError);
    atomic_store(result, (unint64_t *)&qword_F7158);
  }

  return result;
}

uint64_t sub_7ED1C()
{
  uint64_t v1 = *(void *)(v0 - 136);
  uint64_t v2 = sub_ACA0((void *)(v0 - 160), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

uint64_t sub_7ED40(uint64_t a1)
{
  *(void *)(v2 - 88) = a1;
  *(void *)(v2 - 112) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 112);
}

void sub_7ED54()
{
}

uint64_t sub_7ED60(uint64_t a1, uint64_t a2)
{
  return swift_getDynamicType(a1, a2, 1LL);
}

uint64_t sub_7ED68()
{
  return type metadata accessor for DispatchPredicate(0LL);
}

uint64_t sub_7ED84()
{
  *(void *)(v0 - 128) = 0LL;
  *(_OWORD *)(v0 - 160) = 0u;
  *(_OWORD *)(v0 - 144) = 0u;
  return sub_7FA00(1);
}

void sub_7ED9C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_7EDA4()
{
  return type metadata accessor for LogMessage(0LL);
}

id sub_7EDB0()
{
  return [v0 *(SEL *)(v1 + 1208)];
}

void sub_7EDBC(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_7EDC4@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 136) = a2;
  *(_DWORD *)(v2 - 160) = a1;
  return static LogMessage.safe(_:)(v2 - 160);
}

  ;
}

uint64_t sub_7EDF0()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_7EDF8()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

  ;
}

void sub_7EE14()
{
}

void sub_7EE20()
{
}

void sub_7EE2C()
{
}

id sub_7EE38(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return v1;
}

uint64_t sub_7EE44(uint64_t a1)
{
  return LogMessage.init(stringLiteral:)(a1);
}

uint64_t sub_7EE50()
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v0 - 160));
}

uint64_t sub_7EE58@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_allocObject(v2, a1, a2 | 7);
}

void sub_7EE64(uint64_t a1)
{
  unint64_t v1 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

void sub_7EE6C(uint64_t a1)
{
  unint64_t v1 = 0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

uint64_t sub_7EE78@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = type metadata accessor for ActionFactory(0LL);
  swift_allocObject(v7, 16LL, 7LL);
  uint64_t v8 = (int *)type metadata accessor for PromptNotificationAction(0LL);
  sub_7DC84();
  sub_5D6C();
  if (v2)
  {
    uint64_t v9 = sub_8440();
    sub_851C(v9);
    sub_8770();
    uint64_t v10 = sub_8484();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(a1, v10);
  }

  else
  {
    uint64_t v12 = *(void (**)(void))(v6 + 32);
    uint64_t v24 = a2 + v8[7];
    v12();
    sub_7DC84();
    sub_6F66C(v13, v14, v15);
    *(void *)a2 = v16;
    sub_7DC84();
    *(void *)(a2 + 8) = sub_6F270();
    *(void *)(a2 + 16) = v17;
    sub_7DC84();
    uint64_t v18 = sub_6F368();
    *(_BYTE *)(a2 + 24) = v18 & 1;
    __chkstk_darwin(v18);
    sub_2C130();
    sub_7DC68();
    uint64_t v19 = sub_53EE0((uint64_t)&v23, a2 + v8[8]);
    __chkstk_darwin(v19);
    sub_2C130();
    sub_7DC68();
    uint64_t v20 = sub_8440();
    sub_851C(v20);
    sub_8770();
    uint64_t v21 = sub_8484();
    sub_85AC(v21);
    return sub_53EE0((uint64_t)&v22, a2 + v8[9]);
  }

uint64_t sub_7F18C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_7EE78(a1, a2);
}

uint64_t type metadata accessor for PromptNotificationAction(uint64_t a1)
{
  uint64_t result = qword_F71B8;
  if (!qword_F71B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PromptNotificationAction);
  }
  return result;
}

void *sub_7F1D8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v18 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v18 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v18);
  }

  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    uint64_t v7 = a2[2];
    *(void *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
    uint64_t v8 = a3[7];
    uint64_t v9 = a1 + v8;
    uint64_t v10 = (uint64_t)a2 + v8;
    uint64_t v11 = type metadata accessor for ActionMetrics(0LL);
    uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL);
    swift_bridgeObjectRetain(v7);
    v12(v9, v10, v11);
    uint64_t v13 = a3[8];
    uint64_t v14 = (char *)v4 + v13;
    uint64_t v15 = (uint64_t)a2 + v13;
    uint64_t v16 = *(uint64_t *)((char *)a2 + v13 + 24);
    if (v16)
    {
      uint64_t v17 = *(void *)(v15 + 32);
      *((void *)v14 + 3) = v16;
      *((void *)v14 + 4) = v17;
      (**(void (***)(void))(v16 - 8))();
    }

    else
    {
      __int128 v19 = *(_OWORD *)(v15 + 16);
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
      *((_OWORD *)v14 + 1) = v19;
      *((void *)v14 + 4) = *(void *)(v15 + 32);
    }

    uint64_t v20 = a3[9];
    uint64_t v21 = (char *)v4 + v20;
    uint64_t v22 = (uint64_t)a2 + v20;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 24);
    if (v23)
    {
      uint64_t v24 = *(void *)(v22 + 32);
      *((void *)v21 + 3) = v23;
      *((void *)v21 + 4) = v24;
      (**(void (***)(void))(v23 - 8))();
    }

    else
    {
      __int128 v25 = *(_OWORD *)(v22 + 16);
      *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v25;
      *((void *)v21 + 4) = *(void *)(v22 + 32);
    }
  }

  return v4;
}

uint64_t sub_7F30C(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)(a2 + v12 + 24);
  if (v15)
  {
    uint64_t v16 = *(void *)(v14 + 32);
    *(void *)(v13 + 24) = v15;
    *(void *)(v13 + 32) = v16;
    (**(void (***)(void))(v15 - 8))();
  }

  else
  {
    __int128 v17 = *(_OWORD *)(v14 + 16);
    *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
    *(_OWORD *)(v13 + 16) = v17;
    *(void *)(v13 + 32) = *(void *)(v14 + 32);
  }

  uint64_t v18 = a3[9];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  uint64_t v21 = *(void *)(a2 + v18 + 24);
  if (v21)
  {
    uint64_t v22 = *(void *)(v20 + 32);
    *(void *)(v19 + 24) = v21;
    *(void *)(v19 + 32) = v22;
    (**(void (***)(void))(v21 - 8))();
  }

  else
  {
    __int128 v23 = *(_OWORD *)(v20 + 16);
    *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
    *(_OWORD *)(v19 + 16) = v23;
    *(void *)(v19 + 32) = *(void *)(v20 + 32);
  }

  return a1;
}

uint64_t sub_7F414(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = a3[7];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (__int128 *)(a2 + v11);
  uint64_t v14 = *(void *)(a2 + v11 + 24);
  if (*(void *)(a1 + v11 + 24))
  {
    if (v14)
    {
      sub_4290((void *)v12, v13);
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v12);
  }

  else if (v14)
  {
    *(void *)(v12 + 24) = v14;
    *(void *)(v12 + 32) = *((void *)v13 + 4);
    (**(void (***)(uint64_t, __int128 *))(v14 - 8))(v12, v13);
    goto LABEL_8;
  }

  __int128 v15 = *v13;
  __int128 v16 = v13[1];
  *(void *)(v12 + 32) = *((void *)v13 + 4);
  *(_OWORD *)uint64_t v12 = v15;
  *(_OWORD *)(v12 + 16) = v16;
LABEL_8:
  uint64_t v17 = a3[9];
  uint64_t v18 = a1 + v17;
  uint64_t v19 = (__int128 *)(a2 + v17);
  uint64_t v20 = *((void *)v19 + 3);
  if (!*(void *)(a1 + v17 + 24))
  {
    if (v20)
    {
      *(void *)(v18 + 24) = v20;
      *(void *)(v18 + 32) = *((void *)v19 + 4);
      (**(void (***)(uint64_t, __int128 *))(v20 - 8))(v18, v19);
      return a1;
    }

uint64_t sub_7F580(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = a3[9];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  __int128 v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(void *)(v12 + 32) = *(void *)(v13 + 32);
  uint64_t v15 = a1 + v11;
  uint64_t v16 = a2 + v11;
  __int128 v17 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + 16) = v17;
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  return a1;
}

uint64_t sub_7F630(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v6 = a3[7];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40LL))(v7, v8, v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  if (*(void *)(a1 + v10 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v11);
  }
  __int128 v13 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
  *(_OWORD *)(v11 + 16) = v13;
  *(void *)(v11 + 32) = *(void *)(v12 + 32);
  uint64_t v14 = a3[9];
  uint64_t v15 = a1 + v14;
  if (*(void *)(a1 + v14 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v14));
  }
  __int128 v16 = *(_OWORD *)(a2 + v14 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)(a2 + v14);
  *(_OWORD *)(v15 + 16) = v16;
  *(void *)(v15 + 32) = *(void *)(a2 + v14 + 32);
  return a1;
}

uint64_t sub_7F70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_7F718);
}

uint64_t sub_7F718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for ActionMetrics(0LL);
    return sub_4AC4(a1 + *(int *)(a3 + 28), a2, v8);
  }

uint64_t sub_7F78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_7F798);
}

uint64_t sub_7F798(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics(0LL);
    return sub_4AD0(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }

  return result;
}

uint64_t sub_7F804(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.Int64 + 64;
  v4[1] = &unk_BABF0;
  v4[2] = &unk_BAC08;
  uint64_t result = type metadata accessor for ActionMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(result - 8) + 64LL;
    v4[4] = &unk_BAC20;
    v4[5] = &unk_BAC20;
    swift_initStructMetadata(a1, 256LL, 6LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

unint64_t sub_7F89C(uint64_t a1)
{
  unint64_t result = sub_7F8C0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_7F8C0()
{
  unint64_t result = qword_F6CF0;
  if (!qword_F6CF0)
  {
    uint64_t v1 = type metadata accessor for PromptNotificationAction(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BAB70, v1);
    atomic_store(result, (unint64_t *)&qword_F6CF0);
  }

  return result;
}

uint64_t sub_7F900(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4968((uint64_t)&unk_E5660, 24LL);
  swift_weakInit(v4 + 16, v2);
  uint64_t v5 = sub_4968((uint64_t)&unk_E5688, 32LL);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = a1;
  uint64_t v13 = sub_80424(v5, v6, v7, v8, v9, v10, v11, v12, v24);
  if (v26)
  {
    sub_3E6C8(v13, v14, v15, v16, v17, v18, v19, v20, v24, v25, v26, v27, v28[0]);
    uint64_t v21 = v29;
    uint64_t v22 = v30;
    sub_ACA0(v28, v29);
    swift_errorRetain(a1);
    dispatch thunk of TaskScheduler.schedule(task:)(sub_8039C, v5, v21, v22);
    sub_21448();
    return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v28);
  }

  else
  {
    swift_errorRetain(a1);
    swift_retain(v4);
    sub_ACC4((uint64_t)&v24, &qword_F7120);
    sub_7FAE8(v4, a1);
    sub_21448();
    return swift_release();
  }

uint64_t sub_7FA00(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_4968((uint64_t)&unk_E5660, 24LL);
  swift_weakInit(v4 + 16, v2);
  uint64_t v5 = sub_4968((uint64_t)&unk_E56B0, 25LL);
  *(void *)(v5 + 16) = v4;
  *(_BYTE *)(v5 + 24) = a1;
  uint64_t v13 = sub_80424(v5, v6, v7, v8, v9, v10, v11, v12, v24);
  if (v26)
  {
    sub_3E6C8(v13, v14, v15, v16, v17, v18, v19, v20, v24, v25, v26, v27, v28[0]);
    uint64_t v21 = v29;
    uint64_t v22 = v30;
    sub_ACA0(v28, v29);
    dispatch thunk of TaskScheduler.schedule(task:)(sub_80418, v5, v21, v22);
    sub_B14C();
    return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v28);
  }

  else
  {
    swift_retain(v4);
    sub_ACC4((uint64_t)&v24, &qword_F7120);
    sub_7FB4C(v4, a1 & 1);
    sub_21448();
    return sub_B14C();
  }

uint64_t sub_7FAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v3);
  if (result)
  {
    uint64_t v5 = result;
    if ((Promise.isResolved.getter() & 1) == 0) {
      Promise.reject(_:)(a2);
    }
    return swift_release(v5);
  }

  return result;
}

uint64_t sub_7FB4C(uint64_t a1, char a2)
{
  char v6 = a2;
  uint64_t v2 = a1 + 16;
  swift_beginAccess(a1 + 16, &v5, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v2);
  if (result)
  {
    uint64_t v4 = result;
    if ((Promise.isResolved.getter() & 1) == 0) {
      Promise.resolve(_:)(&v6);
    }
    return swift_release(v4);
  }

  return result;
}

uint64_t sub_7FBB0(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_44DC((uint64_t *)&unk_F7130);
  uint64_t v5 = Promise.__allocating_init()(v4);
  sub_802CC();
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  swift_bridgeObjectRetain(v7);
  id v8 = sub_7FD1C(v6, v7);
  uint64_t v9 = *a1;
  uint64_t v10 = sub_4968((uint64_t)&unk_E5610, 32LL);
  *(void *)(v10 + 16) = v2;
  *(void *)(v10 + 24) = v5;
  uint64_t v16 = sub_80314;
  uint64_t v17 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256LL;
  v14[2] = sub_AE480;
  uint64_t v15 = &unk_E5628;
  uint64_t v11 = _Block_copy(v14);
  swift_retain(v2);
  swift_retain(v5);
  swift_release();
  [v8 requestAuthorizationWithOptions:v9 completionHandler:v11];
  _Block_release(v11);
  uint64_t v15 = (void *)type metadata accessor for SyncTaskScheduler(0LL);
  uint64_t v16 = (uint64_t (*)(char, uint64_t))&protocol witness table for SyncTaskScheduler;
  sub_AE98(v14);
  SyncTaskScheduler.init()();
  uint64_t v12 = Promise.map<A>(on:_:)(v14, sub_5C61C, 0LL, &type metadata for ResultingActionOutcome);
  sub_B14C();

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v14);
  return v12;
}

id sub_7FD1C(uint64_t a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v6 = [v4 initWithBundleIdentifier:v5];

  return v6;
}

uint64_t sub_7FD8C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v6);
  id v8 = (char *)v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a2)
  {
    uint64_t v9 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v10 = type metadata accessor for LogMessage(0LL);
    uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v10 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v11 + 16) = xmmword_B5060;
    *((void *)&v55 + 1) = type metadata accessor for PromptNotificationActionImplementation();
    *(void *)&__int128 v54 = a3;
    swift_retain(a3);
    uint64_t v12 = swift_errorRetain(a2);
    id v13 = (id)AMSLogKey(v12);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      uint64_t v17 = v16;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v18._countAndFlagsBits = 0LL;
      v18._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v18);
      uint64_t v19 = *((void *)&v55 + 1);
      uint64_t v20 = sub_ACA0(&v54, *((uint64_t *)&v55 + 1));
      uint64_t DynamicType = swift_getDynamicType(v20, v19, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v57 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v57);
      sub_ACC4((uint64_t)&v57, &qword_F6300);
      v22._countAndFlagsBits = 5972026LL;
      v22._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v22);
      MetatypeMetadata = &type metadata for String;
      uint64_t v57 = v15;
      uint64_t v58 = v17;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v57);
      sub_ACC4((uint64_t)&v57, &qword_F6300);
      uint64_t v23 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v39._countAndFlagsBits = 0LL;
      v39._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v39);
      uint64_t v40 = *((void *)&v55 + 1);
      int v41 = sub_ACA0(&v54, *((uint64_t *)&v55 + 1));
      uint64_t v42 = swift_getDynamicType(v41, v40, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v57 = v42;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v57);
      sub_ACC4((uint64_t)&v57, &qword_F6300);
      uint64_t v23 = 58LL;
    }

    unint64_t v43 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v23);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v54);
    LogMessage.init(stringLiteral:)(0xD00000000000002DLL);
    swift_getErrorValue(a2, v53, v52);
    uint64_t v44 = Error.localizedDescription.getter(v52[1], v52[2]);
    *((void *)&v55 + 1) = &type metadata for String;
    *(void *)&__int128 v54 = v44;
    *((void *)&v54 + 1) = v45;
    static LogMessage.safe(_:)(&v54);
    sub_ACC4((uint64_t)&v54, &qword_F6300);
    sub_705B4(v11);
    swift_bridgeObjectRelease();
    uint64_t v56 = 0LL;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    sub_7F900(a2);
    swift_errorRelease(a2);
  }

  else
  {
    uint64_t v24 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v25 = type metadata accessor for LogMessage(0LL);
    uint64_t v26 = swift_allocObject( v24,  ((*(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v25 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v25 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v26 + 16) = xmmword_B5050;
    *((void *)&v55 + 1) = type metadata accessor for PromptNotificationActionImplementation();
    *(void *)&__int128 v54 = a3;
    swift_retain(a3);
    id v28 = (id)AMSLogKey(v27);
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      uint64_t v32 = v31;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v33._countAndFlagsBits = 0LL;
      v33._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v33);
      uint64_t v34 = *((void *)&v55 + 1);
      int v35 = sub_ACA0(&v54, *((uint64_t *)&v55 + 1));
      uint64_t v36 = swift_getDynamicType(v35, v34, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v57 = v36;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v57);
      sub_ACC4((uint64_t)&v57, &qword_F6300);
      v37._countAndFlagsBits = 5972026LL;
      v37._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v37);
      MetatypeMetadata = &type metadata for String;
      uint64_t v57 = v30;
      uint64_t v58 = v32;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v57);
      sub_ACC4((uint64_t)&v57, &qword_F6300);
      uint64_t v38 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v46._countAndFlagsBits = 0LL;
      v46._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v46);
      uint64_t v47 = *((void *)&v55 + 1);
      uint64_t v48 = sub_ACA0(&v54, *((uint64_t *)&v55 + 1));
      uint64_t v49 = swift_getDynamicType(v48, v47, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v57 = v49;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v57);
      sub_ACC4((uint64_t)&v57, &qword_F6300);
      uint64_t v38 = 58LL;
    }

    unint64_t v50 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v38);
    LogMessage.init(stringInterpolation:)(v8);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v54);
    LogMessage.init(stringLiteral:)(0xD00000000000001DLL);
    sub_70594(v26);
    swift_bridgeObjectRelease();
    uint64_t v56 = 0LL;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    sub_7FA00(a1 & 1);
  }

  return sub_ACC4((uint64_t)&v54, &qword_F7120);
}

uint64_t type metadata accessor for PromptNotificationActionImplementation()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin38PromptNotificationActionImplementation);
}

uint64_t sub_802AC(uint64_t *a1)
{
  return sub_7FBB0(a1);
}

unint64_t sub_802CC()
{
  unint64_t result = qword_F72C0;
  if (!qword_F72C0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UNUserNotificationCenter);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_F72C0);
  }

  return result;
}

uint64_t sub_80308()
{
  return sub_80364((void (*)(void))&_swift_release);
}

uint64_t sub_80314(char a1, uint64_t a2)
{
  return sub_7FD8C(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_8031C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_8032C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_80334()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_80358()
{
  return sub_80364((void (*)(void))&_swift_errorRelease);
}

uint64_t sub_80364(void (*a1)(void))
{
  return swift_deallocObject(v1, 32LL, 7LL);
}

uint64_t sub_8039C()
{
  return sub_7FAE8(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_803A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F7120);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_803EC(uint64_t a1, char *a2)
{
  return sub_7FB4C(a1, *a2);
}

uint64_t sub_803F4()
{
  return swift_deallocObject(v0, 25LL, 7LL);
}

uint64_t sub_80418()
{
  return sub_803EC(*(void *)(v0 + 16), (char *)(v0 + 24));
}

uint64_t sub_80424( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_803A4(v9, (uint64_t)&a9);
}

unint64_t sub_80434()
{
  unint64_t result = qword_F72C8;
  if (!qword_F72C8)
  {
    uint64_t v1 = type metadata accessor for RecessedPlatter(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BACF0, v1);
    atomic_store(result, (unint64_t *)&qword_F72C8);
  }

  return result;
}

uint64_t type metadata accessor for RecessedPlatter(uint64_t a1)
{
  uint64_t result = qword_F7328;
  if (!qword_F7328) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for RecessedPlatter);
  }
  return result;
}

uint64_t sub_804AC@<X0>(uint64_t a1@<X8>)
{
  return sub_8260(v1 + 112, a1);
}

void sub_804B8(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = sub_E9C0(v8);
  uint64_t v10 = type metadata accessor for DynamicTextFactory(0LL);
  sub_E9C0(v10);
  uint64_t v11 = type metadata accessor for RecessedPlatter(0LL);
  uint64_t v12 = sub_6F270();
  if (v2)
  {
    sub_847C();
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  *a2 = v12;
  a2[1] = v13;
  __chkstk_darwin(v12);
  sub_EA0C();
  sub_588C(0x756F72676B636162LL, 0xEF726F6C6F43646ELL, v11, (uint64_t)sub_66ED0, v14, v15, v16, v17);
  a2[2] = v18;
  uint64_t v19 = sub_6F270();
  uint64_t v40 = v9;
  v39[0] = v19;
  v39[1] = v20;
  uint64_t v21 = AnyHashable.init<A>(_:)(v39, &type metadata for String, &protocol witness table for String);
  __chkstk_darwin(v21);
  sub_EA0C();
  sub_5868(0xD000000000000011LL, 0x80000000000BD350LL, v11, (uint64_t)sub_D960, v22, v23, v24, v25);
  sub_D970((uint64_t)v7, (uint64_t)a2 + *(int *)(v11 + 40), &qword_F3838);
  __chkstk_darwin(v26);
  *(&v36 - 2) = v40;
  *(&v36 - 1) = a1;
  sub_5844();
  sub_D970((uint64_t)v39, (uint64_t)a2 + *(int *)(v11 + 44), &qword_F38F8);
  __chkstk_darwin(v27);
  sub_EA0C();
  sub_588C(0x7365636976726573LL, 0xE800000000000000LL, v11, (uint64_t)sub_2E634, v28, v29, v30, v31);
  a2[3] = v32;
  __chkstk_darwin(v32);
  sub_E9AC();
  sub_58A0();
  sub_D970((uint64_t)&v38, (uint64_t)(a2 + 4), &qword_F3930);
  __chkstk_darwin(v33);
  sub_E9AC();
  sub_58A0();
  uint64_t v34 = type metadata accessor for JSONObject(0LL);
  sub_851C(v34);
  sub_E9EC();
  swift_release();
  uint64_t v35 = sub_8484();
  sub_E998(v35);
  sub_7CF4(&v37, (uint64_t)(a2 + 9));
}

void sub_80974(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
}

uint64_t sub_80988(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *(void *)a1 = *a2;
    a1 = v14 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v14);
  }

  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v9 = (void *)a2[2];
    uint64_t v8 = a2[3];
    *(void *)(a1 + swift_weakDestroy(v0 + 16) = v9;
    *(void *)(a1 + 24) = v8;
    uint64_t v10 = a2 + 4;
    uint64_t v11 = a2[7];
    swift_bridgeObjectRetain(v7);
    id v12 = v9;
    swift_bridgeObjectRetain(v8);
    if (v11)
    {
      uint64_t v13 = a2[8];
      *(void *)(a1 + 56) = v11;
      *(void *)(a1 + 64) = v13;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v11 - 8))(a1 + 32, (uint64_t)(a2 + 4), v11);
    }

    else
    {
      __int128 v15 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *v10;
      *(_OWORD *)(a1 + 48) = v15;
      *(void *)(a1 + 64) = a2[8];
    }

    __int128 v16 = *((_OWORD *)a2 + 6);
    *(_OWORD *)(a1 + 96) = v16;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 72, (uint64_t)(a2 + 9));
    __int128 v17 = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(a1 + 136) = v17;
    (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 112, (uint64_t)(a2 + 14));
    uint64_t v18 = *(int *)(a3 + 40);
    uint64_t v19 = (void *)(a1 + v18);
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v20, 1LL, v21))
    {
      uint64_t v22 = sub_44DC(&qword_F3838);
      memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v19, v20, v21);
      sub_4AD0((uint64_t)v19, 0LL, 1LL, v21);
    }

    uint64_t v23 = *(int *)(a3 + 44);
    uint64_t v24 = a1 + v23;
    uint64_t v25 = (uint64_t)a2 + v23;
    uint64_t v26 = *(uint64_t *)((char *)a2 + v23 + 24);
    if (v26)
    {
      uint64_t v27 = *(void *)(v25 + 32);
      *(void *)(v24 + 24) = v26;
      *(void *)(v24 + 32) = v27;
      (**(void (***)(void))(v26 - 8))();
    }

    else
    {
      __int128 v28 = *(_OWORD *)(v25 + 16);
      *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
      *(_OWORD *)(v24 + swift_weakDestroy(v0 + 16) = v28;
      *(void *)(v24 + 32) = *(void *)(v25 + 32);
    }
  }

  return a1;
}

void *sub_80B50(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 32));
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 112));
  uint64_t v4 = a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t result = (void *)(a1 + *(int *)(a2 + 44));
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t sub_80C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v8 = *(void **)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v8;
  *(void *)(a1 + 24) = v7;
  uint64_t v9 = a2 + 32;
  uint64_t v10 = *(void *)(a2 + 56);
  swift_bridgeObjectRetain(v6);
  id v11 = v8;
  swift_bridgeObjectRetain(v7);
  if (v10)
  {
    uint64_t v12 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = v10;
    *(void *)(a1 + 64) = v12;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8))(a1 + 32, v9, v10);
  }

  else
  {
    __int128 v13 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v9;
    *(_OWORD *)(a1 + 48) = v13;
    *(void *)(a1 + 64) = *(void *)(v9 + 32);
  }

  __int128 v14 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 96) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 72, a2 + 72);
  __int128 v15 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 136) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 112, a2 + 112);
  uint64_t v16 = *(int *)(a3 + 40);
  __int128 v17 = (void *)(a1 + v16);
  uint64_t v18 = (const void *)(a2 + v16);
  uint64_t v19 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v18, 1LL, v19))
  {
    uint64_t v20 = sub_44DC(&qword_F3838);
    memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v19 - 8) + 16LL))(v17, v18, v19);
    sub_4AD0((uint64_t)v17, 0LL, 1LL, v19);
  }

  uint64_t v21 = *(int *)(a3 + 44);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = a2 + v21;
  uint64_t v24 = *(void *)(a2 + v21 + 24);
  if (v24)
  {
    uint64_t v25 = *(void *)(v23 + 32);
    *(void *)(v22 + 24) = v24;
    *(void *)(v22 + 32) = v25;
    (**(void (***)(void))(v24 - 8))();
  }

  else
  {
    __int128 v26 = *(_OWORD *)(v23 + 16);
    *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
    *(_OWORD *)(v22 + swift_weakDestroy(v0 + 16) = v26;
    *(void *)(v22 + 32) = *(void *)(v23 + 32);
  }

  return a1;
}

uint64_t sub_80DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void **)(a1 + 16);
  uint64_t v8 = *(void **)(a2 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = v8;
  id v9 = v8;

  uint64_t v10 = *(void *)(a2 + 24);
  *(void *)(a1 + 24) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 56);
  if (*(void *)(a1 + 56))
  {
    if (v11)
    {
      sub_4290((void *)(a1 + 32), (void *)(a2 + 32));
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 32));
  }

  else if (v11)
  {
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 32, a2 + 32);
    goto LABEL_8;
  }

  __int128 v12 = *(_OWORD *)(a2 + 32);
  __int128 v13 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v12;
  *(_OWORD *)(a1 + 48) = v13;
LABEL_8:
  sub_4290((void *)(a1 + 72), (void *)(a2 + 72));
  sub_4290((void *)(a1 + 112), (void *)(a2 + 112));
  uint64_t v14 = *(int *)(a3 + 40);
  __int128 v15 = (void *)(a1 + v14);
  uint64_t v16 = (const void *)(a2 + v14);
  uint64_t v17 = type metadata accessor for ImpressionMetrics(0LL);
  int v18 = sub_4AC4((uint64_t)v15, 1LL, v17);
  int v19 = sub_4AC4((uint64_t)v16, 1LL, v17);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v15, v16, v17);
      sub_4AD0((uint64_t)v15, 0LL, 1LL, v17);
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  uint64_t v20 = *(void *)(v17 - 8);
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v15, v17);
LABEL_13:
    uint64_t v21 = sub_44DC(&qword_F3838);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64LL));
    goto LABEL_14;
  }

  (*(void (**)(void *, const void *, uint64_t))(v20 + 24))(v15, v16, v17);
LABEL_14:
  uint64_t v22 = *(int *)(a3 + 44);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = (__int128 *)(a2 + v22);
  uint64_t v25 = *((void *)v24 + 3);
  if (!*(void *)(a1 + v22 + 24))
  {
    if (v25)
    {
      *(void *)(v23 + 24) = v25;
      *(void *)(v23 + 32) = *((void *)v24 + 4);
      (**(void (***)(uint64_t, __int128 *))(v25 - 8))(v23, v24);
      return a1;
    }

uint64_t sub_80FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  __int128 v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  __int128 v8 = *(_OWORD *)(a2 + 112);
  __int128 v9 = *(_OWORD *)(a2 + 128);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (void *)(a1 + v10);
  __int128 v12 = (const void *)(a2 + v10);
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 128) = v9;
  uint64_t v13 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v12, 1LL, v13))
  {
    uint64_t v14 = sub_44DC(&qword_F3838);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
    sub_4AD0((uint64_t)v11, 0LL, 1LL, v13);
  }

  uint64_t v15 = *(int *)(a3 + 44);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  __int128 v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + swift_weakDestroy(v0 + 16) = v18;
  *(void *)(v16 + 32) = *(void *)(v17 + 32);
  return a1;
}

uint64_t sub_810F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  __int128 v7 = *(void **)(a1 + 16);
  *(void *)(a1 + swift_weakDestroy(v0 + 16) = *(void *)(a2 + 16);

  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 56)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 32));
  }
  __int128 v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 112));
  __int128 v9 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v9;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v10 = *(int *)(a3 + 40);
  uint64_t v11 = (void *)(a1 + v10);
  __int128 v12 = (const void *)(a2 + v10);
  uint64_t v13 = type metadata accessor for ImpressionMetrics(0LL);
  int v14 = sub_4AC4((uint64_t)v11, 1LL, v13);
  int v15 = sub_4AC4((uint64_t)v12, 1LL, v13);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
      sub_4AD0((uint64_t)v11, 0LL, 1LL, v13);
      goto LABEL_9;
    }

    goto LABEL_8;
  }

  uint64_t v16 = *(void *)(v13 - 8);
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v11, v13);
LABEL_8:
    uint64_t v17 = sub_44DC(&qword_F3838);
    memcpy(v11, v12, *(void *)(*(void *)(v17 - 8) + 64LL));
    goto LABEL_9;
  }

  (*(void (**)(void *, const void *, uint64_t))(v16 + 40))(v11, v12, v13);
LABEL_9:
  uint64_t v18 = *(int *)(a3 + 44);
  uint64_t v19 = a1 + v18;
  if (*(void *)(a1 + v18 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v18));
  }
  __int128 v20 = *(_OWORD *)(a2 + v18 + 16);
  *(_OWORD *)uint64_t v19 = *(_OWORD *)(a2 + v18);
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = v20;
  *(void *)(v19 + 32) = *(void *)(a2 + v18 + 32);
  return a1;
}

uint64_t sub_812B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_812C0);
}

uint64_t sub_812C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 96);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F3838);
    return sub_4AC4(a1 + *(int *)(a3 + 40), a2, v8);
  }

uint64_t sub_81338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_81344);
}

uint64_t sub_81344(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 96) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_44DC(&qword_F3838);
    return sub_4AD0(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }

  return result;
}

void sub_813B4(uint64_t a1)
{
  v4[0] = &unk_BAD68;
  v4[1] = &unk_BAD80;
  v4[2] = &unk_BAD80;
  v4[3] = &unk_BAD98;
  v4[4] = &unk_BADB0;
  v4[5] = &unk_BADB0;
  sub_5260(319LL);
  if (v3 <= 0x3F)
  {
    void v4[6] = *(void *)(v2 - 8) + 64LL;
    v4[7] = &unk_BAD98;
    swift_initStructMetadata(a1, 256LL, 8LL, v4, a1 + 16);
  }

void sub_81448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_BADF8);
  uint64_t v6 = sub_44DC(&qword_F73C8);
  DiffableLens.subscript.getter(KeyPath, v6);
  sub_8770();
  if (v35)
  {
    uint64_t v7 = sub_7CF4(&v33, (uint64_t)v37);
    int v15 = sub_81828(v7, v8, v9, v10, v11, v12, v13, v14, v33, *((uint64_t *)&v33 + 1), v34, v35, v36, v37[0]);
    v16(v15);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v37);
  }

  else
  {
    sub_19D4C((uint64_t)&v33);
  }

  uint64_t v17 = swift_getKeyPath(&unk_BAE18);
  sub_81818(v17);
  sub_8770();
  if (v37[0])
  {
    sub_81FC4(v37[0], a3);
    swift_bridgeObjectRelease();
  }

  uint64_t v18 = swift_getKeyPath(&unk_BAE38);
  sub_81818(v18);
  sub_8770();
  if (v37[0]) {
    sub_81840(v37[0]);
  }
  uint64_t v19 = swift_getKeyPath(&unk_BAE58);
  sub_81818(v19);
  uint64_t v20 = swift_release();
  __int128 v28 = sub_81828(v20, v21, v22, v23, v24, v25, v26, v27, v33, *((uint64_t *)&v33 + 1), v34, v35, v36, v37[0]);
  v29(v28);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v37);
  id v30 = [v3 contentView];
  uint64_t v31 = swift_getKeyPath(&unk_BAE78);
  sub_81818(v31);
  swift_release();
  if (v37[1])
  {
    NSString v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v32 = 0LL;
  }

  [v30 setAccessibilityLabel:v32];
}

uint64_t sub_81630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for RecessedPlatterComponent();
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_81684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for RecessedPlatterComponent();
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_816D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BADD8, a4);
  return ComponentCell.apply(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_81734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BADD8, a4);
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_81790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BADD8, a4);
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_817EC()
{
  return sub_8A80(&qword_F7378, type metadata accessor for RecessedPlatter, (uint64_t)&unk_BACB0);
}

uint64_t sub_81818(uint64_t a1)
{
  return DiffableLens.subscript.getter(a1, v1);
}

char *sub_81828( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return &a14;
}

void sub_81840(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_platterColor);
  *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_platterColor) = a1;
}

id sub_81854(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_platterColor;
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  uint64_t v11 = v4;
  id v12 = sub_32438((uint64_t)v11, "secondarySystemBackgroundColor");
  id v13 = sub_82F0C(v12);

  id v15 = sub_32438(v14, "tertiarySystemBackgroundColor");
  id v16 = sub_82F0C(v15);

  id v17 = objc_msgSend(v10, "ams_dynamicColorWithLightColor:darkColor:", v13, v16);
  *(void *)&v4[v9] = v17;
  uint64_t v18 = OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_subtitleLabel;
  uint64_t v19 = type metadata accessor for DynamicLabel(0LL);
  id v20 = sub_32438(v19, "ams_secondaryText");
  uint64_t v21 = type metadata accessor for FontSource(0LL);
  *((void *)&v37 + 1) = v21;
  __int128 v38 = &protocol witness table for FontSource;
  uint64_t v22 = sub_AE98(&v36);
  *uint64_t v22 = UIFontTextStyleSubheadline;
  sub_3E6BC((uint64_t)v22);
  uint64_t v23 = UIFontTextStyleSubheadline;
  uint64_t v24 = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v20, &v36);
  *(void *)&v11[v18] = v24;
  uint64_t v25 = OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_titleLabel;
  id v26 = sub_32438(v24, "ams_primaryText");
  *((void *)&v37 + 1) = v21;
  __int128 v38 = &protocol witness table for FontSource;
  uint64_t v27 = sub_AE98(&v36);
  *uint64_t v27 = UIFontTextStyleBody;
  sub_3E6BC((uint64_t)v27);
  __int128 v28 = UIFontTextStyleBody;
  *(void *)&v11[v25] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v26, &v36);
  uint64_t v29 = OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_gridView;
  __int128 v38 = 0LL;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  memset(v34, 0, sizeof(v34));
  uint64_t v35 = 0LL;
  id v30 = objc_allocWithZone((Class)type metadata accessor for ServicesGridView());
  *(void *)&v11[v29] = sub_8943C(&v36, (uint64_t)v34, 1, v30, 8.0, 20.0, 20.0, 8.0);

  v33.receiver = v11;
  v33.super_class = (Class)type metadata accessor for RecessedPlatterComponent();
  id v31 = objc_msgSendSuper2(&v33, "initWithFrame:", a1, a2, a3, a4);
  sub_825FC((uint64_t)v31);

  return v31;
}

uint64_t sub_81AF8()
{
  uint64_t v5 = type metadata accessor for LayoutRect(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v9 = v8 - v7;
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for RecessedPlatterComponent();
  id v10 = objc_msgSendSuper2(&v20, "layoutSubviews");
  id v11 = sub_118D0((uint64_t)v10, "contentView");
  [v11 bounds];
  sub_11878();

  double v12 = sub_82EF8();
  CGRect.subtracting(insets:)(v12, v13, v14, v15, v1, v2, v3, v4);
  sub_11878();
  sub_82020(v19);
  id v16 = sub_ACA0(v19, v19[3]);
  id v17 = sub_118D0((uint64_t)v16, "contentView");
  dispatch thunk of Layout.placeChildren(relativeTo:in:)(v1, v2, v3, v4);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v19);
}

double sub_81C74(double a1, double a2, float a3)
{
  double v5 = sub_82EF8();
  double v6 = CGSize.subtracting(insets:)(v5);
  double v8 = v7;
  sub_82020(v15);
  uint64_t v9 = sub_ACA0(v15, v15[3]);
  id v10 = sub_118D0((uint64_t)v9, "contentView");
  Measurable.measuredSize(fitting:in:)(v6, v8);

  double v11 = sub_82EF8();
  double v12 = CGSize.adding(outsets:)(v11);
  if (a3 == 1000.0) {
    double v13 = a1;
  }
  else {
    double v13 = v12;
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v15);
  return v13;
}

uint64_t sub_81DF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecessedPlatterComponent();
  objc_msgSendSuper2(&v2, "prepareForReuse");
  sub_2AD7C(**(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_titleLabel]);
  sub_2AD7C(**(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_subtitleLabel]);
  sub_99518();
  return sub_98A90((uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_81EBC(uint64_t a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for RecessedPlatterComponent();
  id v3 = objc_msgSendSuper2(&v7, "traitCollectionDidChange:", a1);
  id v4 = sub_32438((uint64_t)v3, "traitCollection");
  id v5 = [v4 preferredContentSizeCategory];

  sub_829B8((uint64_t)v5);
  sub_82F38();
  return sub_82F2C(OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize);
}

uint64_t sub_81FC4(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 16))
  {
    id v3 = sub_2C144(result);
    sub_98FD0((uint64_t)v3, a2);
    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t sub_82020@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1;
  double v75 = a1;
  uint64_t v82 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v76 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  sub_B058();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v6;
  __chkstk_darwin(v6);
  sub_B058();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v73 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  id v17 = (char *)&v60 - v16;
  uint64_t v71 = sub_44DC(&qword_F3E90);
  uint64_t v74 = v13;
  uint64_t v18 = *(unsigned __int8 *)(v13 + 80);
  uint64_t v65 = *(void *)(v13 + 72);
  uint64_t v69 = (v18 + 32) & ~v18;
  uint64_t v70 = v18 | 7;
  uint64_t v19 = swift_allocObject(v71, v69 + 3 * v65, v18 | 7);
  __int128 v80 = xmmword_B5060;
  *(_OWORD *)(v19 + swift_weakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v20 = static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v19);
  static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v20);
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v21);
  uint64_t v88 = v19;
  unint64_t v22 = sub_13958();
  unint64_t v67 = v22;
  uint64_t v23 = sub_44DC(&qword_F3EA0);
  uint64_t v66 = v23;
  unint64_t v68 = sub_11744();
  uint64_t v24 = v17;
  uint64_t v64 = v12;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v88, v23, v68, v12, v22);
  uint64_t v25 = sub_44DC(&qword_F3E88);
  uint64_t v26 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
  uint64_t v62 = *(void *)(v26 + 72);
  uint64_t v27 = *(unsigned __int8 *)(v26 + 80);
  uint64_t v28 = (v27 + 32) & ~v27;
  uint64_t v29 = swift_allocObject(v25, v28 + 3 * v62, v27 | 7);
  uint64_t v72 = v29;
  *(_OWORD *)(v29 + swift_weakDestroy(v0 + 16) = v80;
  uint64_t v30 = v29 + v28;
  id v31 = *(void **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_titleLabel);
  uint64_t v61 = type metadata accessor for DynamicLabel(0LL);
  uint64_t v89 = v61;
  __int128 v90 = &protocol witness table for UIView;
  uint64_t v88 = (uint64_t)v31;
  uint64_t v86 = &type metadata for Double;
  unint64_t v87 = &protocol witness table for Double;
  uint64_t v84 = &protocol witness table for Double;
  uint64_t v85 = 0LL;
  v83[4] = &type metadata for Double;
  v83[1] = 0LL;
  LODWORD(v80) = enum case for VerticalFlowLayout.VerticalPlacement.top(_:);
  double v79 = *(void (**)(uint64_t))(v7 + 104);
  v79(v11);
  int v78 = enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:);
  uint64_t v32 = v76;
  uint64_t v77 = *(void (**)(uint64_t))(v76 + 104);
  uint64_t v33 = v82;
  v77(v5);
  id v34 = v31;
  uint64_t v35 = sub_2AD60();
  uint64_t v63 = v24;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v35,  v36,  v37,  v11,  v5,  v24);
  uint64_t v76 = *(void *)(v32 + 8);
  ((void (*)(uint64_t, uint64_t))v76)(v5, v33);
  __int128 v38 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v38(v11, v8);
  sub_2ADB4();
  sub_2AD48();
  uint64_t v39 = v62;
  uint64_t v40 = *(void **)(v81 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_subtitleLabel);
  uint64_t v89 = v61;
  __int128 v90 = &protocol witness table for UIView;
  uint64_t v88 = (uint64_t)v40;
  uint64_t v86 = &type metadata for CGFloat;
  unint64_t v87 = &protocol witness table for CGFloat;
  uint64_t v84 = 0LL;
  uint64_t v85 = 0LL;
  sub_82F44();
  sub_154F4((uint64_t)&v92);
  sub_154F4((uint64_t)&v91);
  id v41 = v40;
  uint64_t v42 = sub_2AD60();
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v42,  v43,  v44,  v11,  v5,  v24);
  sub_82F18();
  v38(v11, v8);
  sub_2ADB4();
  sub_2AD48();
  uint64_t v62 = v30 + 2 * v39;
  uint64_t v45 = *(void **)(v81 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_gridView);
  uint64_t v89 = type metadata accessor for ServicesGridView();
  __int128 v90 = &protocol witness table for UIView;
  uint64_t v88 = (uint64_t)v45;
  unint64_t v87 = &protocol witness table for CGFloat;
  uint64_t v86 = &type metadata for CGFloat;
  uint64_t v84 = 0LL;
  uint64_t v85 = 0x4020000000000000LL;
  sub_82F44();
  sub_154F4((uint64_t)&v92);
  sub_154F4((uint64_t)&v91);
  uint64_t v46 = swift_allocObject(v71, v69 + v65, v70);
  *(_OWORD *)(v46 + swift_weakDestroy(v0 + 16) = xmmword_B5B40;
  id v47 = v45;
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v48);
  v83[0] = v46;
  uint64_t v49 = v73;
  uint64_t v50 = v64;
  dispatch thunk of SetAlgebra.init<A>(_:)(v83, v66, v68, v64, v67);
  uint64_t v51 = sub_2AD60();
  uint64_t v52 = v49;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v51,  v53,  v54,  v11,  v5,  v49);
  __int128 v55 = *(void (**)(char *, uint64_t))(v74 + 8);
  v55(v52, v50);
  sub_82F18();
  v38(v11, v8);
  sub_2ADB4();
  sub_2AD48();
  uint64_t v56 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v57 = v75;
  v75[3] = v56;
  v57[4] = &protocol witness table for VerticalFlowLayout;
  v57[5] = &protocol witness table for VerticalFlowLayout;
  sub_AE98(v57);
  __n128 v58 = VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, v72);
  return ((uint64_t (*)(char *, uint64_t, __n128))v55)(v63, v50, v58);
}

void sub_825FC(uint64_t a1)
{
  uint64_t v2 = v1;
  id v3 = sub_118D0(a1, "contentView");
  [v3 setBackgroundColor:*(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_platterColor)];

  id v4 = sub_117FC();
  sub_AD130(12.0);

  id v5 = sub_117FC();
  id v6 = [v5 layer];

  id v7 = objc_msgSend((id)objc_opt_self(UIColor), "ams_tertiaryText");
  id v8 = [v7 CGColor];

  [v6 setBorderColor:v8];
  id v9 = sub_117FC();
  id v10 = [v9 layer];

  [v10 setBorderWidth:1.0];
  id v11 = sub_117FC();
  sub_82F24(v11);

  id v12 = sub_117FC();
  sub_82F24(v12);

  id v13 = sub_117FC();
  sub_82F24(v13);

  sub_82810();
  id v14 = sub_117FC();
  [v14 setIsAccessibilityElement:1];

  id v15 = sub_117FC();
  [v15 setAccessibilityTraits:UIAccessibilityTraitNone];
}

uint64_t sub_82810()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent_gridView];
  id v3 = [v1 traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  sub_829B8((uint64_t)v4);
  sub_82F38();
  sub_82F2C(OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize);
  *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns) = 1LL;
  sub_98994();
  return sub_98A70((uint64_t)sub_828C0, 0LL);
}

void sub_828C0(uint64_t a1)
{
  *(_BYTE *)(a1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_contentAlignment) = 1;
  uint64_t v2 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView;
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                             + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView), "layer"));
  id v4 = objc_msgSend((id)objc_opt_self(UIColor), "ams_clear");
  id v5 = [v4 CGColor];

  [v3 setBorderColor:v5];
  id v6 = [*(id *)(a1 + v2) layer];
  [v6 setBorderWidth:0.0];
}

double sub_829B8(uint64_t a1)
{
  uint64_t v4 = sub_82EDC();
  if (v2 == v4 && v1 == v5) {
    goto LABEL_67;
  }
  sub_82EC0(v4, v5);
  sub_82EEC();
  sub_7EDF0();
  if ((v2 & 1) == 0)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraExtraLarge);
    uint64_t v8 = sub_82EDC();
    if (v2 != v8 || v1 != v9)
    {
      sub_82EC0(v8, v9);
      sub_82EEC();
      sub_7EDF0();
      if ((v2 & 1) != 0) {
        return 40.0;
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityExtraLarge);
      uint64_t v11 = sub_82EDC();
      if (v2 != v11 || v1 != v12)
      {
        sub_82EC0(v11, v12);
        sub_82EEC();
        sub_7EDF0();
        if ((v2 & 1) != 0) {
          return 40.0;
        }
        static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityLarge);
        uint64_t v14 = sub_82EDC();
        if (v2 != v14 || v1 != v15)
        {
          sub_82EC0(v14, v15);
          sub_82EEC();
          sub_7EDF0();
          if ((v2 & 1) != 0) {
            return 40.0;
          }
          static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryAccessibilityMedium);
          uint64_t v17 = sub_82EDC();
          double v7 = 30.0;
          if (v2 != v17 || v1 != v18)
          {
            sub_82EC0(v17, v18);
            sub_82EEC();
            sub_7EDF0();
            if ((v2 & 1) != 0) {
              return v7;
            }
            static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraExtraExtraLarge);
            uint64_t v20 = sub_82EDC();
            double v7 = 20.0;
            if (v2 != v20 || v1 != v21)
            {
              sub_82EC0(v20, v21);
              sub_82EEC();
              sub_7EDF0();
              if ((v2 & 1) != 0) {
                return v7;
              }
              static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraExtraLarge);
              uint64_t v23 = sub_82EDC();
              if (v2 != v23 || v1 != v24)
              {
                sub_82EC0(v23, v24);
                sub_82EEC();
                sub_7EDF0();
                if ((v2 & 1) != 0) {
                  return v7;
                }
                static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraLarge);
                uint64_t v26 = sub_82EDC();
                if (v2 != v26 || v1 != v27)
                {
                  sub_82EC0(v26, v27);
                  sub_82EEC();
                  sub_7EDF0();
                  if ((v2 & 1) != 0) {
                    return v7;
                  }
                  static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryLarge);
                  uint64_t v29 = sub_82EDC();
                  if (v2 != v29 || v1 != v30)
                  {
                    sub_82EC0(v29, v30);
                    sub_82EEC();
                    sub_7EDF0();
                    if ((v2 & 1) != 0) {
                      return v7;
                    }
                    static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryMedium);
                    uint64_t v32 = sub_82EDC();
                    if (v2 != v32 || v1 != v33)
                    {
                      sub_82EC0(v32, v33);
                      sub_82EEC();
                      sub_7EDF0();
                      if ((v2 & 1) != 0) {
                        return v7;
                      }
                      static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategorySmall);
                      uint64_t v35 = sub_82EDC();
                      if (v2 != v35 || v1 != v36)
                      {
                        sub_82EC0(v35, v36);
                        sub_82EEC();
                        sub_7EDF0();
                        if ((v2 & 1) != 0) {
                          return v7;
                        }
                        static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryExtraSmall);
                        uint64_t v38 = sub_82EDC();
                        if (v2 != v38 || v1 != v39)
                        {
                          sub_82EC0(v38, v39);
                          sub_82EEC();
                          sub_7EDF0();
                          if ((v2 & 1) != 0) {
                            return v7;
                          }
                          uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIContentSizeCategoryUnspecified);
                          uint64_t v43 = v42;
                          uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
                          if (v41 != v44 || v43 != v45) {
                            _stringCompareWithSmolCheck(_:_:expecting:)(v41, v43, v44, v45, 0LL);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }

LABEL_68:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return v7;
        }
      }
    }

LABEL_67:
    double v7 = 40.0;
    goto LABEL_68;
  }

  return 40.0;
}

  __break(1u);
  return result;
}

void sub_82CA8()
{
}

id sub_82CE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RecessedPlatterComponent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for RecessedPlatterComponent()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin24RecessedPlatterComponent);
}

id sub_82D88(void *a1)
{
  id v2 = [a1 container];
  swift_getObjectType(v2);
  sub_6F780();
  double v4 = v3;
  swift_unknownObjectRelease(v2);
  id v5 = [a1 container];
  [v5 contentSize];
  double v7 = v6;
  swift_unknownObjectRelease(v5);
  uint64_t v8 = (void *)objc_opt_self(&OBJC_CLASS___NSCollectionLayoutDimension);
  id v9 = objc_msgSend(v8, "absoluteDimension:", fmax(v7 - (v4 + v4), 360.0));
  id v10 = [v8 estimatedDimension:200.0];
  id v11 =  [(id)objc_opt_self(NSCollectionLayoutSize) sizeWithWidthDimension:v9 heightDimension:v10];

  return v11;
}

id sub_82EAC(void *a1)
{
  return sub_82D88(a1);
}

uint64_t sub_82EC0(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(v3, v2, a1, a2, 0LL);
}

uint64_t sub_82EDC()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

uint64_t sub_82EEC()
{
  return swift_bridgeObjectRelease(v0);
}

double sub_82EF8()
{
  return 12.0;
}

id sub_82F0C(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v1 + 496), 0.5);
}

uint64_t sub_82F18()
{
  return (*(uint64_t (**)(void))(v0 - 288))();
}

id sub_82F24(void *a1)
{
  return [a1 *(SEL *)(v1 + 8)];
}

uint64_t sub_82F2C@<X0>(uint64_t a1@<X8>)
{
  double v4 = (void *)(v1 + a1);
  *double v4 = v2;
  v4[1] = v3;
  return sub_995C8();
}

double sub_82F38()
{
  return result;
}

uint64_t sub_82F44()
{
  *(_OWORD *)(v1 - 208) = 0u;
  *(_OWORD *)(v1 - 192) = 0u;
  return v0;
}

char *sub_82F58(double a1, double a2, double a3, double a4)
{
  id v9 = (char *)objc_allocWithZone((Class)sub_119B4());
  id v10 = sub_97848(0, v9, a1, a2, a3, a4, 0.0);
  uint64_t v11 = sub_119B4();
  swift_deallocPartialClassInstance(v4, v11, 57LL, 7LL);
  return v10;
}

void sub_82FF8()
{
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView;
  *(void *)&v0[v1] = objc_msgSend(objc_allocWithZone(UIImageView), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceBadgeView.swift",  43LL,  2LL,  54LL,  0);
  __break(1u);
}

id sub_830A4(char a1)
{
  v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_alignment] = a1;
  return [v1 setNeedsLayout];
}

id sub_830C0(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  swift_getObjectType(v4);
  uint64_t v8 = *(void **)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView];
  id v9 = (void *)sub_8314C(a1, a2, a3);
  [v8 setImage:v9];

  return [v4 setNeedsLayout];
}

uint64_t sub_8314C(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for SymbolFactory(0LL);
  swift_allocObject(v5, 24LL, 7LL);
  uint64_t v6 = SymbolFactory.init(asPartOf:)(a3);
  uint64_t v7 = sub_9B68C(a1);
  uint64_t v9 = v8;
  id v10 = (void *)objc_opt_self(&OBJC_CLASS___UIImageSymbolConfiguration);
  id v11 = objc_msgSend(v10, "_defaultConfiguration", swift_retain(a3).n128_f64[0]);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, id))(*(void *)v6 + 120LL))(v7, v9, v11);
  swift_release();
  swift_bridgeObjectRelease();

  return v12;
}

id sub_83218()
{
  v30.receiver = v0;
  v30.super_class = (Class)sub_119B4();
  objc_msgSendSuper2(&v30, "layoutSubviews");
  [v0 bounds];
  sub_11878();
  [v0 layoutMargins];
  CGRect.subtracting(insets:)(v5, v6, v7, v8, v1, v2, v3, v4);
  sub_11878();
  uint64_t v9 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView];
  id v10 = [v9 image];
  double v11 = sub_18700();
  double v17 = sub_83330(v12, v13, v11, v14, v15, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  v24.n128_f64[0] = sub_18700();
  v25.n128_f64[0] = v17;
  return objc_msgSend( v9,  "setFrame:",  CGRect.withLayoutDirection(in:relativeTo:)(v24, v26, v27, v28, v25, v19, v21, v23));
}

double sub_83330(void *a1, char a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v11 = sub_8349C(a1);
  CGFloat v12 = a3;
  CGFloat v13 = a4;
  CGFloat v14 = a5;
  CGFloat v15 = a6;
  if (a2)
  {
    if (a2 == 1) {
      double MinX = CGRectGetMidX(*(CGRect *)&v12) + v11 * -0.5;
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v12) - v11;
    }
  }

  else
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v12);
  }

  v18.origin.x = a3;
  v18.origin.y = a4;
  v18.size.CGFloat width = a5;
  v18.size.CGFloat height = a6;
  CGRectGetMinY(v18);
  return MinX;
}

void sub_83428()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView), "image"));
  sub_8349C(v1);
}

double sub_8349C(void *a1)
{
  uint64_t v3 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __n128 v5 = __chkstk_darwin(v3);
  double v7 = (char *)&v20[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for AspectRatio(0LL, v5);
  uint64_t v9 = *(void *)(v8 - 8);
  *(void *)&double v10 = __chkstk_darwin(v8).n128_u64[0];
  CGFloat v12 = (char *)&v20[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1) {
    return 0.0;
  }
  AspectRatio.init(_:_:)(objc_msgSend(a1, "size", v10));
  sub_460C(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_referenceLineHeight, (uint64_t)v20);
  uint64_t v13 = v21;
  uint64_t v14 = v22;
  sub_ACA0(v20, v21);
  j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v13, v14);
  double v15 = AnyDimension.value(in:rounded:)(v1, v7, v13, v14);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  uint64_t v16 = _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v20);
  double v17 = AspectRatio.width(fromHeight:)(v16, v15);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  return v17;
}

uint64_t type metadata accessor for ServiceBadgeView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin16ServiceBadgeView);
}

uint64_t storeEnumTagSinglePayload for ServiceBadgeView.Alignment( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_83708 + 4 * byte_BAED5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_8373C + 4 * byte_BAED0[v4]))();
}

uint64_t sub_8373C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_83744(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x8374CLL);
  }
  return result;
}

uint64_t sub_83758(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x83760LL);
  }
  *(_BYTE *)double result = a2 + 2;
  return result;
}

uint64_t sub_83764(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8376C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceBadgeView.Alignment()
{
  return &type metadata for ServiceBadgeView.Alignment;
}

unint64_t sub_8378C()
{
  unint64_t result = qword_F7458;
  if (!qword_F7458)
  {
    unint64_t result = swift_getWitnessTable(&unk_BAF3C, &type metadata for ServiceBadgeView.Alignment);
    atomic_store(result, (unint64_t *)&qword_F7458);
  }

  return result;
}

uint64_t ServiceDetailLayout.init(metrics:artworkView:titleLabelView:detailLabelView:)@<X0>( void *__src@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  return sub_7CF4(a4, a5 + 80);
}

Swift::Int ServiceProductPageLayout.DetailsPosition.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_8386C()
{
  return ServiceProductPageLayout.DetailsPosition.hashValue.getter(*v0);
}

uint64_t ServiceDetailLayout.Metrics.init(artworkSize:detailLabelTopSpace:horizontalSpace:contentAlignment:)@<X0>( __int128 *a1@<X0>, __int128 *a2@<X1>, char a3@<W2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>)
{
  char v8 = a3 & 1;
  *(double *)a4 = a5;
  *(double *)(a4 + 8) = a6;
  sub_7CF4(a1, a4 + 16);
  uint64_t result = sub_7CF4(a2, a4 + 56);
  *(_BYTE *)(a4 + 96) = v8;
  return result;
}

uint64_t ServiceDetailLayout.Metrics.detailLabelTopSpace.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 16, a1);
}

uint64_t ServiceDetailLayout.Metrics.detailLabelTopSpace.setter(__int128 *a1)
{
  int v3 = (void *)(v1 + 16);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v3);
  return sub_1543C(a1, (uint64_t)v3);
}

uint64_t ServiceDetailLayout.Metrics.horizontalSpace.setter(__int128 *a1)
{
  int v3 = (void *)(v1 + 56);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v3);
  return sub_1543C(a1, (uint64_t)v3);
}

uint64_t ServiceDetailLayout.Metrics.contentAlignment.getter()
{
  return *(unsigned __int8 *)(v0 + 96);
}

uint64_t ServiceDetailLayout.Metrics.contentAlignment.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 96) = result & 1;
  return result;
}

uint64_t ServiceDetailLayout.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_83950(v1 + 120, a1);
}

uint64_t sub_83950(uint64_t a1, uint64_t a2)
{
  return a2;
}

double ServiceDetailLayout.measurements(fitting:in:)(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType(a1);
  return sub_83A60(0LL, a1, v1, ObjectType);
}

uint64_t ServiceDetailLayout.placeChildren(relativeTo:in:)(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType(v4);
  sub_83A60(1LL, a1, v1, ObjectType);
  sub_84CC4();
  return LayoutRect.init(origin:measurements:)(v2);
}

double sub_83A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v119 = a4;
  uint64_t v134 = a2;
  sub_21FAC();
  int v133 = v9;
  uint64_t v10 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v129 = *(void *)(v10 - 8);
  sub_B088();
  __chkstk_darwin(v11);
  sub_154AC();
  uint64_t v128 = v12;
  uint64_t v13 = sub_84CA0();
  uint64_t v14 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(v13);
  uint64_t v124 = *(void *)(v14 - 8);
  uint64_t v125 = v14;
  sub_B088();
  __chkstk_darwin(v15);
  sub_154AC();
  uint64_t v123 = v16;
  uint64_t v17 = sub_84CA0();
  uint64_t v122 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(v17);
  uint64_t v130 = *(void *)(v122 - 8);
  sub_B088();
  __chkstk_darwin(v18);
  sub_154AC();
  uint64_t v121 = v19;
  uint64_t v20 = sub_84CA0();
  uint64_t v21 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(v20);
  uint64_t v131 = *(void *)(v21 - 8);
  uint64_t v132 = v21;
  sub_B088();
  __chkstk_darwin(v22);
  sub_154AC();
  uint64_t v120 = v23;
  uint64_t v24 = sub_84CA0();
  uint64_t v25 = type metadata accessor for VerticalFlowLayout.Child(v24);
  uint64_t v126 = *(void *)(v25 - 8);
  uint64_t v127 = v25;
  sub_B088();
  __chkstk_darwin(v26);
  v118 = &v112[-((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v28);
  __int128 v117 = &v112[-v29];
  uint64_t v30 = sub_84CA0();
  uint64_t v31 = type metadata accessor for FloatingPointRoundingRule(v30);
  __chkstk_darwin(v31);
  uint64_t v33 = &v112[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v35 = *(void *)(a3 + 64);
  uint64_t v34 = *(void *)(a3 + 72);
  uint64_t v115 = (void *)(a3 + 40);
  sub_ACA0((void *)(a3 + 40), v35);
  LOBYTE(v34) = dispatch thunk of LayoutView.isHidden.getter(v35, *(void *)(v34 + 8));
  sub_84824(a3, (uint64_t)v146);
  if ((v34 & 1) != 0)
  {
    uint64_t v36 = 0LL;
  }

  else
  {
    uint64_t v37 = v148;
    uint64_t v38 = v149;
    sub_ACA0(v147, v148);
    uint64_t v36 = dispatch thunk of LayoutView.hasContent.getter(v37, *(void *)(v38 + 8));
  }

  sub_84858(v146);
  uint64_t v40 = *(void *)(a3 + 104);
  uint64_t v39 = *(void *)(a3 + 112);
  __int128 v116 = (void *)(a3 + 80);
  sub_ACA0((void *)(a3 + 80), v40);
  LOBYTE(v39) = dispatch thunk of LayoutView.isHidden.getter(v40, *(void *)(v39 + 8));
  sub_84824(a3, (uint64_t)v142);
  if ((v39 & 1) != 0)
  {
    sub_84858(v142);
    if ((v36 & 1) != 0)
    {
      uint64_t v114 = v10;
      int v113 = 0;
LABEL_9:
      double v44 = *(double *)(a3 + 120);
      uint64_t v45 = *(void *)(a3 + 200);
      uint64_t v46 = *(void *)(a3 + 208);
      sub_ACA0((void *)(a3 + 176), v45);
      j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v45, v46);
      uint64_t v47 = v134;
      double v48 = AnyDimension.value(in:rounded:)(v134, v33, v45, v46);
      sub_84CD8();
      double v49 = v44 + v48;
      CGRect.subtracting(insets:)(0.0, v49, 0.0, 0.0, v7, v6, v5, v4);
      sub_84CC4();
      v50.n128_f64[0] = sub_1BE3C();
      CGRect.withLayoutDirection(in:relativeTo:)(v50, v51, v52, v53, v54, v55, v56, v57);
      double v59 = v58;
      double v61 = v60;
      uint64_t v62 = *(void *)(a3 + 160);
      uint64_t v63 = *(void *)(a3 + 168);
      sub_ACA0((void *)(a3 + 136), v62);
      j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v62, v63);
      double v64 = AnyDimension.value(in:rounded:)(v47, v33, v62, v63);
      sub_84CD8();
      if ((v36 & 1) != 0)
      {
        uint64_t v65 = *(void *)(a3 + 72);
        sub_ACA0(v115, *(void *)(a3 + 64));
        uint64_t v66 = sub_84C50();
        sub_84C8C((uint64_t)v66);
        v139 = &type metadata for Double;
        v140 = &protocol witness table for Double;
        uint64_t v137 = 0LL;
        v138[0] = 0LL;
        double v67 = sub_84CAC();
        uint64_t v68 = v120;
        v69(v120, v67);
        uint64_t v70 = v130;
        uint64_t v71 = v121;
        uint64_t v72 = v122;
        (*(void (**)(uint64_t, void, uint64_t))(v130 + 104))( v121,  enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:),  v122);
        uint64_t v73 = sub_44DC(&qword_F3E90);
        uint64_t v74 = (__n128 *)sub_84C30(v73);
        sub_84CE4(v74, (__n128)xmmword_B5B40);
        v135 = v74;
        sub_13958();
        sub_44DC(&qword_F3EA0);
        unint64_t v75 = sub_11744();
        sub_84C0C(v75);
        static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v141,  v138,  v136,  v68,  v71,  v65);
        sub_84C80(*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
        (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v72);
        (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v68, v132);
        sub_11788((uint64_t)v136);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v138);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v141);
        sub_41630(0, 1LL, 1, (uint64_t)_swiftEmptyArrayStorage);
        uint64_t v77 = v76;
        unint64_t v78 = v76[3];
        if (v76[2] >= v78 >> 1)
        {
          sub_84C68(v78);
          uint64_t v77 = v109;
        }

        sub_84BE0();
      }

      else
      {
        uint64_t v77 = _swiftEmptyArrayStorage;
      }

      if ((v113 & 1) != 0)
      {
        uint64_t v90 = *(void *)(a3 + 112);
        sub_ACA0(v116, *(void *)(a3 + 104));
        uint64_t v91 = sub_84C50();
        sub_84C8C((uint64_t)v91);
        v139 = &type metadata for CGFloat;
        v140 = &protocol witness table for CGFloat;
        *(double *)v138 = v64;
        uint64_t v137 = 0LL;
        double v92 = sub_84CAC();
        uint64_t v93 = v120;
        v94(v120, v92);
        uint64_t v96 = v121;
        uint64_t v95 = v122;
        (*(void (**)(uint64_t, void, uint64_t))(v130 + 104))( v121,  enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:),  v122);
        uint64_t v97 = sub_44DC(&qword_F3E90);
        uint64_t v98 = (__n128 *)sub_84C30(v97);
        sub_84CE4(v98, (__n128)xmmword_B5B40);
        v135 = v98;
        sub_13958();
        sub_44DC(&qword_F3EA0);
        unint64_t v99 = sub_11744();
        sub_84C0C(v99);
        static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v141,  v138,  v136,  v93,  v96,  v90);
        sub_84C80(*(uint64_t (**)(uint64_t, uint64_t))(v36 + 8));
        (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v96, v95);
        (*(void (**)(uint64_t, uint64_t))(v131 + 8))(v93, v132);
        sub_11788((uint64_t)v136);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v138);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v141);
        if ((swift_isUniquelyReferenced_nonNull_native(v77) & 1) == 0)
        {
          sub_41630(0, v77[2] + 1LL, 1, (uint64_t)v77);
          uint64_t v77 = v110;
        }

        unint64_t v100 = v77[3];
        if (v77[2] >= v100 >> 1)
        {
          sub_84C68(v100);
          uint64_t v77 = v111;
        }

        sub_84BE0();
      }

      VerticalFlowLayout.init(expandChildrenToFit:children:)(0LL, v77);
      double v102 = VerticalFlowLayout.measurements(fitting:in:)(v134, v59, v61);
      if ((v133 & 1) != 0)
      {
        if ((*(_BYTE *)(a3 + 216) & 1) != 0 && v101 >= *(double *)(a3 + 128))
        {
          double v103 = sub_1BE3C();
          sub_84A54(v104, v134, v103, v105, v106, v107, v49);
        }

        else
        {
          sub_84884(a3, v134, v101, v7, v6, v5, v4, v49);
        }
      }

      double v89 = v49 + v102;
      sub_84C80(*(uint64_t (**)(uint64_t, uint64_t))(v129 + 8));
      return v89;
    }
  }

  else
  {
    uint64_t v42 = v144;
    uint64_t v41 = v145;
    sub_ACA0(v143, v144);
    int v43 = dispatch thunk of LayoutView.hasContent.getter(v42, *(void *)(v41 + 8));
    sub_84858(v142);
    if (((v36 | v43) & 1) != 0)
    {
      uint64_t v114 = v10;
      int v113 = v36 ^ 1 | v43;
      goto LABEL_9;
    }
  }

  if ((v133 & 1) != 0)
  {
    uint64_t v79 = *(void *)(a3 + 24);
    sub_ACA0((void *)a3, v79);
    v150.origin.x = sub_1BE3C();
    CGFloat MinX = CGRectGetMinX(v150);
    v151.origin.x = sub_1BE3C();
    CGRectGetMinY(v151);
    v81.n128_f64[0] = sub_1BE3C();
    v82.n128_f64[0] = MinX;
    CGRect.withLayoutDirection(in:relativeTo:)(v81, v83, v84, v85, v82, v86, v87, v88);
    dispatch thunk of LayoutView.frame.setter(v79);
  }

  return *(double *)(a3 + 120);
}

unint64_t sub_841E4()
{
  unint64_t result = qword_F7460;
  if (!qword_F7460)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ServiceDetailLayout.Metrics.ContentAlignment,  &type metadata for ServiceDetailLayout.Metrics.ContentAlignment);
    atomic_store(result, (unint64_t *)&qword_F7460);
  }

  return result;
}

unint64_t sub_84224()
{
  unint64_t result = qword_F7468;
  if (!qword_F7468)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ServiceDetailLayout,  &type metadata for ServiceDetailLayout);
    atomic_store(result, (unint64_t *)&qword_F7468);
  }

  return result;
}

uint64_t destroy for ServiceDetailLayout(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 22);
}

uint64_t initializeWithCopy for ServiceDetailLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  __int128 v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  __int128 v7 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 160) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 136, a2 + 136);
  __int128 v8 = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 200) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 176, a2 + 176);
  *(_BYTE *)(a1 + 2swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 216);
  return a1;
}

uint64_t assignWithCopy for ServiceDetailLayout(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  sub_4290((void *)(a1 + 136), (void *)(a2 + 136));
  sub_4290((void *)(a1 + 176), (void *)(a2 + 176));
  *(_BYTE *)(a1 + 2swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 216);
  return a1;
}

void *initializeWithTake for ServiceDetailLayout(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xD9uLL);
}

uint64_t assignWithTake for ServiceDetailLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 80));
  __int128 v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 136));
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 176));
  __int128 v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 192) = v6;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  *(_BYTE *)(a1 + 2swift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + 216);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceDetailLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 217))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceDetailLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 2swift_weakDestroy(v0 + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 217) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 217) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for ServiceDetailLayout()
{
}

uint64_t destroy for ServiceDetailLayout.Metrics(uint64_t a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
}

uint64_t initializeWithCopy for ServiceDetailLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __int128 v4 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 16, a2 + 16);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 56, a2 + 56);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t assignWithCopy for ServiceDetailLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  sub_4290((void *)(a1 + 16), (void *)(a2 + 16));
  sub_4290((void *)(a1 + 56), (void *)(a2 + 56));
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

void *initializeWithTake for ServiceDetailLayout.Metrics(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t assignWithTake for ServiceDetailLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 16));
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceDetailLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 97))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceDetailLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 97) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 40) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 97) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for ServiceDetailLayout.Metrics()
{
}

uint64_t storeEnumTagSinglePayload for ServiceDetailLayout.Metrics.ContentAlignment( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_847A8 + 4 * byte_BAF95[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_847DC + 4 * asc_BAF90[v4]))();
}

uint64_t sub_847DC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_847E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x847ECLL);
  }
  return result;
}

uint64_t sub_847F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x84800LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_84804(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8480C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ServiceDetailLayout.Metrics.ContentAlignment()
{
}

uint64_t sub_84824(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_84858(void *a1)
{
  return a1;
}

uint64_t sub_84884( uint64_t a1, uint64_t a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  double v47 = a8;
  uint64_t v15 = type metadata accessor for LayoutRect(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v46 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  double v19 = *(double *)(a1 + 128);
  if (v19 > a3) {
    double v20 = *(double *)(a1 + 128);
  }
  else {
    double v20 = a3;
  }
  double v46 = v20;
  double v21 = round((v20 - v19) * 0.5);
  uint64_t v22 = *(void *)(a1 + 24);
  sub_ACA0((void *)a1, v22);
  v48.origin.x = a4;
  v48.origin.y = a5;
  v48.size.CGFloat width = a6;
  v48.size.CGFloat height = a7;
  CGFloat MinX = CGRectGetMinX(v48);
  v49.origin.x = a4;
  v49.origin.y = a5;
  v49.size.CGFloat width = a6;
  v49.size.CGFloat height = a7;
  double v24 = CGRectGetMinY(v49) + v21;
  v25.n128_f64[0] = a4;
  v26.n128_f64[0] = a5;
  v27.n128_f64[0] = a6;
  v28.n128_f64[0] = a7;
  v29.n128_f64[0] = MinX;
  CGRect.withLayoutDirection(in:relativeTo:)(v25, v26, v27, v28, v29, v24, *(double *)(a1 + 120), v19);
  dispatch thunk of LayoutView.frame.setter(v22);
  v30.n128_u64[0] = CGRect.subtracting(insets:)(round((v46 - a3) * 0.5), v47, 0.0, 0.0, a4, a5, a6, a7);
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37.n128_f64[0] = a4;
  v38.n128_f64[0] = a5;
  v39.n128_f64[0] = a6;
  v40.n128_f64[0] = a7;
  double v41 = CGRect.withLayoutDirection(in:relativeTo:)(v37, v38, v39, v40, v30, v32, v34, v36);
  VerticalFlowLayout.placeChildren(relativeTo:in:)(a2, v41, v42, v43, v44);
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_84A54(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7)
{
  uint64_t v14 = type metadata accessor for LayoutRect(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = *(void *)(a1 + 24);
  sub_ACA0((void *)a1, v18);
  v43.origin.x = a3;
  v43.origin.y = a4;
  v43.size.CGFloat width = a5;
  v43.size.CGFloat height = a6;
  CGFloat MinX = CGRectGetMinX(v43);
  v44.origin.x = a3;
  v44.origin.y = a4;
  v44.size.CGFloat width = a5;
  v44.size.CGFloat height = a6;
  double MinY = CGRectGetMinY(v44);
  v21.n128_f64[0] = a3;
  v22.n128_f64[0] = a4;
  v23.n128_f64[0] = a5;
  v24.n128_f64[0] = a6;
  v25.n128_f64[0] = MinX;
  CGRect.withLayoutDirection(in:relativeTo:)( v21,  v22,  v23,  v24,  v25,  MinY,  *(double *)(a1 + 120),  *(double *)(a1 + 128));
  dispatch thunk of LayoutView.frame.setter(v18);
  v26.n128_u64[0] = CGRect.subtracting(insets:)(0.0, a7, 0.0, 0.0, a3, a4, a5, a6);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33.n128_f64[0] = a3;
  v34.n128_f64[0] = a4;
  v35.n128_f64[0] = a5;
  v36.n128_f64[0] = a6;
  double v37 = CGRect.withLayoutDirection(in:relativeTo:)(v33, v34, v35, v36, v26, v28, v30, v32);
  VerticalFlowLayout.placeChildren(relativeTo:in:)(a2, v37, v38, v39, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_84BE0()
{
  *(void *)(v4 + swift_weakDestroy(v0 + 16) = v1;
  return (*(uint64_t (**)(unint64_t, uint64_t, void))(*(void *)(v0 + 112) + 32LL))( v4 + ((*(unsigned __int8 *)(*(void *)(v0 + 112) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 112) + 80LL))
         + *(void *)(*(void *)(v0 + 112) + 72LL) * v2,
           v3,
           *(void *)(v0 + 120));
}

uint64_t sub_84C0C(uint64_t a1)
{
  return dispatch thunk of SetAlgebra.init<A>(_:)(v1 + 184, v2, a1, *(void *)(v1 + 104), v3);
}

uint64_t sub_84C30(uint64_t a1)
{
  return swift_allocObject( a1,  ((*(unsigned __int8 *)(*(void *)(v1 + 96) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 + 96) + 80LL))
         + *(void *)(*(void *)(v1 + 96) + 72LL),
           *(unsigned __int8 *)(*(void *)(v1 + 96) + 80LL) | 7LL);
}

void *sub_84C50()
{
  v0[37] = v1;
  v0[38] = *(void *)(v2 + 8);
  return sub_AE98(v0 + 34);
}

void sub_84C68(unint64_t a1@<X8>)
{
}

uint64_t sub_84C80@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_84C8C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 16LL))(a1, v2, v1);
}

uint64_t sub_84CA0()
{
  return 0LL;
}

double sub_84CAC()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 208) = 0u;
  return result;
}

  ;
}

uint64_t sub_84CD8()
{
  return v0(v2, v1);
}

uint64_t sub_84CE4(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

char *sub_84CF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4, char a5)
{
  int v29 = a3;
  double v28 = *(double *)&a2;
  uint64_t v8 = type metadata accessor for FontSource(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (UIFontTextStyle *)((char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v12 = type metadata accessor for StaticDimension(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v27 - v17;
  if ((a5 & 1) != 0) {
    double v19 = 22.0;
  }
  else {
    double v19 = *(double *)&a4;
  }
  *uint64_t v11 = UIFontTextStyleBody;
  (*(void (**)(UIFontTextStyle *, void, uint64_t))(v9 + 104))( v11,  enum case for FontSource.textStyle(_:),  v8);
  v30[3] = v8;
  v30[4] = &protocol witness table for FontSource;
  double v20 = sub_AE98(v30);
  (*(void (**)(void *, UIFontTextStyle *, uint64_t))(v9 + 16))(v20, v11, v8);
  __n128 v21 = UIFontTextStyleBody;
  StaticDimension.init(_:scaledLike:)(v30, v19);
  (*(void (**)(UIFontTextStyle *, uint64_t))(v9 + 8))(v11, v8);
  if ((v29 & 1) != 0) {
    double v22 = 64.0;
  }
  else {
    double v22 = *(double *)&a1;
  }
  if ((v29 & 1) != 0) {
    double v23 = 64.0;
  }
  else {
    double v23 = v28;
  }
  __n128 v24 = objc_allocWithZone((Class)type metadata accessor for ServiceDetailView());
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  __n128 v25 = sub_859D8((uint64_t)v16, v24, v22, v23);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  return v25;
}

void sub_84EC8()
{
  v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_contentAlignment] = 0;
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel;
  sub_11998();
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v3 = objc_msgSend(v2, "ams_primaryText");
  uint64_t v4 = type metadata accessor for FontSource(0LL);
  uint64_t v14 = v4;
  uint64_t v15 = &protocol witness table for FontSource;
  __int128 v5 = sub_AE98(v13);
  *__int128 v5 = UIFontTextStyleSubheadline;
  sub_373FC((uint64_t)v5);
  __int128 v6 = UIFontTextStyleSubheadline;
  *(void *)&v0[v1] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v3, v13);
  __int128 v7 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailTop];
  v7[3] = &type metadata for Double;
  v7[4] = &protocol witness table for Double;
  *__int128 v7 = 0LL;
  uint64_t v8 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel;
  id v9 = objc_msgSend(v2, "ams_primaryText");
  uint64_t v14 = v4;
  uint64_t v15 = &protocol witness table for FontSource;
  uint64_t v10 = sub_AE98(v13);
  *uint64_t v10 = UIFontTextStyleHeadline;
  sub_373FC((uint64_t)v10);
  uint64_t v11 = UIFontTextStyleHeadline;
  *(void *)&v0[v8] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v9, v13);
  uint64_t v12 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork];
  void *v12 = 0LL;
  v12[1] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceDetailView.swift",  44LL,  2LL,  40LL,  0);
  __break(1u);
}

void sub_85088(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView);
  *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView) = a1;
}

void sub_8509C(double a1, double a2)
{
  id v3 = v2;
  uint64_t v4 = (double *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize];
  if (*v4 != a1 || v4[1] != a2)
  {
    uint64_t v6 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView;
    [*(id *)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView] removeFromSuperview];
    double v7 = *v4;
    double v8 = v4[1];
    id v9 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView(0LL));
    uint64_t v10 = ArtworkImageView.init(artworkSize:frame:)(v7, v8, 0.0, 0.0, 0.0, 0.0);
    sub_85088(v10);
    [v3 addSubview:*(void *)&v3[v6]];
    sub_85768();
  }

void sub_8515C(double a1, double a2)
{
  id v3 = (double *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize);
  double v4 = *(double *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize);
  double v5 = *(double *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize + 8);
  *id v3 = a1;
  v3[1] = a2;
  sub_8509C(v4, v5);
}

uint64_t sub_8517C(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork + 8);
  *id v3 = a1;
  v3[1] = a2;
  return sub_AC90(v4, v5);
}

void *sub_8519C()
{
  uint64_t v1 = type metadata accessor for LayoutRect(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v23[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = (objc_class *)type metadata accessor for ServiceDetailView();
  v25.receiver = v0;
  v25.super_class = v5;
  id v6 = objc_msgSendSuper2(&v25, "layoutSubviews");
  sub_856D0((uint64_t)v6, (uint64_t)&v24);
  double v7 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView];
  uint64_t v8 = type metadata accessor for ArtworkImageView(0LL);
  v23[4] = &protocol witness table for UIView;
  v23[3] = v8;
  v23[0] = v7;
  id v9 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel];
  uint64_t v10 = sub_11998();
  v23[8] = v10;
  uint64_t v11 = sub_8A80( (unint64_t *)&qword_F3E80,  (uint64_t (*)(uint64_t))&type metadata accessor for DynamicLabel,  (uint64_t)&protocol conformance descriptor for DynamicLabel);
  v23[5] = v9;
  uint64_t v12 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel];
  v23[13] = v10;
  v23[14] = v11;
  v23[9] = v11;
  v23[10] = v12;
  id v13 = v7;
  id v14 = v9;
  id v15 = v12;
  [v0 bounds];
  double v17 = v16;
  sub_85D04(1, (uint64_t)v0, (uint64_t)v23, v16, v18, v19, v20);
  LayoutRect.init(origin:measurements:)(v17);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_84858(v23);
}

double sub_85370(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView);
  void v13[3] = type metadata accessor for ArtworkImageView(0LL);
  v13[4] = &protocol witness table for UIView;
  v13[0] = v3;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel);
  uint64_t v14 = sub_11998();
  uint64_t v5 = sub_8A80( (unint64_t *)&qword_F3E80,  (uint64_t (*)(uint64_t))&type metadata accessor for DynamicLabel,  (uint64_t)&protocol conformance descriptor for DynamicLabel);
  v13[5] = v4;
  id v6 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel);
  uint64_t v17 = v14;
  uint64_t v18 = v5;
  uint64_t v15 = v5;
  double v16 = v6;
  uint64_t ObjectType = swift_getObjectType(a1);
  id v8 = v3;
  id v9 = v4;
  id v10 = v6;
  double v11 = sub_83A60(0LL, a1, (uint64_t)v13, ObjectType);
  sub_84858(v13);
  return v11;
}

void sub_85528(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_4968((uint64_t)&unk_E5A70, 24LL);
  swift_weakInit(v5 + 16, a1);
  uint64_t v6 = sub_4968((uint64_t)&unk_E5A98, 24LL);
  swift_weakInit(v6 + 16, a2);
  uint64_t v7 = sub_4968((uint64_t)&unk_E5AC0, 32LL);
  *(void *)(v7 + swift_weakDestroy(v0 + 16) = v5;
  *(void *)(v7 + 24) = v6;
  sub_8517C((uint64_t)sub_85CFC, v7);
  uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork);
  if (v8)
  {
    uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork + 8);
    id v10 = *(void **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView);
    sub_4548(v8, v9);
    id v11 = v10;
    sub_866F8((uint64_t)v11, v12);
    sub_AC90(v8, v9);
  }

uint64_t sub_85618(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v12, 0LL, 0LL);
  uint64_t result = swift_weakLoadStrong(v5);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = a3 + 16;
    swift_beginAccess(v8, &v11, 0LL, 0LL);
    uint64_t Strong = swift_weakLoadStrong(v8);
    if (Strong)
    {
      uint64_t v10 = Strong;
      (*(void (**)(uint64_t, uint64_t))&stru_108.segname[(swift_isaMask & *a1) + 16])(v7, Strong);
      swift_release(v7);
      uint64_t v7 = v10;
    }

    return swift_release(v7);
  }

  return result;
}

uint64_t sub_856D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize + 8);
  uint64_t v6 = v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailTop;
  sub_866E8(a1, (uint64_t)v12);
  uint64_t v7 = sub_460C(v6, a2 + 16);
  uint64_t v8 = v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_spacingDimension;
  sub_866E8(v7, (uint64_t)&v11);
  uint64_t result = sub_460C(v8, a2 + 56);
  char v10 = *(_BYTE *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_contentAlignment);
  *(void *)a2 = v4;
  *(void *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 96) = v10;
  return result;
}

void sub_85768()
{
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView;
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView), "layer"));
  id v3 = objc_msgSend((id)objc_opt_self(UIColor), "ams_mediaBorder");
  id v4 = [v3 CGColor];

  [v2 setBorderColor:v4];
  id v5 = [*(id *)(v0 + v1) layer];
  [v5 setBorderWidth:1.0];

  uint64_t v6 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork);
  if (v6)
  {
    uint64_t v7 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork + 8);
    uint64_t v8 = *(void **)(v0 + v1);
    sub_4548(v6, v7);
    id v9 = v8;
    sub_866F8((uint64_t)v9, v10);
    sub_AC90(v6, v7);
  }

void sub_8589C()
{
}

void sub_858D4()
{
}

id sub_8590C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceDetailView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ServiceDetailView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin17ServiceDetailView);
}

char *sub_859D8(uint64_t a1, _BYTE *a2, double a3, double a4)
{
  uint64_t v8 = type metadata accessor for StaticDimension(0LL);
  v33[3] = v8;
  v33[4] = &protocol witness table for StaticDimension;
  id v9 = sub_AE98(v33);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v9, a1, v8);
  a2[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_contentAlignment] = 0;
  uint64_t v10 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel;
  type metadata accessor for DynamicLabel(0LL);
  id v11 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  uint64_t v12 = a2;
  id v13 = objc_msgSend(v11, "ams_primaryText");
  uint64_t v14 = type metadata accessor for FontSource(0LL);
  uint64_t v31 = v14;
  double v32 = &protocol witness table for FontSource;
  *sub_AE98(v30) = UIFontTextStyleSubheadline;
  uint64_t v15 = *(void (**)(void))(*(void *)(v14 - 8) + 104LL);
  v15();
  double v16 = UIFontTextStyleSubheadline;
  *(void *)&a2[v10] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v13, v30);
  uint64_t v17 = &v12[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailTop];
  *((void *)v17 + 3) = &type metadata for Double;
  *((void *)v17 + 4) = &protocol witness table for Double;
  *(void *)uint64_t v17 = 0LL;
  uint64_t v18 = OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel;
  id v19 = objc_msgSend(v11, "ams_primaryText");
  uint64_t v31 = v14;
  double v32 = &protocol witness table for FontSource;
  *sub_AE98(v30) = UIFontTextStyleHeadline;
  v15();
  double v20 = UIFontTextStyleHeadline;
  *(void *)&v12[v18] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v19, v30);
  __n128 v21 = &v12[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_applyCachedArtwork];
  double v22 = (objc_class *)type metadata accessor for ArtworkImageView(0LL);
  *(void *)__n128 v21 = 0LL;
  *((void *)v21 + 1) = 0LL;
  id v23 = objc_allocWithZone(v22);
  *(void *)&v12[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView] = ArtworkImageView.init(artworkSize:frame:)( a3,  a4,  0.0,  0.0,  0.0,  0.0);
  sub_460C((uint64_t)v33, (uint64_t)&v12[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_spacingDimension]);
  uint64_t v24 = (double *)&v12[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkSize];
  *uint64_t v24 = a3;
  v24[1] = a4;

  v29.receiver = v12;
  v29.super_class = (Class)type metadata accessor for ServiceDetailView();
  objc_super v25 = (char *)objc_msgSendSuper2(&v29, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v26 = *(void *)&v25[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_artworkImageView];
  uint64_t v27 = v25;
  [v27 addSubview:v26];
  [v27 addSubview:*(void *)&v27[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel]];
  [v27 addSubview:*(void *)&v27[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel]];
  sub_85768();

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v33);
  return v27;
}

uint64_t sub_85CAC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_85CD0()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_85CFC(void *a1)
{
  return sub_85618(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

double sub_85D04(int a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  uint64_t v141 = a2;
  int v140 = a1;
  uint64_t v12 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v136 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  v135 = &v120[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v14 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v131 = *(void *)(v14 - 8);
  uint64_t v132 = v14;
  __chkstk_darwin(v14);
  uint64_t v130 = &v120[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v129 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v137 = *(void *)(v129 - 8);
  __chkstk_darwin(v129);
  uint64_t v128 = &v120[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v17 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v138 = *(void *)(v17 - 8);
  uint64_t v139 = v17;
  __chkstk_darwin(v17);
  uint64_t v127 = &v120[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v19 = type metadata accessor for VerticalFlowLayout.Child(0LL);
  uint64_t v133 = *(void *)(v19 - 8);
  uint64_t v134 = v19;
  __chkstk_darwin(v19);
  uint64_t v126 = &v120[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v21);
  uint64_t v125 = &v120[-v22];
  uint64_t v23 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = &v120[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v28 = *(void *)(a3 + 64);
  uint64_t v27 = *(void *)(a3 + 72);
  uint64_t v123 = (void *)(a3 + 40);
  sub_ACA0((void *)(a3 + 40), v28);
  LOBYTE(v27) = dispatch thunk of LayoutView.isHidden.getter(v28, *(void *)(v27 + 8));
  sub_84824(a3, (uint64_t)v156);
  if ((v27 & 1) != 0)
  {
    int v29 = 0;
  }

  else
  {
    uint64_t v30 = v158;
    uint64_t v31 = v159;
    sub_ACA0(v157, v158);
    int v29 = dispatch thunk of LayoutView.hasContent.getter(v30, *(void *)(v31 + 8));
  }

  sub_84858(v156);
  uint64_t v33 = *(void *)(a3 + 104);
  uint64_t v32 = *(void *)(a3 + 112);
  uint64_t v124 = (void *)(a3 + 80);
  sub_ACA0((void *)(a3 + 80), v33);
  LOBYTE(v32) = dispatch thunk of LayoutView.isHidden.getter(v33, *(void *)(v32 + 8));
  sub_84824(a3, (uint64_t)v152);
  if ((v32 & 1) != 0)
  {
    sub_84858(v152);
    if ((v29 & 1) != 0)
    {
      uint64_t v122 = v12;
      int v121 = 0;
LABEL_9:
      double v37 = *(double *)(a3 + 120);
      uint64_t v38 = *(void *)(a3 + 200);
      uint64_t v39 = *(void *)(a3 + 208);
      sub_ACA0((void *)(a3 + 176), v38);
      j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v38, v39);
      uint64_t v40 = v141;
      double v41 = AnyDimension.value(in:rounded:)(v141, v26, v38, v39);
      uint64_t v42 = *(void (**)(_BYTE *, uint64_t))(v24 + 8);
      v42(v26, v23);
      double v43 = v37 + v41;
      v44.n128_u64[0] = CGRect.subtracting(insets:)(0.0, v43, 0.0, 0.0, a4, a5, a6, a7);
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      v51.n128_f64[0] = a4;
      v52.n128_f64[0] = a5;
      v53.n128_f64[0] = a6;
      v54.n128_f64[0] = a7;
      CGRect.withLayoutDirection(in:relativeTo:)(v51, v52, v53, v54, v44, v46, v48, v50);
      double v56 = v55;
      double v58 = v57;
      uint64_t v59 = *(void *)(a3 + 160);
      uint64_t v60 = *(void *)(a3 + 168);
      sub_ACA0((void *)(a3 + 136), v59);
      j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v59, v60);
      double v61 = AnyDimension.value(in:rounded:)(v40, v26, v59, v60);
      v42(v26, v23);
      if ((v29 & 1) != 0)
      {
        uint64_t v62 = *(void *)(a3 + 64);
        uint64_t v63 = *(void *)(a3 + 72);
        double v64 = sub_ACA0(v123, v62);
        uint64_t v150 = v62;
        uint64_t v151 = *(void *)(v63 + 8);
        uint64_t v65 = sub_AE98(v149);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v62 - 8) + 16LL))(v65, v64, v62);
        v147 = &type metadata for Double;
        uint64_t v148 = &protocol witness table for Double;
        uint64_t v145 = 0LL;
        v146[0] = 0LL;
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        uint64_t v66 = v127;
        (*(void (**)(_BYTE *, void, uint64_t))(v138 + 104))( v127,  enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:),  v139);
        uint64_t v67 = v137;
        uint64_t v68 = v128;
        uint64_t v69 = v129;
        (*(void (**)(_BYTE *, void, uint64_t))(v137 + 104))( v128,  enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:),  v129);
        uint64_t v70 = sub_44DC(&qword_F3E90);
        uint64_t v71 = v131;
        uint64_t v72 = swift_allocObject( v70,  ((*(unsigned __int8 *)(v131 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80))
              + *(void *)(v131 + 72),
                *(unsigned __int8 *)(v131 + 80) | 7LL);
        *(_OWORD *)(v72 + swift_weakDestroy(v0 + 16) = xmmword_B5B40;
        static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5B40);
        uint64_t v142 = v72;
        uint64_t v73 = sub_8A80( (unint64_t *)&qword_F3E98,  (uint64_t (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition,  (uint64_t)&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition);
        uint64_t v74 = sub_44DC(&qword_F3EA0);
        unint64_t v75 = sub_11744();
        uint64_t v76 = v130;
        uint64_t v77 = v74;
        uint64_t v78 = v132;
        dispatch thunk of SetAlgebra.init<A>(_:)(&v142, v77, v75, v132, v73);
        uint64_t v79 = v125;
        static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v149,  v146,  &v143,  v66,  v68,  v76);
        (*(void (**)(_BYTE *, uint64_t))(v71 + 8))(v76, v78);
        (*(void (**)(_BYTE *, uint64_t))(v67 + 8))(v68, v69);
        (*(void (**)(_BYTE *, uint64_t))(v138 + 8))(v66, v139);
        sub_11788((uint64_t)&v143);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v146);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v149);
        sub_41630(0, 1LL, 1, (uint64_t)_swiftEmptyArrayStorage);
        __n128 v81 = (void *)v80;
        unint64_t v83 = *(void *)(v80 + 16);
        unint64_t v82 = *(void *)(v80 + 24);
        if (v83 >= v82 >> 1)
        {
          sub_41630(v82 > 1, v83 + 1, 1, v80);
          __n128 v81 = v117;
        }

        v81[2] = v83 + 1;
        (*(void (**)(unint64_t, _BYTE *, uint64_t))(v133 + 32))( (unint64_t)v81 + ((*(unsigned __int8 *)(v133 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80))
        + *(void *)(v133 + 72) * v83,
          v79,
          v134);
      }

      else
      {
        __n128 v81 = _swiftEmptyArrayStorage;
      }

      if ((v121 & 1) != 0)
      {
        uint64_t v93 = *(void *)(a3 + 104);
        uint64_t v94 = *(void *)(a3 + 112);
        uint64_t v95 = sub_ACA0(v124, v93);
        uint64_t v150 = v93;
        uint64_t v151 = *(void *)(v94 + 8);
        uint64_t v96 = sub_AE98(v149);
        (*(void (**)(void *, void *, uint64_t))(*(void *)(v93 - 8) + 16LL))(v96, v95, v93);
        v147 = &type metadata for CGFloat;
        uint64_t v148 = &protocol witness table for CGFloat;
        *(double *)v146 = v61;
        uint64_t v145 = 0LL;
        __int128 v143 = 0u;
        __int128 v144 = 0u;
        uint64_t v97 = v127;
        (*(void (**)(_BYTE *, void, uint64_t))(v138 + 104))( v127,  enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:),  v139);
        unint64_t v99 = v128;
        uint64_t v98 = v129;
        (*(void (**)(_BYTE *, void, uint64_t))(v137 + 104))( v128,  enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:),  v129);
        uint64_t v100 = sub_44DC(&qword_F3E90);
        uint64_t v101 = v131;
        uint64_t v102 = swift_allocObject( v100,  ((*(unsigned __int8 *)(v131 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80))
               + *(void *)(v131 + 72),
                 *(unsigned __int8 *)(v131 + 80) | 7LL);
        *(_OWORD *)(v102 + swift_weakDestroy(v0 + 16) = xmmword_B5B40;
        static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5B40);
        uint64_t v142 = v102;
        uint64_t v103 = sub_8A80( (unint64_t *)&qword_F3E98,  (uint64_t (*)(uint64_t))&type metadata accessor for VerticalFlowLayout.ExclusionCondition,  (uint64_t)&protocol conformance descriptor for VerticalFlowLayout.ExclusionCondition);
        uint64_t v104 = sub_44DC(&qword_F3EA0);
        unint64_t v105 = sub_11744();
        CGFloat v106 = v130;
        uint64_t v107 = v104;
        uint64_t v108 = v132;
        dispatch thunk of SetAlgebra.init<A>(_:)(&v142, v107, v105, v132, v103);
        uint64_t v109 = v126;
        static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v149,  v146,  &v143,  v97,  v99,  v106);
        (*(void (**)(_BYTE *, uint64_t))(v101 + 8))(v106, v108);
        (*(void (**)(_BYTE *, uint64_t))(v137 + 8))(v99, v98);
        (*(void (**)(_BYTE *, uint64_t))(v138 + 8))(v97, v139);
        sub_11788((uint64_t)&v143);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v146);
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v149);
        if ((swift_isUniquelyReferenced_nonNull_native(v81) & 1) == 0)
        {
          sub_41630(0, v81[2] + 1LL, 1, (uint64_t)v81);
          __n128 v81 = v118;
        }

        unint64_t v111 = v81[2];
        unint64_t v110 = v81[3];
        if (v111 >= v110 >> 1)
        {
          sub_41630(v110 > 1, v111 + 1, 1, (uint64_t)v81);
          __n128 v81 = v119;
        }

        v81[2] = v111 + 1;
        (*(void (**)(unint64_t, _BYTE *, uint64_t))(v133 + 32))( (unint64_t)v81 + ((*(unsigned __int8 *)(v133 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v133 + 80))
        + *(void *)(v133 + 72) * v111,
          v109,
          v134);
      }

      uint64_t v112 = v135;
      VerticalFlowLayout.init(expandChildrenToFit:children:)(0LL, v81);
      double v114 = VerticalFlowLayout.measurements(fitting:in:)(v141, v56, v58);
      uint64_t v115 = v122;
      if ((v140 & 1) != 0)
      {
        else {
          sub_84884(a3, v141, v113, a4, a5, a6, a7, v43);
        }
      }

      double v92 = v43 + v114;
      (*(void (**)(_BYTE *, uint64_t))(v136 + 8))(v112, v115);
      return v92;
    }
  }

  else
  {
    uint64_t v35 = v154;
    uint64_t v34 = v155;
    sub_ACA0(v153, v154);
    int v36 = dispatch thunk of LayoutView.hasContent.getter(v35, *(void *)(v34 + 8));
    sub_84858(v152);
    if (((v29 | v36) & 1) != 0)
    {
      uint64_t v122 = v12;
      int v121 = v29 ^ 1 | v36;
      goto LABEL_9;
    }
  }

  if ((v140 & 1) != 0)
  {
    uint64_t v84 = *(void *)(a3 + 24);
    sub_ACA0((void *)a3, v84);
    v160.origin.x = a4;
    v160.origin.y = a5;
    v160.size.CGFloat width = a6;
    v160.size.CGFloat height = a7;
    CGFloat MinX = CGRectGetMinX(v160);
    v161.origin.x = a4;
    v161.origin.y = a5;
    v161.size.CGFloat width = a6;
    v161.size.CGFloat height = a7;
    double MinY = CGRectGetMinY(v161);
    v87.n128_f64[0] = a4;
    v88.n128_f64[0] = a5;
    v89.n128_f64[0] = a6;
    v90.n128_f64[0] = a7;
    v91.n128_f64[0] = MinX;
    CGRect.withLayoutDirection(in:relativeTo:)( v87,  v88,  v89,  v90,  v91,  MinY,  *(double *)(a3 + 120),  *(double *)(a3 + 128));
    dispatch thunk of LayoutView.frame.setter(v84);
  }

  return *(double *)(a3 + 120);
}

uint64_t sub_866E8(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(v2, a2, 0LL, 0LL);
}

uint64_t sub_866F8(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2);
}

unint64_t sub_86708()
{
  unint64_t result = qword_F74D8;
  if (!qword_F74D8)
  {
    uint64_t v1 = type metadata accessor for ServiceOption(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BB160, v1);
    atomic_store(result, (unint64_t *)&qword_F74D8);
  }

  return result;
}

uint64_t type metadata accessor for ServiceOption(uint64_t a1)
{
  uint64_t result = qword_F7538;
  if (!qword_F7538) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceOption);
  }
  return result;
}

uint64_t sub_86780@<X0>(uint64_t a1@<X8>)
{
  return sub_8260(v1 + 224, a1);
}

uint64_t sub_8678C(uint64_t a1)
{
  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 48));
}

void sub_86798(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = sub_E9C0(v8);
  uint64_t v10 = type metadata accessor for DynamicTextFactory(0LL);
  sub_E9C0(v10);
  id v11 = (int *)type metadata accessor for ServiceOption(0LL);
  uint64_t v12 = sub_6F270();
  if (v2)
  {
    swift_errorRelease(v2);
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  *a2 = v12;
  a2[1] = v13;
  __chkstk_darwin(v12);
  sub_E9AC();
  sub_58A0();
  uint64_t v34 = a2 + 2;
  sub_D970((uint64_t)&v33, (uint64_t)(a2 + 2), &qword_F3930);
  uint64_t v14 = sub_6F270();
  uint64_t v29 = v9;
  *(void *)&v30[0] = v14;
  *((void *)&v30[0] + 1) = v15;
  uint64_t v16 = AnyHashable.init<A>(_:)(v30, &type metadata for String, &protocol witness table for String);
  __chkstk_darwin(v16);
  sub_EA0C();
  sub_5868(0xD000000000000011LL, 0x80000000000BD350LL, (uint64_t)v11, (uint64_t)sub_D960, v17, v18, v19, v20);
  sub_D970((uint64_t)v7, (uint64_t)a2 + v11[10], &qword_F3838);
  __chkstk_darwin(v21);
  sub_E9AC();
  sub_58A0();
  uint64_t v22 = v29;
  sub_D970((uint64_t)&v32, (uint64_t)(a2 + 7), &qword_F3930);
  uint64_t v23 = sub_6F368();
  *((_BYTE *)a2 + v11[12]) = v23 & 1;
  __chkstk_darwin(v23);
  *(&v28 - 2) = v22;
  *(&v28 - 1) = a1;
  sub_87C00(1969710451LL);
  sub_5844();
  sub_D970((uint64_t)&v31, (uint64_t)a2 + v11[11], &qword_F38F8);
  __chkstk_darwin(v24);
  sub_EA0C();
  sub_6580();
  sub_D970((uint64_t)v30, (uint64_t)(a2 + 12), &qword_F3A38);
  __chkstk_darwin(v25);
  sub_E9AC();
  sub_87C00(1819568500LL);
  sub_58A0();
  uint64_t v26 = type metadata accessor for JSONObject(0LL);
  sub_851C(v26);
  sub_E9EC();
  sub_87BF8();
  uint64_t v27 = sub_8484();
  sub_E998(v27);
  sub_7CF4(v30, (uint64_t)(a2 + 23));
}

void sub_86D3C(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
}

void sub_86D50()
{
}

uint64_t sub_86D58(uint64_t a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)a1 = *a2;
    a1 = v11 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v11);
  }

  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2 + 2;
    uint64_t v9 = a2[5];
    swift_bridgeObjectRetain(v7);
    if (v9)
    {
      uint64_t v10 = a2[6];
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 48) = v10;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1 + 16, (uint64_t)(a2 + 2), v9);
    }

    else
    {
      __int128 v12 = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *v8;
      *(_OWORD *)(a1 + 32) = v12;
      *(void *)(a1 + 48) = a2[6];
    }

    uint64_t v13 = (_OWORD *)(a1 + 56);
    uint64_t v14 = a2 + 7;
    uint64_t v15 = a2[10];
    if (v15)
    {
      uint64_t v16 = a2[11];
      *(void *)(a1 + 80) = v15;
      *(void *)(a1 + 88) = v16;
      (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
    }

    else
    {
      __int128 v17 = *(_OWORD *)(a2 + 9);
      *uint64_t v13 = *v14;
      *(_OWORD *)(a1 + 72) = v17;
      *(void *)(a1 + 88) = a2[11];
    }

    uint64_t v18 = a2[12];
    if (v18)
    {
      *(void *)(a1 + 96) = v18;
      __int128 v19 = *((_OWORD *)a2 + 8);
      *(_OWORD *)(a1 + 128) = v19;
      uint64_t v20 = v19;
      uint64_t v21 = **(void (***)(uint64_t, uint64_t, uint64_t, __n128))(v19 - 8);
      __n128 v22 = swift_retain(v18);
      v21(a1 + 104, (uint64_t)(a2 + 13), v20, v22);
      uint64_t v23 = (_OWORD *)(a1 + 144);
      uint64_t v24 = a2 + 18;
      uint64_t v25 = a2[21];
      if (v25)
      {
        uint64_t v26 = a2[22];
        *(void *)(a1 + 168) = v25;
        *(void *)(a1 + 176) = v26;
        (**(void (***)(_OWORD *, _OWORD *))(v25 - 8))(v23, v24);
      }

      else
      {
        __int128 v27 = *((_OWORD *)a2 + 10);
        *uint64_t v23 = *v24;
        *(_OWORD *)(a1 + 160) = v27;
        *(void *)(a1 + 176) = a2[22];
      }
    }

    else
    {
      memcpy((void *)(a1 + 96), a2 + 12, 0x58uLL);
    }

    __int128 v28 = *((_OWORD *)a2 + 13);
    *(_OWORD *)(a1 + 208) = v28;
    (**(void (***)(uint64_t, uint64_t))(v28 - 8))(a1 + 184, (uint64_t)(a2 + 23));
    __int128 v29 = *(_OWORD *)(a2 + 31);
    *(_OWORD *)(a1 + 248) = v29;
    (**(void (***)(uint64_t, uint64_t))(v29 - 8))(a1 + 224, (uint64_t)(a2 + 28));
    uint64_t v30 = a3[10];
    __int128 v31 = (void *)(a1 + v30);
    __int128 v32 = (char *)a2 + v30;
    uint64_t v33 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v32, 1LL, v33))
    {
      uint64_t v34 = sub_44DC(&qword_F3838);
      memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v33 - 8) + 16LL))(v31, v32, v33);
      sub_4AD0((uint64_t)v31, 0LL, 1LL, v33);
    }

    uint64_t v35 = a3[11];
    uint64_t v36 = a1 + v35;
    uint64_t v37 = (uint64_t)a2 + v35;
    uint64_t v38 = *(uint64_t *)((char *)a2 + v35 + 24);
    if (v38)
    {
      uint64_t v39 = *(void *)(v37 + 32);
      *(void *)(v36 + 24) = v38;
      *(void *)(v36 + 32) = v39;
      (**(void (***)(void))(v38 - 8))();
    }

    else
    {
      __int128 v40 = *(_OWORD *)(v37 + 16);
      *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
      *(_OWORD *)(v36 + swift_weakDestroy(v0 + 16) = v40;
      *(void *)(v36 + 32) = *(void *)(v37 + 32);
    }

    *(_BYTE *)(a1 + a3[12]) = *((_BYTE *)a2 + a3[12]);
  }

  return a1;
}

void *sub_86FD8(void *a1, uint64_t a2)
{
  if (a1[5]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 2);
  }
  if (a1[10]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 7);
  }
  if (a1[12])
  {
    swift_release();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 13);
    if (a1[21]) {
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 18);
    }
  }

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 23);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 28);
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t result = (void *)((char *)a1 + *(int *)(a2 + 44));
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t sub_870B8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = a2 + 16;
  uint64_t v8 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain(v6);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    *(void *)(a1 + 40) = v8;
    *(void *)(a1 + 48) = v9;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8))(a1 + 16, v7, v8);
  }

  else
  {
    __int128 v10 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)v7;
    *(_OWORD *)(a1 + 32) = v10;
    *(void *)(a1 + 48) = *(void *)(v7 + 32);
  }

  uint64_t v11 = (_OWORD *)(a1 + 56);
  __int128 v12 = (_OWORD *)(a2 + 56);
  uint64_t v13 = *(void *)(a2 + 80);
  if (v13)
  {
    uint64_t v14 = *(void *)(a2 + 88);
    *(void *)(a1 + 80) = v13;
    *(void *)(a1 + 88) = v14;
    (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
  }

  else
  {
    __int128 v15 = *(_OWORD *)(a2 + 72);
    *uint64_t v11 = *v12;
    *(_OWORD *)(a1 + 72) = v15;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
  }

  uint64_t v16 = *(void *)(a2 + 96);
  if (v16)
  {
    *(void *)(a1 + 96) = v16;
    __int128 v17 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 128) = v17;
    uint64_t v18 = v17;
    __int128 v19 = **(void (***)(uint64_t, uint64_t, uint64_t, __n128))(v17 - 8);
    __n128 v20 = swift_retain(v16);
    v19(a1 + 104, a2 + 104, v18, v20);
    uint64_t v21 = (_OWORD *)(a1 + 144);
    __n128 v22 = (_OWORD *)(a2 + 144);
    uint64_t v23 = *(void *)(a2 + 168);
    if (v23)
    {
      uint64_t v24 = *(void *)(a2 + 176);
      *(void *)(a1 + 168) = v23;
      *(void *)(a1 + 176) = v24;
      (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
    }

    else
    {
      __int128 v25 = *(_OWORD *)(a2 + 160);
      *uint64_t v21 = *v22;
      *(_OWORD *)(a1 + 160) = v25;
      *(void *)(a1 + 176) = *(void *)(a2 + 176);
    }
  }

  else
  {
    memcpy((void *)(a1 + 96), (const void *)(a2 + 96), 0x58uLL);
  }

  __int128 v26 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v26;
  (**(void (***)(uint64_t, uint64_t))(v26 - 8))(a1 + 184, a2 + 184);
  __int128 v27 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 248) = v27;
  (**(void (***)(uint64_t, uint64_t))(v27 - 8))(a1 + 224, a2 + 224);
  uint64_t v28 = a3[10];
  __int128 v29 = (void *)(a1 + v28);
  uint64_t v30 = (const void *)(a2 + v28);
  uint64_t v31 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v30, 1LL, v31))
  {
    uint64_t v32 = sub_44DC(&qword_F3838);
    memcpy(v29, v30, *(void *)(*(void *)(v32 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v31 - 8) + 16LL))(v29, v30, v31);
    sub_4AD0((uint64_t)v29, 0LL, 1LL, v31);
  }

  uint64_t v33 = a3[11];
  uint64_t v34 = a1 + v33;
  uint64_t v35 = a2 + v33;
  uint64_t v36 = *(void *)(a2 + v33 + 24);
  if (v36)
  {
    uint64_t v37 = *(void *)(v35 + 32);
    *(void *)(v34 + 24) = v36;
    *(void *)(v34 + 32) = v37;
    (**(void (***)(void))(v36 - 8))();
  }

  else
  {
    __int128 v38 = *(_OWORD *)(v35 + 16);
    *(_OWORD *)uint64_t v34 = *(_OWORD *)v35;
    *(_OWORD *)(v34 + swift_weakDestroy(v0 + 16) = v38;
    *(void *)(v34 + 32) = *(void *)(v35 + 32);
  }

  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_8730C(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 40);
  if (*(void *)(a1 + 40))
  {
    if (v7)
    {
      sub_4290((void *)(a1 + 16), (void *)(a2 + 16));
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 16));
  }

  else if (v7)
  {
    *(void *)(a1 + 40) = v7;
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 16, a2 + 16);
    goto LABEL_8;
  }

  __int128 v8 = *(_OWORD *)(a2 + 16);
  __int128 v9 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v8;
  *(_OWORD *)(a1 + 32) = v9;
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 80);
  if (*(void *)(a1 + 80))
  {
    if (v10)
    {
      sub_4290((void *)(a1 + 56), (void *)(a2 + 56));
      goto LABEL_15;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
  }

  else if (v10)
  {
    *(void *)(a1 + 80) = v10;
    *(void *)(a1 + 88) = *(void *)(a2 + 88);
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 56, a2 + 56);
    goto LABEL_15;
  }

  __int128 v11 = *(_OWORD *)(a2 + 56);
  __int128 v12 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 56) = v11;
  *(_OWORD *)(a1 + 72) = v12;
LABEL_15:
  uint64_t v13 = *(void *)(a2 + 96);
  if (!*(void *)(a1 + 96))
  {
    if (v13)
    {
      *(void *)(a1 + 96) = v13;
      uint64_t v15 = *(void *)(a2 + 128);
      *(void *)(a1 + 128) = v15;
      *(void *)(a1 + 136) = *(void *)(a2 + 136);
      uint64_t v16 = **(void (***)(uint64_t, uint64_t, uint64_t, __n128))(v15 - 8);
      __n128 v17 = swift_retain(v13);
      v16(a1 + 104, a2 + 104, v15, v17);
      uint64_t v18 = (_OWORD *)(a1 + 144);
      __int128 v19 = (__int128 *)(a2 + 144);
      uint64_t v20 = *(void *)(a2 + 168);
      if (v20)
      {
        *(void *)(a1 + 168) = v20;
        *(void *)(a1 + 176) = *(void *)(a2 + 176);
        (**(void (***)(_OWORD *, __int128 *))(v20 - 8))(v18, v19);
      }

      else
      {
        __int128 v23 = *v19;
        __int128 v24 = *(_OWORD *)(a2 + 160);
        *(void *)(a1 + 176) = *(void *)(a2 + 176);
        *uint64_t v18 = v23;
        *(_OWORD *)(a1 + 160) = v24;
      }

      goto LABEL_31;
    }

uint64_t sub_876C0(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v6;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  __int128 v7 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = v7;
  memcpy((void *)(a1 + 96), (const void *)(a2 + 96), 0x58uLL);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(void *)(a1 + 2swift_weakDestroy(v0 + 16) = *(void *)(a2 + 216);
  __int128 v8 = *(_OWORD *)(a2 + 224);
  __int128 v9 = *(_OWORD *)(a2 + 240);
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  uint64_t v10 = a3[10];
  __int128 v11 = (void *)(a1 + v10);
  __int128 v12 = (const void *)(a2 + v10);
  *(_OWORD *)(a1 + 224) = v8;
  *(_OWORD *)(a1 + 240) = v9;
  uint64_t v13 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v12, 1LL, v13))
  {
    uint64_t v14 = sub_44DC(&qword_F3838);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
    sub_4AD0((uint64_t)v11, 0LL, 1LL, v13);
  }

  uint64_t v15 = a3[11];
  uint64_t v16 = a3[12];
  uint64_t v17 = a1 + v15;
  uint64_t v18 = a2 + v15;
  __int128 v19 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = v19;
  *(void *)(v17 + 32) = *(void *)(v18 + 32);
  *(_BYTE *)(a1 + vswift_weakDestroy(v0 + 16) = *(_BYTE *)(a2 + v16);
  return a1;
}

uint64_t sub_87800(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 40)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 16));
  }
  __int128 v7 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v7;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  if (*(void *)(a1 + 80)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
  }
  __int128 v8 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = v8;
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  __int128 v9 = (void *)(a2 + 96);
  if (!*(void *)(a1 + 96)) {
    goto LABEL_11;
  }
  if (!*v9)
  {
    sub_2D3DC((void *)(a1 + 96));
LABEL_11:
    memcpy((void *)(a1 + 96), (const void *)(a2 + 96), 0x58uLL);
    goto LABEL_12;
  }

  *(void *)(a1 + 96) = *v9;
  swift_release();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 104));
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  if (*(void *)(a1 + 168)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 144));
  }
  __int128 v10 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v10;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
LABEL_12:
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 184));
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(void *)(a1 + 2swift_weakDestroy(v0 + 16) = *(void *)(a2 + 216);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 224));
  __int128 v11 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v11;
  *(void *)(a1 + 256) = *(void *)(a2 + 256);
  uint64_t v12 = a3[10];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for ImpressionMetrics(0LL);
  int v16 = sub_4AC4((uint64_t)v13, 1LL, v15);
  int v17 = sub_4AC4((uint64_t)v14, 1LL, v15);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 32LL))(v13, v14, v15);
      sub_4AD0((uint64_t)v13, 0LL, 1LL, v15);
      goto LABEL_18;
    }

    goto LABEL_17;
  }

  uint64_t v18 = *(void *)(v15 - 8);
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v18 + 8))(v13, v15);
LABEL_17:
    uint64_t v19 = sub_44DC(&qword_F3838);
    memcpy(v13, v14, *(void *)(*(void *)(v19 - 8) + 64LL));
    goto LABEL_18;
  }

  (*(void (**)(void *, const void *, uint64_t))(v18 + 40))(v13, v14, v15);
LABEL_18:
  uint64_t v20 = a3[11];
  uint64_t v21 = a1 + v20;
  if (*(void *)(a1 + v20 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v20));
  }
  __int128 v22 = *(_OWORD *)(a2 + v20 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)(a2 + v20);
  *(_OWORD *)(v21 + swift_weakDestroy(v0 + 16) = v22;
  *(void *)(v21 + 32) = *(void *)(a2 + v20 + 32);
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_87A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_87A64);
}

uint64_t sub_87A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 208);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F3838);
    return sub_4AC4(a1 + *(int *)(a3 + 40), a2, v8);
  }

uint64_t sub_87ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_87AE8);
}

uint64_t sub_87AE8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 208) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_44DC(&qword_F3838);
    return sub_4AD0(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }

  return result;
}

void sub_87B58(uint64_t a1)
{
  v4[0] = &unk_BB1D8;
  v4[1] = &unk_BB1F0;
  v4[2] = &unk_BB1F0;
  v4[3] = &unk_BB208;
  v4[4] = &unk_BB220;
  v4[5] = &unk_BB220;
  sub_5260(319LL);
  if (v3 <= 0x3F)
  {
    void v4[6] = *(void *)(v2 - 8) + 64LL;
    v4[7] = &unk_BB1F0;
    void v4[8] = &unk_BB238;
    swift_initStructMetadata(a1, 256LL, 9LL, v4, a1 + 16);
  }

uint64_t sub_87BF8()
{
  return swift_release(v0);
}

unint64_t sub_87C00(uint64_t a1)
{
  return a1 & 0xFFFF0000FFFFFFFFLL | 0x6500000000LL;
}

void sub_87C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath = swift_getKeyPath(&unk_BB290);
  sub_44DC(&qword_F75D8);
  sub_EE98(KeyPath);
  uint64_t v6 = sub_8770();
  if (*(void *)v60)
  {
    memcpy(__dst, v60, sizeof(__dst));
    sub_88C50(__dst, a3);
    sub_2D3DC(__dst);
  }

  else
  {
    sub_EECC(v6, &qword_F3A38, v7, v8, v9, v10, v11, v12, 0LL);
  }

  uint64_t v13 = swift_getKeyPath(&unk_BB2B0);
  sub_EE98(v13);
  uint64_t v14 = sub_8770();
  if (*(void *)&v60[24])
  {
    sub_88070( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  *(__int128 *)v60,  *(uint64_t *)&v60[16],  *(uint64_t *)&v60[24],  *(uint64_t *)&v60[32],  *(uint64_t *)&v60[40],  *(uint64_t *)&v60[48],  *(uint64_t *)&v60[56],  *(uint64_t *)&v60[64],  *(uint64_t *)&v60[72],  *(uint64_t *)&v60[80],  __dst[0]);
    uint64_t v22 = sub_88048( OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel,  *(uint64_t *)v60,  *(uint64_t *)&v60[8],  *(uint64_t *)&v60[16],  *(uint64_t *)&v60[24],  *(uint64_t *)&v60[32],  *(uint64_t *)&v60[40],  *(uint64_t *)&v60[48],  *(uint64_t *)&v60[56],  *(uint64_t *)&v60[64],  *(uint64_t *)&v60[72],  *(uint64_t *)&v60[80]);
    sub_88068(v22, v23, v24, v25, v26, v27, v28, v29, *(uint64_t *)v60, *(uint64_t *)&v60[8], *(uint64_t *)&v60[16]);
  }

  else
  {
    sub_EECC(v14, &qword_F3930, v16, v17, v18, v19, v20, v21, *(uint64_t *)v60);
  }

  uint64_t v30 = swift_getKeyPath(&unk_BB2D0);
  sub_EE98(v30);
  uint64_t v31 = sub_8770();
  if (*(void *)&v60[24])
  {
    sub_88070( v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  *(__int128 *)v60,  *(uint64_t *)&v60[16],  *(uint64_t *)&v60[24],  *(uint64_t *)&v60[32],  *(uint64_t *)&v60[40],  *(uint64_t *)&v60[48],  *(uint64_t *)&v60[56],  *(uint64_t *)&v60[64],  *(uint64_t *)&v60[72],  *(uint64_t *)&v60[80],  __dst[0]);
    uint64_t v39 = sub_88048( OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel,  *(uint64_t *)v60,  *(uint64_t *)&v60[8],  *(uint64_t *)&v60[16],  *(uint64_t *)&v60[24],  *(uint64_t *)&v60[32],  *(uint64_t *)&v60[40],  *(uint64_t *)&v60[48],  *(uint64_t *)&v60[56],  *(uint64_t *)&v60[64],  *(uint64_t *)&v60[72],  *(uint64_t *)&v60[80]);
    sub_88068(v39, v40, v41, v42, v43, v44, v45, v46, *(uint64_t *)v60, *(uint64_t *)&v60[8], *(uint64_t *)&v60[16]);
  }

  else
  {
    sub_EECC(v31, &qword_F3930, v33, v34, v35, v36, v37, v38, *(uint64_t *)v60);
  }

  double v47 = *(void **)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel];
  uint64_t v48 = swift_getKeyPath(&unk_BB2F0);
  sub_EE98(v48);
  swift_release();
  uint64_t v49 = (*(uint64_t (**)(uint64_t *, uint64_t))&stru_158.sectname[swift_isaMask & *v47])(__dst, a3);
  sub_88068(v49, v50, v51, v52, v53, v54, v55, v56, *(uint64_t *)v60, *(uint64_t *)&v60[8], *(uint64_t *)&v60[16]);
  id v57 = [v3 contentView];
  uint64_t v58 = swift_getKeyPath(&unk_BB310);
  sub_EE98(v58);
  swift_release();
  if (__dst[1])
  {
    NSString v59 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v59 = 0LL;
  }

  [v57 setAccessibilityLabel:v59];
}

uint64_t sub_87E48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for ServiceOptionComponent();
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_87E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for ServiceOptionComponent();
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_87EF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BB270, a4);
  return ComponentCell.apply(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_87F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BB270, a4);
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_87FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BB270, a4);
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

unint64_t sub_88008()
{
  unint64_t result = qword_F6D70;
  if (!qword_F6D70)
  {
    uint64_t v1 = type metadata accessor for ServiceOption(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BB120, v1);
    atomic_store(result, (unint64_t *)&qword_F6D70);
  }

  return result;
}

uint64_t sub_88048@<X0>( uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  return (*(uint64_t (**)(char *, uint64_t))&stru_158.sectname[*v14 & **(void **)(v12 + a1)])(va, v13);
}

uint64_t sub_88068( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t *)va);
}

uint64_t sub_88070( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  return sub_7CF4(&a9, (uint64_t)&a19);
}

uint64_t sub_8807C(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  uint64_t v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

id sub_880C4(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel;
  sub_11998();
  objc_opt_self(&OBJC_CLASS___UIColor);
  uint64_t v10 = v4;
  id v11 = sub_32438((uint64_t)v10, "whiteColor");
  uint64_t v12 = type metadata accessor for FontSource(0LL);
  uint64_t v63 = v12;
  double v64 = &protocol witness table for FontSource;
  uint64_t v19 = sub_89624(v12, v13, v14, v15, v16, v17, v18);
  *uint64_t v19 = UIFontTextStyleCaption2;
  sub_323C4((uint64_t)v19);
  uint64_t v20 = UIFontTextStyleCaption2;
  uint64_t v21 = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v11, v62);
  *(void *)&v4[v9] = v21;
  uint64_t v22 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel;
  id v23 = sub_32438(v21, "whiteColor");
  uint64_t v63 = v12;
  double v64 = &protocol witness table for FontSource;
  uint64_t v30 = sub_89624((uint64_t)v23, v24, v25, v26, v27, v28, v29);
  *uint64_t v30 = UIFontTextStyleTitle3;
  sub_323C4((uint64_t)v30);
  uint64_t v31 = UIFontTextStyleTitle3;
  uint64_t v38 = sub_895FC((uint64_t)v31, v32, v33, v34, v35, v36, v37);
  *(void *)&v10[v22] = v38;
  uint64_t v39 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel;
  id v40 = sub_32438(v38, "whiteColor");
  uint64_t v63 = v12;
  double v64 = &protocol witness table for FontSource;
  double v47 = sub_89624((uint64_t)v40, v41, v42, v43, v44, v45, v46);
  *double v47 = v20;
  sub_323C4((uint64_t)v47);
  uint64_t v48 = v20;
  *(void *)&v10[v39] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v40, v62);
  uint64_t v49 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_gridView;
  uint64_t v50 = (objc_class *)sub_8960C();
  uint64_t v51 = sub_8962C(v50);
  *(void *)&v10[v49] = sub_895D8(v56, 90.0, (uint64_t)v51, v52, v53, v51, v54, v55);
  uint64_t v57 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_blurView;
  objc_msgSend( objc_allocWithZone(UIVisualEffectView),  "initWithEffect:",  objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 5001));
  sub_119C8();
  *(void *)&v10[v57] = &protocol witness table for Double;
  uint64_t v58 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_container;
  *(void *)&v10[v58] = [objc_allocWithZone(UIView) init];

  v61.receiver = v10;
  v61.super_class = (Class)type metadata accessor for ServiceOptionComponent();
  id v59 = objc_msgSendSuper2(&v61, "initWithFrame:", a1, a2, a3, a4);
  sub_88D24();

  return v59;
}

void sub_8837C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel;
  sub_11998();
  id v3 = [(id)objc_opt_self(UIColor) whiteColor];
  uint64_t v4 = type metadata accessor for FontSource(0LL);
  id v11 = sub_89624(v4, v5, v6, v7, v8, v9, v10);
  *id v11 = UIFontTextStyleCaption2;
  sub_373FC((uint64_t)v11);
  uint64_t v12 = UIFontTextStyleCaption2;
  uint64_t v19 = sub_895FC((uint64_t)v12, v13, v14, v15, v16, v17, v18);
  *(void *)&v0[v2] = v19;
  uint64_t v20 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel;
  id v21 = sub_2AE08(v19, "whiteColor");
  uint64_t v28 = sub_89624((uint64_t)v21, v22, v23, v24, v25, v26, v27);
  *uint64_t v28 = UIFontTextStyleTitle3;
  sub_373FC((uint64_t)v28);
  uint64_t v29 = UIFontTextStyleTitle3;
  uint64_t v36 = sub_895FC((uint64_t)v29, v30, v31, v32, v33, v34, v35);
  *(void *)&v0[v20] = v36;
  uint64_t v37 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel;
  id v38 = sub_2AE08(v36, "whiteColor");
  uint64_t v58 = v4;
  id v59 = &protocol witness table for FontSource;
  uint64_t v45 = sub_89624((uint64_t)v38, v39, v40, v41, v42, v43, v44);
  *uint64_t v45 = v12;
  sub_373FC((uint64_t)v45);
  uint64_t v46 = v12;
  *(void *)&v0[v37] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v38, v57);
  uint64_t v47 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_gridView;
  uint64_t v48 = (objc_class *)sub_8960C();
  uint64_t v49 = sub_8962C(v48);
  *(void *)&v0[v47] = sub_895D8(v54, 90.0, (uint64_t)v49, v50, v51, v49, v52, v53);
  uint64_t v55 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_blurView;
  objc_msgSend( objc_allocWithZone(UIVisualEffectView),  "initWithEffect:",  objc_msgSend((id)objc_opt_self(UIBlurEffect), "effectWithStyle:", 5001));
  sub_119C8();
  *(void *)&v0[v55] = &protocol witness table for Double;
  uint64_t v56 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_container;
  *(void *)&v1[v56] = [objc_allocWithZone(UIView) init];

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceOptionComponent_tvOS.swift",  54LL,  2LL,  32LL,  0);
  __break(1u);
}

uint64_t sub_885DC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceOptionComponent();
  objc_msgSendSuper2(&v2, "prepareForReuse");
  sub_2AD7C(**(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel]);
  sub_2AD7C(**(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel]);
  sub_2AD7C(**(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel]);
  sub_99518();
  return sub_98A90((uint64_t)_swiftEmptyArrayStorage);
}

id sub_886B4(uint64_t a1)
{
  objc_super v2 = v1;
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ServiceOptionComponent();
  objc_msgSendSuper2(&v6, "traitCollectionDidChange:", a1);
  sub_88F44();
  sub_8900C(v4);
  sub_98DA0();
  return [v2 setNeedsLayout];
}

void sub_8877C(uint64_t a1, void *a2)
{
  id v3 = v2;
  sub_88F44();
  sub_8900C(v5);
  uint64_t v6 = sub_98DA0();
  id v7 = sub_2AE08(v6, "nextFocusedItem");
  if (v7 && (v8 = v7, id v7 = (id)swift_unknownObjectRelease(v7), v8 == v3))
  {
    id v9 = sub_32438((uint64_t)v7, "contentView");
    id v13 = objc_msgSend((id)objc_opt_self(UIColor), "ams_shadow");
    id v14 = [v13 CGColor];

    sub_B0C28((uint64_t)v14, 7.0, 1.0, 0.0, 3.0);
    [v3 setNeedsLayout];
    *(void *)(sub_1186C((uint64_t)&unk_E5C40) + swift_weakDestroy(v0 + 16) = v3;
    sub_32418((uint64_t)sub_8807C, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v15, v16);
    sub_32490();
    swift_release();
    uint64_t v12 = &selRef_addCoordinatedFocusingAnimations_completion_;
  }

  else
  {
    id v9 = sub_32438((uint64_t)v7, "contentView");
    id v10 = [v9 layer];
    LODWORD(v11) = 0;
    [v10 setShadowOpacity:v11];

    [v3 setNeedsLayout];
    *(void *)(sub_1186C((uint64_t)&unk_E5BF0) + swift_weakDestroy(v0 + 16) = v3;
    sub_32418((uint64_t)sub_8807C, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v15, v16);
    sub_32490();
    swift_release();
    uint64_t v12 = &selRef_addCoordinatedUnfocusingAnimations_completion_;
  }

  objc_msgSend(a2, *v12, v9, 0);
  _Block_release(v9);
}

void *sub_88A18()
{
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = type metadata accessor for LayoutRect(0LL);
  uint64_t v39 = *(void *)(v2 - 8);
  uint64_t v40 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = (objc_class *)type metadata accessor for ServiceOptionComponent();
  v42.receiver = v0;
  v42.super_class = v5;
  objc_msgSendSuper2(&v42, "layoutSubviews");
  v41[28] = &type metadata for Double;
  v41[29] = &protocol witness table for Double;
  v41[25] = 0x4008000000000000LL;
  v41[33] = &type metadata for Double;
  v41[34] = &protocol witness table for Double;
  v41[30] = 0x4020000000000000LL;
  v41[38] = &type metadata for Double;
  v41[39] = &protocol witness table for Double;
  v41[35] = 0x4024000000000000LL;
  v41[40] = sub_7CF3C();
  v41[41] = v6;
  v41[42] = v7;
  v41[43] = v8;
  id v9 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel];
  uint64_t v10 = sub_11998();
  v41[8] = v10;
  unint64_t v11 = sub_1BC08();
  v41[5] = v9;
  uint64_t v12 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel);
  v41[13] = v10;
  v41[14] = v11;
  v41[9] = v11;
  v41[10] = v12;
  id v13 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_gridView);
  v41[23] = type metadata accessor for ServicesGridView();
  v41[24] = &protocol witness table for UIView;
  id v14 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel);
  v41[19] = v11;
  v41[20] = v13;
  v41[18] = v10;
  v41[15] = v14;
  uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_container);
  v41[3] = sub_31544();
  v41[4] = &protocol witness table for UIView;
  v41[0] = v15;
  id v16 = v9;
  id v17 = v12;
  id v18 = v13;
  id v19 = v14;
  id v20 = sub_32438((uint64_t)v15, "contentView");
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  double v29 = sub_7CF04();
  double v33 = CGRect.subtracting(insets:)(v29, v30, v31, v32, v22, v24, v26, v28);
  ServiceOptionComponentLayout.placeChildren(relativeTo:in:)(v1, v33, v34, v35, v36);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v4, v40);
  return sub_89384(v41);
}

uint64_t sub_88C50(uint64_t *a1, uint64_t a2)
{
  *(void *)(*(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_gridView)
            + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns) = 1LL;
  sub_98994();
  uint64_t v5 = sub_44DC(&qword_F4B80);
  uint64_t inited = swift_initStackObject(v5, v9);
  *(_OWORD *)(inited + swift_weakDestroy(v0 + 16) = xmmword_B5B40;
  *(void *)(inited + 56) = &type metadata for MarketingItemService;
  *(void *)(inited + 64) = &off_E48E0;
  uint64_t v7 = swift_allocObject(&unk_E5BC8, 104LL, 7LL);
  *(void *)(inited + 32) = v7;
  sub_2D364(a1, v7 + 16);
  sub_98FD0(inited, a2);
  swift_setDeallocating(inited);
  return sub_8933C(&qword_F4B88);
}

uint64_t sub_88D24()
{
  uint64_t v1 = v0;
  id v2 = [v0 contentView];
  sub_AD130(24.0);

  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_container];
  sub_AD130(24.0);
  id v4 = sub_32360();
  [v4 addSubview:v3];

  [v3 addSubview:*(void *)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_blurView]];
  [v3 setClipsToBounds:1];
  id v5 = sub_32360();
  sub_3238C(v5, OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel);

  id v6 = sub_32360();
  sub_3238C(v6, OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel);

  id v7 = sub_32360();
  sub_3238C(v7, OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel);

  id v8 = sub_32360();
  [v8 addSubview:*(void *)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_gridView]];

  sub_88EDC();
  sub_88F44();
  sub_8900C(v9);
  return sub_98DA0();
}

void sub_88E80(uint64_t a1@<X8>)
{
  *(void *)(a1 + 24) = &type metadata for Double;
  *(void *)(a1 + 32) = &protocol witness table for Double;
  *(void *)a1 = 0x4008000000000000LL;
  *(void *)(a1 + 64) = &type metadata for Double;
  *(void *)(a1 + 72) = &protocol witness table for Double;
  *(void *)(a1 + 40) = 0x4020000000000000LL;
  *(void *)(a1 + 104) = &type metadata for Double;
  *(void *)(a1 + 112) = &protocol witness table for Double;
  *(void *)(a1 + 80) = 0x4024000000000000LL;
  *(double *)(a1 + 120) = sub_7CF3C();
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 136) = v3;
  *(void *)(a1 + 144) = v4;
}

uint64_t sub_88EDC()
{
  uint64_t v0 = sub_1186C((uint64_t)&unk_E5BA0);
  swift_unknownObjectWeakInit(v0 + 16);
  swift_retain(v0);
  sub_98A70((uint64_t)sub_321F0, v0);
  return swift_release();
}

void sub_88F44()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_container];
  if ([v0 isFocused])
  {
    if (qword_F36D8 != -1) {
      swift_once(&qword_F36D8, sub_58790);
    }
    uint64_t v2 = &qword_1031A8;
  }

  else
  {
    if (qword_F36D0 != -1) {
      swift_once(&qword_F36D0, sub_586C4);
    }
    uint64_t v2 = &qword_1031A0;
  }

  id v3 = (id)*v2;
  [v1 setBackgroundColor:v3];
}

uint64_t sub_8900C(uint64_t a1)
{
  uint64_t v2 = v1;
  id v3 = *(uint64_t **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_titleLabel);
  id v4 = sub_11820(a1, "traitCollection");
  sub_323DC();
  id v5 = (void *)sub_32440();
  id v6 = sub_323B8(v5);

  uint64_t v7 = sub_32378(*v3);
  id v8 = *(uint64_t **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_infoLabel);
  id v9 = sub_11820(v7, "traitCollection");
  sub_323DC();
  uint64_t v10 = (void *)sub_32440();
  id v11 = sub_323B8(v10);

  uint64_t v12 = sub_32378(*v8);
  id v13 = *(void **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceOptionComponent_detailLabel);
  id v14 = sub_11820(v12, "traitCollection");
  sub_323DC();
  uint64_t v15 = (void *)sub_32440();
  id v16 = sub_323B8(v15);

  return (*(uint64_t (**)(id))((char *)&stru_68.reserved2 + (swift_isaMask & *v13)))(v16);
}

id sub_89160()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServiceOptionComponent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ServiceOptionComponent()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin22ServiceOptionComponent);
}

char **sub_89218()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___NSCollectionLayoutDimension);
  id v1 = [v0 absoluteDimension:720.0];
  id v2 = [v0 absoluteDimension:580.0];
  id v3 =  [(id)objc_opt_self(NSCollectionLayoutSize) sizeWithWidthDimension:v1 heightDimension:v2];
  sub_119C8();

  return &selRef_view;
}

char **sub_892BC()
{
  return sub_89218();
}

uint64_t sub_892D0()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_892F4()
{
  if (v0[11]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 8);
  }
  return swift_deallocObject(v0, 104LL, 7LL);
}

uint64_t sub_89330()
{
  return sub_8933C(&qword_F4B98);
}

uint64_t sub_8933C(uint64_t *a1)
{
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = sub_44DC(a1);
  swift_arrayDestroy(v1 + 32, v2, v3);
  return swift_deallocClassInstance(v1, 32LL, 7LL);
}

void *sub_89384(void *a1)
{
  return a1;
}

uint64_t sub_893B8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_893DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_893EC(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

id sub_893F4(void *a1, uint64_t a2, char a3, _BYTE *a4, double a5, double a6, double a7, double a8)
{
  return sub_89450( a1,  a2,  a3,  a4,  (uint64_t)&type metadata for Double,  (uint64_t)&protocol witness table for Double,  a5,  a6,  a7,  a8);
}

uint64_t sub_89408(uint64_t a1)
{
  return a1;
}

id sub_8943C(void *a1, uint64_t a2, char a3, _BYTE *a4, double a5, double a6, double a7, double a8)
{
  return sub_89450( a1,  a2,  a3,  a4,  (uint64_t)&type metadata for CGFloat,  (uint64_t)&protocol witness table for CGFloat,  a5,  a6,  a7,  a8);
}

id sub_89450( void *a1, uint64_t a2, char a3, _BYTE *a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  char v15 = a3 & 1;
  v23[3] = a5;
  v23[4] = a6;
  *(double *)double v23 = a7;
  v22[3] = a5;
  v22[4] = a6;
  *(double *)double v22 = a10;
  *(void *)&a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns] = 1LL;
  id v16 = &a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView];
  *id v16 = 0LL;
  v16[1] = 0LL;
  *(void *)&a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews] = _swiftEmptyArrayStorage;
  a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState] = 0;
  sub_460C((uint64_t)v22, (uint64_t)&a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_rowSpacing]);
  id v17 = (double *)&a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize];
  *id v17 = a8;
  v17[1] = a9;
  id v18 = &a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics];
  sub_460C((uint64_t)v23, (uint64_t)&a4[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics]);
  sub_69148((uint64_t)a1, (uint64_t)(v18 + 48));
  sub_691D4(a2, (uint64_t)(v18 + 88));
  sub_460C((uint64_t)v22, (uint64_t)(v18 + 128));
  v18[40] = 1;
  v18[168] = v15;
  *((void *)v18 + 22) = 1LL;
  v18[184] = 0;
  v21.receiver = a4;
  v21.super_class = (Class)type metadata accessor for ServicesGridView();
  id v19 = objc_msgSendSuper2(&v21, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_89408(a2);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v22);
  sub_6AABC(a1);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v23);
  return v19;
}

id sub_895D8(double a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  return sub_89450((uint64_t *)va1, (uint64_t)va, 1, a6, v8, v9, 30.0, a2, a2, 30.0);
}

uint64_t sub_895FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  return DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v7, va);
}

uint64_t sub_8960C()
{
  return type metadata accessor for ServicesGridView();
}

void *sub_89624(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  return sub_AE98((uint64_t *)va);
}

id sub_8962C(Class a1)
{
  return objc_allocWithZone(a1);
}

uint64_t ServiceOptionComponentLayout.init(metrics:titleView:disclaimerView:gridView:detailView:blurView:)@<X0>( void *__src@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, __int128 *a5@<X4>, __int128 *a6@<X5>, uint64_t a7@<X8>)
{
  return sub_7CF4(a6, a7);
}

uint64_t ServiceOptionComponentLayout.placeChildren(relativeTo:in:)( uint64_t a1, double a2, double a3, double a4, double a5)
{
  uint64_t v10 = v5;
  uint64_t v78 = type metadata accessor for LayoutRect(0LL);
  sub_23430(*(void *)(v78 - 8));
  __chkstk_darwin(v15);
  sub_154AC();
  uint64_t v75 = v16;
  uint64_t v77 = type metadata accessor for VerticalFlowLayout(0LL);
  sub_23430(*(void *)(v77 - 8));
  __chkstk_darwin(v17);
  sub_154AC();
  uint64_t v71 = v18;
  uint64_t v69 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v19 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  sub_B058();
  uint64_t v22 = v21 - v20;
  uint64_t v68 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  sub_23430(*(void *)(v68 - 8));
  __chkstk_darwin(v23);
  sub_B058();
  uint64_t v26 = v25 - v24;
  uint64_t v67 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v27 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  sub_B058();
  uint64_t v30 = v29 - v28;
  uint64_t v31 = *((void *)v5 + 3);
  sub_ACA0(v5, v31);
  unint64_t v72 = *(void *)&a2;
  unint64_t v73 = *(void *)&a3;
  dispatch thunk of LayoutView.frame.setter(v31);
  uint64_t v80 = (uint64_t)(v5 + 25);
  CGRect.subtracting(insets:)(v10[40], v10[41], v10[42], v10[43], a2, a3, a4, a5);
  sub_8A628();
  uint64_t v32 = sub_44DC(&qword_F3E88);
  uint64_t v33 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
  uint64_t v70 = swift_allocObject( v32,  ((*(unsigned __int8 *)(v33 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))
        + 3LL * *(void *)(v33 + 72),
          *(unsigned __int8 *)(v33 + 80) | 7LL);
  *(_OWORD *)(v70 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v35 = *((void *)v10 + 8);
  uint64_t v34 = *((void *)v10 + 9);
  sub_ACA0((void *)v10 + 5, v35);
  v88[3] = v35;
  v88[4] = *(void *)(v34 + 8);
  double v36 = sub_AE98(v88);
  sub_8A580((uint64_t)v36);
  uint64_t v87 = 0LL;
  memset(v86, 0, sizeof(v86));
  (*(void (**)(uint64_t))(v27 + 104))(v30);
  (*(void (**)(uint64_t))(v79 + 104))(v26);
  uint64_t v84 = sub_44DC(&qword_F3E90);
  uint64_t v37 = swift_allocObject( v84,  ((*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))
        + *(void *)(v19 + 72),
          *(unsigned __int8 *)(v19 + 80) | 7LL);
  *(_OWORD *)(v37 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5B40;
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5B40);
  uint64_t v85 = v37;
  unint64_t v82 = sub_13958();
  uint64_t v81 = sub_44DC(&qword_F3EA0);
  unint64_t v83 = sub_11744();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v85, v81, v83, v69, v82);
  sub_8A5EC((uint64_t)v88, v80, (uint64_t)v86);
  sub_34E94();
  v38(v22, v69);
  (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v26, v68);
  sub_34E94();
  v39(v30, v67);
  sub_34E48();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v88);
  sub_ACA0((void *)v10 + 10, *((void *)v10 + 13));
  uint64_t v40 = sub_8A610();
  sub_8A580((uint64_t)v40);
  sub_8A558();
  sub_8A5D0();
  uint64_t v41 = sub_8A5B4();
  sub_8A594(v41);
  sub_8A528();
  sub_8A5EC((uint64_t)v88, (uint64_t)(v10 + 30), (uint64_t)v86);
  sub_154F4((uint64_t)&v91);
  sub_154F4((uint64_t)&v90);
  sub_154F4((uint64_t)&v89);
  sub_34E48();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v88);
  sub_ACA0((void *)v10 + 15, *((void *)v10 + 18));
  objc_super v42 = sub_8A610();
  sub_8A580((uint64_t)v42);
  sub_8A558();
  sub_8A5D0();
  uint64_t v43 = sub_8A5B4();
  sub_8A594(v43);
  sub_8A528();
  sub_8A5EC((uint64_t)v88, (uint64_t)(v10 + 35), (uint64_t)v86);
  sub_154F4((uint64_t)&v91);
  sub_154F4((uint64_t)&v90);
  sub_154F4((uint64_t)&v89);
  sub_34E48();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v88);
  VerticalFlowLayout.init(expandChildrenToFit:children:)(0LL, v70);
  double v44 = sub_8A5FC();
  uint64_t v48 = VerticalFlowLayout.placeChildren(relativeTo:in:)(a1, v44, v45, v46, v47);
  LayoutRect.size.getter(v48);
  CGRect.subtracting(insets:)(v49, 0.0, 0.0, 0.0, v6, v7, v8, v9);
  sub_8A628();
  uint64_t v50 = *((void *)v10 + 23);
  sub_ACA0((void *)v10 + 20, v50);
  double v51 = dispatch thunk of Measurable.measurements(fitting:in:)(a1, v50);
  double v53 = v52;
  uint64_t v54 = *((void *)v10 + 23);
  sub_ACA0((void *)v10 + 20, v54);
  v92.origin.x = sub_8A5FC();
  CGFloat MinX = CGRectGetMinX(v92);
  v93.origin.x = sub_8A5FC();
  double v56 = CGRectGetMaxY(v93) - v53;
  v57.n128_u64[0] = v72;
  v58.n128_u64[0] = v73;
  v59.n128_f64[0] = a4;
  v60.n128_f64[0] = a5;
  v61.n128_f64[0] = MinX;
  CGRect.withLayoutDirection(in:relativeTo:)(v57, v58, v59, v60, v61, v56, v51, v53);
  dispatch thunk of LayoutView.frame.setter(v54);
  v94.origin.x = sub_8A63C();
  double v62 = CGRectGetMinX(v94);
  v95.origin.x = sub_8A63C();
  double MinY = CGRectGetMinY(v95);
  LayoutRect.init(x:y:width:height:firstBaseline:lastBaseline:)(v62, MinY, a4, a5, 0.0, 0.0);
  sub_34E94();
  v64(v75, v78);
  sub_34E94();
  return v65(v71, v77);
}

uint64_t ServiceOptionComponentLayout.Metrics.init(titleTopSpace:disclaimerTopSpace:detailTopSpace:contentInsets:)@<X0>( __int128 *a1@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, double *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  uint64_t result = sub_7CF4(a3, (uint64_t)(a4 + 10));
  a4[15] = a5;
  a4[16] = a6;
  a4[17] = a7;
  a4[18] = a8;
  return result;
}

double ServiceOptionComponentLayout.Metrics.contentInsets.getter()
{
  return *(double *)(v0 + 120);
}

void ServiceOptionComponentLayout.Metrics.contentInsets.setter(double a1, double a2, double a3, double a4)
{
  v4[15] = a1;
  v4[16] = a2;
  v4[17] = a3;
  v4[18] = a4;
}

_OWORD *ServiceOptionComponentLayout.metrics.getter@<X0>(_OWORD *a1@<X8>)
{
  return sub_89E74((_OWORD *)(v1 + 200), a1);
}

_OWORD *sub_89E74(_OWORD *a1, _OWORD *a2)
{
  return a2;
}

unint64_t sub_89EAC()
{
  unint64_t result = qword_F7638;
  if (!qword_F7638)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ServiceOptionComponentLayout,  &type metadata for ServiceOptionComponentLayout);
    atomic_store(result, (unint64_t *)&qword_F7638);
  }

  return result;
}

uint64_t destroy for ServiceOptionComponentLayout(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 35);
}

uint64_t initializeWithCopy for ServiceOptionComponentLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  __int128 v6 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 80, a2 + 80);
  __int128 v7 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 144) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 120, a2 + 120);
  __int128 v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 184) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 160, a2 + 160);
  __int128 v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 200, a2 + 200);
  uint64_t v10 = *(void *)(a2 + 264);
  uint64_t v11 = *(void *)(a2 + 272);
  *(void *)(a1 + 264) = v10;
  *(void *)(a1 + 272) = v11;
  (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 240, a2 + 240);
  __int128 v12 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 304) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 280, a2 + 280);
  __int128 v13 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v13;
  return a1;
}

void *assignWithCopy for ServiceOptionComponentLayout(void *a1, void *a2)
{
  a1[40] = a2[40];
  a1[41] = a2[41];
  a1[42] = a2[42];
  a1[43] = a2[43];
  return a1;
}

void *initializeWithTake for ServiceOptionComponentLayout(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x160uLL);
}

uint64_t assignWithTake for ServiceOptionComponentLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 80));
  __int128 v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 120));
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 160));
  __int128 v6 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v6;
  *(void *)(a1 + 192) = *(void *)(a2 + 192);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 200));
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 2swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 232) = *(void *)(a2 + 232);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 240));
  __int128 v7 = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 240) = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 256) = v7;
  *(void *)(a1 + 272) = *(void *)(a2 + 272);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 280));
  __int128 v8 = *(_OWORD *)(a2 + 296);
  *(_OWORD *)(a1 + 280) = *(_OWORD *)(a2 + 280);
  *(_OWORD *)(a1 + 296) = v8;
  *(void *)(a1 + 312) = *(void *)(a2 + 312);
  __int128 v9 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v9;
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceOptionComponentLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 352))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceOptionComponentLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 344) = 0LL;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 2swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 352) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 352) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ServiceOptionComponentLayout()
{
  return &type metadata for ServiceOptionComponentLayout;
}

_OWORD *initializeWithCopy for ServiceOptionComponentLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  __int128 v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  __int128 v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  __int128 v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  *(_OWORD *)((char *)a1 + 120) = *(_OWORD *)((char *)a2 + 120);
  *(_OWORD *)((char *)a1 + 136) = *(_OWORD *)((char *)a2 + 136);
  return a1;
}

void *assignWithCopy for ServiceOptionComponentLayout.Metrics(void *a1, void *a2)
{
  a1[15] = a2[15];
  a1[16] = a2[16];
  a1[17] = a2[17];
  a1[18] = a2[18];
  return a1;
}

void *initializeWithTake for ServiceOptionComponentLayout.Metrics(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x98uLL);
}

uint64_t assignWithTake for ServiceOptionComponentLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 80));
  __int128 v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceOptionComponentLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 152))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceOptionComponentLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 152) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 152) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ServiceOptionComponentLayout.Metrics()
{
  return &type metadata for ServiceOptionComponentLayout.Metrics;
}

uint64_t sub_8A528()
{
  *(void *)(v2 - 248) = v0;
  return dispatch thunk of SetAlgebra.init<A>(_:)( v2 - 248,  *(void *)(v2 - 360),  *(void *)(v2 - 344),  v1,  *(void *)(v2 - 352));
}

uint64_t sub_8A558()
{
  *(void *)(v2 - 208) = 0LL;
  *(_OWORD *)(v2 - 240) = 0u;
  *(_OWORD *)(v2 - 224) = 0u;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 - 272))(v1, *(unsigned int *)(v2 - 260), v0);
}

uint64_t sub_8A580(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v1 - 8) + 16LL))(a1, v2, v1);
}

uint64_t sub_8A594(uint64_t a1)
{
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(v1 - 336);
  return static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter();
}

uint64_t sub_8A5B4()
{
  return swift_allocObject(*(void *)(v0 - 296), *(void *)(v0 - 304), *(void *)(v0 - 312));
}

uint64_t sub_8A5D0()
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 - 288))(v1, *(unsigned int *)(v2 - 276), v0);
}

uint64_t sub_8A5EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( a1,  a2,  a3,  v4,  v3,  v5);
}

double sub_8A5FC()
{
  return v0;
}

void *sub_8A610()
{
  *(void *)(v2 - 168) = v0;
  *(void *)(v2 - 160) = *(void *)(v1 + 8);
  return sub_AE98((void *)(v2 - 192));
}

  ;
}

double sub_8A63C()
{
  return v0;
}

unint64_t sub_8A650(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEDA0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_8A698(char a1)
{
  if (!a1) {
    return 0x6853726564616568LL;
  }
  if (a1 == 1) {
    return 0x6C65685379646F62LL;
  }
  return 0x79646F427473616CLL;
}

void sub_8A708()
{
}

void sub_8A714()
{
}

uint64_t sub_8A71C(uint64_t a1)
{
  return sub_76058(a1, *v1);
}

void sub_8A724(uint64_t a1)
{
}

unint64_t sub_8A72C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_8A650(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8A758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_8A698(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t *sub_8A780@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain(a2);
  v29._countAndFlagsBits = a1;
  v29._object = a2;
  char v8 = sub_8A650(v29);
  type metadata accessor for Log();
  uint64_t v9 = sub_44DC((uint64_t *)&unk_F7110);
  uint64_t v10 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = v12 | 7;
  if (v8 == 3)
  {
    uint64_t v15 = swift_allocObject(v9, v13 + 2 * v11, v14);
    *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    __dst[3] = &type metadata for ServiceOverlayPlatterLayout.BodySpacing;
    __dst[0] = swift_allocObject(&unk_E5E08, 304LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), v4, 0x120uLL);
    sub_5ABE8((uint64_t *)v4);
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[0] = 0LL;
    __dst[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(42LL);
    swift_bridgeObjectRelease();
    __dst[0] = 0xD000000000000018LL;
    __dst[1] = 0x80000000000BD2F0LL;
    v16._countAndFlagsBits = a1;
    v16._object = a2;
    String.append(_:)(v16);
    v17._object = (void *)0x80000000000BD310LL;
    v17._countAndFlagsBits = 0xD000000000000010LL;
    String.append(_:)(v17);
    __dst[3] = &type metadata for String;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v15);
    swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for ServiceOverlayPlatterLayout.BodySpacing;
    a3[4] = (uint64_t)&off_E5F50;
    uint64_t v18 = swift_allocObject(&unk_E5E08, 304LL, 7LL);
    *a3 = v18;
    memcpy((void *)(v18 + 16), v4, 0x120uLL);
    return sub_5ABE8((uint64_t *)v4);
  }

  else
  {
    uint64_t v20 = swift_allocObject(v9, v13 + 3 * v11, v14);
    *(_OWORD *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    __dst[3] = &type metadata for ServiceOverlayPlatterLayout.BodySpacing;
    __dst[0] = swift_allocObject(&unk_E5E08, 304LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), v4, 0x120uLL);
    sub_5ABE8((uint64_t *)v4);
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for String;
    __dst[0] = 0xD00000000000001CLL;
    __dst[1] = 0x80000000000BD330LL;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for ServiceOverlayPlatterLayout.BodySpacing.OverrideSectionIdentifier;
    LOBYTE(__dst[0]) = v8;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v20);
    swift_bridgeObjectRelease();
    if (v8)
    {
      if (v8 == 1)
      {
        uint64_t v21 = v4 + 72;
      }

      else
      {
        id v25 = [(id)objc_opt_self(UIDevice) currentDevice];
        uint64_t v26 = (char *)[v25 userInterfaceIdiom];

        if (v26 == (_BYTE *)&dword_0 + 1) {
          uint64_t v21 = v4 + 216;
        }
        else {
          uint64_t v21 = v4 + 144;
        }
      }

      memcpy(__dst, v21, sizeof(__dst));
      a3[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      a3[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v27 = swift_allocObject(&unk_E5FB8, 88LL, 7LL);
      *a3 = v27;
      uint64_t v23 = (void *)(v27 + 16);
      uint64_t v24 = v21;
    }

    else
    {
      memcpy(__dst, v4, sizeof(__dst));
      a3[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      a3[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v22 = swift_allocObject(&unk_E5FB8, 88LL, 7LL);
      *a3 = v22;
      uint64_t v23 = (void *)(v22 + 16);
      uint64_t v24 = v4;
    }

    memcpy(v23, v24, 0x48uLL);
    return (uint64_t *)sub_451C((uint64_t)__dst);
  }

double sub_8AB8C@<D0>(uint64_t a1@<X8>)
{
  *((void *)&v57 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v58 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  char v26 = 0;
  char v22 = 1;
  char v18 = 0;
  char v14 = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v44,  &v56,  0LL,  1LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v14,  0LL,  v18,  0LL,  v22,  0LL,  v26,  0LL,  0LL);
  __int128 v39 = v44[1];
  __int128 v40 = v44[0];
  __int128 v38 = v44[2];
  uint64_t v2 = v45;
  uint64_t v36 = v47;
  uint64_t v37 = v46;
  *((void *)&v57 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v58 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v27) = 0;
  LOBYTE(v2_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0;
  LOBYTE(v19) = 0;
  LOBYTE(v15) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v48,  &v56,  0x4028000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v15,  0LL,  v19,  0x4020000000000000LL,  v23,  0LL,  v27,  0LL,  0LL);
  __int128 v34 = v48[1];
  __int128 v35 = v48[0];
  __int128 v33 = v48[2];
  uint64_t v3 = v49;
  uint64_t v4 = v50;
  uint64_t v5 = v51;
  *((void *)&v57 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v58 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v28) = 1;
  LOBYTE(v24) = 0;
  LOBYTE(v20) = 1;
  LOBYTE(vswift_unknownObjectWeakDestroy(v0 + 16) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v52,  &v56,  0LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v16,  0LL,  v20,  0x4034000000000000LL,  v24,  0LL,  v28,  0LL,  0LL);
  __int128 v31 = v52[1];
  __int128 v32 = v52[0];
  __int128 v30 = v52[2];
  uint64_t v6 = v53;
  uint64_t v7 = v54;
  uint64_t v8 = v55;
  objc_super v42 = &type metadata for DefaultLayoutCollectionSpacingModel;
  uint64_t v43 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v29) = 1;
  LOBYTE(v25) = 0;
  LOBYTE(v21) = 1;
  LOBYTE(v17) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( &v56,  v41,  0LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0x404C000000000000LL,  v17,  0LL,  v21,  0x4034000000000000LL,  v25,  0LL,  v29,  0LL,  0LL);
  double result = v59;
  __int128 v10 = v60;
  __int128 v11 = v56;
  __int128 v12 = v57;
  __int128 v13 = v58;
  *(_OWORD *)a1 = v40;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v39;
  *(_OWORD *)(a1 + 32) = v38;
  *(void *)(a1 + 48) = v2;
  *(void *)(a1 + 56) = v37;
  *(void *)(a1 + 64) = v36;
  *(_OWORD *)(a1 + 72) = v35;
  *(_OWORD *)(a1 + 88) = v34;
  *(_OWORD *)(a1 + 104) = v33;
  *(void *)(a1 + 120) = v3;
  *(void *)(a1 + 128) = v4;
  *(void *)(a1 + 136) = v5;
  *(_OWORD *)(a1 + 144) = v32;
  *(_OWORD *)(a1 + 160) = v31;
  *(_OWORD *)(a1 + 176) = v30;
  *(void *)(a1 + 192) = v6;
  *(void *)(a1 + 200) = v7;
  *(void *)(a1 + 208) = v8;
  *(_OWORD *)(a1 + 2swift_unknownObjectWeakDestroy(v0 + 16) = v11;
  *(_OWORD *)(a1 + 232) = v12;
  *(_OWORD *)(a1 + 248) = v13;
  *(double *)(a1 + 264) = result;
  *(_OWORD *)(a1 + 272) = v10;
  return result;
}

uint64_t *sub_8AE1C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_8A780(a1, a2, a3);
}

uint64_t sub_8AE7C@<X0>(void *a1@<X8>)
{
  v10[3] = &type metadata for ServiceOverlayPlatterLayout.BodySpacing;
  v10[4] = &off_E5F50;
  v10[0] = swift_allocObject(&unk_E5E08, 304LL, 7LL);
  memcpy((void *)(v10[0] + 16LL), __src, 0x120uLL);
  uint64_t v9 = 0LL;
  memset(v8, 0, sizeof(v8));
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = &type metadata for DefaultLayoutSpacingModel;
  uint64_t v5 = &protocol witness table for DefaultLayoutSpacingModel;
  a1[3] = &type metadata for BoxedLayoutSpacingModel;
  a1[4] = &protocol witness table for BoxedLayoutSpacingModel;
  *a1 = swift_allocObject(&unk_E5E30, 136LL, 7LL);
  return BoxedLayoutSpacingModel.init(base:body:footer:header:)(v3, v10, v8, v6);
}

uint64_t sub_8AF54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = type metadata accessor for JSONContext(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a2, v5);
  uint64_t v6 = type metadata accessor for JSONObject(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
}

uint64_t sub_8AFC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_8AF54(a1, a2, a3);
}

uint64_t sub_8AFD4()
{
  if (v0[9]) {
    swift_release(v0[10]);
  }
  if (v0[18]) {
    swift_release(v0[19]);
  }
  if (v0[27]) {
    swift_release(v0[28]);
  }
  if (v0[36]) {
    swift_release(v0[37]);
  }
  return swift_deallocObject(v0, 304LL, 7LL);
}

uint64_t sub_8B030()
{
  return swift_deallocObject(v0, 136LL, 7LL);
}

ValueMetadata *type metadata accessor for ServiceOverlayPlatterLayout.BodySpacing()
{
  return &type metadata for ServiceOverlayPlatterLayout.BodySpacing;
}

ValueMetadata *type metadata accessor for ServiceOverlayPlatterLayout()
{
  return &type metadata for ServiceOverlayPlatterLayout;
}

uint64_t sub_8B084()
{
  if (*(void *)(v0 + 72)) {
    swift_release(*(void *)(v0 + 80));
  }
  return swift_deallocObject(v0, 88LL, 7LL);
}

uint64_t storeEnumTagSinglePayload for ServiceOverlayPlatterLayout.BodySpacing.OverrideSectionIdentifier( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_8B0FC + 4 * byte_BB475[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_8B130 + 4 * asc_BB470[v4]))();
}

uint64_t sub_8B130(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_8B138(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x8B140LL);
  }
  return result;
}

uint64_t sub_8B14C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x8B154LL);
  }
  *(_BYTE *)double result = a2 + 2;
  return result;
}

uint64_t sub_8B158(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8B160(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceOverlayPlatterLayout.BodySpacing.OverrideSectionIdentifier()
{
  return &type metadata for ServiceOverlayPlatterLayout.BodySpacing.OverrideSectionIdentifier;
}

unint64_t sub_8B180()
{
  unint64_t result = qword_F7640;
  if (!qword_F7640)
  {
    unint64_t result = swift_getWitnessTable( &unk_BB594,  &type metadata for ServiceOverlayPlatterLayout.BodySpacing.OverrideSectionIdentifier);
    atomic_store(result, (unint64_t *)&qword_F7640);
  }

  return result;
}

unint64_t sub_8B1BC(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEE08, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_8B204(char a1)
{
  if (!a1) {
    return 0x656853656C746974LL;
  }
  if (a1 == 1) {
    return 0x6C65685379646F62LL;
  }
  return 0x79646F427473616CLL;
}

void sub_8B270()
{
}

void sub_8B27C()
{
}

uint64_t sub_8B284(uint64_t a1)
{
  return sub_75F40(a1, *v1);
}

void sub_8B28C(uint64_t a1)
{
}

unint64_t sub_8B294@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_8B1BC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8B2C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_8B204(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t *sub_8B2E8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain(a2);
  v27._countAndFlagsBits = a1;
  v27._object = a2;
  char v8 = sub_8B1BC(v27);
  type metadata accessor for Log();
  uint64_t v9 = sub_44DC((uint64_t *)&unk_F7110);
  uint64_t v10 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  uint64_t v12 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (v12 + 32) & ~v12;
  uint64_t v14 = v12 | 7;
  if (v8 == 3)
  {
    uint64_t v15 = swift_allocObject(v9, v13 + 2 * v11, v14);
    *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    __dst[3] = &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing;
    __dst[0] = swift_allocObject(&unk_E60F0, 232LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), v4, 0xD8uLL);
    sub_CE04((uint64_t *)v4);
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[0] = 0LL;
    __dst[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(42LL);
    swift_bridgeObjectRelease();
    __dst[0] = 0xD000000000000018LL;
    __dst[1] = 0x80000000000BD2F0LL;
    v16._countAndFlagsBits = a1;
    v16._object = a2;
    String.append(_:)(v16);
    v17._object = (void *)0x80000000000BD310LL;
    v17._countAndFlagsBits = 0xD000000000000010LL;
    String.append(_:)(v17);
    __dst[3] = &type metadata for String;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v15);
    swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for ServiceOverlayPlatterTVLayout.BodySpacing;
    a3[4] = (uint64_t)&off_E6238;
    uint64_t v18 = swift_allocObject(&unk_E60F0, 232LL, 7LL);
    *a3 = v18;
    memcpy((void *)(v18 + 16), v4, 0xD8uLL);
    return sub_CE04((uint64_t *)v4);
  }

  else
  {
    uint64_t v20 = swift_allocObject(v9, v13 + 3 * v11, v14);
    *(_OWORD *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    __dst[3] = &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing;
    __dst[0] = swift_allocObject(&unk_E60F0, 232LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), v4, 0xD8uLL);
    sub_CE04((uint64_t *)v4);
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for String;
    __dst[0] = 0xD00000000000001CLL;
    __dst[1] = 0x80000000000BD330LL;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing.OverrideSectionIdentifier;
    LOBYTE(__dst[0]) = v8;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v20);
    swift_bridgeObjectRelease();
    if (v8)
    {
      if (v8 == 1) {
        int v21 = v4 + 72;
      }
      else {
        int v21 = v4 + 144;
      }
      memcpy(__dst, v21, sizeof(__dst));
      a3[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      a3[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v25 = swift_allocObject(&unk_E62A0, 88LL, 7LL);
      *a3 = v25;
      int v23 = (void *)(v25 + 16);
      int v24 = v21;
    }

    else
    {
      memcpy(__dst, v4, sizeof(__dst));
      a3[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      a3[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v22 = swift_allocObject(&unk_E62A0, 88LL, 7LL);
      *a3 = v22;
      int v23 = (void *)(v22 + 16);
      int v24 = v4;
    }

    memcpy(v23, v24, 0x48uLL);
    return (uint64_t *)sub_451C((uint64_t)__dst);
  }

double sub_8B6AC@<D0>(uint64_t a1@<X8>)
{
  *((void *)&v43 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v44 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  char v22 = 1;
  char v19 = 0;
  char v16 = 1;
  char v13 = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v34,  &v42,  0x403F000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0x4044000000000000LL,  v13,  0LL,  v16,  0LL,  v19,  0LL,  v22,  0LL,  0LL);
  __int128 v29 = v34[1];
  __int128 v30 = v34[0];
  __int128 v28 = v34[2];
  uint64_t v2 = v35;
  uint64_t v3 = v36;
  uint64_t v4 = v37;
  *((void *)&v43 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v44 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v2_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 1;
  LOBYTE(v20) = 0;
  LOBYTE(v1_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = 1;
  LOBYTE(v14) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v38,  &v42,  0x402C000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v14,  0LL,  v17,  0LL,  v20,  0LL,  v23,  0LL,  0LL);
  __int128 v26 = v38[1];
  __int128 v27 = v38[0];
  __int128 v25 = v38[2];
  uint64_t v5 = v39;
  uint64_t v6 = v40;
  uint64_t v7 = v41;
  __int128 v32 = &type metadata for DefaultLayoutCollectionSpacingModel;
  __int128 v33 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v24) = 1;
  LOBYTE(v21) = 0;
  LOBYTE(v18) = 1;
  LOBYTE(v15) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( &v42,  v31,  0LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v15,  0LL,  v18,  0x4034000000000000LL,  v21,  0LL,  v24,  0LL,  0LL);
  double result = v45;
  __int128 v9 = v46;
  __int128 v10 = v42;
  __int128 v11 = v43;
  __int128 v12 = v44;
  *(_OWORD *)a1 = v30;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v29;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v28;
  *(void *)(a1 + 48) = v2;
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v27;
  *(_OWORD *)(a1 + 88) = v26;
  *(_OWORD *)(a1 + 104) = v25;
  *(void *)(a1 + 120) = v5;
  *(void *)(a1 + 128) = v6;
  *(void *)(a1 + 136) = v7;
  *(_OWORD *)(a1 + 144) = v10;
  *(_OWORD *)(a1 + 160) = v11;
  *(_OWORD *)(a1 + 176) = v12;
  *(double *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = result;
  *(_OWORD *)(a1 + 200) = v9;
  return result;
}

uint64_t *sub_8B88C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_8B2E8(a1, a2, a3);
}

uint64_t sub_8B8EC@<X0>(void *a1@<X8>)
{
  v10[3] = &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing;
  v10[4] = &off_E6238;
  v10[0] = swift_allocObject(&unk_E60F0, 232LL, 7LL);
  memcpy((void *)(v10[0] + 16LL), __src, 0xD8uLL);
  uint64_t v9 = 0LL;
  memset(v8, 0, sizeof(v8));
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = &type metadata for DefaultLayoutSpacingModel;
  uint64_t v5 = &protocol witness table for DefaultLayoutSpacingModel;
  a1[3] = &type metadata for BoxedLayoutSpacingModel;
  a1[4] = &protocol witness table for BoxedLayoutSpacingModel;
  *a1 = swift_allocObject(&unk_E6118, 136LL, 7LL);
  return BoxedLayoutSpacingModel.init(base:body:footer:header:)(v3, v10, v8, v6);
}

uint64_t sub_8B9C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = type metadata accessor for JSONContext(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a2, v5);
  uint64_t v6 = type metadata accessor for JSONObject(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
}

uint64_t sub_8BA30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_8B9C4(a1, a2, a3);
}

uint64_t sub_8BA44()
{
  if (v0[9]) {
    swift_release(v0[10]);
  }
  if (v0[18]) {
    swift_release(v0[19]);
  }
  if (v0[27]) {
    swift_release(v0[28]);
  }
  return swift_deallocObject(v0, 232LL, 7LL);
}

uint64_t sub_8BA90()
{
  return swift_deallocObject(v0, 136LL, 7LL);
}

ValueMetadata *type metadata accessor for ServiceOverlayPlatterTVLayout.BodySpacing()
{
  return &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing;
}

ValueMetadata *type metadata accessor for ServiceOverlayPlatterTVLayout()
{
  return &type metadata for ServiceOverlayPlatterTVLayout;
}

uint64_t sub_8BAE4()
{
  if (*(void *)(v0 + 72)) {
    swift_release(*(void *)(v0 + 80));
  }
  return swift_deallocObject(v0, 88LL, 7LL);
}

uint64_t storeEnumTagSinglePayload for ServiceOverlayPlatterTVLayout.BodySpacing.OverrideSectionIdentifier( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_8BB5C + 4 * byte_BB5C5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_8BB90 + 4 * byte_BB5C0[v4]))();
}

uint64_t sub_8BB90(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_8BB98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x8BBA0LL);
  }
  return result;
}

uint64_t sub_8BBAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x8BBB4LL);
  }
  *(_BYTE *)double result = a2 + 2;
  return result;
}

uint64_t sub_8BBB8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8BBC0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceOverlayPlatterTVLayout.BodySpacing.OverrideSectionIdentifier()
{
  return &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing.OverrideSectionIdentifier;
}

unint64_t sub_8BBE0()
{
  unint64_t result = qword_F7648;
  if (!qword_F7648)
  {
    unint64_t result = swift_getWitnessTable( &unk_BB6E4,  &type metadata for ServiceOverlayPlatterTVLayout.BodySpacing.OverrideSectionIdentifier);
    atomic_store(result, (unint64_t *)&qword_F7648);
  }

  return result;
}

uint64_t sub_8BC1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 52);
  uint64_t v5 = type metadata accessor for PageMetrics(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

uint64_t sub_8BC5C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3968);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = type metadata accessor for PageMetrics(0LL);
  uint64_t v42 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for ActionFactory(0LL);
  uint64_t v11 = sub_E9C0(v10);
  uint64_t v12 = type metadata accessor for DynamicTextFactory(0LL);
  uint64_t v13 = sub_E9C0(v12);
  uint64_t v14 = type metadata accessor for ServiceProductBadgedPageDestination(0LL);
  uint64_t v44 = a1;
  sub_588C(0x6B726F77747261LL, 0xE700000000000000LL, v14, (uint64_t)sub_8C458, (uint64_t)v43, v15, v16, v17);
  if (v2)
  {
    swift_errorRelease(v2);
    uint64_t v18 = 0LL;
  }

  *(void *)a2 = v18;
  sub_6E04();
  uint64_t v40 = v9;
  uint64_t v41 = v13;
  *(_BYTE *)(a2 + 8) = v19;
  __chkstk_darwin(v19);
  sub_397CC();
  sub_6C0C8();
  sub_8CD44();
  uint64_t v38 = a1;
  uint64_t v39 = v11;
  sub_7CF4(&v49, a2 + 16);
  sub_6C0C8();
  uint64_t v20 = sub_8CD50();
  *(void *)(a2 + 56) = v20;
  *(void *)(a2 + 64) = v21;
  __chkstk_darwin(v20);
  sub_8CCF0();
  uint64_t v22 = v38;
  *(void *)(v23 - swift_unknownObjectWeakDestroy(v0 + 16) = &v37;
  *(void *)(v23 - 8) = v22;
  sub_39814();
  uint64_t v24 = sub_7CF4(&v48, a2 + 72);
  __chkstk_darwin(v24);
  sub_397CC();
  sub_6C0C8();
  sub_8CD44();
  sub_7CF4(&v47, a2 + 112);
  sub_6C0C8();
  uint64_t v25 = sub_8CD50();
  *(void *)(a2 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v25;
  *(void *)(a2 + 160) = v26;
  __chkstk_darwin(v25);
  *(&v37 - _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v22;
  sub_609C();
  sub_4AD0((uint64_t)v7, 0LL, 1LL, v50);
  __int128 v27 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
  __int128 v28 = v40;
  __int128 v29 = v7;
  uint64_t v30 = v50;
  v27(v40, v29, v50);
  uint64_t v31 = ((uint64_t (*)(uint64_t, char *, uint64_t))v27)(a2 + *(int *)(v14 + 52), v28, v30);
  __chkstk_darwin(v31);
  *(&v37 - _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v41;
  *(&v37 - 1) = v22;
  sub_39814();
  uint64_t v32 = sub_39410((uint64_t)&v46, a2 + 168);
  __chkstk_darwin(v32);
  sub_8CCF0();
  *(void *)(v33 - swift_unknownObjectWeakDestroy(v0 + 16) = &v37;
  *(void *)(v33 - 8) = v22;
  sub_58A0();
  uint64_t v34 = type metadata accessor for JSONObject(0LL);
  sub_851C(v34);
  sub_87BF8();
  sub_2F388();
  uint64_t v35 = sub_8484();
  sub_397B8(v35);
  return sub_7CF4(&v45, a2 + 208);
}

uint64_t sub_8C2F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for JSONContext(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for JSONObject(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = &v15[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  type metadata accessor for Artwork(0LL);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  uint64_t result = Artwork.__allocating_init(deserializing:using:)(v13, v9);
  *a3 = result;
  return result;
}

uint64_t sub_8C40C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_8BC5C(a1, a2);
}

uint64_t type metadata accessor for ServiceProductBadgedPageDestination(uint64_t a1)
{
  uint64_t result = qword_F76A8;
  if (!qword_F76A8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceProductBadgedPageDestination);
  }
  return result;
}

uint64_t sub_8C458@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_8C2F4(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_8C460(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16LL) & ~(unint64_t)v4);
    swift_retain(v5);
  }

  else
  {
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    uint64_t v8 = a2 + 2;
    __int128 v9 = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 40) = v9;
    uint64_t v10 = v9;
    uint64_t v11 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v9 - 8);
    swift_retain(v5);
    v11(a1 + 16, v8, v10);
    uint64_t v12 = a2[8];
    *(void *)(a1 + 56) = a2[7];
    *(void *)(a1 + 64) = v12;
    __int128 v13 = *((_OWORD *)a2 + 6);
    *(_OWORD *)(a1 + 96) = v13;
    uint64_t v14 = v13;
    uint64_t v15 = **(void (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
    swift_bridgeObjectRetain(v12);
    v15(a1 + 72, (uint64_t)(a2 + 9), v14);
    __int128 v16 = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(a1 + 136) = v16;
    (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 112, (uint64_t)(a2 + 14));
    uint64_t v17 = a2[20];
    *(void *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a2[19];
    *(void *)(a1 + 160) = v17;
    uint64_t v18 = a2[24];
    swift_bridgeObjectRetain(v17);
    if (v18)
    {
      uint64_t v19 = a2[25];
      *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v18;
      *(void *)(a1 + 200) = v19;
      (**(void (***)(uint64_t, uint64_t, uint64_t))(v18 - 8))(a1 + 168, (uint64_t)(a2 + 21), v18);
    }

    else
    {
      __int128 v20 = *(_OWORD *)(a2 + 23);
      *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 21);
      *(_OWORD *)(a1 + 184) = v20;
      *(void *)(a1 + 200) = a2[25];
    }

    __int128 v21 = *(_OWORD *)(a2 + 29);
    *(_OWORD *)(a1 + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v21;
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 208, (uint64_t)(a2 + 26));
    uint64_t v22 = *(int *)(a3 + 52);
    uint64_t v23 = a1 + v22;
    uint64_t v24 = (uint64_t)a2 + v22;
    uint64_t v25 = type metadata accessor for PageMetrics(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 16LL))(v23, v24, v25);
  }

  return a1;
}

uint64_t sub_8C5F8(void *a1, uint64_t a2)
{
  if (a1[24]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 21);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 26);
  int v4 = (char *)a1 + *(int *)(a2 + 52);
  uint64_t v5 = type metadata accessor for PageMetrics(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t sub_8C680(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v7 = a2 + 2;
  __int128 v8 = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(a1 + 40) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t *, uint64_t))(v8 - 8);
  swift_retain(v6);
  v10(a1 + 16, v7, v9);
  uint64_t v11 = a2[8];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = v11;
  __int128 v12 = *((_OWORD *)a2 + 6);
  *(_OWORD *)(a1 + 96) = v12;
  uint64_t v13 = v12;
  uint64_t v14 = **(void (***)(uint64_t, uint64_t, uint64_t))(v12 - 8);
  swift_bridgeObjectRetain(v11);
  v14(a1 + 72, (uint64_t)(a2 + 9), v13);
  __int128 v15 = *(_OWORD *)(a2 + 17);
  *(_OWORD *)(a1 + 136) = v15;
  (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 112, (uint64_t)(a2 + 14));
  uint64_t v16 = a2[20];
  *(void *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a2[19];
  *(void *)(a1 + 160) = v16;
  uint64_t v17 = a2[24];
  swift_bridgeObjectRetain(v16);
  if (v17)
  {
    uint64_t v18 = a2[25];
    *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v17;
    *(void *)(a1 + 200) = v18;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v17 - 8))(a1 + 168, (uint64_t)(a2 + 21), v17);
  }

  else
  {
    __int128 v19 = *(_OWORD *)(a2 + 23);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 21);
    *(_OWORD *)(a1 + 184) = v19;
    *(void *)(a1 + 200) = a2[25];
  }

  __int128 v20 = *(_OWORD *)(a2 + 29);
  *(_OWORD *)(a1 + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v20;
  (**(void (***)(uint64_t, uint64_t))(v20 - 8))(a1 + 208, (uint64_t)(a2 + 26));
  uint64_t v21 = *(int *)(a3 + 52);
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t)a2 + v21;
  uint64_t v24 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16LL))(v22, v23, v24);
  return a1;
}

uint64_t sub_8C7F4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  swift_retain(v6);
  swift_release();
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  sub_4290((void *)(a1 + 16), a2 + 2);
  *(void *)(a1 + 56) = a2[7];
  uint64_t v7 = a2[8];
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease();
  sub_4290((void *)(a1 + 72), a2 + 9);
  sub_4290((void *)(a1 + 112), a2 + 14);
  *(void *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a2[19];
  uint64_t v8 = a2[20];
  *(void *)(a1 + 160) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease();
  uint64_t v9 = a2[24];
  if (!*(void *)(a1 + 192))
  {
    if (v9)
    {
      *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v9;
      *(void *)(a1 + 200) = a2[25];
      (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 168, (uint64_t)(a2 + 21));
      goto LABEL_8;
    }

uint64_t sub_8C950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  __int128 v5 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v5;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_OWORD *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  __int128 v6 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v6;
  uint64_t v7 = *(int *)(a3 + 52);
  uint64_t v8 = a2 + v7;
  uint64_t v9 = a1 + v7;
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  uint64_t v10 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v9, v8, v10);
  return a1;
}

uint64_t sub_8CA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 16));
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRelease();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 112));
  __int128 v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 192)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 168));
  }
  __int128 v8 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = v8;
  *(void *)(a1 + 200) = *(void *)(a2 + 200);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 208));
  __int128 v9 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v9;
  *(void *)(a1 + 240) = *(void *)(a2 + 240);
  uint64_t v10 = *(int *)(a3 + 52);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40LL))(v11, v12, v13);
  return a1;
}

uint64_t sub_8CB48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8CB54);
}

uint64_t sub_8CB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for PageMetrics(0LL);
    return sub_4AC4(a1 + *(int *)(a3 + 52), a2, v8);
  }

uint64_t sub_8CBC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8CBD4);
}

uint64_t sub_8CBD4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 40) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for PageMetrics(0LL);
    return sub_4AD0(v5 + *(int *)(a4 + 52), a2, a2, v7);
  }

  return result;
}

uint64_t sub_8CC40(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = &unk_BB780;
  v4[2] = &unk_BB798;
  v4[3] = &unk_BB7B0;
  v4[4] = &unk_BB798;
  v4[5] = &unk_BB798;
  void v4[6] = &unk_BB7B0;
  v4[7] = &unk_BB7C8;
  void v4[8] = &unk_BB798;
  uint64_t result = type metadata accessor for PageMetrics(319LL);
  if (v3 <= 0x3F)
  {
    void v4[9] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 10LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_8CCE4()
{
  return swift_release(*(void *)(v0 - 336));
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_8CD44()
{
}

uint64_t sub_8CD50()
{
  return sub_6F270();
}

uint64_t sub_8CD5C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEE70, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_8CDAC()
{
  return sub_77A78(*v0);
}

uint64_t sub_8CDB4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_8CD5C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8CDE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2FF0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t *sub_8CE08@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v66 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_bridgeObjectRetain(a2);
  v71._countAndFlagsBits = a1;
  v71._object = a2;
  char v11 = sub_8CD5C(v71);
  if (v11 == 2)
  {
    uint64_t v12 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v13 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v14 = *(uint64_t **)(v13 + 72);
    uint64_t v15 = *(unsigned __int8 *)(v13 + 80);
    uint64_t v66 = v14;
    uint64_t v16 = swift_allocObject(v12, ((v15 + 32) & ~v15) + 2LL * (void)v14, v15 | 7);
    *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    __dst[3] = &type metadata for ServiceProductOverlayLayout.FooterSpacing;
    __dst[0] = swift_allocObject(&unk_E6410, 160LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), (const void *)v4, 0x90uLL);
    uint64_t v17 = sub_45C8((uint64_t *)v4);
    id v18 = (id)AMSLogKey(v17);
    if (v18)
    {
      __int128 v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      uint64_t v21 = a3;
      uint64_t v23 = v22;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v24._countAndFlagsBits = 0LL;
      v24._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v24);
      uint64_t v25 = __dst[3];
      uint64_t v26 = sub_ACA0(__dst, __dst[3]);
      uint64_t DynamicType = swift_getDynamicType(v26, v25, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v67 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v67);
      sub_4558((uint64_t)&v67);
      v28._countAndFlagsBits = 5972026LL;
      v28._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v28);
      MetatypeMetadata = &type metadata for String;
      uint64_t v67 = v20;
      uint64_t v68 = v23;
      a3 = v21;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v67);
      sub_4558((uint64_t)&v67);
      uint64_t v29 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v46._countAndFlagsBits = 0LL;
      v46._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v46);
      uint64_t v47 = __dst[3];
      __int128 v48 = sub_ACA0(__dst, __dst[3]);
      uint64_t v49 = swift_getDynamicType(v48, v47, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v67 = v49;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v67);
      sub_4558((uint64_t)&v67);
      uint64_t v29 = 58LL;
    }

    unint64_t v50 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v29);
    LogMessage.init(stringInterpolation:)(v10);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(__dst);
    __dst[0] = 0LL;
    __dst[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(42LL);
    swift_bridgeObjectRelease();
    __dst[0] = 0xD000000000000018LL;
    __dst[1] = 0x80000000000BD2F0LL;
    v51._countAndFlagsBits = a1;
    v51._object = a2;
    String.append(_:)(v51);
    v52._object = (void *)0x80000000000BD310LL;
    v52._countAndFlagsBits = 0xD000000000000010LL;
    String.append(_:)(v52);
    __dst[3] = &type metadata for String;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v16);
    swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for ServiceProductOverlayLayout.FooterSpacing;
    a3[4] = (uint64_t)&off_E6560;
    uint64_t v53 = swift_allocObject(&unk_E6410, 160LL, 7LL);
    *a3 = v53;
    memcpy((void *)(v53 + 16), (const void *)v4, 0x90uLL);
    return sub_45C8((uint64_t *)v4);
  }

  else
  {
    uint64_t v66 = a3;
    int v30 = v11 & 1;
    uint64_t v31 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v32 = type metadata accessor for LogMessage(0LL);
    uint64_t v33 = swift_allocObject( v31,  ((*(unsigned __int8 *)(*(void *)(v32 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v32 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v32 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v32 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v33 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    __dst[3] = &type metadata for ServiceProductOverlayLayout.FooterSpacing;
    __dst[0] = swift_allocObject(&unk_E6410, 160LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), (const void *)v4, 0x90uLL);
    uint64_t v34 = sub_45C8((uint64_t *)v4);
    id v35 = (id)AMSLogKey(v34);
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
      uint64_t v39 = v38;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v40._countAndFlagsBits = 0LL;
      v40._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v40);
      uint64_t v41 = __dst[3];
      uint64_t v42 = sub_ACA0(__dst, __dst[3]);
      uint64_t v43 = swift_getDynamicType(v42, v41, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v67 = v43;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v67);
      sub_4558((uint64_t)&v67);
      v44._countAndFlagsBits = 5972026LL;
      v44._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v44);
      MetatypeMetadata = &type metadata for String;
      uint64_t v67 = v37;
      uint64_t v68 = v39;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v67);
      sub_4558((uint64_t)&v67);
      uint64_t v45 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v55._countAndFlagsBits = 0LL;
      v55._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v55);
      uint64_t v56 = __dst[3];
      __int128 v57 = sub_ACA0(__dst, __dst[3]);
      uint64_t v58 = swift_getDynamicType(v57, v56, 1LL);
      MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v67 = v58;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v67);
      sub_4558((uint64_t)&v67);
      uint64_t v45 = 58LL;
    }

    unint64_t v59 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v45);
    LogMessage.init(stringInterpolation:)(v10);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(__dst);
    __dst[3] = &type metadata for String;
    __dst[0] = 0xD00000000000001CLL;
    __dst[1] = 0x80000000000BD330LL;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for ServiceProductOverlayLayout.FooterSpacing.OverrideSectionIdentifier;
    LOBYTE(__dst[0]) = v30;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v33);
    swift_bridgeObjectRelease();
    if (v30)
    {
      memcpy(__dst, (const void *)(v4 + 72), sizeof(__dst));
      double v64 = v66;
      v66[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      v64[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v65 = swift_allocObject(&unk_E65B8, 88LL, 7LL);
      *double v64 = v65;
      double v62 = (void *)(v65 + 16);
      uint64_t v63 = (const void *)(v4 + 72);
    }

    else
    {
      memcpy(__dst, (const void *)v4, sizeof(__dst));
      __int128 v60 = v66;
      v66[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      v60[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v61 = swift_allocObject(&unk_E65B8, 88LL, 7LL);
      *__int128 v60 = v61;
      double v62 = (void *)(v61 + 16);
      uint64_t v63 = (const void *)v4;
    }

    memcpy(v62, v63, 0x48uLL);
    return (uint64_t *)sub_451C((uint64_t)__dst);
  }

double sub_8D470@<D0>(uint64_t a1@<X8>)
{
  *((void *)&v29 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v30 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  char v16 = 1;
  char v14 = 0;
  char v12 = 1;
  char v10 = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v24,  &v28,  0x4014000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0LL,  v10,  0LL,  v12,  0x4010000000000000LL,  v14,  0LL,  v16,  0LL,  0LL);
  __int128 v19 = v24[1];
  __int128 v20 = v24[0];
  __int128 v18 = v24[2];
  uint64_t v2 = v25;
  uint64_t v3 = v26;
  uint64_t v4 = v27;
  uint64_t v22 = &type metadata for DefaultLayoutCollectionSpacingModel;
  uint64_t v23 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v1_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = 1;
  LOBYTE(v15) = 0;
  LOBYTE(v1_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 1;
  LOBYTE(v11) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( &v28,  v21,  0x4014000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0x404B800000000000LL,  v11,  0LL,  v13,  0x4010000000000000LL,  v15,  0LL,  v17,  0LL,  0LL);
  double result = v31;
  __int128 v6 = v32;
  __int128 v7 = v28;
  __int128 v8 = v29;
  __int128 v9 = v30;
  *(_OWORD *)a1 = v20;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v19;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v18;
  *(void *)(a1 + 48) = v2;
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v7;
  *(_OWORD *)(a1 + 88) = v8;
  *(_OWORD *)(a1 + 104) = v9;
  *(double *)(a1 + 120) = result;
  *(_OWORD *)(a1 + 128) = v6;
  return result;
}

uint64_t *sub_8D5C4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_8CE08(a1, a2, a3);
}

uint64_t sub_8D61C@<X0>(void *a1@<X8>)
{
  uint64_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  sub_8D470((uint64_t)__src);
  v8[3] = &type metadata for ServiceProductOverlayLayout.FooterSpacing;
  v8[4] = &off_E6560;
  v8[0] = swift_allocObject(&unk_E6410, 160LL, 7LL);
  memcpy((void *)(v8[0] + 16LL), __src, 0x90uLL);
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = &type metadata for DefaultLayoutSpacingModel;
  uint64_t v5 = &protocol witness table for DefaultLayoutSpacingModel;
  a1[3] = &type metadata for BoxedLayoutSpacingModel;
  a1[4] = &protocol witness table for BoxedLayoutSpacingModel;
  *a1 = swift_allocObject(&unk_E6438, 136LL, 7LL);
  return BoxedLayoutSpacingModel.init(base:body:footer:header:)(v3, v9, v8, v6);
}

uint64_t sub_8D6F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = type metadata accessor for JSONContext(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a2, v5);
  uint64_t v6 = type metadata accessor for JSONObject(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
}

uint64_t sub_8D764@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_8D6F8(a1, a2, a3);
}

uint64_t sub_8D778()
{
  if (v0[9]) {
    swift_release(v0[10]);
  }
  if (v0[18]) {
    swift_release(v0[19]);
  }
  return swift_deallocObject(v0, 160LL, 7LL);
}

uint64_t sub_8D7B4()
{
  return swift_deallocObject(v0, 136LL, 7LL);
}

ValueMetadata *type metadata accessor for ServiceProductOverlayLayout.FooterSpacing()
{
  return &type metadata for ServiceProductOverlayLayout.FooterSpacing;
}

uint64_t destroy for ServiceProductOverlayLayout(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1);
}

ValueMetadata *type metadata accessor for ServiceProductOverlayLayout()
{
  return &type metadata for ServiceProductOverlayLayout;
}

uint64_t sub_8D81C()
{
  if (*(void *)(v0 + 72)) {
    swift_release(*(void *)(v0 + 80));
  }
  return swift_deallocObject(v0, 88LL, 7LL);
}

uint64_t storeEnumTagSinglePayload for ServiceProductOverlayLayout.FooterSpacing.OverrideSectionIdentifier( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_8D894 + 4 * byte_BB825[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_8D8C8 + 4 * byte_BB820[v4]))();
}

uint64_t sub_8D8C8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_8D8D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x8D8D8LL);
  }
  return result;
}

uint64_t sub_8D8E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x8D8ECLL);
  }
  *(_BYTE *)double result = a2 + 1;
  return result;
}

uint64_t sub_8D8F0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8D8F8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceProductOverlayLayout.FooterSpacing.OverrideSectionIdentifier()
{
  return &type metadata for ServiceProductOverlayLayout.FooterSpacing.OverrideSectionIdentifier;
}

unint64_t sub_8D918()
{
  unint64_t result = qword_F7700;
  if (!qword_F7700)
  {
    unint64_t result = swift_getWitnessTable( &unk_BB944,  &type metadata for ServiceProductOverlayLayout.FooterSpacing.OverrideSectionIdentifier);
    atomic_store(result, (unint64_t *)&qword_F7700);
  }

  return result;
}

unint64_t sub_8D954(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEEC0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_8D99C(char a1)
{
  if (!a1) {
    return 0x656E696C6E69LL;
  }
  if (a1 == 1) {
    return 0x697461676976616ELL;
  }
  return 1701736302LL;
}

void sub_8D9EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_8D9F8()
{
}

uint64_t sub_8DA00(uint64_t a1)
{
  return sub_75EE4(a1, *v1);
}

void sub_8DA08(uint64_t a1)
{
}

unint64_t sub_8DA10@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_8D954(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8DA3C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_8D99C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_8DA64()
{
  if (v0)
  {
    uint64_t v10 = sub_8484();
    sub_E998(v10);
    uint64_t v11 = sub_8440();
    return sub_851C(v11);
  }

  else
  {
    unsigned __int8 v2 = v1;
    sub_6E04();
    unsigned __int8 v4 = v3;
    sub_6FB4(0x6E6F697469736F70LL, 0xE800000000000000LL, (uint64_t)&unk_E68F8, v5, v6, v7, v8, v9);
    unsigned __int8 v13 = v12;
    uint64_t v14 = sub_8484();
    sub_E998(v14);
    uint64_t v15 = sub_8440();
    sub_851C(v15);
    return (unsigned __int16)(v4 << 8) | (v13 << 16) | v2;
  }

uint64_t sub_8DB58(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEF28, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_8DBA8(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x656372756F736572LL;
  }
  else {
    return 0x6C6F626D7973LL;
  }
}

uint64_t sub_8DBDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_8DA64();
  if (!v1)
  {
    *(_WORD *)a1 = result;
    *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = BYTE2(result);
  }

  return result;
}

void sub_8DC14(char *a1, unsigned __int8 *a2)
{
}

void sub_8DC20()
{
}

uint64_t sub_8DC28(uint64_t a1)
{
  return sub_75E98(a1, *v1);
}

void sub_8DC30(uint64_t a1)
{
}

uint64_t sub_8DC38@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_8DB58(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_8DC64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_8DBA8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_8DC8C@<X0>( uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  if (v6)
  {
    uint64_t v26 = sub_8484();
    sub_E998(v26);
    uint64_t v27 = sub_8440();
    return sub_851C(v27);
  }

  else
  {
    __chkstk_darwin(v8);
    if ((v9 & 1) != 0)
    {
      sub_8E4CC();
      sub_6680();
      uint64_t v25 = v35;
      uint64_t v18 = v36;
      uint64_t v19 = v37;
      uint64_t v20 = v38;
      uint64_t v21 = v39;
      uint64_t v22 = v40;
      char v23 = v41 | 0x80;
    }

    else
    {
      uint64_t v10 = sub_8E4CC();
      sub_6784(v10, v11, v12, v13, v14, v15, v16, v17, v32, *(int *)v33, *(__int16 *)&v33[4], v33[6]);
      uint64_t v18 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      char v23 = 0;
      uint64_t v25 = v24 & 0xFFFFFF;
    }

    uint64_t v34 = v22;
    char v42 = v23;
    uint64_t v29 = v21;
    uint64_t v30 = type metadata accessor for JSONContext(0LL);
    sub_E998(v30);
    uint64_t v31 = sub_8440();
    uint64_t result = sub_851C(v31);
    *(void *)a6 = v25;
    *(void *)(a6 + 8) = v18;
    *(void *)(a6 + swift_unknownObjectWeakDestroy(v0 + 16) = v19;
    *(void *)(a6 + 24) = v20;
    *(void *)(a6 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v29;
    *(void *)(a6 + 40) = v34;
    *(_BYTE *)(a6 + 48) = v42;
  }

  return result;
}

uint64_t sub_8DDF4@<X0>( uint64_t a1@<X3>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, uint64_t a5@<X7>, uint64_t a6@<X8>)
{
  uint64_t result = sub_8DC8C(a1, a2, a3, a4, a5, (uint64_t)v9);
  if (!v6) {
    return sub_8DE38(v9, a6);
  }
  return result;
}

uint64_t sub_8DE38(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  __int128 v4 = a1[2];
  *(_BYTE *)(a2 + 48) = *((_BYTE *)a1 + 48);
  *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  *(_OWORD *)(a2 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v4;
  *(_OWORD *)a2 = v2;
  return a2;
}

uint64_t sub_8DE58@<X0>(uint64_t a1@<X8>)
{
  return sub_8DEA0((uint64_t)v3, a1);
}

uint64_t sub_8DE90@<X0>(uint64_t a1@<X8>)
{
  return sub_8DE58(a1);
}

void sub_8DE98(uint64_t a1@<X8>)
{
}

uint64_t sub_8DEA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F7708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t _s10descrE6931V8BrandingO4KeysO4KindOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_8DF34 + 4 * byte_BB971[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_8DF68 + 4 * byte_BB96C[v4]))();
}

uint64_t sub_8DF68(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_8DF70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x8DF78LL);
  }
  return result;
}

uint64_t sub_8DF84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x8DF8CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_8DF90(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8DF98(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10descrE6931V8BrandingO4KeysO4KindOMa()
{
  return &_s10descrE6931V8BrandingO4KeysO4KindON;
}

uint64_t sub_8DFB4(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_8E000 + 4 * byte_BB97B[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_8E034 + 4 * byte_BB976[v4]))();
}

uint64_t sub_8E034(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_8E03C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x8E044LL);
  }
  return result;
}

uint64_t sub_8E050(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x8E058LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_8E05C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_8E064(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void _s10descrE6931V5BadgeV8PositionOMa()
{
}

uint64_t sub_8E07C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 < 0) {
    return swift_retain(a2);
  }
  return result;
}

uint64_t sub_8E08C(uint64_t a1)
{
  return sub_8E0A4( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(_BYTE *)(a1 + 48));
}

uint64_t sub_8E0A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (a7 < 0) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_8E0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(_BYTE *)(a2 + 48);
  sub_8E07C(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v7;
  *(void *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t sub_8E12C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(_BYTE *)(a2 + 48);
  sub_8E07C(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_8E0A4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 sub_8E1B8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_8E1D4(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  __int128 v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v10;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 32);
  char v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_8E0A4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t sub_8E228(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 49))
    {
      int v3 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unsigned int v2 = (*(void *)a1 >> 13) & 0xFFFFFFE0 | ((unsigned __int16)*(void *)a1 >> 11);
      if (v2 > 0x80000000) {
        int v3 = ~v2;
      }
      else {
        int v3 = -1;
      }
    }
  }

  else
  {
    int v3 = -1;
  }

  return (v3 + 1);
}

double sub_8E274(uint64_t a1, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(a1 + 40) = 0LL;
    double result = 0.0;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_BYTE *)(a1 + 48) = 0;
    *(void *)a1 = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(a1 + 49) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)a1 = ((unint64_t)-a2 << 13) & 0x1FFFFFFC0000LL | ((-a2 & 0x1FLL) << 11);
      double result = 0.0;
      *(_OWORD *)(a1 + 8) = 0u;
      *(_OWORD *)(a1 + 24) = 0u;
      *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0u;
      return result;
    }

    *(_BYTE *)(a1 + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t sub_8E2E0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48) >> 7;
}

uint64_t sub_8E2EC(uint64_t result)
{
  *(_BYTE *)(result + 48) &= ~0x80u;
  return result;
}

int8x16_t sub_8E2FC(int8x16_t *a1, char a2)
{
  uint64_t v2 = a1[1].u8[0];
  __int8 v3 = a1[3].i8[0] & 1 | (a2 << 7);
  int8x16_t result = vandq_s8(*a1, (int8x16_t)xmmword_BBB50);
  *a1 = result;
  a1[1].i64[0] = v2;
  a1[3].i8[0] = v3;
  return result;
}

void _s10descrE6931V8BrandingOMa()
{
}

uint64_t initializeBufferWithCopyOfBuffer for TextGradient.GradientOptions(uint64_t result, __int16 *a2)
{
  __int16 v2 = *a2;
  *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((_BYTE *)a2 + 2);
  *(_WORD *)int8x16_t result = v2;
  return result;
}

uint64_t sub_8E34C(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v3 = -1;
    return (v3 + 1);
  }

  if (a2 >= 0xFE)
  {
    if ((a2 + 33554178) >> 24)
    {
      int v2 = *((unsigned __int8 *)a1 + 3);
      if (*((_BYTE *)a1 + 3)) {
        goto LABEL_5;
      }
    }

    else
    {
      int v2 = *(unsigned __int16 *)((char *)a1 + 3);
      if (*(unsigned __int16 *)((char *)a1 + 3))
      {
LABEL_5:
        int v3 = (*a1 | (*((unsigned __int8 *)a1 + 2) << 16) | (v2 << 24)) - 16776963;
        return (v3 + 1);
      }
    }
  }

  unsigned int v4 = *((unsigned __int8 *)a1 + 2);
  BOOL v5 = v4 >= 3;
  int v3 = v4 - 3;
  if (!v5) {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t sub_8E3B4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554178) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFD) {
    int v3 = 0;
  }
  if (a2 > 0xFD)
  {
    *(_WORD *)int8x16_t result = a2 - 254;
    *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = (a2 - 254) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 254) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v4;
      }
      else {
        *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v4;
      }
    }
  }

  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a2 + 2;
      return result;
    }

    *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }

  return result;
}

void _s10descrE6931V5BadgeVMa()
{
}

unint64_t sub_8E450()
{
  unint64_t result = qword_F7710;
  if (!qword_F7710)
  {
    unint64_t result = swift_getWitnessTable(&unk_BBA44, &unk_E67F0);
    atomic_store(result, (unint64_t *)&qword_F7710);
  }

  return result;
}

unint64_t sub_8E490()
{
  unint64_t result = qword_F7718;
  if (!qword_F7718)
  {
    unint64_t result = swift_getWitnessTable(&unk_BBAAC, &_s10descrE6931V8BrandingO4KeysO4KindON);
    atomic_store(result, (unint64_t *)&qword_F7718);
  }

  return result;
}

uint64_t sub_8E4CC()
{
  return 0x746E65746E6F63LL;
}

uint64_t sub_8E4E8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v12 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v12);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = (_OWORD *)(v4 + 40);
    uint64_t v9 = a2 + 5;
    uint64_t v10 = a2[8];
    if (v10)
    {
      uint64_t v11 = a2[9];
      *(void *)(v4 + 64) = v10;
      *(void *)(v4 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v11;
      (**(void (***)(_OWORD *, _OWORD *))(v10 - 8))(v8, v9);
    }

    else
    {
      __int128 v13 = *(_OWORD *)(a2 + 7);
      *uint64_t v8 = *v9;
      *(_OWORD *)(v4 + 56) = v13;
      *(void *)(v4 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a2[9];
    }

    __int128 v14 = *(_OWORD *)(a2 + 13);
    *(_OWORD *)(v4 + 104) = v14;
    (**(void (***)(uint64_t, uint64_t))(v14 - 8))(v4 + 80, (uint64_t)(a2 + 10));
    uint64_t v15 = *(int *)(a3 + 28);
    char v16 = (void *)(v4 + v15);
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v17, 1LL, v18))
    {
      uint64_t v19 = sub_44DC(&qword_F3838);
      memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v18 - 8) + 16LL))(v16, v17, v18);
      sub_4AD0((uint64_t)v16, 0LL, 1LL, v18);
    }
  }

  return v4;
}

uint64_t sub_8E638(void *a1, uint64_t a2)
{
  if (a1[8]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 5);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 10);
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t result = sub_4AC4(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  }
  return result;
}

uint64_t sub_8E6B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  __int128 v7 = (_OWORD *)(a1 + 40);
  uint64_t v8 = (_OWORD *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 64);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 72);
    *(void *)(a1 + 64) = v9;
    *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }

  else
  {
    __int128 v11 = *(_OWORD *)(a2 + 56);
    *__int128 v7 = *v8;
    *(_OWORD *)(a1 + 56) = v11;
    *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 72);
  }

  __int128 v12 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 104) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 80, a2 + 80);
  uint64_t v13 = *(int *)(a3 + 28);
  __int128 v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v15, 1LL, v16))
  {
    uint64_t v17 = sub_44DC(&qword_F3838);
    memcpy(v14, v15, *(void *)(*(void *)(v17 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
    sub_4AD0((uint64_t)v14, 0LL, 1LL, v16);
  }

  return a1;
}

uint64_t sub_8E7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 64);
  if (*(void *)(a1 + 64))
  {
    if (v6)
    {
      sub_4290((void *)(a1 + 40), (void *)(a2 + 40));
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  }

  else if (v6)
  {
    *(void *)(a1 + 64) = v6;
    *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 72);
    (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 40, a2 + 40);
    goto LABEL_8;
  }

  __int128 v7 = *(_OWORD *)(a2 + 40);
  __int128 v8 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 40) = v7;
  *(_OWORD *)(a1 + 56) = v8;
LABEL_8:
  sub_4290((void *)(a1 + 80), (void *)(a2 + 80));
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)(a1 + v9);
  __int128 v11 = (const void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for ImpressionMetrics(0LL);
  int v13 = sub_4AC4((uint64_t)v10, 1LL, v12);
  int v14 = sub_4AC4((uint64_t)v11, 1LL, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 24))(v10, v11, v12);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_13;
  }

  if (v14)
  {
LABEL_13:
    uint64_t v16 = sub_44DC(&qword_F3838);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
  sub_4AD0((uint64_t)v10, 0LL, 1LL, v12);
  return a1;
}

uint64_t sub_8E948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 72);
  *(void *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 112);
  __int128 v5 = *(_OWORD *)(a2 + 96);
  uint64_t v6 = *(int *)(a3 + 28);
  __int128 v7 = (void *)(a1 + v6);
  __int128 v8 = (const void *)(a2 + v6);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  uint64_t v9 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v8, 1LL, v9))
  {
    uint64_t v10 = sub_44DC(&qword_F3838);
    memcpy(v7, v8, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    sub_4AD0((uint64_t)v7, 0LL, 1LL, v9);
  }

  return a1;
}

uint64_t sub_8EA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  if (*(void *)(a1 + 64)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  }
  __int128 v7 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v7;
  *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 80));
  __int128 v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(void *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 112);
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = (void *)(a1 + v9);
  __int128 v11 = (const void *)(a2 + v9);
  uint64_t v12 = type metadata accessor for ImpressionMetrics(0LL);
  int v13 = sub_4AC4((uint64_t)v10, 1LL, v12);
  int v14 = sub_4AC4((uint64_t)v11, 1LL, v12);
  if (!v13)
  {
    uint64_t v15 = *(void *)(v12 - 8);
    if (!v14)
    {
      (*(void (**)(void *, const void *, uint64_t))(v15 + 40))(v10, v11, v12);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v15 + 8))(v10, v12);
    goto LABEL_8;
  }

  if (v14)
  {
LABEL_8:
    uint64_t v16 = sub_44DC(&qword_F3838);
    memcpy(v10, v11, *(void *)(*(void *)(v16 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(void *, const void *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  sub_4AD0((uint64_t)v10, 0LL, 1LL, v12);
  return a1;
}

uint64_t sub_8EB74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_8EB80);
}

uint64_t sub_8EB80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F3838);
    return sub_4AC4(a1 + *(int *)(a3 + 28), a2, v8);
  }

uint64_t sub_8EBF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_8EC04);
}

uint64_t sub_8EC04(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_44DC(&qword_F3838);
    return sub_4AD0(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }

  return result;
}

uint64_t _s10descrE69B9V6ButtonVMa(uint64_t a1)
{
  uint64_t result = qword_F7778;
  if (!qword_F7778) {
    return swift_getSingletonMetadata(a1, &_s10descrE69B9V6ButtonVMn);
  }
  return result;
}

void sub_8ECAC(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = &unk_BBB80;
  v4[2] = "(";
  sub_5260(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(v2 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
  }

uint64_t sub_8ED2C@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = swift_allocObject(v8, 16LL, 7LL);
  uint64_t v10 = _s10descrE69B9V6ButtonVMa(0LL);
  uint64_t v29 = v9;
  uint64_t v30 = a1;
  sub_5844();
  if (v2)
  {
    uint64_t v11 = sub_8440();
    sub_851C(v11);
    sub_2F388();
    uint64_t v12 = sub_8484();
    return sub_85AC(v12);
  }

  else
  {
    __int128 v28 = v7;
    sub_7CF4(&v34, (uint64_t)a2);
    uint64_t v14 = sub_8F1FC();
    unsigned __int8 v35 = a2;
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    a2[8] = &type metadata for DynamicMarkdownText;
    a2[9] = &protocol witness table for DynamicMarkdownText;
    a2[5] = sub_8F208((uint64_t)&unk_E69A0);
    DynamicMarkdownText.init(text:)(v15, v17);
    uint64_t v18 = sub_8F1FC();
    uint64_t v20 = v19;
    uint64_t v32 = &type metadata for DynamicMarkdownText;
    uint64_t v33 = &protocol witness table for DynamicMarkdownText;
    *(void *)&__int128 v31 = sub_8F208((uint64_t)&unk_E69A0);
    DynamicMarkdownText.init(text:)(v18, v20);
    uint64_t v21 = v35;
    uint64_t v22 = sub_7CF4(&v31, (uint64_t)(v35 + 10));
    __chkstk_darwin(v22);
    *(&v27 - _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a1;
    uint64_t v23 = (uint64_t)v28;
    sub_665C();
    uint64_t v24 = sub_8440();
    sub_851C(v24);
    sub_2F388();
    uint64_t v25 = sub_8484();
    sub_85AC(v25);
    uint64_t v26 = type metadata accessor for ImpressionMetrics(0LL);
    sub_4AD0(v23, 0LL, 1LL, v26);
    return sub_8F1B4(v23, (uint64_t)v21 + *(int *)(v10 + 28));
  }

uint64_t sub_8F01C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for JSONContext(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for JSONObject(0LL);
  __n128 v11 = __chkstk_darwin(v10);
  int v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  (*(void (**)(_BYTE *, uint64_t, __n128))(v14 + 16))(v13, a1, v11);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
  ImpressionMetrics.init(deserializing:using:)(v13, v9);
  uint64_t v15 = type metadata accessor for ImpressionMetrics(0LL);
  return sub_4AD0(a3, 0LL, 1LL, v15);
}

uint64_t sub_8F13C@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  return sub_8ED2C(a1, a2);
}

uint64_t sub_8F150()
{
  if (*(void *)(v0 + 112)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v0 + 88));
  }

  swift_bridgeObjectRelease();
  return swift_deallocObject(v0, 192LL, 7LL);
}

uint64_t sub_8F1AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_8F01C(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_8F1B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F3838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_8F1FC()
{
  return sub_6F270();
}

uint64_t sub_8F208(uint64_t a1)
{
  return swift_allocObject(a1, 192LL, 7LL);
}

uint64_t sub_8F214(uint64_t a1, uint64_t *a2, int *a3)
{
  int v4 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16LL) & ~(unint64_t)v4);
    swift_retain(v5);
  }

  else
  {
    *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
    *(_BYTE *)(a1 + 10) = *((_BYTE *)a2 + 10);
    uint64_t v8 = a2[2];
    uint64_t v9 = a2[3];
    uint64_t v10 = a2[4];
    uint64_t v11 = a2[5];
    uint64_t v12 = a2[6];
    uint64_t v13 = a2[7];
    char v14 = *((_BYTE *)a2 + 64);
    swift_retain(v5);
    sub_8E07C(v8, v9, v10, v11, v12, v13, v14);
    *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v8;
    *(void *)(a1 + 24) = v9;
    *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v10;
    *(void *)(a1 + 40) = v11;
    *(void *)(a1 + 48) = v12;
    *(void *)(a1 + 56) = v13;
    *(_BYTE *)(a1 + 64) = v14;
    uint64_t v15 = (_OWORD *)(a1 + 72);
    uint64_t v16 = a2 + 9;
    uint64_t v17 = a2[12];
    if (v17)
    {
      uint64_t v18 = a2[13];
      *(void *)(a1 + 96) = v17;
      *(void *)(a1 + 104) = v18;
      (**(void (***)(_OWORD *, _OWORD *))(v17 - 8))(v15, v16);
    }

    else
    {
      __int128 v19 = *(_OWORD *)(a2 + 11);
      *uint64_t v15 = *v16;
      *(_OWORD *)(a1 + 88) = v19;
      *(void *)(a1 + 104) = a2[13];
    }

    uint64_t v20 = a2[14];
    uint64_t v21 = a2[15];
    *(void *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v20;
    *(void *)(a1 + 120) = v21;
    uint64_t v22 = a3[10];
    uint64_t v23 = a1 + v22;
    uint64_t v24 = (uint64_t)a2 + v22;
    uint64_t v25 = _s10descrE69B9V6ButtonVMa(0LL);
    swift_retain(v20);
    swift_bridgeObjectRetain(v21);
    if (sub_4AC4(v24, 1LL, v25))
    {
      uint64_t v26 = sub_44DC(&qword_F39F0);
      memcpy((void *)v23, (const void *)v24, *(void *)(*(void *)(v26 - 8) + 64LL));
    }

    else
    {
      __int128 v27 = *(_OWORD *)(v24 + 24);
      *(_OWORD *)(v23 + 24) = v27;
      (**(void (***)(uint64_t, uint64_t))(v27 - 8))(v23, v24);
      __int128 v28 = (_OWORD *)(v23 + 40);
      uint64_t v29 = (_OWORD *)(v24 + 40);
      uint64_t v30 = *(void *)(v24 + 64);
      if (v30)
      {
        uint64_t v31 = *(void *)(v24 + 72);
        *(void *)(v23 + 64) = v30;
        *(void *)(v23 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v31;
        (**(void (***)(_OWORD *, _OWORD *))(v30 - 8))(v28, v29);
      }

      else
      {
        __int128 v32 = *(_OWORD *)(v24 + 56);
        *__int128 v28 = *v29;
        *(_OWORD *)(v23 + 56) = v32;
        *(void *)(v23 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v24 + 72);
      }

      __int128 v33 = *(_OWORD *)(v24 + 104);
      *(_OWORD *)(v23 + 104) = v33;
      (**(void (***)(uint64_t, uint64_t))(v33 - 8))(v23 + 80, v24 + 80);
      uint64_t v34 = *(int *)(v25 + 28);
      unsigned __int8 v35 = (void *)(v23 + v34);
      uint64_t v36 = (const void *)(v24 + v34);
      uint64_t v37 = type metadata accessor for ImpressionMetrics(0LL);
      if (sub_4AC4((uint64_t)v36, 1LL, v37))
      {
        uint64_t v38 = sub_44DC(&qword_F3838);
        memcpy(v35, v36, *(void *)(*(void *)(v38 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v37 - 8) + 16LL))(v35, v36, v37);
        sub_4AD0((uint64_t)v35, 0LL, 1LL, v37);
      }

      sub_4AD0(v23, 0LL, 1LL, v25);
    }

    uint64_t v39 = a3[11];
    uint64_t v40 = a1 + v39;
    uint64_t v41 = (uint64_t)a2 + v39;
    uint64_t v42 = *(uint64_t *)((char *)a2 + v39 + 24);
    if (v42)
    {
      uint64_t v43 = *(void *)(v41 + 32);
      *(void *)(v40 + 24) = v42;
      *(void *)(v40 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v43;
      (**(void (***)(void))(v42 - 8))();
    }

    else
    {
      __int128 v44 = *(_OWORD *)(v41 + 16);
      *(_OWORD *)uint64_t v40 = *(_OWORD *)v41;
      *(_OWORD *)(v40 + swift_unknownObjectWeakDestroy(v0 + 16) = v44;
      *(void *)(v40 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v41 + 32);
    }

    uint64_t v45 = a3[12];
    uint64_t v46 = a3[13];
    uint64_t v47 = *(void **)((char *)a2 + v45);
    *(void *)(a1 + v45) = v47;
    uint64_t v48 = a1 + v46;
    uint64_t v49 = (uint64_t)a2 + v46;
    __int128 v50 = *(_OWORD *)((char *)a2 + v46 + 24);
    *(_OWORD *)(a1 + v46 + 24) = v50;
    uint64_t v51 = v50;
    Swift::String v52 = **(void (***)(uint64_t, uint64_t, uint64_t))(v50 - 8);
    id v53 = v47;
    v52(v48, v49, v51);
    uint64_t v54 = (_OWORD *)(v48 + 40);
    Swift::String v55 = (_OWORD *)(v49 + 40);
    uint64_t v56 = *(void *)(v49 + 64);
    if (v56)
    {
      uint64_t v57 = *(void *)(v49 + 72);
      *(void *)(v48 + 64) = v56;
      *(void *)(v48 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v57;
      (**(void (***)(_OWORD *, _OWORD *))(v56 - 8))(v54, v55);
    }

    else
    {
      __int128 v58 = *(_OWORD *)(v49 + 56);
      *uint64_t v54 = *v55;
      *(_OWORD *)(v48 + 56) = v58;
      *(void *)(v48 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v49 + 72);
    }

    __int128 v59 = *(_OWORD *)(v49 + 104);
    *(_OWORD *)(v48 + 104) = v59;
    (**(void (***)(uint64_t, uint64_t))(v59 - 8))(v48 + 80, v49 + 80);
    uint64_t v60 = *(int *)(v25 + 28);
    uint64_t v61 = (void *)(v48 + v60);
    double v62 = (const void *)(v49 + v60);
    uint64_t v63 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v62, 1LL, v63))
    {
      uint64_t v64 = sub_44DC(&qword_F3838);
      memcpy(v61, v62, *(void *)(*(void *)(v64 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v63 - 8) + 16LL))(v61, v62, v63);
      sub_4AD0((uint64_t)v61, 0LL, 1LL, v63);
    }

    uint64_t v65 = a3[14];
    uint64_t v66 = a1 + v65;
    uint64_t v67 = (uint64_t)a2 + v65;
    if (sub_4AC4((uint64_t)a2 + v65, 1LL, v25))
    {
      uint64_t v68 = sub_44DC(&qword_F39F0);
      memcpy((void *)v66, (const void *)v67, *(void *)(*(void *)(v68 - 8) + 64LL));
    }

    else
    {
      __int128 v69 = *(_OWORD *)(v67 + 24);
      *(_OWORD *)(v66 + 24) = v69;
      (**(void (***)(uint64_t, uint64_t))(v69 - 8))(v66, v67);
      uint64_t v70 = (_OWORD *)(v66 + 40);
      Swift::String v71 = (_OWORD *)(v67 + 40);
      uint64_t v72 = *(void *)(v67 + 64);
      if (v72)
      {
        uint64_t v73 = *(void *)(v67 + 72);
        *(void *)(v66 + 64) = v72;
        *(void *)(v66 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v73;
        (**(void (***)(_OWORD *, _OWORD *))(v72 - 8))(v70, v71);
      }

      else
      {
        __int128 v74 = *(_OWORD *)(v67 + 56);
        *uint64_t v70 = *v71;
        *(_OWORD *)(v66 + 56) = v74;
        *(void *)(v66 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v67 + 72);
      }

      __int128 v75 = *(_OWORD *)(v67 + 104);
      *(_OWORD *)(v66 + 104) = v75;
      (**(void (***)(uint64_t, uint64_t))(v75 - 8))(v66 + 80, v67 + 80);
      uint64_t v76 = *(int *)(v25 + 28);
      uint64_t v77 = (void *)(v66 + v76);
      uint64_t v78 = (const void *)(v67 + v76);
      if (sub_4AC4((uint64_t)v78, 1LL, v63))
      {
        uint64_t v79 = sub_44DC(&qword_F3838);
        memcpy(v77, v78, *(void *)(*(void *)(v79 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v63 - 8) + 16LL))(v77, v78, v63);
        sub_4AD0((uint64_t)v77, 0LL, 1LL, v63);
      }

      sub_4AD0(v66, 0LL, 1LL, v25);
    }

    uint64_t v80 = a3[15];
    uint64_t v81 = a1 + v80;
    uint64_t v82 = (uint64_t)a2 + v80;
    uint64_t v83 = *(uint64_t *)((char *)a2 + v80 + 24);
    if (v83)
    {
      uint64_t v84 = *(void *)(v82 + 32);
      *(void *)(v81 + 24) = v83;
      *(void *)(v81 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v84;
      (**(void (***)(void))(v83 - 8))();
    }

    else
    {
      __int128 v85 = *(_OWORD *)(v82 + 16);
      *(_OWORD *)uint64_t v81 = *(_OWORD *)v82;
      *(_OWORD *)(v81 + swift_unknownObjectWeakDestroy(v0 + 16) = v85;
      *(void *)(v81 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v82 + 32);
    }

    uint64_t v86 = a3[16];
    uint64_t v87 = a3[17];
    uint64_t v88 = *(uint64_t *)((char *)a2 + v86);
    *(void *)(a1 + v86) = v88;
    uint64_t v89 = a1 + v87;
    uint64_t v90 = (uint64_t)a2 + v87;
    uint64_t v91 = type metadata accessor for PageMetrics(0LL);
    CGRect v92 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v91 - 8) + 16LL);
    __n128 v93 = swift_retain(v88);
    v92(v89, v90, v91, v93);
  }

  return a1;
}

uint64_t sub_8F78C(uint64_t a1, int *a2)
{
  if (*(void *)(a1 + 96)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  }
  swift_release();
  swift_bridgeObjectRelease();
  int v4 = (void *)(a1 + a2[10]);
  uint64_t v5 = _s10descrE69B9V6ButtonVMa(0LL);
  if (!sub_4AC4((uint64_t)v4, 1LL, v5))
  {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v4);
    if (v4[8]) {
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v4 + 5);
    }
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v4 + 10);
    uint64_t v6 = (uint64_t)v4 + *(int *)(v5 + 28);
    uint64_t v7 = type metadata accessor for ImpressionMetrics(0LL);
  }

  uint64_t v8 = (void *)(a1 + a2[11]);
  if (v8[3]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v8);
  }

  uint64_t v9 = (void *)(a1 + a2[13]);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v9);
  if (v9[8]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v9 + 5);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v9 + 10);
  uint64_t v10 = (uint64_t)v9 + *(int *)(v5 + 28);
  uint64_t v11 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t v12 = (void *)(a1 + a2[14]);
  if (!sub_4AC4((uint64_t)v12, 1LL, v5))
  {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v12);
    if (v12[8]) {
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v12 + 5);
    }
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v12 + 10);
    uint64_t v13 = (uint64_t)v12 + *(int *)(v5 + 28);
  }

  char v14 = (void *)(a1 + a2[15]);
  if (v14[3]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v14);
  }
  swift_release();
  uint64_t v15 = a1 + a2[17];
  uint64_t v16 = type metadata accessor for PageMetrics(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v16 - 8) + 8LL))(v15, v16);
}

uint64_t sub_8F9AC(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  *(_WORD *)(a1 + 8) = *((_WORD *)a2 + 4);
  *(_BYTE *)(a1 + 10) = *((_BYTE *)a2 + 10);
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v10 = a2[5];
  uint64_t v11 = a2[6];
  uint64_t v12 = a2[7];
  char v13 = *((_BYTE *)a2 + 64);
  swift_retain(v6);
  sub_8E07C(v7, v8, v9, v10, v11, v12, v13);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v9;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  *(_BYTE *)(a1 + 64) = v13;
  char v14 = (_OWORD *)(a1 + 72);
  uint64_t v15 = a2 + 9;
  uint64_t v16 = a2[12];
  if (v16)
  {
    uint64_t v17 = a2[13];
    *(void *)(a1 + 96) = v16;
    *(void *)(a1 + 104) = v17;
    (**(void (***)(_OWORD *, _OWORD *))(v16 - 8))(v14, v15);
  }

  else
  {
    __int128 v18 = *(_OWORD *)(a2 + 11);
    *char v14 = *v15;
    *(_OWORD *)(a1 + 88) = v18;
    *(void *)(a1 + 104) = a2[13];
  }

  uint64_t v19 = a2[14];
  uint64_t v20 = a2[15];
  *(void *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v19;
  *(void *)(a1 + 120) = v20;
  uint64_t v21 = a3[10];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t)a2 + v21;
  uint64_t v24 = _s10descrE69B9V6ButtonVMa(0LL);
  swift_retain(v19);
  swift_bridgeObjectRetain(v20);
  if (sub_4AC4(v23, 1LL, v24))
  {
    uint64_t v25 = sub_44DC(&qword_F39F0);
    memcpy((void *)v22, (const void *)v23, *(void *)(*(void *)(v25 - 8) + 64LL));
  }

  else
  {
    __int128 v26 = *(_OWORD *)(v23 + 24);
    *(_OWORD *)(v22 + 24) = v26;
    (**(void (***)(uint64_t, uint64_t))(v26 - 8))(v22, v23);
    __int128 v27 = (_OWORD *)(v22 + 40);
    __int128 v28 = (_OWORD *)(v23 + 40);
    uint64_t v29 = *(void *)(v23 + 64);
    if (v29)
    {
      uint64_t v30 = *(void *)(v23 + 72);
      *(void *)(v22 + 64) = v29;
      *(void *)(v22 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v30;
      (**(void (***)(_OWORD *, _OWORD *))(v29 - 8))(v27, v28);
    }

    else
    {
      __int128 v31 = *(_OWORD *)(v23 + 56);
      *__int128 v27 = *v28;
      *(_OWORD *)(v22 + 56) = v31;
      *(void *)(v22 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v23 + 72);
    }

    __int128 v32 = *(_OWORD *)(v23 + 104);
    *(_OWORD *)(v22 + 104) = v32;
    (**(void (***)(uint64_t, uint64_t))(v32 - 8))(v22 + 80, v23 + 80);
    uint64_t v33 = *(int *)(v24 + 28);
    uint64_t v34 = (void *)(v22 + v33);
    unsigned __int8 v35 = (const void *)(v23 + v33);
    uint64_t v36 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v35, 1LL, v36))
    {
      uint64_t v37 = sub_44DC(&qword_F3838);
      memcpy(v34, v35, *(void *)(*(void *)(v37 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v36 - 8) + 16LL))(v34, v35, v36);
      sub_4AD0((uint64_t)v34, 0LL, 1LL, v36);
    }

    sub_4AD0(v22, 0LL, 1LL, v24);
  }

  uint64_t v38 = a3[11];
  uint64_t v39 = a1 + v38;
  uint64_t v40 = (uint64_t)a2 + v38;
  uint64_t v41 = *(uint64_t *)((char *)a2 + v38 + 24);
  if (v41)
  {
    uint64_t v42 = *(void *)(v40 + 32);
    *(void *)(v39 + 24) = v41;
    *(void *)(v39 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v42;
    (**(void (***)(void))(v41 - 8))();
  }

  else
  {
    __int128 v43 = *(_OWORD *)(v40 + 16);
    *(_OWORD *)uint64_t v39 = *(_OWORD *)v40;
    *(_OWORD *)(v39 + swift_unknownObjectWeakDestroy(v0 + 16) = v43;
    *(void *)(v39 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v40 + 32);
  }

  uint64_t v44 = a3[12];
  uint64_t v45 = a3[13];
  uint64_t v46 = *(void **)((char *)a2 + v44);
  *(void *)(a1 + v44) = v46;
  uint64_t v47 = a1 + v45;
  uint64_t v48 = (uint64_t)a2 + v45;
  __int128 v49 = *(_OWORD *)((char *)a2 + v45 + 24);
  *(_OWORD *)(a1 + v45 + 24) = v49;
  uint64_t v50 = v49;
  uint64_t v51 = **(void (***)(uint64_t, uint64_t, uint64_t))(v49 - 8);
  id v52 = v46;
  v51(v47, v48, v50);
  id v53 = (_OWORD *)(v47 + 40);
  uint64_t v54 = (_OWORD *)(v48 + 40);
  uint64_t v55 = *(void *)(v48 + 64);
  if (v55)
  {
    uint64_t v56 = *(void *)(v48 + 72);
    *(void *)(v47 + 64) = v55;
    *(void *)(v47 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v56;
    (**(void (***)(_OWORD *, _OWORD *))(v55 - 8))(v53, v54);
  }

  else
  {
    __int128 v57 = *(_OWORD *)(v48 + 56);
    *id v53 = *v54;
    *(_OWORD *)(v47 + 56) = v57;
    *(void *)(v47 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v48 + 72);
  }

  __int128 v58 = *(_OWORD *)(v48 + 104);
  *(_OWORD *)(v47 + 104) = v58;
  (**(void (***)(uint64_t, uint64_t))(v58 - 8))(v47 + 80, v48 + 80);
  uint64_t v59 = *(int *)(v24 + 28);
  uint64_t v60 = (void *)(v47 + v59);
  uint64_t v61 = (const void *)(v48 + v59);
  uint64_t v62 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v61, 1LL, v62))
  {
    uint64_t v63 = sub_44DC(&qword_F3838);
    memcpy(v60, v61, *(void *)(*(void *)(v63 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v62 - 8) + 16LL))(v60, v61, v62);
    sub_4AD0((uint64_t)v60, 0LL, 1LL, v62);
  }

  uint64_t v64 = a3[14];
  uint64_t v65 = a1 + v64;
  uint64_t v66 = (uint64_t)a2 + v64;
  if (sub_4AC4((uint64_t)a2 + v64, 1LL, v24))
  {
    uint64_t v67 = sub_44DC(&qword_F39F0);
    memcpy((void *)v65, (const void *)v66, *(void *)(*(void *)(v67 - 8) + 64LL));
  }

  else
  {
    __int128 v68 = *(_OWORD *)(v66 + 24);
    *(_OWORD *)(v65 + 24) = v68;
    (**(void (***)(uint64_t, uint64_t))(v68 - 8))(v65, v66);
    __int128 v69 = (_OWORD *)(v65 + 40);
    uint64_t v70 = (_OWORD *)(v66 + 40);
    uint64_t v71 = *(void *)(v66 + 64);
    if (v71)
    {
      uint64_t v72 = *(void *)(v66 + 72);
      *(void *)(v65 + 64) = v71;
      *(void *)(v65 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v72;
      (**(void (***)(_OWORD *, _OWORD *))(v71 - 8))(v69, v70);
    }

    else
    {
      __int128 v73 = *(_OWORD *)(v66 + 56);
      *__int128 v69 = *v70;
      *(_OWORD *)(v65 + 56) = v73;
      *(void *)(v65 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v66 + 72);
    }

    __int128 v74 = *(_OWORD *)(v66 + 104);
    *(_OWORD *)(v65 + 104) = v74;
    (**(void (***)(uint64_t, uint64_t))(v74 - 8))(v65 + 80, v66 + 80);
    uint64_t v75 = *(int *)(v24 + 28);
    uint64_t v76 = (void *)(v65 + v75);
    uint64_t v77 = (const void *)(v66 + v75);
    if (sub_4AC4((uint64_t)v77, 1LL, v62))
    {
      uint64_t v78 = sub_44DC(&qword_F3838);
      memcpy(v76, v77, *(void *)(*(void *)(v78 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v62 - 8) + 16LL))(v76, v77, v62);
      sub_4AD0((uint64_t)v76, 0LL, 1LL, v62);
    }

    sub_4AD0(v65, 0LL, 1LL, v24);
  }

  uint64_t v79 = a3[15];
  uint64_t v80 = a1 + v79;
  uint64_t v81 = (uint64_t)a2 + v79;
  uint64_t v82 = *(uint64_t *)((char *)a2 + v79 + 24);
  if (v82)
  {
    uint64_t v83 = *(void *)(v81 + 32);
    *(void *)(v80 + 24) = v82;
    *(void *)(v80 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v83;
    (**(void (***)(void))(v82 - 8))();
  }

  else
  {
    __int128 v84 = *(_OWORD *)(v81 + 16);
    *(_OWORD *)uint64_t v80 = *(_OWORD *)v81;
    *(_OWORD *)(v80 + swift_unknownObjectWeakDestroy(v0 + 16) = v84;
    *(void *)(v80 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v81 + 32);
  }

  uint64_t v85 = a3[16];
  uint64_t v86 = a3[17];
  uint64_t v87 = *(uint64_t *)((char *)a2 + v85);
  *(void *)(a1 + v85) = v87;
  uint64_t v88 = a1 + v86;
  uint64_t v89 = (uint64_t)a2 + v86;
  uint64_t v90 = type metadata accessor for PageMetrics(0LL);
  uint64_t v91 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))(*(void *)(v90 - 8) + 16LL);
  __n128 v92 = swift_retain(v87);
  v91(v88, v89, v90, v92);
  return a1;
}

uint64_t sub_8FF00(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  swift_retain(v6);
  swift_release();
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_BYTE *)(a1 + 9) = *((_BYTE *)a2 + 9);
  *(_BYTE *)(a1 + 10) = *((_BYTE *)a2 + 10);
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  uint64_t v10 = a2[5];
  uint64_t v11 = a2[6];
  uint64_t v12 = a2[7];
  char v13 = *((_BYTE *)a2 + 64);
  sub_8E07C(v7, v8, v9, v10, v11, v12, v13);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v9;
  *(void *)(a1 + 40) = v10;
  *(void *)(a1 + 48) = v11;
  *(void *)(a1 + 56) = v12;
  char v20 = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(a1 + 64) = v13;
  sub_8E0A4(v14, v15, v16, v17, v18, v19, v20);
  uint64_t v21 = a2[12];
  if (*(void *)(a1 + 96))
  {
    if (v21)
    {
      sub_4290((void *)(a1 + 72), a2 + 9);
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  }

  else if (v21)
  {
    *(void *)(a1 + 96) = v21;
    *(void *)(a1 + 104) = a2[13];
    (**(void (***)(uint64_t, uint64_t))(v21 - 8))(a1 + 72, (uint64_t)(a2 + 9));
    goto LABEL_8;
  }

  __int128 v22 = *(_OWORD *)(a2 + 9);
  __int128 v23 = *(_OWORD *)(a2 + 11);
  *(void *)(a1 + 104) = a2[13];
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v22;
  *(_OWORD *)(a1 + 88) = v23;
LABEL_8:
  uint64_t v24 = a2[14];
  *(void *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v24;
  swift_retain(v24);
  swift_release();
  uint64_t v25 = a2[15];
  *(void *)(a1 + 120) = v25;
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[10];
  uint64_t v27 = a1 + v26;
  uint64_t v28 = (uint64_t)a2 + v26;
  uint64_t v29 = _s10descrE69B9V6ButtonVMa(0LL);
  int v30 = sub_4AC4(v27, 1LL, v29);
  int v31 = sub_4AC4(v28, 1LL, v29);
  if (v30)
  {
    if (!v31)
    {
      uint64_t v32 = *(void *)(v28 + 24);
      *(void *)(v27 + 24) = v32;
      *(void *)(v27 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v28 + 32);
      (**(void (***)(uint64_t, uint64_t))(v32 - 8))(v27, v28);
      uint64_t v33 = (_OWORD *)(v27 + 40);
      uint64_t v34 = (__int128 *)(v28 + 40);
      uint64_t v35 = *(void *)(v28 + 64);
      if (v35)
      {
        *(void *)(v27 + 64) = v35;
        *(void *)(v27 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v28 + 72);
        (**(void (***)(_OWORD *, __int128 *))(v35 - 8))(v33, v34);
      }

      else
      {
        __int128 v39 = *v34;
        __int128 v40 = *(_OWORD *)(v28 + 56);
        *(void *)(v27 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v28 + 72);
        *uint64_t v33 = v39;
        *(_OWORD *)(v27 + 56) = v40;
      }

      uint64_t v41 = *(void *)(v28 + 104);
      *(void *)(v27 + 104) = v41;
      *(void *)(v27 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v28 + 112);
      (**(void (***)(uint64_t, uint64_t))(v41 - 8))(v27 + 80, v28 + 80);
      uint64_t v42 = *(int *)(v29 + 28);
      __int128 v43 = (void *)(v27 + v42);
      uint64_t v44 = (const void *)(v28 + v42);
      uint64_t v45 = type metadata accessor for ImpressionMetrics(0LL);
      if (sub_4AC4((uint64_t)v44, 1LL, v45))
      {
        uint64_t v46 = sub_44DC(&qword_F3838);
        memcpy(v43, v44, *(void *)(*(void *)(v46 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v45 - 8) + 16LL))(v43, v44, v45);
        sub_4AD0((uint64_t)v43, 0LL, 1LL, v45);
      }

      uint64_t v47 = v27;
      uint64_t v48 = v29;
      goto LABEL_24;
    }

    goto LABEL_14;
  }

  if (v31)
  {
    sub_3C630(v27, _s10descrE69B9V6ButtonVMa);
LABEL_14:
    uint64_t v36 = &qword_F39F0;
LABEL_15:
    uint64_t v37 = sub_44DC(v36);
    memcpy((void *)v27, (const void *)v28, *(void *)(*(void *)(v37 - 8) + 64LL));
    goto LABEL_25;
  }

  sub_4290((void *)v27, (void *)v28);
  uint64_t v38 = *(void *)(v28 + 64);
  if (*(void *)(v27 + 64))
  {
    if (v38)
    {
      sub_4290((void *)(v27 + 40), (void *)(v28 + 40));
      goto LABEL_77;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v27 + 40));
  }

  else if (v38)
  {
    *(void *)(v27 + 64) = v38;
    *(void *)(v27 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v28 + 72);
    (**(void (***)(uint64_t, uint64_t))(v38 - 8))(v27 + 40, v28 + 40);
    goto LABEL_77;
  }

  __int128 v108 = *(_OWORD *)(v28 + 40);
  __int128 v109 = *(_OWORD *)(v28 + 56);
  *(void *)(v27 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v28 + 72);
  *(_OWORD *)(v27 + 40) = v108;
  *(_OWORD *)(v27 + 56) = v109;
LABEL_77:
  sub_4290((void *)(v27 + 80), (void *)(v28 + 80));
  uint64_t v110 = *(int *)(v29 + 28);
  v27 += v110;
  v28 += v110;
  uint64_t v111 = type metadata accessor for ImpressionMetrics(0LL);
  int v112 = sub_4AC4(v27, 1LL, v111);
  int v113 = sub_4AC4(v28, 1LL, v111);
  if (v112)
  {
    if (!v113)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v111 - 8) + 16LL))(v27, v28, v111);
      uint64_t v47 = v27;
      uint64_t v48 = v111;
LABEL_24:
      sub_4AD0(v47, 0LL, 1LL, v48);
      goto LABEL_25;
    }

    goto LABEL_82;
  }

  uint64_t v114 = *(void *)(v111 - 8);
  if (v113)
  {
    (*(void (**)(uint64_t, uint64_t))(v114 + 8))(v27, v111);
LABEL_82:
    uint64_t v36 = &qword_F3838;
    goto LABEL_15;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v114 + 24))(v27, v28, v111);
LABEL_25:
  uint64_t v49 = a3[11];
  uint64_t v50 = a1 + v49;
  uint64_t v51 = (__int128 *)((char *)a2 + v49);
  uint64_t v52 = *(uint64_t *)((char *)a2 + v49 + 24);
  if (*(void *)(a1 + v49 + 24))
  {
    if (v52)
    {
      sub_4290((void *)v50, v51);
      goto LABEL_32;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v50);
  }

  else if (v52)
  {
    *(void *)(v50 + 24) = v52;
    *(void *)(v50 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v51 + 4);
    (**(void (***)(uint64_t, __int128 *))(v52 - 8))(v50, v51);
    goto LABEL_32;
  }

  __int128 v53 = *v51;
  __int128 v54 = v51[1];
  *(void *)(v50 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v51 + 4);
  *(_OWORD *)uint64_t v50 = v53;
  *(_OWORD *)(v50 + swift_unknownObjectWeakDestroy(v0 + 16) = v54;
LABEL_32:
  uint64_t v55 = a3[12];
  uint64_t v56 = *(void **)((char *)a2 + v55);
  __int128 v57 = *(void **)(a1 + v55);
  *(void *)(a1 + v55) = v56;
  id v58 = v56;

  uint64_t v59 = a3[13];
  uint64_t v60 = a1 + v59;
  uint64_t v61 = (uint64_t)a2 + v59;
  sub_4290((void *)(a1 + v59), (uint64_t *)((char *)a2 + v59));
  uint64_t v62 = *(void *)(v61 + 64);
  if (*(void *)(v60 + 64))
  {
    if (v62)
    {
      sub_4290((void *)(v60 + 40), (void *)(v61 + 40));
      goto LABEL_39;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v60 + 40));
  }

  else if (v62)
  {
    *(void *)(v60 + 64) = v62;
    *(void *)(v60 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v61 + 72);
    (**(void (***)(uint64_t, uint64_t))(v62 - 8))(v60 + 40, v61 + 40);
    goto LABEL_39;
  }

  __int128 v63 = *(_OWORD *)(v61 + 40);
  __int128 v64 = *(_OWORD *)(v61 + 56);
  *(void *)(v60 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v61 + 72);
  *(_OWORD *)(v60 + 40) = v63;
  *(_OWORD *)(v60 + 56) = v64;
LABEL_39:
  sub_4290((void *)(v60 + 80), (void *)(v61 + 80));
  uint64_t v65 = *(int *)(v29 + 28);
  uint64_t v66 = (void *)(v60 + v65);
  uint64_t v67 = (const void *)(v61 + v65);
  uint64_t v68 = type metadata accessor for ImpressionMetrics(0LL);
  int v69 = sub_4AC4((uint64_t)v66, 1LL, v68);
  int v70 = sub_4AC4((uint64_t)v67, 1LL, v68);
  if (v69)
  {
    if (!v70)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v68 - 8) + 16LL))(v66, v67, v68);
      sub_4AD0((uint64_t)v66, 0LL, 1LL, v68);
      goto LABEL_45;
    }

    goto LABEL_44;
  }

  uint64_t v71 = *(void *)(v68 - 8);
  if (v70)
  {
    (*(void (**)(void *, uint64_t))(v71 + 8))(v66, v68);
LABEL_44:
    uint64_t v72 = sub_44DC(&qword_F3838);
    memcpy(v66, v67, *(void *)(*(void *)(v72 - 8) + 64LL));
    goto LABEL_45;
  }

  (*(void (**)(void *, const void *, uint64_t))(v71 + 24))(v66, v67, v68);
LABEL_45:
  uint64_t v73 = a3[14];
  uint64_t v74 = a1 + v73;
  uint64_t v75 = (uint64_t)a2 + v73;
  int v76 = sub_4AC4(a1 + v73, 1LL, v29);
  int v77 = sub_4AC4(v75, 1LL, v29);
  if (v76)
  {
    if (!v77)
    {
      uint64_t v78 = *(void *)(v75 + 24);
      *(void *)(v74 + 24) = v78;
      *(void *)(v74 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v75 + 32);
      (**(void (***)(uint64_t, uint64_t))(v78 - 8))(v74, v75);
      uint64_t v79 = (_OWORD *)(v74 + 40);
      uint64_t v80 = (__int128 *)(v75 + 40);
      uint64_t v81 = *(void *)(v75 + 64);
      if (v81)
      {
        *(void *)(v74 + 64) = v81;
        *(void *)(v74 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v75 + 72);
        (**(void (***)(_OWORD *, __int128 *))(v81 - 8))(v79, v80);
      }

      else
      {
        __int128 v86 = *v80;
        __int128 v87 = *(_OWORD *)(v75 + 56);
        *(void *)(v74 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v75 + 72);
        *uint64_t v79 = v86;
        *(_OWORD *)(v74 + 56) = v87;
      }

      uint64_t v88 = *(void *)(v75 + 104);
      *(void *)(v74 + 104) = v88;
      *(void *)(v74 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v75 + 112);
      (**(void (***)(uint64_t, uint64_t))(v88 - 8))(v74 + 80, v75 + 80);
      uint64_t v89 = *(int *)(v29 + 28);
      uint64_t v90 = (void *)(v74 + v89);
      uint64_t v91 = (const void *)(v75 + v89);
      if (sub_4AC4((uint64_t)v91, 1LL, v68))
      {
        uint64_t v92 = sub_44DC(&qword_F3838);
        memcpy(v90, v91, *(void *)(*(void *)(v92 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v68 - 8) + 16LL))(v90, v91, v68);
        sub_4AD0((uint64_t)v90, 0LL, 1LL, v68);
      }

      uint64_t v93 = v74;
      uint64_t v94 = v29;
      goto LABEL_62;
    }

    goto LABEL_51;
  }

  if (v77)
  {
    sub_3C630(v74, _s10descrE69B9V6ButtonVMa);
LABEL_51:
    size_t v82 = *(void *)(*(void *)(sub_44DC(&qword_F39F0) - 8) + 64LL);
    uint64_t v83 = (void *)v74;
    __int128 v84 = (const void *)v75;
LABEL_52:
    memcpy(v83, v84, v82);
    goto LABEL_63;
  }

  sub_4290((void *)v74, (void *)v75);
  uint64_t v85 = *(void *)(v75 + 64);
  if (*(void *)(v74 + 64))
  {
    if (v85)
    {
      sub_4290((void *)(v74 + 40), (void *)(v75 + 40));
      goto LABEL_85;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v74 + 40));
  }

  else if (v85)
  {
    *(void *)(v74 + 64) = v85;
    *(void *)(v74 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v75 + 72);
    (**(void (***)(uint64_t, uint64_t))(v85 - 8))(v74 + 40, v75 + 40);
    goto LABEL_85;
  }

  __int128 v115 = *(_OWORD *)(v75 + 40);
  __int128 v116 = *(_OWORD *)(v75 + 56);
  *(void *)(v74 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v75 + 72);
  *(_OWORD *)(v74 + 40) = v115;
  *(_OWORD *)(v74 + 56) = v116;
LABEL_85:
  sub_4290((void *)(v74 + 80), (void *)(v75 + 80));
  uint64_t v117 = *(int *)(v29 + 28);
  uint64_t v118 = v74 + v117;
  uint64_t v119 = v75 + v117;
  int v120 = sub_4AC4(v118, 1LL, v68);
  int v121 = sub_4AC4(v119, 1LL, v68);
  if (v120)
  {
    if (!v121)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 16LL))(v118, v119, v68);
      uint64_t v93 = v118;
      uint64_t v94 = v68;
LABEL_62:
      sub_4AD0(v93, 0LL, 1LL, v94);
      goto LABEL_63;
    }

    goto LABEL_90;
  }

  uint64_t v122 = *(void *)(v68 - 8);
  if (v121)
  {
    (*(void (**)(uint64_t, uint64_t))(v122 + 8))(v118, v68);
LABEL_90:
    size_t v82 = *(void *)(*(void *)(sub_44DC(&qword_F3838) - 8) + 64LL);
    uint64_t v83 = (void *)v118;
    __int128 v84 = (const void *)v119;
    goto LABEL_52;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v122 + 24))(v118, v119, v68);
LABEL_63:
  uint64_t v95 = a3[15];
  uint64_t v96 = a1 + v95;
  uint64_t v97 = (__int128 *)((char *)a2 + v95);
  uint64_t v98 = *(uint64_t *)((char *)a2 + v95 + 24);
  if (!*(void *)(a1 + v95 + 24))
  {
    if (v98)
    {
      *(void *)(v96 + 24) = v98;
      *(void *)(v96 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v97 + 4);
      (**(void (***)(uint64_t, __int128 *))(v98 - 8))(v96, v97);
      goto LABEL_70;
    }

LABEL_69:
    __int128 v99 = *v97;
    __int128 v100 = v97[1];
    *(void *)(v96 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v97 + 4);
    *(_OWORD *)uint64_t v96 = v99;
    *(_OWORD *)(v96 + swift_unknownObjectWeakDestroy(v0 + 16) = v100;
    goto LABEL_70;
  }

  if (!v98)
  {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v96);
    goto LABEL_69;
  }

  sub_4290((void *)v96, v97);
LABEL_70:
  uint64_t v101 = a3[16];
  uint64_t v102 = *(uint64_t *)((char *)a2 + v101);
  *(void *)(a1 + v101) = v102;
  swift_retain(v102);
  swift_release();
  uint64_t v103 = a3[17];
  uint64_t v104 = a1 + v103;
  uint64_t v105 = (uint64_t)a2 + v103;
  uint64_t v106 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v106 - 8) + 24LL))(v104, v105, v106);
  return a1;
}

uint64_t sub_90854(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_BYTE *)(a1 + 10) = *(_BYTE *)(a2 + 10);
  __int128 v6 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v6;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v7 = a3[10];
  uint64_t v8 = (_OWORD *)(a1 + v7);
  uint64_t v9 = (_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 112);
  uint64_t v10 = _s10descrE69B9V6ButtonVMa(0LL);
  if (sub_4AC4((uint64_t)v9, 1LL, v10))
  {
    uint64_t v11 = sub_44DC(&qword_F39F0);
    memcpy(v8, v9, *(void *)(*(void *)(v11 - 8) + 64LL));
  }

  else
  {
    __int128 v12 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v12;
    *((void *)v8 + 4) = *((void *)v9 + 4);
    *(_OWORD *)((char *)v8 + 40) = *(_OWORD *)((char *)v9 + 40);
    *(_OWORD *)((char *)v8 + 56) = *(_OWORD *)((char *)v9 + 56);
    *((void *)v8 + 9) = *((void *)v9 + 9);
    *((void *)v8 + 14) = *((void *)v9 + 14);
    __int128 v13 = v9[6];
    void v8[5] = v9[5];
    void v8[6] = v13;
    uint64_t v14 = *(int *)(v10 + 28);
    uint64_t v15 = (char *)v8 + v14;
    uint64_t v16 = (char *)v9 + v14;
    uint64_t v17 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v16, 1LL, v17))
    {
      uint64_t v18 = sub_44DC(&qword_F3838);
      memcpy(v15, v16, *(void *)(*(void *)(v18 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 32LL))(v15, v16, v17);
      sub_4AD0((uint64_t)v15, 0LL, 1LL, v17);
    }

    sub_4AD0((uint64_t)v8, 0LL, 1LL, v10);
  }

  uint64_t v19 = a3[11];
  uint64_t v20 = a3[12];
  uint64_t v21 = a1 + v19;
  uint64_t v22 = a2 + v19;
  __int128 v23 = *(_OWORD *)(v22 + 16);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
  *(_OWORD *)(v21 + swift_unknownObjectWeakDestroy(v0 + 16) = v23;
  *(void *)(v21 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v22 + 32);
  *(void *)(a1 + v20) = *(void *)(a2 + v20);
  uint64_t v24 = a3[13];
  uint64_t v25 = a1 + v24;
  uint64_t v26 = a2 + v24;
  __int128 v27 = *(_OWORD *)(v26 + 16);
  *(_OWORD *)uint64_t v25 = *(_OWORD *)v26;
  *(_OWORD *)(v25 + swift_unknownObjectWeakDestroy(v0 + 16) = v27;
  *(void *)(v25 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v26 + 32);
  *(_OWORD *)(v25 + 40) = *(_OWORD *)(v26 + 40);
  *(_OWORD *)(v25 + 56) = *(_OWORD *)(v26 + 56);
  *(void *)(v25 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v26 + 72);
  __int128 v28 = *(_OWORD *)(v26 + 80);
  __int128 v29 = *(_OWORD *)(v26 + 96);
  *(void *)(v25 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v26 + 112);
  *(_OWORD *)(v25 + 80) = v28;
  *(_OWORD *)(v25 + 96) = v29;
  uint64_t v30 = *(int *)(v10 + 28);
  int v31 = (void *)(v25 + v30);
  uint64_t v32 = (const void *)(v26 + v30);
  uint64_t v33 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v32, 1LL, v33))
  {
    uint64_t v34 = sub_44DC(&qword_F3838);
    memcpy(v31, v32, *(void *)(*(void *)(v34 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v33 - 8) + 32LL))(v31, v32, v33);
    sub_4AD0((uint64_t)v31, 0LL, 1LL, v33);
  }

  uint64_t v35 = a3[14];
  uint64_t v36 = (_OWORD *)(a1 + v35);
  uint64_t v37 = (_OWORD *)(a2 + v35);
  if (sub_4AC4(a2 + v35, 1LL, v10))
  {
    uint64_t v38 = sub_44DC(&qword_F39F0);
    memcpy(v36, v37, *(void *)(*(void *)(v38 - 8) + 64LL));
  }

  else
  {
    __int128 v39 = v37[1];
    *uint64_t v36 = *v37;
    v36[1] = v39;
    *((void *)v36 + 4) = *((void *)v37 + 4);
    *(_OWORD *)((char *)v36 + 40) = *(_OWORD *)((char *)v37 + 40);
    *(_OWORD *)((char *)v36 + 56) = *(_OWORD *)((char *)v37 + 56);
    *((void *)v36 + 9) = *((void *)v37 + 9);
    *((void *)v36 + 14) = *((void *)v37 + 14);
    __int128 v40 = v37[6];
    v36[5] = v37[5];
    v36[6] = v40;
    uint64_t v41 = *(int *)(v10 + 28);
    uint64_t v42 = (char *)v36 + v41;
    __int128 v43 = (char *)v37 + v41;
    if (sub_4AC4((uint64_t)v43, 1LL, v33))
    {
      uint64_t v44 = sub_44DC(&qword_F3838);
      memcpy(v42, v43, *(void *)(*(void *)(v44 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v33 - 8) + 32LL))(v42, v43, v33);
      sub_4AD0((uint64_t)v42, 0LL, 1LL, v33);
    }

    sub_4AD0((uint64_t)v36, 0LL, 1LL, v10);
  }

  uint64_t v45 = a3[15];
  uint64_t v46 = a3[16];
  uint64_t v47 = a1 + v45;
  uint64_t v48 = (__int128 *)(a2 + v45);
  __int128 v49 = *v48;
  __int128 v50 = v48[1];
  *(void *)(v47 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v48 + 4);
  uint64_t v51 = *(void *)(a2 + v46);
  *(_OWORD *)uint64_t v47 = v49;
  *(_OWORD *)(v47 + swift_unknownObjectWeakDestroy(v0 + 16) = v50;
  *(void *)(a1 + v46) = v51;
  uint64_t v52 = a3[17];
  uint64_t v53 = a1 + v52;
  uint64_t v54 = a2 + v52;
  uint64_t v55 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 32LL))(v53, v54, v55);
  return a1;
}

uint64_t sub_90C30(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_WORD *)(a1 + 9) = *(_WORD *)(a2 + 9);
  char v6 = *(_BYTE *)(a2 + 64);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 56);
  __int128 v13 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v13;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  char v14 = *(_BYTE *)(a1 + 64);
  *(_BYTE *)(a1 + 64) = v6;
  sub_8E0A4(v7, v8, v9, v10, v11, v12, v14);
  if (*(void *)(a1 + 96)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  }
  __int128 v15 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v15;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 112);
  swift_release();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[10];
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = _s10descrE69B9V6ButtonVMa(0LL);
  int v20 = sub_4AC4(v17, 1LL, v19);
  int v21 = sub_4AC4(v18, 1LL, v19);
  if (v20)
  {
    if (!v21)
    {
      __int128 v22 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
      *(_OWORD *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = v22;
      *(void *)(v17 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v18 + 32);
      *(_OWORD *)(v17 + 40) = *(_OWORD *)(v18 + 40);
      *(_OWORD *)(v17 + 56) = *(_OWORD *)(v18 + 56);
      *(void *)(v17 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v18 + 72);
      *(void *)(v17 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v18 + 112);
      __int128 v23 = *(_OWORD *)(v18 + 96);
      *(_OWORD *)(v17 + 80) = *(_OWORD *)(v18 + 80);
      *(_OWORD *)(v17 + 96) = v23;
      uint64_t v24 = *(int *)(v19 + 28);
      uint64_t v25 = (void *)(v17 + v24);
      uint64_t v26 = (const void *)(v18 + v24);
      uint64_t v27 = type metadata accessor for ImpressionMetrics(0LL);
      if (sub_4AC4((uint64_t)v26, 1LL, v27))
      {
        uint64_t v28 = sub_44DC(&qword_F3838);
        memcpy(v25, v26, *(void *)(*(void *)(v28 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v27 - 8) + 32LL))(v25, v26, v27);
        sub_4AD0((uint64_t)v25, 0LL, 1LL, v27);
      }

      uint64_t v38 = v17;
      uint64_t v39 = v19;
      goto LABEL_18;
    }

    goto LABEL_9;
  }

  if (v21)
  {
    sub_3C630(v17, _s10descrE69B9V6ButtonVMa);
LABEL_9:
    __int128 v29 = &qword_F39F0;
LABEL_10:
    uint64_t v30 = sub_44DC(v29);
    memcpy((void *)v17, (const void *)v18, *(void *)(*(void *)(v30 - 8) + 64LL));
    goto LABEL_19;
  }

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v17);
  __int128 v31 = *(_OWORD *)(v18 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
  *(_OWORD *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = v31;
  *(void *)(v17 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v18 + 32);
  if (*(void *)(v17 + 64)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v17 + 40));
  }
  __int128 v32 = *(_OWORD *)(v18 + 56);
  *(_OWORD *)(v17 + 40) = *(_OWORD *)(v18 + 40);
  *(_OWORD *)(v17 + 56) = v32;
  *(void *)(v17 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v18 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v17 + 80));
  __int128 v33 = *(_OWORD *)(v18 + 96);
  *(_OWORD *)(v17 + 80) = *(_OWORD *)(v18 + 80);
  *(_OWORD *)(v17 + 96) = v33;
  *(void *)(v17 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v18 + 112);
  uint64_t v34 = *(int *)(v19 + 28);
  v17 += v34;
  v18 += v34;
  uint64_t v35 = type metadata accessor for ImpressionMetrics(0LL);
  int v36 = sub_4AC4(v17, 1LL, v35);
  int v37 = sub_4AC4(v18, 1LL, v35);
  if (v36)
  {
    if (!v37)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 32LL))(v17, v18, v35);
      uint64_t v38 = v17;
      uint64_t v39 = v35;
LABEL_18:
      sub_4AD0(v38, 0LL, 1LL, v39);
      goto LABEL_19;
    }

    goto LABEL_51;
  }

  uint64_t v92 = *(void *)(v35 - 8);
  if (v37)
  {
    (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v17, v35);
LABEL_51:
    __int128 v29 = &qword_F3838;
    goto LABEL_10;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 40))(v17, v18, v35);
LABEL_19:
  uint64_t v40 = a3[11];
  uint64_t v41 = a1 + v40;
  uint64_t v42 = a2 + v40;
  if (*(void *)(a1 + v40 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v41);
  }
  __int128 v43 = *(_OWORD *)(v42 + 16);
  *(_OWORD *)uint64_t v41 = *(_OWORD *)v42;
  *(_OWORD *)(v41 + swift_unknownObjectWeakDestroy(v0 + 16) = v43;
  *(void *)(v41 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v42 + 32);
  uint64_t v44 = a3[12];
  uint64_t v45 = *(void **)(a1 + v44);
  *(void *)(a1 + v44) = *(void *)(a2 + v44);

  uint64_t v46 = a3[13];
  uint64_t v47 = a1 + v46;
  uint64_t v48 = a2 + v46;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v46));
  __int128 v49 = *(_OWORD *)(v48 + 16);
  *(_OWORD *)uint64_t v47 = *(_OWORD *)v48;
  *(_OWORD *)(v47 + swift_unknownObjectWeakDestroy(v0 + 16) = v49;
  *(void *)(v47 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v48 + 32);
  if (*(void *)(v47 + 64)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v47 + 40));
  }
  __int128 v50 = *(_OWORD *)(v48 + 56);
  *(_OWORD *)(v47 + 40) = *(_OWORD *)(v48 + 40);
  *(_OWORD *)(v47 + 56) = v50;
  *(void *)(v47 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v48 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v47 + 80));
  __int128 v51 = *(_OWORD *)(v48 + 96);
  *(_OWORD *)(v47 + 80) = *(_OWORD *)(v48 + 80);
  *(_OWORD *)(v47 + 96) = v51;
  *(void *)(v47 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v48 + 112);
  uint64_t v52 = *(int *)(v19 + 28);
  uint64_t v53 = (void *)(v47 + v52);
  uint64_t v54 = (const void *)(v48 + v52);
  uint64_t v55 = type metadata accessor for ImpressionMetrics(0LL);
  int v56 = sub_4AC4((uint64_t)v53, 1LL, v55);
  int v57 = sub_4AC4((uint64_t)v54, 1LL, v55);
  if (v56)
  {
    if (!v57)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v55 - 8) + 32LL))(v53, v54, v55);
      sub_4AD0((uint64_t)v53, 0LL, 1LL, v55);
      goto LABEL_29;
    }

    goto LABEL_28;
  }

  uint64_t v58 = *(void *)(v55 - 8);
  if (v57)
  {
    (*(void (**)(void *, uint64_t))(v58 + 8))(v53, v55);
LABEL_28:
    uint64_t v59 = sub_44DC(&qword_F3838);
    memcpy(v53, v54, *(void *)(*(void *)(v59 - 8) + 64LL));
    goto LABEL_29;
  }

  (*(void (**)(void *, const void *, uint64_t))(v58 + 40))(v53, v54, v55);
LABEL_29:
  uint64_t v60 = a3[14];
  uint64_t v61 = a1 + v60;
  uint64_t v62 = a2 + v60;
  int v63 = sub_4AC4(a1 + v60, 1LL, v19);
  int v64 = sub_4AC4(v62, 1LL, v19);
  if (v63)
  {
    if (!v64)
    {
      __int128 v65 = *(_OWORD *)(v62 + 16);
      *(_OWORD *)uint64_t v61 = *(_OWORD *)v62;
      *(_OWORD *)(v61 + swift_unknownObjectWeakDestroy(v0 + 16) = v65;
      *(void *)(v61 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v62 + 32);
      *(_OWORD *)(v61 + 40) = *(_OWORD *)(v62 + 40);
      *(_OWORD *)(v61 + 56) = *(_OWORD *)(v62 + 56);
      *(void *)(v61 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v62 + 72);
      *(void *)(v61 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v62 + 112);
      __int128 v66 = *(_OWORD *)(v62 + 96);
      *(_OWORD *)(v61 + 80) = *(_OWORD *)(v62 + 80);
      *(_OWORD *)(v61 + 96) = v66;
      uint64_t v67 = *(int *)(v19 + 28);
      uint64_t v68 = (void *)(v61 + v67);
      int v69 = (const void *)(v62 + v67);
      if (sub_4AC4((uint64_t)v69, 1LL, v55))
      {
        uint64_t v70 = sub_44DC(&qword_F3838);
        memcpy(v68, v69, *(void *)(*(void *)(v70 - 8) + 64LL));
      }

      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(void *)(v55 - 8) + 32LL))(v68, v69, v55);
        sub_4AD0((uint64_t)v68, 0LL, 1LL, v55);
      }

      uint64_t v82 = v61;
      uint64_t v83 = v19;
      goto LABEL_45;
    }

    goto LABEL_35;
  }

  if (v64)
  {
    sub_3C630(v61, _s10descrE69B9V6ButtonVMa);
LABEL_35:
    size_t v71 = *(void *)(*(void *)(sub_44DC(&qword_F39F0) - 8) + 64LL);
    uint64_t v72 = (void *)v61;
    uint64_t v73 = (const void *)v62;
LABEL_36:
    memcpy(v72, v73, v71);
    goto LABEL_46;
  }

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)v61);
  __int128 v74 = *(_OWORD *)(v62 + 16);
  *(_OWORD *)uint64_t v61 = *(_OWORD *)v62;
  *(_OWORD *)(v61 + swift_unknownObjectWeakDestroy(v0 + 16) = v74;
  *(void *)(v61 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v62 + 32);
  if (*(void *)(v61 + 64)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v61 + 40));
  }
  __int128 v75 = *(_OWORD *)(v62 + 56);
  *(_OWORD *)(v61 + 40) = *(_OWORD *)(v62 + 40);
  *(_OWORD *)(v61 + 56) = v75;
  *(void *)(v61 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v62 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v61 + 80));
  __int128 v76 = *(_OWORD *)(v62 + 96);
  *(_OWORD *)(v61 + 80) = *(_OWORD *)(v62 + 80);
  *(_OWORD *)(v61 + 96) = v76;
  *(void *)(v61 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v62 + 112);
  uint64_t v77 = *(int *)(v19 + 28);
  uint64_t v78 = v61 + v77;
  uint64_t v79 = v62 + v77;
  int v80 = sub_4AC4(v78, 1LL, v55);
  int v81 = sub_4AC4(v79, 1LL, v55);
  if (v80)
  {
    if (!v81)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 32LL))(v78, v79, v55);
      uint64_t v82 = v78;
      uint64_t v83 = v55;
LABEL_45:
      sub_4AD0(v82, 0LL, 1LL, v83);
      goto LABEL_46;
    }

    goto LABEL_54;
  }

  uint64_t v93 = *(void *)(v55 - 8);
  if (v81)
  {
    (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v78, v55);
LABEL_54:
    size_t v71 = *(void *)(*(void *)(sub_44DC(&qword_F3838) - 8) + 64LL);
    uint64_t v72 = (void *)v78;
    uint64_t v73 = (const void *)v79;
    goto LABEL_36;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 40))(v78, v79, v55);
LABEL_46:
  uint64_t v84 = a3[15];
  uint64_t v85 = a1 + v84;
  if (*(void *)(a1 + v84 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v84));
  }
  __int128 v86 = *(_OWORD *)(a2 + v84 + 16);
  *(_OWORD *)uint64_t v85 = *(_OWORD *)(a2 + v84);
  *(_OWORD *)(v85 + swift_unknownObjectWeakDestroy(v0 + 16) = v86;
  *(void *)(v85 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + v84 + 32);
  *(void *)(a1 + a3[16]) = *(void *)(a2 + a3[16]);
  swift_release();
  uint64_t v87 = a3[17];
  uint64_t v88 = a1 + v87;
  uint64_t v89 = a2 + v87;
  uint64_t v90 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v90 - 8) + 40LL))(v88, v89, v90);
  return a1;
}

uint64_t sub_91360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9136C);
}

uint64_t sub_9136C(uint64_t a1, uint64_t a2, int *a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unsigned int v4 = (*(void *)(a1 + 16) >> 13) & 0xFFFFFFE0 | ((unsigned __int16)*(void *)(a1 + 16) >> 11);
    if (v4 > 0x80000000) {
      return -v4;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F39F0);
    if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == (_DWORD)a2)
    {
      uint64_t v9 = v8;
      uint64_t v10 = a3[10];
    }

    else
    {
      uint64_t v11 = _s10descrE69B9V6ButtonVMa(0LL);
      if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == (_DWORD)a2)
      {
        uint64_t v9 = v11;
        uint64_t v10 = a3[13];
      }

      else
      {
        uint64_t v9 = sub_3C794();
        uint64_t v10 = a3[17];
      }
    }

    return sub_4AC4(a1 + v10, a2, v9);
  }

uint64_t sub_9142C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_91438);
}

uint64_t sub_91438(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = ((unint64_t)-(int)a2 << 13) & 0x1FFFFFFC0000LL | ((-(int)a2 & 0x1FLL) << 11);
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 49) = 0u;
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F39F0);
    if (*(_DWORD *)(*(void *)(v8 - 8) + 84LL) == a3)
    {
      uint64_t v9 = v8;
      uint64_t v10 = a4[10];
    }

    else
    {
      uint64_t v11 = _s10descrE69B9V6ButtonVMa(0LL);
      if (*(_DWORD *)(*(void *)(v11 - 8) + 84LL) == a3)
      {
        uint64_t v9 = v11;
        uint64_t v10 = a4[13];
      }

      else
      {
        uint64_t v9 = sub_3C794();
        uint64_t v10 = a4[17];
      }
    }

    return sub_4AD0(v5 + v10, a2, a2, v9);
  }

  return result;
}

uint64_t type metadata accessor for ServiceProductPageDestination(uint64_t a1)
{
  uint64_t result = qword_F7810;
  if (!qword_F7810) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceProductPageDestination);
  }
  return result;
}

void sub_91544(uint64_t a1)
{
  v9[0] = "\b";
  v9[1] = &unk_BBC08;
  _OWORD v9[2] = &unk_BBC20;
  __int128 v9[3] = &unk_BBC38;
  v9[4] = "\b";
  v9[5] = "\b";
  sub_9162C(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(v2 - 8) + 64LL;
    v9[6] = v4;
    v9[7] = &unk_BBC38;
    v9[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t v5 = _s10descrE69B9V6ButtonVMa(319LL);
    if (v6 <= 0x3F)
    {
      v9[9] = *(void *)(v5 - 8) + 64LL;
      v9[10] = v4;
      v9[11] = &unk_BBC38;
      v9[12] = "\b";
      uint64_t v7 = type metadata accessor for PageMetrics(319LL);
      if (v8 <= 0x3F)
      {
        v9[13] = *(void *)(v7 - 8) + 64LL;
        swift_initStructMetadata(a1, 256LL, 14LL, v9, a1 + 16);
      }
    }
  }

void sub_9162C(uint64_t a1)
{
  if (!qword_F7820)
  {
    uint64_t v2 = _s10descrE69B9V6ButtonVMa(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_F7820);
    }
  }

void sub_91680(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v50 = a2;
  uint64_t v47 = a3;
  uint64_t v44 = type metadata accessor for PageMetrics(0LL);
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  sub_154AC();
  uint64_t v46 = v5;
  v42[1] = _s10descrE69B9V6ButtonVMa(0LL);
  sub_8690();
  __chkstk_darwin(v6);
  sub_154AC();
  uint64_t v45 = v7;
  sub_44DC(&qword_F39F0);
  sub_8690();
  __chkstk_darwin(v8);
  uint64_t v49 = (uint64_t)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v48 = (uint64_t)v42 - v11;
  uint64_t v12 = sub_8484();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_B058();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = type metadata accessor for JSONObject(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v19 = sub_8580();
  int v20 = (int *)type metadata accessor for ServiceProductPageDestination(v19);
  sub_8690();
  __chkstk_darwin(v21);
  sub_B058();
  uint64_t v24 = v23 - v22;
  uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16);
  uint64_t v56 = a1;
  sub_92AAC(v3, v25);
  (*(void (**)(uint64_t))(v13 + 16))(v16);
  uint64_t v26 = v51;
  sub_91C50(v3, v16, (void *)v24);
  sub_92A8C();
  sub_92A7C();
  if (!v26)
  {
    sub_92A70();
    sub_92A68(v27, v28, v29);
    uint64_t v30 = *(void *)v24;
    LODWORD(v56) = *(unsigned __int8 *)(v24 + 10);
    LODWORD(v51) = *(unsigned __int16 *)(v24 + 8);
    sub_8DE38((__int128 *)(v24 + 16), (uint64_t)v55);
    sub_3E5D0(v24 + 72, (uint64_t)v54);
    uint64_t v31 = *(void *)(v24 + 112);
    uint64_t v32 = *(void *)(v24 + 120);
    sub_92A70();
    sub_92A68(v33, v34, v35);
    sub_3E5D0(v24 + v20[11], (uint64_t)v53);
    int v36 = *(void **)(v24 + v20[12]);
    uint64_t v37 = v45;
    sub_92994(v24 + v20[13], v45);
    sub_3E5D0(v24 + v20[15], (uint64_t)v52);
    uint64_t v38 = v20[17];
    uint64_t v39 = *(void *)(v24 + v20[16]);
    uint64_t v40 = v46;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v43 + 16))(v46, v24 + v38, v44);
    swift_retain(v30);
    sub_929D8((uint64_t)v55);
    swift_retain(v39);
    swift_retain(v31);
    swift_bridgeObjectRetain(v32);
    id v41 = v36;
    sub_3C630(v24, type metadata accessor for ServiceProductPageDestination);
    sub_91ABC( v30,  v51 | ((_DWORD)v56 << 16),  v55,  (uint64_t)v54,  v31,  v32,  v49,  (uint64_t)v53,  v47,  (uint64_t)v41,  v37,  v48,  (uint64_t)v52,  v39,  v40);
  }

  sub_8314();
}

void sub_919D8(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v7 = sub_8484();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = sub_8580();
  uint64_t v10 = type metadata accessor for JSONObject(v9);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_B058();
  uint64_t v14 = v13 - v12;
  sub_92AAC(v13 - v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, a2, v7);
  sub_91C50(v14, v3, a3);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a2, v7);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  sub_8314();
}

uint64_t sub_91ABC@<X0>( uint64_t a1@<X0>, int a2@<W1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  *(void *)a9 = a1;
  *(_WORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 10) = BYTE2(a2);
  sub_8DE38(a3, a9 + 16);
  sub_92A9C(a4, a9 + 72);
  *(void *)(a9 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a5;
  *(void *)(a9 + 120) = a6;
  uint64_t v21 = (int *)type metadata accessor for ServiceProductPageDestination(0LL);
  sub_92954(a7, a9 + v21[10], &qword_F39F0);
  sub_92A9C(a8, a9 + v21[11]);
  *(void *)(a9 + v21[12]) = a10;
  sub_928EC(a11, a9 + v21[13]);
  sub_92954(a12, a9 + v21[14], &qword_F39F0);
  sub_92A9C(a13, a9 + v21[15]);
  *(void *)(a9 + v21[16]) = a14;
  uint64_t v22 = a9 + v21[17];
  uint64_t v23 = sub_3C794();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 32LL))(v22, a15, v23);
}

uint64_t sub_91C10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 68);
  uint64_t v5 = type metadata accessor for PageMetrics(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

void sub_91C50(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v131 = a3;
  uint64_t v130 = _s10descrE69B9V6ButtonVMa(0LL);
  sub_8690();
  __chkstk_darwin(v5);
  sub_154AC();
  uint64_t v126 = v6;
  sub_44DC(&qword_F3968);
  sub_8690();
  __chkstk_darwin(v7);
  sub_154AC();
  uint64_t v124 = v8;
  uint64_t v9 = type metadata accessor for PageMetrics(0LL);
  uint64_t v128 = *(void *)(v9 - 8);
  uint64_t v129 = (uint64_t *)v9;
  __chkstk_darwin(v9);
  sub_154AC();
  uint64_t v125 = v10;
  sub_44DC(&qword_F3F78);
  sub_8690();
  __chkstk_darwin(v11);
  sub_154AC();
  uint64_t v127 = v12;
  uint64_t v13 = type metadata accessor for JSONObject(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_154AC();
  uint64_t v132 = v15;
  sub_44DC(&qword_F39F0);
  sub_8690();
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v116 - v20;
  uint64_t v22 = type metadata accessor for DynamicTextFactory(0LL);
  uint64_t v23 = swift_allocObject(v22, 16LL, 7LL);
  uint64_t v24 = (int *)type metadata accessor for ServiceProductPageDestination(0LL);
  uint64_t v143 = a2;
  v134[2] = a2;
  uint64_t v25 = v133;
  sub_6784( 0x6567646162LL,  0xE500000000000000LL,  (uint64_t)v24,  (uint64_t)sub_9282C,  (uint64_t)v134,  v26,  v27,  v28,  v116,  (int)v117,  SWORD2(v117),  BYTE6(v117));
  if (!v25)
  {
    LODWORD(v12_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v29;
    int v120 = v21;
    uint64_t v121 = v13;
    uint64_t v122 = v14;
    uint64_t v117 = v18;
    uint64_t v133 = v23;
    __chkstk_darwin(v29);
    sub_92A28();
    sub_5A94(0x6B726F77747261LL, 0xE700000000000000LL, (uint64_t)v24, (uint64_t)sub_16924, v31, v32, v33, v34);
    uint64_t v35 = v131;
    uint64_t v36 = (uint64_t)v120;
    int v37 = v123;
    *uint64_t v131 = v38;
    *((_WORD *)v35 + 4) = v37;
    *((_BYTE *)v35 + 10) = BYTE2(v37);
    __chkstk_darwin(v38);
    uint64_t v39 = v143;
    *(&v116 - _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v40;
    *(&v116 - 1) = v39;
    sub_58A0();
    sub_92954((uint64_t)&v137, (uint64_t)(v35 + 9), &qword_F3930);
    __chkstk_darwin(v41);
    sub_92A28();
    sub_6898();
    int v120 = (char *)(v35 + 9);
    sub_92954((uint64_t)v138, (uint64_t)&v139, &qword_F7888);
    if (v141 > 1u
      || (v140 <= 0xFF ? (BOOL v43 = (v139 & 0xFFFFFFFFFFFCF800LL) == 0x1FFFFFFCF800LL) : (BOOL v43 = 0),
          !v43 || (*((void *)&v139 + 1) & 0xF000000000000007LL) != 0))
    {
      sub_8DE38(&v139, (uint64_t)v142);
      uint64_t v42 = sub_8DE38(v142, (uint64_t)(v35 + 2));
      uint64_t v44 = v143;
    }

    else
    {
      uint64_t v44 = v143;
      v35[2] = v123 & 0xFFFFFF;
      *(_OWORD *)(v35 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0u;
      *(_OWORD *)(v35 + 5) = 0u;
      *(_OWORD *)((char *)v35 + 49) = 0u;
    }

    __chkstk_darwin(v42);
    sub_92A14();
    sub_5A94(0x777472416B726164LL, 0xEB000000006B726FLL, (uint64_t)v24, (uint64_t)sub_1692C, v45, v46, v47, v48);
    v35[14] = v49;
    v35[15] = 0LL;
    __chkstk_darwin(v49);
    sub_92A14();
    sub_6874(0x427373696D736964LL, 0xED00006E6F747475LL, (uint64_t)v24, (uint64_t)sub_928A0, v50, v51, v52, v53);
    uint64_t v54 = v133;
    uint64_t v55 = v122;
    uint64_t v123 = (uint64_t)v35 + v24[10];
    sub_92954(v36, v123, &qword_F39F0);
    __chkstk_darwin(v56);
    sub_1991C();
    *(void *)(v57 - swift_unknownObjectWeakDestroy(v0 + 16) = v54;
    *(void *)(v57 - 8) = v44;
    sub_92A58();
    uint64_t v58 = v132;
    uint64_t v119 = (uint64_t)v35 + v24[11];
    sub_92954((uint64_t)&v136, v119, &qword_F3930);
    uint64_t v59 = JSONObject.subscript.getter(0x6E6974656B72616DLL, 0xED00006D65744967LL);
    uint64_t v60 = JSONObject.isNull.getter(v59);
    uint64_t v118 = v24;
    if ((v60 & 1) == 0)
    {
      uint64_t v61 = v127;
      JSONObject.dictionary.getter(v60);
      uint64_t v62 = type metadata accessor for JSONDictionary(0LL);
      if (sub_4AC4(v61, 1LL, v62) == 1)
      {
        sub_3C6C8(v61, &qword_F3F78);
        uint64_t v55 = v122;
        uint64_t v58 = v132;
      }

      else
      {
        uint64_t v63 = sub_44DC(&qword_F6370);
        uint64_t v64 = JSONDictionary.bridgedPrimitiveValues<A, B>()( &type metadata for String,  v63,  &protocol witness table for String);
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v62 - 8) + 8LL))(v61, v62);
        uint64_t v55 = v122;
        uint64_t v58 = v132;
        if (v64)
        {
          sub_928A8();
          uint64_t v132 = *(void (**)(void, void))(v55 + 8);
          v132(v58, v121);
          id v65 = sub_92768();
          *(void *)((char *)v35 + v24[12]) = v65;
          __chkstk_darwin(v65);
          sub_92A14();
          uint64_t v66 = v124;
          sub_92A40();
          sub_609C();
          __int128 v74 = v129;
          sub_92A68(v66, 0LL, 1LL);
          __int128 v75 = *(void (**)(uint64_t, uint64_t, uint64_t *))(v128 + 32);
          uint64_t v76 = v125;
          v75(v125, v66, v74);
          uint64_t v77 = v131;
          uint64_t v78 = ((uint64_t (*)(char *, uint64_t, uint64_t *))v75)((char *)v131 + v24[17], v76, v74);
          __chkstk_darwin(v78);
          sub_1991C();
          *(void *)(v79 - swift_unknownObjectWeakDestroy(v0 + 16) = v143;
          uint64_t v80 = v126;
          sub_92A40();
          sub_6850(v81, v82, v83, v84, v85, v86, v87, v88);
          uint64_t v89 = sub_928EC(v80, (uint64_t)v77 + v24[13]);
          uint64_t v129 = &v116;
          __chkstk_darwin(v89);
          sub_92A14();
          uint64_t v90 = (uint64_t)v117;
          sub_92A40();
          sub_6874(v91, v92, v93, v94, v95, v96, v97, v98);
          __int128 v99 = v77;
          sub_92954(v90, (uint64_t)v77 + v24[14], &qword_F39F0);
          __chkstk_darwin(v100);
          sub_1991C();
          uint64_t v101 = v143;
          *(void *)(v102 - swift_unknownObjectWeakDestroy(v0 + 16) = v133;
          *(void *)(v102 - 8) = v101;
          sub_92A58();
          sub_92954((uint64_t)&v135, (uint64_t)v77 + v24[15], &qword_F3930);
          __chkstk_darwin(v103);
          sub_92A28();
          sub_92A40();
          sub_5A94(v104, v105, v106, v107, v108, v109, v110, v111);
          int v112 = v132;
          uint64_t v114 = v113;
          sub_92AA4();
          v112(0LL, v121);
          uint64_t v115 = sub_8484();
          sub_77BCC(v115);
          *(void *)((char *)v99 + v24[16]) = v114;
          goto LABEL_17;
        }
      }
    }

    uint64_t v67 = type metadata accessor for JSONError(0LL);
    unint64_t v68 = sub_6F328();
    swift_allocError(v67, v68, 0LL, 0LL);
    strcpy(v69, "marketingItem");
    *((_WORD *)v69 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = -4864;
    *((void *)v69 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v24;
    uint64_t v70 = (*(uint64_t (**)(char *, void, uint64_t))(*(void *)(v67 - 8) + 104LL))( v69,  enum case for JSONError.missingProperty(_:),  v67);
    swift_willThrow(v70);
    size_t v71 = *(void (**)(uint64_t, uint64_t))(v55 + 8);
    uint64_t v72 = v121;
    v71((uint64_t)v58, v121);
    v71(a1, v72);
    sub_92AA4();
    uint64_t v73 = sub_8484();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v73 - 8) + 8LL))(v44, v73);
    swift_release();
    sub_8E0A4(v35[2], v35[3], v35[4], v35[5], v35[6], v35[7], *((_BYTE *)v35 + 64));
    sub_3C6C8((uint64_t)v120, &qword_F3930);
    swift_release();
    swift_bridgeObjectRelease();
    sub_3C6C8(v123, &qword_F39F0);
    sub_3C6C8(v119, &qword_F3930);
    goto LABEL_17;
  }

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  swift_release();
  uint64_t v30 = sub_8484();
  sub_77BCC(v30);
LABEL_17:
  sub_8314();
}

id sub_92768()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  sub_44DC(&qword_F6370);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v3 = [v1 initWithDictionary:isa];

  return v3;
}

void sub_927F0(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
}

void sub_92804(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = v2;
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v3;
  sub_4960();
}

void sub_9282C(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = v2;
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v3;
  sub_4960();
}

void sub_92858(uint64_t a1@<X8>)
{
}

void sub_92898(uint64_t a1@<X8>)
{
}

void sub_928A0()
{
}

unint64_t sub_928A8()
{
  unint64_t result = qword_F7880;
  if (!qword_F7880)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___AMSMarketingItem);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_F7880);
  }

  return result;
}

void sub_928E4()
{
}

uint64_t sub_928EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s10descrE69B9V6ButtonVMa(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_92930(void *a1@<X8>)
{
  *a1 = v2;
  sub_4960();
}

void sub_92954(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_44DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  sub_4960();
}

uint64_t sub_92994(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _s10descrE69B9V6ButtonVMa(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_929D8(uint64_t a1)
{
  return a1;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_92A50()
{
  return swift_errorRelease(v0);
}

void sub_92A58()
{
}

uint64_t sub_92A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_4AD0(a1, a2, a3, v3);
}

  ;
}

uint64_t sub_92A7C()
{
  return (*(uint64_t (**)(void, uint64_t))(v1 + 8))(*(void *)(v2 - 72), v0);
}

uint64_t sub_92A8C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

void sub_92A9C(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_92AA4()
{
  return swift_release(*(void *)(v0 + 136));
}

uint64_t sub_92AAC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2, v3);
}

void *sub_92AB8()
{
  uint64_t v7 = &type metadata for CGFloat;
  uint64_t v8 = &protocol witness table for CGFloat;
  v5[4] = &protocol witness table for CGFloat;
  *(void *)&__int128 v6 = 0x4089000000000000LL;
  v5[3] = &type metadata for CGFloat;
  v5[0] = 0x4080A80000000000LL;
  uint64_t v3 = &type metadata for Double;
  uint64_t v4 = &protocol witness table for Double;
  *(void *)&__int128 v2 = 0x4062C00000000000LL;
  memset(&v1[72], 0, 40);
  *(_OWORD *)uint64_t v1 = xmmword_BBCC0;
  *(_OWORD *)&v1[16] = xmmword_BBCD0;
  sub_7CF4(&v6, (uint64_t)&v1[32]);
  sub_1BF14((uint64_t)v5, (uint64_t)&v1[72]);
  sub_7CF4(&v2, (uint64_t)&v1[112]);
  return memcpy(&unk_F7898, v1, 0x98uLL);
}

void *sub_92B90()
{
  uint64_t v8 = &type metadata for Double;
  uint64_t v9 = &protocol witness table for Double;
  uint64_t v6 = 0LL;
  *(void *)&__int128 v7 = 0x408D780000000000LL;
  memset(v5, 0, sizeof(v5));
  uint64_t v3 = &type metadata for Double;
  uint64_t v4 = &protocol witness table for Double;
  *(void *)&__int128 v2 = 0LL;
  memset(&v1[72], 0, 40);
  *(_OWORD *)uint64_t v1 = xmmword_BBCE0;
  *(_OWORD *)&v1[16] = xmmword_BBCF0;
  sub_7CF4(&v7, (uint64_t)&v1[32]);
  sub_1BF14((uint64_t)v5, (uint64_t)&v1[72]);
  sub_7CF4(&v2, (uint64_t)&v1[112]);
  return memcpy(&unk_F7930, v1, 0x98uLL);
}

char *sub_92C48(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)sub_119B4();
  *(void *)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_pageType] = 1LL;
  *(void *)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView] = 0LL;
  id v10 = objc_allocWithZone((Class)type metadata accessor for ServiceProductTextDetailsView());
  uint64_t v11 = v4;
  id v12 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_detailsView] = v12;

  v15.receiver = v11;
  v15.super_class = v9;
  uint64_t v13 = (char *)objc_msgSendSuper2(&v15, "initWithFrame:", a1, a2, a3, a4);
  [v13 addSubview:*(void *)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_detailsView]];
  return v13;
}

void sub_92D58()
{
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_pageType] = 1LL;
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceProductPageView_tvOS.swift",  54LL,  2LL,  81LL,  0);
  __break(1u);
}

id sub_92DE8()
{
  if (*(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView]) {
    objc_msgSend(v0, "addSubview:");
  }
  return [v0 setNeedsLayout];
}

void sub_92E24(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView);
  if (v4)
  {
    [v4 removeFromSuperview];
    uint64_t v3 = OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView;
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  *(void *)(v1 + v_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = a1;
  id v6 = a1;

  sub_92DE8();
}

void *sub_92E94()
{
  uint64_t v1 = v0;
  __int128 v2 = (objc_class *)sub_119B4();
  uint64_t v3 = type metadata accessor for LayoutRect(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  sub_B058();
  uint64_t v7 = v6 - v5;
  v29.receiver = v1;
  v29.super_class = v2;
  objc_msgSendSuper2(&v29, "layoutSubviews");
  unint64_t result = [v1 bounds];
  uint64_t v12 = *(void *)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_pageType];
  if (v12 != 1)
  {
    CGFloat v13 = v9;
    CGFloat v14 = v10;
    CGFloat v15 = v11;
    if (v12)
    {
      uint64_t v16 = qword_F3778;
      sub_94190();
      if (v16 != -1) {
        swift_once(&qword_F3778, sub_92AB8);
      }
      uint64_t v17 = &unk_F7898;
    }

    else
    {
      if (qword_F3780 != -1) {
        swift_once(&qword_F3780, sub_92B90);
      }
      uint64_t v17 = &unk_F7930;
    }

    sub_93FDC((uint64_t)v17, (uint64_t)v25);
    uint64_t v18 = *(void **)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_contentView];
    if (v18)
    {
      *((void *)&v23 + 1) = sub_31544();
      uint64_t v24 = &protocol witness table for UIView;
      *(void *)&__int128 v22 = v18;
    }

    else
    {
      uint64_t v24 = 0LL;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
    }

    uint64_t v19 = *(void **)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_detailsView];
    v28[8] = type metadata accessor for ServiceProductTextDetailsView();
    v28[9] = &protocol witness table for UIView;
    v28[5] = v19;
    memcpy(v26, v25, sizeof(v26));
    BOOL v27 = v12 == 0;
    sub_940E4((uint64_t)&v22, (uint64_t)v28);
    id v20 = v18;
    id v21 = v19;
    ServiceProductPageLayout.placeChildren(relativeTo:in:)((uint64_t)v1, v13, v14, v15);
    sub_9404C(v12);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
    return sub_9412C(v26);
  }

  return result;
}

uint64_t sub_930DC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v31 = a2;
  uint64_t v7 = type metadata accessor for FloatingPointRoundingRule(0LL);
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v10 = v9 - v8;
  uint64_t v32 = a1;
  uint64_t v33 = a3;
  uint64_t v11 = *a1;
  if (*a1)
  {
    uint64_t v12 = qword_F3778;
    swift_retain(v11);
    if (v12 != -1) {
      swift_once(&qword_F3778, sub_92AB8);
    }
    CGFloat v13 = &unk_F7898;
  }

  else
  {
    if (qword_F3780 != -1) {
      swift_once(&qword_F3780, sub_92B90);
    }
    CGFloat v13 = &unk_F7930;
  }

  sub_93FDC((uint64_t)v13, (uint64_t)v42);
  sub_6666C((uint64_t)&v43, (uint64_t)v39);
  sub_94018(v42);
  uint64_t v14 = v40;
  uint64_t v15 = v41;
  sub_ACA0(v39, v40);
  j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v14, v15);
  double v16 = AnyDimension.value(in:rounded:)(v4, v10, v14, v15);
  sub_94184();
  if (v11)
  {
    if (qword_F3778 != -1) {
      swift_once(&qword_F3778, sub_92AB8);
    }
    uint64_t v17 = &unk_F7898;
    uint64_t v18 = v32;
  }

  else
  {
    uint64_t v18 = v32;
    if (qword_F3780 != -1) {
      swift_once(&qword_F3780, sub_92B90);
    }
    uint64_t v17 = &unk_F7930;
  }

  sub_93FDC((uint64_t)v17, (uint64_t)v34);
  sub_6662C((uint64_t)&v35, (uint64_t)v36, &qword_F3EB0);
  sub_94018(v34);
  uint64_t v19 = v37;
  if (v37)
  {
    uint64_t v20 = v38;
    sub_ACA0(v36, v37);
    j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v19, v20);
    double Height = AnyDimension.value(in:rounded:)(v4, v10, v19, v20);
    sub_94184();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v36);
  }

  else
  {
    sub_8144((uint64_t)v36, &qword_F3EB0);
    objc_msgSend(v4, "bounds", v31);
    double Height = CGRectGetHeight(v44);
  }

  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v39);
  if (v11)
  {
    uint64_t v22 = v18[14];
    swift_retain(v11);
    sub_936E0(v23, v22, v33, v16, Height);
    swift_release();
  }

  else
  {
    id v24 =  [*(id *)((char *)v18 + *(int *)(type metadata accessor for ServiceProductPageDestination(0) + 48)) rawValues];
    uint64_t v25 = sub_44DC(&qword_F6370);
    uint64_t v26 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v24,  &type metadata for String,  v25,  &protocol witness table for String);

    sub_55D84(v26);
    uint64_t v28 = v27;
    swift_bridgeObjectRelease();
    sub_937DC(v28, v31, v33, v16, Height);
    swift_bridgeObjectRelease();
  }

  uint64_t v29 = *(void *)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_pageType];
  *(void *)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceProductPageView_pageType] = v11;
  return sub_9404C(v29);
}

void sub_93448(unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = sub_44DC(&qword_F39F0);
  __chkstk_darwin(v10);
  sub_B058();
  uint64_t v13 = v12 - v11;
  int v14 = a1[8];
  int v22 = a1[9];
  int v21 = a1[10];
  uint64_t v15 = (int *)type metadata accessor for ServiceProductPageDestination(0LL);
  sub_94170((uint64_t)&a1[v15[15]], (uint64_t)v31);
  sub_94170((uint64_t)(a1 + 72), (uint64_t)v30);
  sub_94170((uint64_t)&a1[v15[11]], (uint64_t)v29);
  double v16 = &a1[v15[13]];
  sub_6666C((uint64_t)(v16 + 80), (uint64_t)v28);
  sub_94170((uint64_t)(v16 + 40), (uint64_t)v27);
  uint64_t v17 = sub_94178((uint64_t)&unk_E6AB0);
  *(void *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  sub_6662C((uint64_t)&a1[v15[14]], v13, &qword_F39F0);
  uint64_t v18 = _s10descrE69B9V6ButtonVMa(0LL);
  if (sub_4AC4(v13, 1LL, v18) == 1)
  {
    sub_94190();
    sub_8144(v13, &qword_F39F0);
    memset(v25, 0, sizeof(v25));
    uint64_t v26 = 0LL;
  }

  else
  {
    sub_6666C(v13 + 80, (uint64_t)v25);
    sub_94190();
    sub_93F74(v13);
  }

  if (a4)
  {
    uint64_t v19 = sub_94178((uint64_t)&unk_E6AD8);
    *(void *)(v19 + swift_unknownObjectWeakDestroy(v0 + 16) = a4;
    *(void *)(v19 + 24) = a5;
    uint64_t v20 = sub_9416C;
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v19 = 0LL;
  }

  sub_4548(a4, a5);
  sub_95B00( v14 | (v22 << 8) | (v21 << 16),  (uint64_t)v31,  (uint64_t)v30,  (uint64_t)v29,  (uint64_t)v28,  (uint64_t)v27,  (uint64_t)sub_93F6C,  v17,  (uint64_t)v25,  (uint64_t)v20,  v19,  a6);
  sub_AC90((uint64_t)v20, v19);
  swift_release();
  sub_26EBC((uint64_t)v25);
  sub_26EBC((uint64_t)v27);
  sub_26EBC((uint64_t)v28);
  sub_26EBC((uint64_t)v29);
  sub_26EBC((uint64_t)v30);
  sub_26EBC((uint64_t)v31);
}

void sub_936E0(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  id v10 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView(0LL));
  uint64_t v11 = (void *)ArtworkImageView.init(artworkSize:frame:)(a4, a5, 0.0, 0.0, 0.0, 0.0);
  uint64_t v12 = v11;
  if (a2)
  {
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t, __n128))((char *)&stru_108.size + (swift_isaMask & *v11));
    __n128 v14 = swift_retain(a2);
    v13(a1, a2, a3, v14);
    swift_release();
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))&stru_108.segname[(swift_isaMask & *v11) + 16])(a1, a3);
  }

  id v15 = v12;
  sub_92E24(v12);
}

void sub_937DC(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v10 = sub_44DC(&qword_F4018);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v27[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for DelegateController(0LL);
  uint64_t v15 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v14, a3, v14, v15);
  uint64_t v16 = v27[0];
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t, double, double, double, double))(*(void *)v27[0] + 240LL))( a1,  0.0,  0.0,  a4,  a5);
  if (v17)
  {
    uint64_t v18 = v17;
    sub_93A10(v17);
    uint64_t v26 = *(void *)(v16 + 16);
    uint64_t v19 = swift_allocObject(&unk_E6B28, 24LL, 7LL);
    swift_unknownObjectWeakInit(v19 + 16);
    uint64_t v20 = swift_allocObject(&unk_E6B50, 24LL, 7LL);
    swift_unknownObjectWeakInit(v20 + 16);
    uint64_t v21 = swift_allocObject(&unk_E6B78, 24LL, 7LL);
    swift_weakInit(v21 + 16, a2);
    int v22 = (void *)swift_allocObject(&unk_E6BA0, 40LL, 7LL);
    v22[2] = v20;
    v22[3] = v21;
    v22[4] = v19;
    uint64_t v23 = sub_44DC(&qword_F4020);
    unint64_t v24 = sub_185A8();
    dispatch thunk of static EventEmitter.defaultScheduler.getter(v27, v23, v24);
    EventEmitter.addObserver(on:singleUse:_:)(v27, 0LL, sub_940D8, v22, v23, v24);
    swift_release();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v27);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    id v25 = v18;
    sub_92E24(v18);
    swift_release();
  }

  else
  {
    swift_release();
  }

void sub_93A10(void *a1)
{
  uint64_t v2 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t v18 = *(void *)(v2 - 8);
  *(void *)&double v3 = __chkstk_darwin(v2).n128_u64[0];
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v6 = a1;
  id v7 = [v6 impressionItems];
  uint64_t v8 = type metadata accessor for DynamicImpressionItem(0LL);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  Unstable.ImpressionsCalculator.removeAllElements()();
  if (!((unint64_t)v9 >> 62))
  {
    uint64_t v10 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFF8LL));
    if (v10) {
      goto LABEL_4;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }

  if (v9 < 0) {
    uint64_t v16 = v9;
  }
  else {
    uint64_t v16 = v9 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v9);
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v16);
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_16;
  }
LABEL_4:
  if (v10 < 1)
  {
    __break(1u);
  }

  else
  {
    uint64_t v11 = 0LL;
    do
    {
      if ((v9 & 0xC000000000000001LL) != 0) {
        uint64_t v12 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v9);
      }
      else {
        uint64_t v12 = *(id *)(v9 + 8 * v11 + 32);
      }
      uint64_t v13 = v12;
      ++v11;
      uint64_t v14 = (void *)(*(uint64_t (**)(void))&stru_68.segname[(swift_isaMask & *v12) + 8])();
      sub_5F830();

      double v15 = (*(double (**)(void))&stru_68.sectname[swift_isaMask & *v13])();
      Unstable.ImpressionsCalculator.addElement(_:at:)(v15);

      (*(void (**)(char *, uint64_t))(v18 + 8))(v5, v2);
    }

    while (v10 != v11);
    swift_bridgeObjectRelease();
  }

void sub_93C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 16;
  swift_beginAccess(a2 + 16, v15, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v6);
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    uint64_t v9 = a3 + 16;
    swift_beginAccess(v9, v14, 0LL, 0LL);
    if (swift_weakLoadStrong(v9))
    {
      uint64_t v10 = a4 + 16;
      swift_beginAccess(v10, v13, 0LL, 0LL);
      uint64_t v11 = swift_unknownObjectWeakLoadStrong(v10);
      if (v11)
      {
        uint64_t v12 = (void *)v11;
        sub_93A10(v8);
      }

      swift_release();
    }
  }

uint64_t sub_93CD4(uint64_t a1, void (*a2)(void *))
{
  v5[3] = sub_44DC(&qword_F6300);
  v5[0] = swift_allocObject(&unk_E6B00, 48LL, 7LL);
  sub_6662C(a1, v5[0] + 16LL, &qword_F6300);
  a2(v5);
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v5);
}

uint64_t type metadata accessor for ServiceProductPageView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin22ServiceProductPageView);
}

uint64_t *initializeBufferWithCopyOfBuffer for ServiceProductPageView.PageType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a1 = *a2;
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for ServiceProductPageView.PageType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

void *initializeWithTake for ServiceProductPageView.PageType(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t *assignWithTake for ServiceProductPageView.PageType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceProductPageView.PageType(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for ServiceProductPageView.PageType( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0LL;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }

  return result;
}

uint64_t sub_93F00(uint64_t *a1)
{
  uint64_t v1 = *a1;
  return (v1 + 1);
}

void *sub_93F18(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }

  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }

  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for ServiceProductPageView.PageType()
{
  return &type metadata for ServiceProductPageView.PageType;
}

uint64_t sub_93F48()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_93F6C(uint64_t a1)
{
  return sub_93CD4(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_93F74(uint64_t a1)
{
  uint64_t v2 = _s10descrE69B9V6ButtonVMa(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_93FB0()
{
  if (*(void *)(v0 + 40)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v0 + 16));
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_93FDC(uint64_t a1, uint64_t a2)
{
  return a2;
}

void *sub_94018(void *a1)
{
  return a1;
}

uint64_t sub_9404C(uint64_t result)
{
  if (result != 1) {
    return swift_release(result);
  }
  return result;
}

uint64_t sub_9405C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_94080()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_940A4()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

void sub_940D8(uint64_t a1)
{
}

uint64_t sub_940E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F5108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_9412C(void *a1)
{
  return a1;
}

void sub_94170(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_94178(uint64_t a1)
{
  return swift_allocObject(a1, 32LL, 7LL);
}

uint64_t sub_94184()
{
  return v0(v2, v1);
}

uint64_t sub_94190()
{
  return swift_retain(v0);
}

void sub_94198(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = type metadata accessor for PageRenderMetricsPresenter.ActivityStart(0LL);
  uint64_t v45 = *(void *)(v6 - 8);
  uint64_t v46 = v6;
  __chkstk_darwin(v6);
  sub_154AC();
  CGRect v44 = v7;
  uint64_t v53 = type metadata accessor for Bag(0LL);
  uint64_t v57 = *(void *)(v53 - 8);
  __chkstk_darwin(v53);
  sub_154AC();
  uint64_t v52 = v8;
  sub_44DC(&qword_F3968);
  sub_8690();
  __chkstk_darwin(v9);
  sub_154AC();
  uint64_t v51 = v10;
  type metadata accessor for MetricsFieldsContext(0LL, v11);
  sub_8690();
  __chkstk_darwin(v12);
  sub_154AC();
  uint64_t v49 = v13;
  uint64_t v14 = type metadata accessor for MetricsPipeline(0LL);
  sub_95ACC();
  __chkstk_darwin(v15);
  uint64_t v48 = (uint64_t)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v44 - v18;
  v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_didApply] = 0;
  *(void *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_overlayViewController] = 0LL;
  uint64_t v20 = sub_44DC(&qword_F4030);
  type metadata accessor for BaseObjectGraph(0LL);
  uint64_t v21 = v2;
  sub_95AE4(v20, a2, v20);
  uint64_t v23 = v60;
  uint64_t v22 = v61;
  type metadata accessor for Unstable.ImpressionsCalculator(0LL, v24);
  uint64_t v25 = swift_unknownObjectRetain(v23);
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_impressionsCalculator] = Unstable.ImpressionsCalculator.__allocating_init(impressionableThreshold:tracker:)(v25, v22, 0.5);
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ServiceProductPageView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  uint64_t v58 = a1;
  sub_959A4(a1, (uint64_t)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_destination]);
  uint64_t v47 = OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_objectGraph;
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_objectGraph] = a2;
  uint64_t v26 = type metadata accessor for AppMetricsPresenter(0LL);
  swift_retain(a2);
  sub_95AE4(v26, a2, v26);
  uint64_t v27 = v60;
  sub_95AE4(v14, a2, v14);
  uint64_t v54 = v19;
  uint64_t v55 = v3;
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  uint64_t v29 = v48;
  uint64_t v56 = v14;
  sub_95AEC(v48, (uint64_t)v19, v28);
  swift_unknownObjectRetain(v23);
  __n128 v30 = swift_retain(v27);
  uint64_t v31 = v49;
  static MetricsFieldsContext.createFieldsContext(impressionsTracker:)(v23, v22, v30);
  swift_unknownObjectRelease(v23);
  uint64_t v32 = sub_3C794();
  uint64_t v33 = v51;
  sub_4AD0(v51, 1LL, 1LL, v32);
  uint64_t v34 = sub_3C758();
  swift_allocObject(v34, *(unsigned int *)(v34 + 48), *(unsigned __int16 *)(v34 + 52));
  uint64_t v50 = v27;
  uint64_t v35 = v29;
  uint64_t v36 = v53;
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_metricsPresenter] = PageMetricsPresenter.init(appMetrics:pipeline:context:data:)(v27, v35, v31, v33);
  uint64_t v37 = v52;
  sub_95AE4(v36, a2, v36);
  type metadata accessor for DynamicViewController(0LL);
  __n128 v38 = swift_retain(*(void *)&v21[v47]);
  uint64_t v39 = static DynamicViewController.setupPageRenderPresenterWrapper(with:bag:)(v38);
  swift_release();
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter] = v39;
  if (v39)
  {
    uint64_t v40 = v44;
    *CGRect v44 = 1;
    uint64_t v42 = v45;
    uint64_t v41 = v46;
    (*(void (**)(_BYTE *, void, uint64_t))(v45 + 104))( v40,  enum case for PageRenderMetricsPresenter.ActivityStart.fetchPrimaryData(_:),  v46);
    (*(void (**)(_BYTE *))(*(void *)v39 + 152LL))(v40);
    (*(void (**)(_BYTE *, uint64_t))(v42 + 8))(v40, v41);
  }

  uint64_t v43 = (objc_class *)sub_958C4();
  v59.receiver = v21;
  v59.super_class = v43;
  objc_msgSend( *(id *)((char *)objc_msgSendSuper2(&v59, "init")
          + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView),
    "setAlpha:",
    0.0);
  swift_unknownObjectRelease(v23);
  swift_release();
  swift_release();
  sub_46128(v58, type metadata accessor for ServiceProductPageDestination);
  (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v37, v36);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
  sub_855C();
}

void sub_945B8()
{
  v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_didApply] = 0;
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_overlayViewController] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceProductPageViewController.swift",  59LL,  2LL,  78LL,  0);
  __break(1u);
}

id sub_94644()
{
  if (*(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_overlayViewController]) {
    return objc_msgSend(v0, "unsetChildViewController:");
  }
  return result;
}

void sub_94668()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_overlayViewController];
  if (v1)
  {
    id v2 = v1;
    [v0 setChildViewController:v2];
    id v3 = [v2 view];
    if (v3)
    {
      id v4 = v3;
      sub_B05E8(0LL, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    }

    else
    {
      __break(1u);
    }
  }

void sub_94710(void *a1)
{
  id v3 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_overlayViewController);
  *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_overlayViewController) = a1;
  id v4 = a1;

  sub_94668();
}

id sub_94794(uint64_t a1)
{
  id v2 = sub_118D0(a1, "parentViewController");
  if (!v2) {
    goto LABEL_4;
  }
  id v3 = v2;
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___UINavigationController);
  if (swift_dynamicCastObjCClass(v3, v4))
  {

LABEL_4:
    v7.receiver = v1;
    v7.super_class = (Class)sub_958C4();
    return objc_msgSendSuper2(&v7, "navigationItem");
  }

  id v6 = [v3 navigationItem];

  return v6;
}

void sub_94840()
{
  v17.receiver = v0;
  v17.super_class = (Class)sub_958C4();
  id v7 = sub_3C774((uint64_t)v17.super_class, "loadView", v1, v2, v3, v4, v5, v6, v17);
  id v8 = sub_118D0((uint64_t)v7, "view");
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v10 = objc_msgSend(v9, "ams_clear");
  [v8 setBackgroundColor:v10];

  id v11 = [(id)objc_opt_self(UIBlurEffect) effectWithStyle:5003];
  id v12 = [objc_allocWithZone(UIVisualEffectView) initWithEffect:v11];

  id v13 = v12;
  id v14 = objc_msgSend(v9, "ams_clear");
  [v13 setBackgroundColor:v14];

  id v16 = sub_118D0(v15, "view");
  [v16 addSubview:v13];
}

void sub_949CC()
{
  uint64_t v2 = v0;
  uint64_t v3 = type metadata accessor for PageRenderMetricsPresenter.ActivityEnd(0LL);
  sub_95ACC();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = (objc_class *)sub_958C4();
  v14.receiver = v0;
  v14.super_class = v7;
  id v8 = objc_msgSendSuper2(&v14, "viewDidLoad");
  id v9 = sub_118D0((uint64_t)v8, "view");
  [v9 addSubview:*(void *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView]];

  sub_3C758();
  ViewControllerPresenter.viewDidLoad()();
  uint64_t v10 = *(void *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter];
  if (v10)
  {
    (*(void (**)(void))(*(void *)v10 + 168LL))();
    id v11 = &v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_destination];
    id v12 = &v11[*(int *)(sub_95ADC() + 68)];
    uint64_t v13 = sub_3C794();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v6, v12, v13);
    (*(void (**)(char *, void, uint64_t))(v1 + 104))( v6,  enum case for PageRenderMetricsPresenter.ActivityEnd.fetchPrimaryDataCompleted(_:),  v3);
    (*(void (**)(char *))(*(void *)v10 + 160LL))(v6);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v3);
  }

  sub_8738();
}

void sub_94B4C()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_958C4();
  sub_3C760((uint64_t)v8.super_class, "viewDidAppear:", v1, v2, v3, v4, v5, v6, v8);
  PageMetricsPresenter.viewDidAppear()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 184LL))();
  }
  Unstable.ImpressionsCalculator.isVisible.setter(1LL);
  sub_21464();
}

void sub_94C00()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_958C4();
  sub_3C760((uint64_t)v8.super_class, "viewDidDisappear:", v1, v2, v3, v4, v5, v6, v8);
  sub_3C758();
  ViewControllerPresenter.viewDidDisappear()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 192LL))();
  }
  Unstable.ImpressionsCalculator.isVisible.setter(0LL);
  sub_21464();
}

void sub_94CC0()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_958C4();
  sub_3C760((uint64_t)v8.super_class, "viewWillAppear:", v1, v2, v3, v4, v5, v6, v8);
  sub_3C758();
  ViewControllerPresenter.viewWillAppear()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 176LL))();
  }
  sub_21464();
}

void sub_94D6C(char a1)
{
  uint64_t v2 = v1;
  type metadata accessor for ViewWillDisappearReason(0LL);
  sub_95ACC();
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = (objc_class *)sub_958C4();
  v9.receiver = v2;
  v9.super_class = v7;
  objc_msgSendSuper2(&v9, "viewWillDisappear:", a1 & 1);
  sub_3C788();
  PageMetricsPresenter.viewWillDisappear(forReason:)(v6);
  sub_3C79C();
  uint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter];
  if (v8)
  {
    sub_3C788();
    (*(void (**)(char *))(*(void *)v8 + 200LL))(v6);
    sub_3C79C();
  }

  sub_8738();
}

id sub_94E6C()
{
  v19.receiver = v0;
  v19.super_class = (Class)sub_958C4();
  id v7 = sub_3C774((uint64_t)v19.super_class, "viewWillLayoutSubviews", v1, v2, v3, v4, v5, v6, v19);
  uint64_t v8 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView];
  id v9 = sub_118D0((uint64_t)v7, "view");
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  return objc_msgSend(v8, "setFrame:", v11, v13, v15, v17);
}

void sub_94F48()
{
  v7.receiver = v0;
  v7.super_class = (Class)sub_958C4();
  sub_3C774((uint64_t)v7.super_class, "viewDidLayoutSubviews", v1, v2, v3, v4, v5, v6, v7);
  sub_9574C();
  sub_95300();
}

void sub_94FB0()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_958C4();
  sub_3C774((uint64_t)v8.super_class, "didReceiveMemoryWarning", v1, v2, v3, v4, v5, v6, v8);
  sub_3C758();
  ViewControllerPresenter.viewDidReceiveMemoryWarning()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 208LL))();
  }
  sub_21464();
}

uint64_t sub_9504C(uint64_t a1)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_destination;
  uint64_t v3 = sub_95ADC();
  sub_9551C(v2 + *(int *)(v3 + 52));
  uint64_t v4 = sub_1186C((uint64_t)&unk_E6BC8);
  sub_95AB4(v4);
  unint64_t v7 = sub_3C6F8();
  objc_super v8 = &protocol witness table for OS_dispatch_queue;
  v6[0] = static OS_dispatch_queue.main.getter(v7);
  sub_95AF4((uint64_t)v6, (uint64_t)sub_95A94);
  swift_release();
  swift_release();
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v6);
}

uint64_t sub_950FC()
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_destination;
  uint64_t v4 = sub_95ADC();
  sub_95A4C(v3 + *(int *)(v4 + 56), v0);
  uint64_t v5 = _s10descrE69B9V6ButtonVMa(0LL);
  sub_460C(v0, (uint64_t)&v11);
  sub_46128(v0, _s10descrE69B9V6ButtonVMa);
  uint64_t v7 = sub_7CF4(&v11, (uint64_t)v14);
  sub_956AC(v7);
  sub_9551C((uint64_t)v14);
  uint64_t v8 = sub_1186C((uint64_t)&unk_E6BC8);
  sub_95AB4(v8);
  unint64_t v9 = sub_3C6F8();
  uint64_t v10 = static OS_dispatch_queue.main.getter(v9);
  unint64_t v12 = v9;
  double v13 = &protocol witness table for OS_dispatch_queue;
  *(void *)&__int128 v11 = v10;
  sub_95AF4((uint64_t)&v11, (uint64_t)sub_95A94);
  swift_release();
  swift_release();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v11);
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v14);
}

void sub_95230(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  sub_118BC(a2 + 16, (uint64_t)v5);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    sub_95708(Strong);
  }

uint64_t sub_95284(void *a1, uint64_t a2, uint64_t a3, void (*a4)(id))
{
  if (a3)
  {
    id v7 = a1;
    uint64_t v8 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v8);
    id v9 = (id)swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v11, 0, sizeof(v11));
    id v9 = a1;
  }

  a4(v9);

  return sub_460FC((uint64_t)v11, &qword_F6300);
}

void sub_95300()
{
  uint64_t v2 = v1;
  sub_44DC(&qword_F3968);
  sub_8690();
  __chkstk_darwin(v3);
  sub_7EDD8();
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_didApply) & 1) == 0)
  {
    *(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_didApply) = 1;
    uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView);
    uint64_t v5 = (unsigned __int8 *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_destination);
    uint64_t v6 = sub_1186C((uint64_t)&unk_E6BC8);
    sub_3C77C(v6);
    uint64_t v7 = sub_1186C((uint64_t)&unk_E6BC8);
    sub_3C77C(v7);
    uint64_t v8 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_impressionsCalculator);
    uint64_t v9 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_objectGraph);
    swift_retain(v6);
    swift_retain(v7);
    sub_930DC(v5, v8, v9);
    sub_93448(v5, (uint64_t)sub_95A0C, v6, (uint64_t)sub_95A2C, v7, v9);
    [v4 setNeedsLayout];
    swift_release_n(v6, 2LL);
    swift_release_n(v7, 2LL);
    sub_AD1BC(0LL, 0LL, 1.0, 0.1);
    sub_9574C();
    uint64_t v10 = (uint64_t)&v5[*(int *)(sub_95ADC() + 68)];
    uint64_t v11 = sub_3C794();
    sub_95AEC(v0, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL));
    sub_4AD0(v0, 0LL, 1LL, v11);
    PageMetricsPresenter.data.setter(v0);
  }

uint64_t sub_954A4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = a2 + 16;
  sub_118BC(a2 + 16, (uint64_t)v10);
  uint64_t result = swift_unknownObjectWeakLoadStrong(v5);
  if (result)
  {
    uint64_t v7 = (void *)result;
    uint64_t v8 = sub_3C68C(a1, (uint64_t)v9);
    a3(v8);

    return sub_460FC((uint64_t)v9, &qword_F6300);
  }

  return result;
}

void sub_9551C(uint64_t a1)
{
  __n128 v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for MetricsFieldsContext(0LL, v4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for ResultingActionDispatcher(0LL);
  uint64_t v12 = *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_objectGraph);
  uint64_t v13 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v11, v12, v11, v13);
  uint64_t v14 = *(void *)&v16[0];
  inject<A, B>(_:from:)(v7, v12, v7, v13);
  sub_95AEC((uint64_t)v6, (uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  uint64_t v15 = sub_44DC((uint64_t *)&unk_F6780);
  sub_4AD0((uint64_t)v6, 0LL, 1LL, v15);
  memset(v16, 0, sizeof(v16));
  char v17 = -1;
  (*(void (**)(uint64_t, char *, uint64_t, _OWORD *))(*(void *)v14 + 216LL))(a1, v6, v12, v16);
  swift_release();
  sub_460FC((uint64_t)v16, &qword_F5090);
  sub_46128( (uint64_t)v6,  (uint64_t (*)(void))&type metadata accessor for ResultingActionDispatcher.MetricsBehavior);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_855C();
}

void sub_956AC(uint64_t a1)
{
  id v1 = sub_118D0(a1, "view");
  [v1 setUserInteractionEnabled:0];

  id v2 = objc_allocWithZone((Class)type metadata accessor for LoadingViewController());
  id v3 = sub_6F9C8(2);
  sub_95AAC(v3);
}

void sub_95708(uint64_t a1)
{
  id v1 = sub_118D0(a1, "view");
  [v1 setUserInteractionEnabled:1];

  sub_95AAC(0LL);
}

uint64_t sub_9574C()
{
  return Unstable.ImpressionsCalculator.viewBounds.setter( [*(id *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductPageViewController_pageView) bounds]);
}

void sub_95790()
{
}

void sub_957C8()
{
}

id sub_95818()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_958C4();
  return sub_3C774((uint64_t)v8.super_class, "dealloc", v1, v2, v3, v4, v5, v6, v8);
}

uint64_t sub_958C4()
{
  return type metadata accessor for ServiceProductPageViewController(0LL);
}

uint64_t type metadata accessor for ServiceProductPageViewController(uint64_t a1)
{
  uint64_t result = qword_F7A70;
  if (!qword_F7A70) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceProductPageViewController);
  }
  return result;
}

uint64_t sub_95904(uint64_t a1)
{
  uint64_t result = type metadata accessor for ServiceProductPageDestination(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_BBD58;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    void v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[5] = &unk_BBD70;
    void v4[6] = &unk_BBD70;
    v4[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_959A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ServiceProductPageDestination(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_959E8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_95A0C(uint64_t a1)
{
  return sub_954A4(a1, v1, (void (*)(uint64_t))sub_9504C);
}

uint64_t sub_95A2C(uint64_t a1)
{
  return sub_954A4(a1, v1, (void (*)(uint64_t))sub_950FC);
}

uint64_t sub_95A4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F39F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void sub_95A94(uint64_t a1)
{
}

void sub_95AAC(void *a1)
{
}

uint64_t sub_95AB4(uint64_t a1)
{
  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

uint64_t sub_95AC4@<X0>(uint64_t a1@<X8>)
{
  return swift_release(*(void *)(v1 + a1));
}

  ;
}

uint64_t sub_95ADC()
{
  return type metadata accessor for ServiceProductPageDestination(0LL);
}

uint64_t sub_95AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return inject<A, B>(_:from:)(a1, a2, a3, v3);
}

uint64_t sub_95AEC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_95AF4(uint64_t a1, uint64_t a2)
{
  return Promise.always(on:perform:)(a1, a2, v2);
}

id sub_95B00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13 = v12;
  uint64_t v173 = a2;
  unsigned int v17 = a1 >> 8;
  id v18 = sub_11820(a1, "traitCollection");
  sub_830C0(v17, (uint64_t)v18, a12);

  if (a7)
  {
    uint64_t v19 = sub_4968((uint64_t)&unk_E6C40, 32LL);
    *(void *)(v19 + swift_unknownObjectWeakDestroy(v0 + 16) = a7;
    *(void *)(v19 + 24) = a8;
    uint64_t v20 = sub_97B40;
  }

  else
  {
    uint64_t v20 = 0LL;
    uint64_t v19 = 0LL;
  }

  uint64_t v21 = (uint64_t (**)(uint64_t))&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButtonHandler];
  uint64_t v22 = *(void *)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButtonHandler];
  uint64_t v23 = *(void *)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButtonHandler + 8];
  *uint64_t v21 = v20;
  v21[1] = (uint64_t (*)(uint64_t))v19;
  sub_4548(a7, a8);
  sub_AC90(v22, v23);
  __n128 v24 = *(void **)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButton];
  id v26 = sub_668F0(v24, "addTarget:action:forControlEvents:", v25, (uint64_t)"didTapPrimaryButton:");
  uint64_t v32 = sub_97BE8((uint64_t)v26, v27, &qword_F3930, v28, v29, v30, v31);
  if (v177)
  {
    uint64_t v37 = sub_7CF4(&v176, (uint64_t)v178);
    id v45 = sub_97BC8(v37, v38, v39, v40, v41, v42, v43, v44, v167);
    sub_97BAC((uint64_t)v45, v46, v47, v48, v49, v50, v51, v52, v168);
  }

  else
  {
    sub_97BB4(v32, &qword_F3930, v33, v34, v35, v36);
    [v24 setHidden:1];
  }

  uint64_t v53 = sub_97ACC(a6, (uint64_t)&v176, &qword_F3930);
  if (v177)
  {
    sub_7CF4(&v176, (uint64_t)v178);
    id v58 = sub_5DA84((uint64_t)v178, a12);
    sub_97BAC((uint64_t)v58, v59, v60, v61, v62, v63, v64, v65, v167);
  }

  else
  {
    sub_97BB4(v53, &qword_F3930, v54, v55, v56, v57);
  }

  if (a10)
  {
    uint64_t v66 = sub_4968((uint64_t)&unk_E6C18, 32LL);
    *(void *)(v66 + swift_unknownObjectWeakDestroy(v0 + 16) = a10;
    *(void *)(v66 + 24) = a11;
    uint64_t v67 = sub_97B34;
  }

  else
  {
    uint64_t v67 = 0LL;
    uint64_t v66 = 0LL;
  }

  unint64_t v68 = (uint64_t (**)(uint64_t))&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButtonHandler];
  uint64_t v69 = *(void *)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButtonHandler];
  uint64_t v70 = *(void *)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButtonHandler + 8];
  *unint64_t v68 = v67;
  v68[1] = (uint64_t (*)(uint64_t))v66;
  sub_4548(a10, a11);
  sub_AC90(v69, v70);
  size_t v71 = *(void **)&v13[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButton];
  id v73 = sub_668F0(v71, "addTarget:action:forControlEvents:", v72, (uint64_t)"didTapSecondaryButton:");
  uint64_t v79 = sub_97BE8((uint64_t)v73, v74, &qword_F3930, v75, v76, v77, v78);
  if (v177)
  {
    uint64_t v84 = sub_7CF4(&v176, (uint64_t)v178);
    id v92 = sub_97BC8(v84, v85, v86, v87, v88, v89, v90, v91, v167);
    sub_97BAC((uint64_t)v92, v93, v94, v95, v96, v97, v98, v99, v169);
  }

  else
  {
    sub_97BB4(v79, &qword_F3930, v80, v81, v82, v83);
    [v71 setHidden:1];
  }

  uint64_t v100 = sub_97ACC(v173, (uint64_t)&v176, &qword_F3930);
  if (v177)
  {
    sub_7CF4(&v176, (uint64_t)v178);
    uint64_t v105 = sub_9647C();
    sub_97B44(v105, v106, v107, v108, v109, v110, v111, v112, v167, v173);

    sub_97BAC(v113, v114, v115, v116, v117, v118, v119, v120, v170);
  }

  else
  {
    sub_97BB4(v100, &qword_F3930, v101, v102, v103, v104);
    uint64_t v121 = sub_9647C();
    sub_97B64(v121);
  }

  uint64_t v122 = sub_97ACC(a3, (uint64_t)&v176, &qword_F3930);
  if (v177)
  {
    sub_7CF4(&v176, (uint64_t)v178);
    uint64_t v127 = sub_96594();
    sub_97B44(v127, v128, v129, v130, v131, v132, v133, v134, v167, v173);

    sub_97BAC(v135, v136, v137, v138, v139, v140, v141, v142, v171);
  }

  else
  {
    sub_97BB4(v122, &qword_F3930, v123, v124, v125, v126);
    uint64_t v143 = sub_96594();
    sub_97B64(v143);
  }

  uint64_t v144 = sub_97ACC(a4, (uint64_t)&v176, &qword_F3930);
  if (v177)
  {
    sub_7CF4(&v176, (uint64_t)v178);
    uint64_t v149 = sub_966AC();
    sub_97B44(v149, v150, v151, v152, v153, v154, v155, v156, v167, v173);

    sub_97BAC(v157, v158, v159, v160, v161, v162, v163, v164, v172);
  }

  else
  {
    sub_97BB4(v144, &qword_F3930, v145, v146, v147, v148);
    v165 = sub_966AC();
    sub_97B64(v165);
  }

  sub_96380();
  return [v13 setNeedsLayout];
}

id sub_95ED0(uint64_t a1)
{
  return sub_95F18(a1, qword_1031E0, (id *)&UIFontTextStyleCallout, 0);
}

id sub_95EE8(uint64_t a1)
{
  return sub_95F18(a1, qword_1031F8, (id *)&UIFontTextStyleFootnote, 0);
}

id sub_95F00(uint64_t a1)
{
  return sub_95F18(a1, qword_103210, (id *)&UIFontTextStyleTitle1, 2);
}

id sub_95F18(uint64_t a1, uint64_t *a2, id *a3, int a4)
{
  uint64_t v7 = type metadata accessor for FontSource(0LL);
  sub_506BC(v7, a2);
  uint64_t v8 = sub_50698(v7, (uint64_t)a2);
  id v12 = *a3;
  *(void *)uint64_t v8 = *a3;
  *(_DWORD *)(v8 + 8) = a4;
  uint64_t v9 = enum case for FontUseCase.preferredFont(_:);
  uint64_t v10 = type metadata accessor for FontUseCase(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104LL))(v8, v9, v10);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104LL))( v8,  enum case for FontSource.useCase(_:),  v7);
  return v12;
}

char *sub_95FD0(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = (objc_class *)sub_119B4();
  uint64_t v11 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButton;
  id v12 = (objc_class *)type metadata accessor for DynamicButton();
  id v13 = objc_allocWithZone(v12);
  uint64_t v14 = v4;
  *(void *)&v5[v11] = [v13 init];
  uint64_t v15 = &v14[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButtonHandler];
  *(void *)uint64_t v15 = 0LL;
  *((void *)v15 + 1) = 0LL;
  uint64_t v16 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButton;
  *(void *)&v14[v16] = [objc_allocWithZone(v12) init];
  unsigned int v17 = &v14[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButtonHandler];
  *(void *)unsigned int v17 = 0LL;
  *((void *)v17 + 1) = 0LL;
  *(void *)&v14[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___bodyLabel] = 0LL;
  *(void *)&v14[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___footnoteLabel] = 0LL;
  *(void *)&v14[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___titleLabel] = 0LL;
  id v18 = objc_allocWithZone((Class)type metadata accessor for ServiceBadgeView());
  double v19 = sub_97BD4();
  *(void *)&v14[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_badgeWordmark] = sub_9785C(1, v20, v21, v22, v19, v23, v24, v25, 24.0);

  v34.receiver = v14;
  v34.super_class = v10;
  id v26 = objc_msgSendSuper2(&v34, "initWithFrame:", a1, a2, a3, a4);
  sub_97B90(v26);
  sub_961D0();
  sub_96380();
  sub_97BBC();
  uint64_t v27 = v14;
  id v28 = sub_9647C();
  sub_97B7C((uint64_t)v28);

  uint64_t v29 = v27;
  id v30 = sub_96594();
  sub_97B7C((uint64_t)v30);

  uint64_t v31 = v29;
  id v32 = sub_966AC();
  sub_97B7C((uint64_t)v32);

  sub_97BBC();
  sub_97BBC();

  return v31;
}

void sub_961D0()
{
  uint64_t v1 = v0;
  id v2 = sub_96594();
  if (qword_F3788 != -1) {
    swift_once(&qword_F3788, sub_95ED0);
  }
  uint64_t v3 = type metadata accessor for FontSource(0LL);
  sub_50698(v3, (uint64_t)qword_1031E0);
  id v4 = [v0 traitCollection];
  Class isa = FontSource.font(compatibleWith:)((UITraitCollection)v4).super.isa;

  DynamicLabel.font.setter(isa);
  id v6 = sub_966AC();
  if (qword_F3790 != -1) {
    swift_once(&qword_F3790, sub_95EE8);
  }
  sub_50698(v3, (uint64_t)qword_1031F8);
  id v7 = [v1 traitCollection];
  Class v8 = FontSource.font(compatibleWith:)((UITraitCollection)v7).super.isa;

  DynamicLabel.font.setter(v8);
  id v11 = sub_9647C();
  if (qword_F3798 != -1) {
    swift_once(&qword_F3798, sub_95F00);
  }
  sub_50698(v3, (uint64_t)qword_103210);
  id v9 = [v1 traitCollection];
  Class v10 = FontSource.font(compatibleWith:)((UITraitCollection)v9).super.isa;

  DynamicLabel.font.setter(v10);
}

void sub_96380()
{
  id v1 = [v0 traitCollection];
  char v2 = UITraitCollection.prefersRightToLeftLayouts.getter();

  if ((v2 & 1) != 0) {
    uint64_t v3 = 2LL;
  }
  else {
    uint64_t v3 = 0LL;
  }
  sub_830A4(0);
  id v4 = sub_96594();
  (*(void (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & *v4)))(v3);

  uint64_t v5 = sub_966AC();
  (*(void (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & *v5)))(v3);

  id v6 = sub_9647C();
  (*(void (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & *v6)))(v3);
}

id sub_9647C()
{
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___titleLabel;
  char v2 = *(void **)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___titleLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___titleLabel);
  }

  else
  {
    uint64_t v4 = v0;
    type metadata accessor for DynamicLabel(0LL);
    id v5 = objc_msgSend((id)objc_opt_self(UIColor), "ams_primaryText");
    if (qword_F3798 != -1) {
      swift_once(&qword_F3798, sub_95F00);
    }
    uint64_t v6 = type metadata accessor for FontSource(0LL);
    uint64_t v7 = sub_50698(v6, (uint64_t)qword_103210);
    void v13[3] = v6;
    v13[4] = &protocol witness table for FontSource;
    Class v8 = sub_AE98(v13);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v8, v7, v6);
    id v9 = (void *)DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v5, v13);
    Class v10 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v9;
    id v3 = v9;

    char v2 = 0LL;
  }

  id v11 = v2;
  return v3;
}

id sub_96594()
{
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___bodyLabel;
  char v2 = *(void **)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___bodyLabel);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___bodyLabel);
  }

  else
  {
    uint64_t v4 = v0;
    type metadata accessor for DynamicLabel(0LL);
    id v5 = objc_msgSend((id)objc_opt_self(UIColor), "ams_secondaryText");
    if (qword_F3788 != -1) {
      swift_once(&qword_F3788, sub_95ED0);
    }
    uint64_t v6 = type metadata accessor for FontSource(0LL);
    uint64_t v7 = sub_50698(v6, (uint64_t)qword_1031E0);
    void v13[3] = v6;
    v13[4] = &protocol witness table for FontSource;
    Class v8 = sub_AE98(v13);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v8, v7, v6);
    id v9 = (void *)DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v5, v13);
    Class v10 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v9;
    id v3 = v9;

    char v2 = 0LL;
  }

  id v11 = v2;
  return v3;
}

id sub_966AC()
{
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___footnoteLabel;
  char v2 = *(void **)(v0
                + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___footnoteLabel);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___footnoteLabel);
  }

  else
  {
    uint64_t v4 = v0;
    type metadata accessor for DynamicLabel(0LL);
    id v5 = objc_msgSend((id)objc_opt_self(UIColor), "ams_tertiaryText");
    if (qword_F3790 != -1) {
      swift_once(&qword_F3790, sub_95EE8);
    }
    uint64_t v6 = type metadata accessor for FontSource(0LL);
    uint64_t v7 = sub_50698(v6, (uint64_t)qword_1031F8);
    void v13[3] = v6;
    v13[4] = &protocol witness table for FontSource;
    Class v8 = sub_AE98(v13);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v8, v7, v6);
    id v9 = (void *)DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(4LL, v5, v13);
    Class v10 = *(void **)(v0 + v1);
    *(void *)(v4 + v1) = v9;
    id v3 = v9;

    char v2 = 0LL;
  }

  id v11 = v2;
  return v3;
}

void sub_967E4()
{
  uint64_t v1 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButton;
  char v2 = (objc_class *)type metadata accessor for DynamicButton();
  *(void *)&v0[v1] = [objc_allocWithZone(v2) init];
  id v3 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButtonHandler];
  *(void *)id v3 = 0LL;
  *((void *)v3 + 1) = 0LL;
  uint64_t v4 = OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButton;
  *(void *)&v0[v4] = [objc_allocWithZone(v2) init];
  id v5 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButtonHandler];
  *(void *)id v5 = 0LL;
  *((void *)v5 + 1) = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___bodyLabel] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___footnoteLabel] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView____lazy_storage___titleLabel] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceProductTextDetailsView_tvOS.swift",  61LL,  2LL,  71LL,  0);
  __break(1u);
}

uint64_t sub_968E8(uint64_t a1)
{
  char v2 = v1;
  v10.receiver = v1;
  v10.super_class = (Class)sub_119B4();
  objc_msgSendSuper2(&v10, "traitCollectionDidChange:", a1);
  sub_961D0();
  id v4 = [v1 traitCollection];
  int v5 = UITraitCollection.prefersAccessibilityLayouts.getter();

  if (!a1
    || (uint64_t v6 = UITraitCollection.prefersAccessibilityLayouts.getter(), ((v6 ^ v5) & 1) != 0)
    || (id v7 = sub_11820(v6, "traitCollection"),
        int v8 = UITraitCollection.prefersRightToLeftLayouts.getter() & 1,
        v7,
        uint64_t result = UITraitCollection.prefersRightToLeftLayouts.getter(),
        (result & 1) != v8))
  {
    sub_96380();
    return (uint64_t)[v2 setNeedsLayout];
  }

  return result;
}

uint64_t sub_96A20(uint64_t a1, void (*a2)(_BYTE *))
{
  return sub_ACC4((uint64_t)v4, &qword_F6300);
}

double sub_96A68(double a1, double a2)
{
  uint64_t v5 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v9 = v8 - v7;
  sub_96C54(v8 - v7);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return v10;
}

uint64_t sub_96B58()
{
  uint64_t v1 = (objc_class *)sub_119B4();
  uint64_t v2 = type metadata accessor for LayoutRect(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_B058();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v11 = v10 - v9;
  v17.receiver = v0;
  v17.super_class = v1;
  objc_msgSendSuper2(&v17, "layoutSubviews");
  sub_96C54(v11);
  [v0 bounds];
  VerticalFlowLayout.placeChildren(relativeTo:in:)(v0, v12, v13, v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_96C54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v80 = a1;
  uint64_t v89 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v1 = *(void *)(v89 - 8);
  __chkstk_darwin(v89);
  uint64_t v3 = (char *)&v70 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v76 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v4 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v6 = (char *)&v70 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v83 = type metadata accessor for VerticalFlowLayout.Child(0LL);
  uint64_t v81 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v72 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_44DC(&qword_F3E90);
  uint64_t v74 = v9;
  uint64_t v13 = swift_allocObject( v12,  ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + 3LL * *(void *)(v9 + 72),
          *(unsigned __int8 *)(v9 + 80) | 7LL);
  *(_OWORD *)(v13 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v14 = static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v13);
  static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v14);
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v15);
  v96[0] = v13;
  unint64_t v16 = sub_13958();
  uint64_t v17 = sub_44DC(&qword_F3EA0);
  unint64_t v18 = sub_11744();
  uint64_t v88 = v11;
  uint64_t v73 = v8;
  dispatch thunk of SetAlgebra.init<A>(_:)(v96, v17, v18, v8, v16);
  VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, _swiftEmptyArrayStorage);
  double v19 = *(void **)(v87 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_badgeWordmark);
  uint64_t v97 = type metadata accessor for ServiceBadgeView();
  uint64_t v98 = &protocol witness table for UIView;
  v96[0] = v19;
  uint64_t v94 = &type metadata for CGFloat;
  uint64_t v95 = &protocol witness table for CGFloat;
  uint64_t v92 = 0LL;
  v93[0] = 0x4038000000000000LL;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  unsigned int v75 = enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:);
  uint64_t v82 = *(void (**)(char *))(v4 + 104);
  uint64_t v20 = v4;
  uint64_t v21 = v6;
  uint64_t v22 = v6;
  uint64_t v23 = v76;
  v82(v22);
  unsigned int v79 = enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:);
  uint64_t v86 = *(void (**)(char *))(v1 + 104);
  uint64_t v78 = v3;
  uint64_t v24 = v89;
  v86(v3);
  id v25 = v19;
  id v26 = v72;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v96,  v93,  &v90,  v21,  v3,  v11);
  uint64_t v84 = *(void (**)(char *, uint64_t))(v1 + 8);
  uint64_t v27 = v24;
  v84(v3, v24);
  uint64_t v85 = *(void (**)(char *, uint64_t))(v20 + 8);
  uint64_t v28 = v23;
  v85(v21, v23);
  sub_ACC4((uint64_t)&v90, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v93);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v96);
  uint64_t v29 = v26;
  VerticalFlowLayout.addChild(_:)(v26);
  uint64_t v81 = *(void *)(v81 + 8);
  uint64_t v30 = v83;
  ((void (*)(char *, uint64_t))v81)(v26, v83);
  id v31 = sub_9647C();
  uint64_t v77 = type metadata accessor for DynamicLabel(0LL);
  uint64_t v97 = v77;
  uint64_t v98 = &protocol witness table for UIView;
  v96[0] = v31;
  uint64_t v95 = &protocol witness table for CGFloat;
  uint64_t v94 = &type metadata for CGFloat;
  uint64_t v92 = 0LL;
  v93[0] = 0x4058000000000000LL;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v32 = v75;
  uint64_t v33 = v82;
  ((void (*)(char *, void, uint64_t))v82)(v21, v75, v23);
  objc_super v34 = v78;
  uint64_t v35 = v79;
  ((void (*)(char *, void, uint64_t))v86)(v78, v79, v27);
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v96,  v93,  &v90,  v21,  v34,  v88);
  v84(v34, v27);
  v85(v21, v28);
  sub_ACC4((uint64_t)&v90, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v93);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v96);
  uint64_t v36 = v29;
  VerticalFlowLayout.addChild(_:)(v29);
  ((void (*)(char *, uint64_t))v81)(v29, v30);
  id v37 = sub_96594();
  uint64_t v97 = v77;
  uint64_t v98 = &protocol witness table for UIView;
  v96[0] = v37;
  uint64_t v95 = &protocol witness table for CGFloat;
  uint64_t v94 = &type metadata for CGFloat;
  uint64_t v92 = 0LL;
  v93[0] = 0x4052C00000000000LL;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v38 = v21;
  size_t v71 = v21;
  uint64_t v39 = v21;
  uint64_t v40 = v32;
  uint64_t v41 = v76;
  uint64_t v42 = v33;
  ((void (*)(char *, uint64_t, uint64_t))v33)(v39, v40, v76);
  uint64_t v43 = v78;
  uint64_t v44 = v89;
  id v45 = v86;
  ((void (*)(char *, uint64_t, uint64_t))v86)(v78, v35, v89);
  uint64_t v46 = v36;
  uint64_t v47 = v88;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v96,  v93,  &v90,  v38,  v43,  v88);
  v84(v43, v44);
  v85(v38, v41);
  sub_ACC4((uint64_t)&v90, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v93);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v96);
  VerticalFlowLayout.addChild(_:)(v46);
  uint64_t v48 = v46;
  uint64_t v49 = v83;
  uint64_t v50 = (void (*)(char *, uint64_t))v81;
  ((void (*)(char *, uint64_t))v81)(v46, v83);
  id v51 = sub_966AC();
  uint64_t v97 = v77;
  uint64_t v98 = &protocol witness table for UIView;
  v96[0] = v51;
  uint64_t v95 = &protocol witness table for CGFloat;
  uint64_t v94 = &type metadata for CGFloat;
  uint64_t v92 = 0LL;
  v93[0] = 0x4052C00000000000LL;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  uint64_t v52 = v71;
  uint64_t v53 = v41;
  ((void (*)(char *, void, uint64_t))v42)(v71, v75, v41);
  uint64_t v54 = v78;
  uint64_t v55 = v89;
  ((void (*)(char *, void, uint64_t))v45)(v78, v79, v89);
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v96,  v93,  &v90,  v52,  v54,  v47);
  uint64_t v56 = v54;
  uint64_t v57 = v84;
  v84(v54, v55);
  id v58 = v52;
  uint64_t v59 = v85;
  v85(v52, v53);
  sub_ACC4((uint64_t)&v90, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v93);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v96);
  VerticalFlowLayout.addChild(_:)(v48);
  v50(v48, v49);
  uint64_t v60 = *(void **)(v87 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_primaryButton);
  uint64_t v77 = type metadata accessor for DynamicButton();
  uint64_t v97 = v77;
  uint64_t v98 = &protocol witness table for UIView;
  v96[0] = v60;
  uint64_t v95 = &protocol witness table for CGFloat;
  uint64_t v94 = &type metadata for CGFloat;
  uint64_t v92 = 0LL;
  v93[0] = 0x4044000000000000LL;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  unsigned int v75 = enum case for VerticalFlowLayout.VerticalPlacement.top(_:);
  v82(v58);
  uint64_t v61 = v79;
  uint64_t v62 = v89;
  ((void (*)(char *, void, uint64_t))v86)(v56, v79, v89);
  id v63 = v60;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v96,  v93,  &v90,  v58,  v56,  v88);
  v57(v56, v62);
  v59(v58, v53);
  sub_ACC4((uint64_t)&v90, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v93);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v96);
  VerticalFlowLayout.addChild(_:)(v48);
  uint64_t v64 = v83;
  uint64_t v65 = (void (*)(char *, uint64_t))v81;
  ((void (*)(char *, uint64_t))v81)(v48, v83);
  uint64_t v66 = *(void **)(v87 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView_secondaryButton);
  uint64_t v97 = v77;
  uint64_t v98 = &protocol witness table for UIView;
  v96[0] = v66;
  uint64_t v95 = &protocol witness table for CGFloat;
  uint64_t v94 = &type metadata for CGFloat;
  uint64_t v92 = 0LL;
  v93[0] = 0x4034000000000000LL;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  ((void (*)(char *, void, uint64_t))v82)(v58, v75, v53);
  ((void (*)(char *, uint64_t, uint64_t))v86)(v56, v61, v62);
  id v67 = v66;
  unint64_t v68 = v88;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v96,  v93,  &v90,  v58,  v56,  v88);
  v84(v56, v62);
  v85(v58, v53);
  sub_ACC4((uint64_t)&v90, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v93);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v96);
  VerticalFlowLayout.addChild(_:)(v48);
  v65(v48, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v74 + 8))(v68, v73);
}

void sub_97668(uint64_t a1, void *a2)
{
  uint64_t v3 = v2 + *a2;
  uint64_t v4 = *(void (**)(void *, __n128))v3;
  if (*(void *)v3)
  {
    uint64_t v6 = *(void *)(v3 + 8);
    v8[3] = sub_44DC(&qword_F6300);
    v8[0] = sub_4968((uint64_t)&unk_E6BF0, 48LL);
    sub_97ACC(a1, v8[0] + 16LL, &qword_F6300);
    __n128 v7 = swift_retain(v6);
    v4(v8, v7);
    sub_AC90((uint64_t)v4, v6);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v8);
  }

  sub_535AC();
}

void sub_97704(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3)
  {
    id v7 = a1;
    uint64_t v8 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v8);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    id v9 = a1;
  }

  sub_97668((uint64_t)v10, a4);

  sub_ACC4((uint64_t)v10, &qword_F6300);
  sub_535AC();
}

uint64_t type metadata accessor for ServiceProductTextDetailsView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin29ServiceProductTextDetailsView);
}

uint64_t sub_9781C()
{
  if (*(void *)(v0 + 40)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(v0 + 16));
  }
  return swift_deallocObject(v0, 48LL, 7LL);
}

char *sub_97848(char a1, char *a2, double a3, double a4, double a5, double a6, double a7)
{
  return sub_9785C( a1,  a2,  (uint64_t)&type metadata for Double,  (uint64_t)&protocol witness table for Double,  a3,  a4,  a5,  a6,  a7);
}

char *sub_9785C( char a1, char *a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(a2);
  v29[3] = a3;
  v29[4] = a4;
  *(double *)uint64_t v29 = a9;
  uint64_t v19 = OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView;
  id v20 = objc_allocWithZone(&OBJC_CLASS___UIImageView);
  uint64_t v21 = a2;
  double v22 = sub_97BD4();
  *(void *)&a2[v19] = objc_msgSend(v20, v23, v22);
  sub_460C((uint64_t)v29, (uint64_t)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_referenceLineHeight]);
  v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_alignment] = a1;

  v28.receiver = v21;
  v28.super_class = ObjectType;
  id v24 = objc_msgSendSuper2(&v28, "initWithFrame:", a5, a6, a7, a8);
  sub_97B90(v24);
  objc_opt_self(&OBJC_CLASS___UIColor);
  id v25 = v21;
  id v26 = sub_11820((uint64_t)v25, "ams_primaryText");
  [v25 setTintColor:v26];

  [v25 addSubview:*(void *)&v25[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServiceBadgeView_imageView]];
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v29);
  return v25;
}

double sub_979FC(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_96C54((uint64_t)v9);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(a1, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

uint64_t sub_97ACC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_44DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_97B10()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_97B34(uint64_t a1)
{
  return sub_96A20(a1, *(void (**)(_BYTE *))(v1 + 16));
}

uint64_t sub_97B44( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  return (*(uint64_t (**)(char *, uint64_t))&stru_158.sectname[*v11 & *a1])(va, v10);
}

uint64_t sub_97B64(void *a1)
{
  return (*(uint64_t (**)(void))&stru_158.segname[(*v1 & *a1) - 8])();
}

id sub_97B7C(uint64_t a1)
{
  return objc_msgSend(v1, *(SEL *)(v2 + 8), a1);
}

id sub_97B90(void *a1)
{
  return objc_msgSend(a1, v1, v2, v3, v4, v5);
}

uint64_t sub_97BAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((uint64_t *)va);
}

uint64_t sub_97BB4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  return sub_ACC4((uint64_t)va, a2);
}

id sub_97BBC()
{
  return [v0 *(SEL *)(v1 + 8)];
}

id sub_97BC8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  return sub_5DA90((uint64_t)va, v9);
}

double sub_97BD4()
{
  return 0.0;
}

uint64_t sub_97BE8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  return sub_97ACC(v7, (uint64_t)va, a3);
}

uint64_t sub_97BF4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEF78, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0LL;
  }
}

uint64_t sub_97C44(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x656E696C64616568LL;
  }
  else {
    return 0x53736E6F74747562LL;
  }
}

void sub_97C90(char *a1, unsigned __int8 *a2)
{
}

void sub_97C9C()
{
}

uint64_t sub_97CA4(uint64_t a1)
{
  return sub_75FF0(a1, *v1);
}

void sub_97CAC(uint64_t a1)
{
}

uint64_t sub_97CB4@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_97BF4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_97CE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_97C44(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double sub_97D08()
{
  return 0.0;
}

double sub_97D10()
{
  return 20.0;
}

uint64_t *sub_97D18@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4 = (void *)v3;
  swift_bridgeObjectRetain(a2);
  v26._countAndFlagsBits = a1;
  v26._object = a2;
  char v8 = sub_97BF4(v26);
  if (v8 == 2)
  {
    type metadata accessor for Log();
    uint64_t v9 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v10 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v11 = swift_allocObject( v9,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
          + 2LL * *(void *)(v10 + 72),
            *(unsigned __int8 *)(v10 + 80) | 7LL);
    *(_OWORD *)(v11 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    __dst[3] = &type metadata for ServiceProductWelcomeLayout.BodySpacing;
    __dst[0] = swift_allocObject(&unk_E6C68, 160LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), v4, 0x90uLL);
    sub_45C8((uint64_t *)v4);
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[0] = 0LL;
    __dst[1] = 0xE000000000000000LL;
    _StringGuts.grow(_:)(42LL);
    swift_bridgeObjectRelease();
    __dst[0] = 0xD000000000000018LL;
    __dst[1] = 0x80000000000BD2F0LL;
    v12._countAndFlagsBits = a1;
    v12._object = a2;
    String.append(_:)(v12);
    v13._object = (void *)0x80000000000BD310LL;
    v13._countAndFlagsBits = 0xD000000000000010LL;
    String.append(_:)(v13);
    __dst[3] = &type metadata for String;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v11);
    swift_bridgeObjectRelease();
    a3[3] = (uint64_t)&type metadata for ServiceProductWelcomeLayout.BodySpacing;
    a3[4] = (uint64_t)&off_E6DA8;
    uint64_t v14 = swift_allocObject(&unk_E6C68, 160LL, 7LL);
    *a3 = v14;
    memcpy((void *)(v14 + 16), v4, 0x90uLL);
    return sub_45C8((uint64_t *)v4);
  }

  else
  {
    char v16 = v8;
    char v17 = v8 & 1;
    type metadata accessor for Log();
    uint64_t v18 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v19 = type metadata accessor for LogMessage(0LL);
    uint64_t v20 = swift_allocObject( v18,  ((*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v19 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v19 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    __dst[3] = &type metadata for ServiceProductWelcomeLayout.BodySpacing;
    __dst[0] = swift_allocObject(&unk_E6C68, 160LL, 7LL);
    memcpy((void *)(__dst[0] + 16LL), (const void *)v3, 0x90uLL);
    sub_45C8((uint64_t *)v3);
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for String;
    __dst[0] = 0xD00000000000001CLL;
    __dst[1] = 0x80000000000BD330LL;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    __dst[3] = &type metadata for ServiceProductWelcomeLayout.BodySpacing.OverrideSectionIdentifier;
    LOBYTE(__dst[0]) = v17;
    static LogMessage.safe(_:)(__dst);
    sub_4558((uint64_t)__dst);
    sub_70594(v20);
    swift_bridgeObjectRelease();
    if ((v16 & 1) != 0)
    {
      memcpy(__dst, (const void *)v3, sizeof(__dst));
      a3[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      a3[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v24 = swift_allocObject(&unk_E6E10, 88LL, 7LL);
      *a3 = v24;
      double v22 = (void *)(v24 + 16);
      SEL v23 = (const void *)v3;
    }

    else
    {
      memcpy(__dst, (const void *)(v3 + 72), sizeof(__dst));
      a3[3] = (uint64_t)&type metadata for BoxedLayoutCollectionSpacingModel;
      a3[4] = (uint64_t)&protocol witness table for BoxedLayoutCollectionSpacingModel;
      uint64_t v21 = swift_allocObject(&unk_E6E10, 88LL, 7LL);
      *a3 = v21;
      double v22 = (void *)(v21 + 16);
      SEL v23 = (const void *)(v3 + 72);
    }

    memcpy(v22, v23, 0x48uLL);
    return (uint64_t *)sub_451C((uint64_t)__dst);
  }

double sub_98104@<D0>(uint64_t a1@<X8>)
{
  *((void *)&v29 + 1) = &type metadata for DefaultLayoutCollectionSpacingModel;
  *(void *)&__int128 v30 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  char v16 = 1;
  char v14 = 1;
  char v12 = 1;
  char v10 = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( v24,  &v28,  0x4014000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0x4046800000000000LL,  v10,  0LL,  v12,  0LL,  v14,  0LL,  v16,  0LL,  0LL);
  __int128 v19 = v24[1];
  __int128 v20 = v24[0];
  __int128 v18 = v24[2];
  uint64_t v2 = v25;
  uint64_t v3 = v26;
  uint64_t v4 = v27;
  double v22 = &type metadata for DefaultLayoutCollectionSpacingModel;
  SEL v23 = &protocol witness table for DefaultLayoutCollectionSpacingModel;
  LOBYTE(v1_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = 1;
  LOBYTE(v15) = 0;
  LOBYTE(v1_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 1;
  LOBYTE(v11) = 0;
  BoxedLayoutCollectionSpacingModel.init(base:interItem:itemLeading:itemTrailing:sectionBottom:sectionLeading:sectionTop:sectionTrailing:shelfMap:)( &v28,  v21,  0x4014000000000000LL,  0LL,  0LL,  1LL,  0LL,  1LL,  0x402C000000000000LL,  v11,  0LL,  v13,  0x4014000000000000LL,  v15,  0LL,  v17,  0LL,  0LL);
  double result = v31;
  __int128 v6 = v32;
  __int128 v7 = v28;
  __int128 v8 = v29;
  __int128 v9 = v30;
  *(_OWORD *)a1 = v20;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v19;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v18;
  *(void *)(a1 + 48) = v2;
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v7;
  *(_OWORD *)(a1 + 88) = v8;
  *(_OWORD *)(a1 + 104) = v9;
  *(double *)(a1 + 120) = result;
  *(_OWORD *)(a1 + 128) = v6;
  return result;
}

double sub_98258()
{
  return sub_97D10();
}

double sub_98290()
{
  return sub_97D08();
}

uint64_t *sub_982C8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  return sub_97D18(a1, a2, a3);
}

uint64_t sub_98320@<X0>(void *a1@<X8>)
{
  v10[3] = &type metadata for ServiceProductWelcomeLayout.BodySpacing;
  v10[4] = &off_E6DA8;
  v10[0] = swift_allocObject(&unk_E6C68, 160LL, 7LL);
  memcpy((void *)(v10[0] + 16LL), __src, 0x90uLL);
  uint64_t v9 = 0LL;
  memset(v8, 0, sizeof(v8));
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = &type metadata for DefaultLayoutSpacingModel;
  double v5 = &protocol witness table for DefaultLayoutSpacingModel;
  a1[3] = &type metadata for BoxedLayoutSpacingModel;
  a1[4] = &protocol witness table for BoxedLayoutSpacingModel;
  *a1 = swift_allocObject(&unk_E6C90, 136LL, 7LL);
  return BoxedLayoutSpacingModel.init(base:body:footer:header:)(v3, v10, v8, v6);
}

uint64_t sub_983F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = type metadata accessor for JSONContext(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(a2, v5);
  uint64_t v6 = type metadata accessor for JSONObject(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
}

uint64_t sub_98464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_983F8(a1, a2, a3);
}

uint64_t sub_98478()
{
  if (v0[9]) {
    swift_release(v0[10]);
  }
  if (v0[18]) {
    swift_release(v0[19]);
  }
  return swift_deallocObject(v0, 160LL, 7LL);
}

uint64_t sub_984B4()
{
  return swift_deallocObject(v0, 136LL, 7LL);
}

ValueMetadata *type metadata accessor for ServiceProductWelcomeLayout.BodySpacing()
{
  return &type metadata for ServiceProductWelcomeLayout.BodySpacing;
}

ValueMetadata *type metadata accessor for ServiceProductWelcomeLayout()
{
  return &type metadata for ServiceProductWelcomeLayout;
}

uint64_t sub_98508()
{
  if (*(void *)(v0 + 72)) {
    swift_release(*(void *)(v0 + 80));
  }
  return swift_deallocObject(v0, 88LL, 7LL);
}

uint64_t storeEnumTagSinglePayload for ServiceProductWelcomeLayout.BodySpacing.OverrideSectionIdentifier( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_98580 + 4 * byte_BBDB5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_985B4 + 4 * asc_BBDB0[v4]))();
}

uint64_t sub_985B4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_985BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x985C4LL);
  }
  return result;
}

uint64_t sub_985D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x985D8LL);
  }
  *(_BYTE *)double result = a2 + 1;
  return result;
}

uint64_t sub_985DC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_985E4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceProductWelcomeLayout.BodySpacing.OverrideSectionIdentifier()
{
  return &type metadata for ServiceProductWelcomeLayout.BodySpacing.OverrideSectionIdentifier;
}

unint64_t sub_98604()
{
  unint64_t result = qword_F7AE8;
  if (!qword_F7AE8)
  {
    unint64_t result = swift_getWitnessTable( &unk_BBED4,  &type metadata for ServiceProductWelcomeLayout.BodySpacing.OverrideSectionIdentifier);
    atomic_store(result, (unint64_t *)&qword_F7AE8);
  }

  return result;
}

id sub_98644( uint64_t a1, char a2, void *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, char a8, uint64_t a9)
{
  double v17 = 20.0;
  if ((a2 & 1) != 0) {
    *(double *)&a1 = 20.0;
  }
  void v30[3] = &type metadata for CGFloat;
  __int128 v30[4] = &protocol witness table for CGFloat;
  v30[0] = a1;
  sub_69148((uint64_t)a3, (uint64_t)v29);
  if ((a6 & 1) != 0) {
    double v18 = 64.0;
  }
  else {
    double v18 = *(double *)&a4;
  }
  if ((a6 & 1) != 0) {
    double v19 = 64.0;
  }
  else {
    double v19 = *(double *)&a5;
  }
  if ((a8 & 1) == 0) {
    double v17 = *(double *)&a7;
  }
  sub_691D4(a9, (uint64_t)v28);
  uint64_t v20 = sub_2D33C((uint64_t)v30, (uint64_t)&type metadata for CGFloat);
  __chkstk_darwin(v20);
  double v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v23 + 16))(v22);
  double v27 = v17;
  id v24 = sub_998F8( (uint64_t)v22,  v29,  (uint64_t)&v27,  (uint64_t)v28,  0,  v18,  v19,  v9,  (uint64_t)&type metadata for CGFloat,  (uint64_t)&type metadata for CGFloat,  (uint64_t)&protocol witness table for CGFloat,  (uint64_t)&protocol witness table for CGFloat);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v30);
  sub_89408(a9);
  sub_6AABC(a3);
  return v24;
}

void *sub_987C8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    double v17 = _swiftEmptyArrayStorage;
    uint64_t v9 = &v17;
    specialized ContiguousArray.reserveCapacity(_:)(v7);
    char v10 = (void *)(a1 + 32);
    while (1)
    {
      sub_99038(v10, (uint64_t)a2, a3, &v16);
      if (v4) {
        break;
      }
      uint64_t v4 = 0LL;
      char v12 = v16;
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v11);
      uint64_t v13 = v17[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v13);
      uint64_t v14 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v12);
      uint64_t v9 = &v17;
      specialized ContiguousArray._endMutation()(v14);
      v10 += 5;
      if (!--v7)
      {
        uint64_t v9 = v17;

        goto LABEL_7;
      }
    }

    swift_release();

    swift_release();
  }

  else
  {

    uint64_t v9 = _swiftEmptyArrayStorage;
LABEL_7:
    swift_release();
  }

  return v9;
}

void sub_988E0()
{
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns] = 1LL;
  __int16 v1 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView];
  void *v1 = 0LL;
  v1[1] = 0LL;
  *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews] = _swiftEmptyArrayStorage;
  v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState] = 0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000010LL,  0x80000000000BFD70LL,  "StoreDynamicUIPlugin/ServicesGridView.swift",  43LL,  2LL,  55LL,  0);
  __break(1u);
}

void sub_98994()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns);
  uint64_t v2 = v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics;
  sub_9A934(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics, (uint64_t)v3, 1LL);
  *(void *)(v2 + 176) = v1;
  *(_BYTE *)(v2 + 184) = 0;
  sub_535AC();
}

BOOL sub_98A10()
{
  if (v1)
  {
    if (v0 < 0) {
      uint64_t v4 = v0;
    }
    else {
      uint64_t v4 = v0 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_34E60();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
  }

  return v2 != 0;
}

uint64_t sub_98A70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView + 8);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_AC90(v4, v5);
}

uint64_t sub_98A90(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews);
  *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews) = a1;
  return swift_bridgeObjectRelease(v2);
}

void *sub_98AA8()
{
  uint64_t v1 = type metadata accessor for LayoutRect(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v5 = (objc_class *)type metadata accessor for ServicesGridView();
  v19.receiver = v0;
  v19.super_class = v5;
  objc_msgSendSuper2(&v19, "layoutSubviews");
  sub_98DA0();
  uint64_t v6 = (uint64_t)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics];
  sub_9A934((uint64_t)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics], (uint64_t)v16, 0LL);
  sub_6935C(v6, (uint64_t)&v18);
  uint64_t v7 = swift_bridgeObjectRetain(*(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews]);
  __int128 v8 = sub_2C38C(v7);
  swift_bridgeObjectRelease();
  double v17 = v8;
  [v0 bounds];
  double v10 = v9;
  sub_99C44(1, (uint64_t)v0, (uint64_t)&v17, v9, v11, v12, v13);
  LayoutRect.init(origin:measurements:)(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return sub_9A594(&v17);
}

double sub_98C30(uint64_t a1, CGFloat a2, CGFloat a3)
{
  uint64_t v7 = v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics;
  sub_9A934(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics, (uint64_t)&v14, 0LL);
  sub_6935C(v7, (uint64_t)&v16);
  uint64_t v8 = swift_bridgeObjectRetain(*(void *)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews));
  CGFloat v9 = sub_2C38C(v8);
  swift_bridgeObjectRelease();
  int v15 = v9;
  uint64_t ObjectType = swift_getObjectType(a1);
  sub_69584(0, a1, (uint64_t)&v15, ObjectType, 0.0, 0.0, a2, a3);
  double v12 = v11;
  sub_9A594(&v15);
  return v12;
}

uint64_t sub_98DA0()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews);
  if (!((unint64_t)v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain(*(void *)(v0
                                                + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews));
    if (v2) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }

  if (v1 < 0) {
    uint64_t v11 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews);
  }
  else {
    uint64_t v11 = v1 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews));
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v11);
  uint64_t v2 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView;
    do
    {
      if ((v1 & 0xC000000000000001LL) != 0) {
        uint64_t v6 = (char *)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v1);
      }
      else {
        uint64_t v6 = (char *)sub_9A93C(v1 + 8 * v4);
      }
      uint64_t v7 = v6;
      sub_9A950(*(void **)&v6[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel]);
      sub_9A950(*(void **)&v7[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel]);
      uint64_t v8 = *(void (**)(char *, __n128))v5;
      if (*(void *)v5)
      {
        uint64_t v9 = *(void *)(v5 + 8);
        __n128 v10 = swift_retain(v9);
        v8(v7, v10);
        sub_AC90((uint64_t)v8, v9);
      }

      ++v4;
    }

    while (v2 != v4);
    return swift_bridgeObjectRelease();
  }

  __break(1u);
  return result;
}

void sub_98EDC()
{
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState) == 1)
  {
    *(_BYTE *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState) = 0;
    uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns);
    uint64_t v2 = v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics;
    sub_9A934(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics, (uint64_t)v3, 1LL);
    *(void *)(v2 + 176) = v1;
    *(_BYTE *)(v2 + 184) = 0;
    *(_BYTE *)(v2 + 40) = 1;
    sub_98DA0();
  }

  sub_535AC();
}

uint64_t sub_98F4C(uint64_t result, char a2, char a3)
{
  if ((*(_BYTE *)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState) & 1) == 0)
  {
    uint64_t v5 = result;
    char v6 = a3 & 1;
    *(_BYTE *)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState) = 1;
    uint64_t v7 = v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics;
    sub_9A934(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics, (uint64_t)v8, 1LL);
    *(void *)(v7 + 176) = v5;
    *(_BYTE *)(v7 + 184) = a2 & 1;
    *(_BYTE *)(v7 + 40) = v6;
    return sub_98DA0();
  }

  return result;
}

uint64_t sub_98FD0(uint64_t a1, uint64_t a2)
{
  id v5 = v2;
  swift_retain(a2);
  char v6 = sub_987C8(a1, v5, a2);
  sub_98A90((uint64_t)v6);
  sub_98DA0();
  return sub_9944C();
}

void sub_99038(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  void (*v21)(void *__return_ptr, uint64_t, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  void v52[3];
  uint64_t v53;
  uint64_t v54;
  type metadata accessor for ServiceDetailView();
  uint64_t v8 = sub_84CF0(0LL, 0LL, 1, 0LL, 1);
  sub_8515C( *(double *)(a2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize),  *(double *)(a2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize + 8));
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_ACA0(a1, v9);
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  sub_85528(v11, a3);
  swift_release();
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_ACA0(a1, v12);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v13 + 24))(&v50, v12, v13);
  if (v51)
  {
    sub_7CF4(&v50, (uint64_t)v52);
    (*(void (**)(void *, uint64_t))&stru_158.sectname[swift_isaMask & **(void **)&v8[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_titleLabel]])( v52,  a3);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v52);
  }

  else
  {
    sub_8144((uint64_t)&v50, &qword_F3930);
  }

  uint64_t v14 = *(void **)&v8[OBJC_IVAR____TtC20StoreDynamicUIPlugin17ServiceDetailView_detailLabel];
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  sub_ACA0(a1, v15);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v16 + 16))(v52, v15, v16);
  (*(void (**)(void *, uint64_t))&stru_158.sectname[swift_isaMask & *v14])(v52, a3);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v52);
  uint64_t v17 = sub_44DC(&qword_F7B58);
  uint64_t inited = swift_initStackObject(v17, &v49);
  *(_OWORD *)(inited + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  sub_ACA0(a1, v19);
  uint64_t v21 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v20 + 24);
  double v22 = v8;
  v21(v52, v19, v20);
  uint64_t v23 = v53;
  if (v53)
  {
    id v24 = v54;
    sub_ACA0(v52, v53);
    *(void *)(inited + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 64))(v23, v24);
    *(void *)(inited + 40) = v25;
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v52);
  }

  else
  {
    sub_8144((uint64_t)v52, &qword_F3930);
    *(void *)(inited + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0LL;
    *(void *)(inited + 40) = 0LL;
  }

  uint64_t v26 = a1[3];
  double v27 = a1[4];
  sub_ACA0(a1, v26);
  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(v27 + 16))(v52, v26, v27);
  __int128 v28 = v53;
  __int128 v29 = v54;
  sub_ACA0(v52, v53);
  *(void *)(inited + 48) = (*(uint64_t (**)(uint64_t, uint64_t))(v29 + 64))(v28, v29);
  *(void *)(inited + 56) = v30;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v52);
  double v31 = *(void *)(inited + 40);
  if (v31)
  {
    __int128 v32 = *(void *)(inited + 32);
    swift_bridgeObjectRetain(*(void *)(inited + 40));
    sub_417E8();
    objc_super v34 = v33;
    uint64_t v35 = v33[2];
    if (v35 >= v33[3] >> 1)
    {
      sub_417E8();
      objc_super v34 = v46;
    }

    _OWORD v34[2] = v35 + 1;
    uint64_t v36 = &v34[2 * v35];
    v36[4] = v32;
    v36[5] = v31;
  }

  else
  {
    objc_super v34 = _swiftEmptyArrayStorage;
  }

  id v37 = *(void *)(inited + 56);
  if (v37)
  {
    uint64_t v38 = *(void *)(inited + 48);
    swift_bridgeObjectRetain(*(void *)(inited + 56));
    if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0)
    {
      sub_417E8();
      objc_super v34 = v47;
    }

    uint64_t v39 = v34[2];
    if (v39 >= v34[3] >> 1)
    {
      sub_417E8();
      objc_super v34 = v48;
    }

    _OWORD v34[2] = v39 + 1;
    uint64_t v40 = &v34[2 * v39];
    v40[4] = v38;
    v40[5] = v37;
  }

  swift_bridgeObjectRelease();
  v52[0] = v34;
  uint64_t v41 = sub_44DC(&qword_F65D8);
  uint64_t v42 = sub_5E83C();
  uint64_t v43 = BidirectionalCollection<>.joined(separator:)(0LL, 0xE000000000000000LL, v41, v42);
  id v45 = v44;
  swift_bridgeObjectRelease();
  sub_998A8(v43, v45, v22);

  *a4 = v22;
}

uint64_t sub_9944C()
{
  if (!v2)
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = sub_34E60();
    if (v3) {
      goto LABEL_3;
    }
    return swift_bridgeObjectRelease();
  }

  if (v0 < 0) {
    uint64_t v8 = v0;
  }
  else {
    uint64_t v8 = v0 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_34E60();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v8);
  uint64_t v3 = result;
  if (!result) {
    return swift_bridgeObjectRelease();
  }
LABEL_3:
  if (v3 >= 1)
  {
    for (uint64_t i = 0LL; i != v3; ++i)
    {
      if ((v0 & 0xC000000000000001LL) != 0) {
        uint64_t v6 = sub_9A95C(i);
      }
      else {
        uint64_t v6 = (uint64_t)sub_9A93C(v0 + 8 * i);
      }
      uint64_t v7 = (void *)v6;
      [v1 addSubview:v6];
    }

    return swift_bridgeObjectRelease();
  }

  __break(1u);
  return result;
}

uint64_t sub_99518()
{
  if (!v1)
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = sub_34E60();
    if (v2) {
      goto LABEL_3;
    }
    return sub_9A924(v0);
  }

  if (v0 < 0) {
    uint64_t v7 = v0;
  }
  else {
    uint64_t v7 = v0 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_34E60();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v7);
  uint64_t v2 = result;
  if (!result) {
    return sub_9A924(v0);
  }
LABEL_3:
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i != v2; ++i)
    {
      if ((v0 & 0xC000000000000001LL) != 0) {
        id v5 = (void *)sub_9A95C(i);
      }
      else {
        id v5 = sub_9A93C(v0 + 8 * i);
      }
      uint64_t v6 = v5;
      [v5 removeFromSuperview];
    }

    return sub_9A924(v0);
  }

  __break(1u);
  return result;
}

uint64_t sub_995C8()
{
  if (!v2)
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v0 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = sub_34E60();
    if (v3) {
      goto LABEL_3;
    }
    return sub_9A924(v0);
  }

  if (v0 < 0) {
    uint64_t v9 = v0;
  }
  else {
    uint64_t v9 = v0 & 0xFFFFFFFFFFFFFF8LL;
  }
  sub_34E60();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v9);
  uint64_t v3 = result;
  if (!result) {
    return sub_9A924(v0);
  }
LABEL_3:
  if (v3 >= 1)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = (double *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize);
    do
    {
      if ((v0 & 0xC000000000000001LL) != 0) {
        uint64_t v7 = sub_9A95C(v5);
      }
      else {
        uint64_t v7 = (uint64_t)sub_9A93C(v0 + 8 * v5);
      }
      uint64_t v8 = (void *)v7;
      ++v5;
      sub_8515C(*v6, v6[1]);
    }

    while (v3 != v5);
    return sub_9A924(v0);
  }

  __break(1u);
  return result;
}

void sub_99680()
{
}

void sub_996B8()
{
}

id sub_996F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ServicesGridView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ServicesGridView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin16ServicesGridView);
}

uint64_t storeEnumTagSinglePayload for ServicesGridView.ServiceViewState( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_997E8 + 4 * byte_BBF05[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_9981C + 4 * byte_BBF00[v4]))();
}

uint64_t sub_9981C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_99824(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9982CLL);
  }
  return result;
}

uint64_t sub_99838(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x99840LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_99844(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9984C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServicesGridView.ServiceViewState()
{
  return &type metadata for ServicesGridView.ServiceViewState;
}

unint64_t sub_9986C()
{
  unint64_t result = qword_F7B50;
  if (!qword_F7B50)
  {
    unint64_t result = swift_getWitnessTable(&unk_BBF84, &type metadata for ServicesGridView.ServiceViewState);
    atomic_store(result, (unint64_t *)&qword_F7B50);
  }

  return result;
}

void sub_998A8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  [a3 setAccessibilityLabel:v5];
}

id sub_998F8( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v34 = a4;
  __int128 v32 = a2;
  uint64_t v31 = a11;
  int v33 = a5 & 1;
  uint64_t v17 = *(void *)(a10 - 8);
  uint64_t v18 = __chkstk_darwin(a1);
  uint64_t v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v18);
  uint64_t v25 = (char *)&v31 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v23);
  double v27 = (char *)&v31 - v26;
  (*(void (**)(char *))(v22 + 32))((char *)&v31 - v26);
  __int128 v28 = objc_allocWithZone((Class)type metadata accessor for ServicesGridView());
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v25, v27, a9);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, a3, a10);
  id v29 = sub_99A90((uint64_t)v25, v32, (uint64_t)v20, v34, v33, v28, a9, a10, a6, a7, v31, a12);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, a10);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v27, a9);
  return v29;
}

id sub_99A90( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, char a5, _BYTE *a6, uint64_t a7, uint64_t a8, double a9, double a10, uint64_t a11, uint64_t a12)
{
  char v21 = a5 & 1;
  v31[3] = a7;
  v31[4] = a11;
  uint64_t v22 = sub_AE98(v31);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a7 - 8) + 32LL))(v22, a1, a7);
  void v30[3] = a8;
  __int128 v30[4] = a12;
  uint64_t v23 = sub_AE98(v30);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(a8 - 8) + 32LL))(v23, a3, a8);
  *(void *)&a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_columns] = 1LL;
  uint64_t v24 = &a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_onConfigureServiceView];
  *uint64_t v24 = 0LL;
  v24[1] = 0LL;
  *(void *)&a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViews] = _swiftEmptyArrayStorage;
  a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_serviceViewState] = 0;
  sub_6666C((uint64_t)v30, (uint64_t)&a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_rowSpacing]);
  uint64_t v25 = (double *)&a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_artworkSize];
  *uint64_t v25 = a9;
  v25[1] = a10;
  uint64_t v26 = &a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics];
  sub_6666C((uint64_t)v31, (uint64_t)&a6[OBJC_IVAR____TtC20StoreDynamicUIPlugin16ServicesGridView_metrics]);
  sub_69148((uint64_t)a2, (uint64_t)(v26 + 48));
  sub_691D4(a4, (uint64_t)(v26 + 88));
  sub_6666C((uint64_t)v30, (uint64_t)(v26 + 128));
  v26[40] = 1;
  v26[168] = v21;
  *((void *)v26 + 2_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 1LL;
  v26[184] = 0;
  v29.receiver = a6;
  v29.super_class = (Class)type metadata accessor for ServicesGridView();
  id v27 = objc_msgSendSuper2(&v29, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_89408(a4);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v30);
  sub_6AABC(a2);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v31);
  return v27;
}

void sub_99C44(int a1, uint64_t a2, uint64_t a3, CGFloat a4, double a5, CGFloat a6, double a7)
{
  double v154 = a5;
  double v155 = a7;
  LODWORD(v15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = a1;
  uint64_t v11 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v134 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = *(void *)(a3 + 32);
  uint64_t v16 = *(void *)(a3 + 40);
  sub_ACA0((void *)(a3 + 8), v15);
  j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v15, v16);
  double v153 = AnyDimension.value(in:rounded:)(a2, v14, v15, v16);
  uint64_t v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  v17(v14, v11);
  uint64_t v18 = *(void *)(a3 + 160);
  uint64_t v19 = *(void *)(a3 + 168);
  sub_ACA0((void *)(a3 + 136), v18);
  j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v18, v19);
  double v142 = AnyDimension.value(in:rounded:)(a2, v14, v18, v19);
  v17(v14, v11);
  uint64_t v156 = a2;
  double v152 = sub_6A94C(a3, a2);
  if ((*(_BYTE *)(a3 + 192) & 1) != 0)
  {
    uint64_t v147 = -1LL;
    double v20 = a6;
LABEL_12:
    unsigned int v150 = v157 & 1;
    v171[0] = 0.0;
    uint64_t v25 = swift_allocObject(&unk_E6FD8, 24LL, 7LL);
    uint64_t v146 = v25;
    *(void *)(v25 + swift_unknownObjectWeakDestroy(v0 + 16) = _swiftEmptyArrayStorage;
    uint64_t v26 = (void *)(v25 + 16);
    uint64_t v27 = swift_allocObject(&unk_E7000, 24LL, 7LL);
    v172.origin.x = a4;
    CGFloat v29 = v154;
    CGFloat v28 = v155;
    v172.origin.y = v154;
    v172.size.CGFloat width = a6;
    v172.size.CGFloat height = v155;
    CGFloat MinX = CGRectGetMinX(v172);
    uint64_t v145 = v27;
    *(CGFloat *)(v27 + swift_unknownObjectWeakDestroy(v0 + 16) = MinX;
    uint64_t v31 = (double *)(v27 + 16);
    uint64_t v32 = swift_allocObject(&unk_E7000, 24LL, 7LL);
    v173.origin.x = a4;
    v173.origin.y = v29;
    v173.size.CGFloat width = a6;
    v173.size.CGFloat height = v28;
    CGFloat MinY = CGRectGetMinY(v173);
    uint64_t v144 = v32;
    *(CGFloat *)(v32 + swift_unknownObjectWeakDestroy(v0 + 16) = MinY;
    uint64_t v34 = *(void *)a3;
    uint64_t v149 = a3 + 56;
    unint64_t v35 = *(void *)(v34 + 16);
    swift_bridgeObjectRetain(v34);
    swift_beginAccess(v31, v167, 1LL, 0LL);
    swift_beginAccess(v26, v166, 1LL, 0LL);
    uint64_t v135 = (double *)(v32 + 16);
    swift_beginAccess(v32 + 16, &v165, 1LL, 0LL);
    swift_beginAccess(v171, &v164, 1LL, 0LL);
    unint64_t v36 = 0LL;
    uint64_t v140 = v34 + 32;
    uint64_t v141 = v34;
    unint64_t v37 = v35;
    uint64_t v138 = (uint64_t)&v158 + 8;
    uint64_t v139 = v163;
    uint64_t v148 = (__int128 *)((char *)&v168 + 8);
    double v151 = v20;
    uint64_t v137 = v31;
    unint64_t v143 = v35;
    while (1)
    {
      if (v36 == v37)
      {
        __int128 v159 = 0u;
        __int128 v160 = 0u;
        unint64_t v36 = v37;
        __int128 v158 = 0u;
      }

      else
      {
        if (v36 >= *(void *)(v141 + 16))
        {
          __break(1u);
          return;
        }

        uint64_t v38 = (__int128 *)v139;
        sub_6666C(v140 + 40 * v36, (uint64_t)v139);
        *(void *)&__int128 v158 = v36;
        sub_7CF4(v38, v138);
        ++v36;
      }

      sub_92954((uint64_t)&v158, (uint64_t)&v168, &qword_F6908);
      if (!v170)
      {
        swift_bridgeObjectRelease();
        v175.origin.x = a4;
        v175.origin.y = v154;
        v175.size.CGFloat height = v155;
        v175.size.CGFloat width = a6;
        CGRectGetMinY(v175);
        swift_release();
        swift_release();
        swift_release();
        return;
      }

      uint64_t v157 = v168;
      sub_7CF4(v148, (uint64_t)&v162);
      sub_ACA0(&v162, v163[2]);
      double v39 = Measurable.measuredSize(fitting:in:)(v20, v152);
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)(*(void *)a3 + 16LL) - 1LL;
      sub_69148(v149, (uint64_t)&v158);
      uint64_t v43 = *((void *)&v159 + 1);
      sub_6AABC(&v158);
      if (v43)
      {
        sub_6666C((uint64_t)&v162, (uint64_t)&v158);
        *((double *)&v160 + 1) = v39;
        uint64_t v161 = v41;
        uint64_t v44 = *v26;
        if ((swift_isUniquelyReferenced_nonNull_native(*v26) & 1) == 0)
        {
          sub_4164C();
          uint64_t v44 = v130;
        }

        unint64_t v45 = *(void *)(v44 + 16);
        if (v45 >= *(void *)(v44 + 24) >> 1)
        {
          sub_4164C();
          uint64_t v44 = v131;
        }

        *(void *)(v44 + swift_unknownObjectWeakDestroy(v0 + 16) = v45 + 1;
        uint64_t v46 = v44 + 56 * v45;
        __int128 v47 = v158;
        __int128 v48 = v159;
        __int128 v49 = v160;
        *(void *)(v46 + 80) = v161;
        *(_OWORD *)(v46 + 48) = v48;
        *(_OWORD *)(v46 + 64) = v49;
        *(_OWORD *)(v46 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v47;
        *uint64_t v26 = v44;
        if (*(void *)(v44 + 16) == v147)
        {
          uint64_t v50 = v145;
          double v51 = *(double *)(v145 + 16);
          uint64_t v52 = v26;
          uint64_t v53 = v144;
          double v54 = *(double *)(v144 + 16);
          uint64_t v55 = *(unsigned __int8 *)(a3 + 48);
          char v56 = *(_BYTE *)(a3 + 176);
          uint64_t v57 = swift_bridgeObjectRetain(v44);
          double v58 = v154;
          double v59 = v20;
          double v60 = v155;
          sub_9A5FC(v57, v51, v54, v153, v59, a4, v154, a6, v155, v55, v150, v56, v156, a3);
          double v62 = v61;
          double v64 = v63;
          swift_bridgeObjectRelease();
          double v65 = v142;
          if (v42 == v157) {
            double v65 = 0.0;
          }
          double v66 = v65 + v64;
          double v67 = v171[0];
          if (v171[0] <= v62) {
            double v67 = v62;
          }
          v171[0] = v67;
          uint64_t v68 = v50;
          uint64_t v31 = v137;
          CGFloat v69 = a4;
          CGFloat v70 = v58;
          CGFloat v71 = a6;
          uint64_t v72 = v53;
          uint64_t v26 = v52;
          unint64_t v37 = v143;
LABEL_43:
          CGFloat v112 = v60;
          double v20 = v151;
          sub_69490(v68, v72, v146, v66, v69, v70, v71, v112);
        }
      }

      else
      {
        double v73 = *v31;
        if (v39 + *v31 > a6)
        {
          uint64_t v74 = *v26;
          unsigned int v75 = v135;
          double v136 = *v135;
          double v76 = v136;
          uint64_t v77 = *(unsigned __int8 *)(a3 + 48);
          char v78 = *(_BYTE *)(a3 + 176);
          uint64_t v79 = swift_bridgeObjectRetain(v74);
          double v80 = v76;
          double v81 = v20;
          double v82 = a4;
          double v83 = a6;
          double v84 = a4;
          CGFloat v85 = v154;
          CGFloat v86 = v155;
          sub_9A5FC(v79, v73, v80, v153, v81, v82, v154, v83, v155, v77, v150, v78, v156, a3);
          double v88 = v87;
          double v90 = v89;
          swift_bridgeObjectRelease();
          double v91 = v142 + v90;
          double v92 = v171[0];
          if (v171[0] <= v88) {
            double v92 = v88;
          }
          v171[0] = v92;
          v174.origin.x = v84;
          v174.origin.y = v85;
          a4 = v84;
          a6 = v83;
          v174.size.CGFloat width = v83;
          v174.size.CGFloat height = v86;
          double v20 = v151;
          double v73 = CGRectGetMinX(v174);
          *uint64_t v31 = v73;
          *unsigned int v75 = v136 + v91;
          unint64_t v37 = v143;
          *uint64_t v26 = _swiftEmptyArrayStorage;
          swift_bridgeObjectRelease();
        }

        sub_6666C((uint64_t)&v162, (uint64_t)&v158);
        *((double *)&v160 + 1) = v39;
        uint64_t v161 = v41;
        uint64_t v93 = *v26;
        if ((swift_isUniquelyReferenced_nonNull_native(*v26) & 1) == 0)
        {
          sub_4164C();
          uint64_t v93 = v132;
        }

        unint64_t v94 = *(void *)(v93 + 16);
        if (v94 >= *(void *)(v93 + 24) >> 1)
        {
          sub_4164C();
          uint64_t v93 = v133;
        }

        *(void *)(v93 + swift_unknownObjectWeakDestroy(v0 + 16) = v94 + 1;
        uint64_t v95 = v93 + 56 * v94;
        __int128 v96 = v158;
        __int128 v97 = v159;
        __int128 v98 = v160;
        *(void *)(v95 + 80) = v161;
        *(_OWORD *)(v95 + 48) = v97;
        *(_OWORD *)(v95 + 64) = v98;
        *(_OWORD *)(v95 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v96;
        *uint64_t v26 = v93;
        if (*(void *)(v93 + 16) == v147)
        {
          uint64_t v99 = v144;
          double v100 = *(double *)(v144 + 16);
          uint64_t v101 = *(unsigned __int8 *)(a3 + 48);
          char v102 = *(_BYTE *)(a3 + 176);
          uint64_t v103 = swift_bridgeObjectRetain(v93);
          double v104 = v154;
          double v105 = v20;
          double v60 = v155;
          sub_9A5FC(v103, v73, v100, v153, v105, a4, v154, a6, v155, v101, v150, v102, v156, a3);
          double v107 = v106;
          double v109 = v108;
          swift_bridgeObjectRelease();
          double v110 = v142;
          if (v42 == v157) {
            double v110 = 0.0;
          }
          double v66 = v110 + v109;
          double v111 = v171[0];
          if (v171[0] <= v107) {
            double v111 = v107;
          }
          v171[0] = v111;
          uint64_t v68 = v145;
          CGFloat v69 = a4;
          CGFloat v70 = v104;
          CGFloat v71 = a6;
          uint64_t v72 = v99;
          uint64_t v31 = v137;
          goto LABEL_43;
        }
      }

      if (v42 == v157 && *(void *)(*v26 + 16LL))
      {
        uint64_t v114 = v144;
        uint64_t v113 = v145;
        double v115 = *(double *)(v145 + 16);
        double v116 = *(double *)(v144 + 16);
        uint64_t v117 = *(unsigned __int8 *)(a3 + 48);
        char v118 = *(_BYTE *)(a3 + 176);
        uint64_t v119 = swift_bridgeObjectRetain(*v26);
        CGFloat v120 = v154;
        double v121 = v20;
        double v122 = v155;
        sub_9A5FC(v119, v115, v116, v153, v121, a4, v154, a6, v155, v117, v150, v118, v156, a3);
        double v124 = v123;
        double v126 = v125;
        swift_bridgeObjectRelease();
        double v127 = v171[0];
        if (v171[0] <= v124) {
          double v127 = v124;
        }
        v171[0] = v127;
        uint64_t v128 = v113;
        unint64_t v37 = v143;
        CGFloat v129 = v122;
        double v20 = v151;
        sub_69490(v128, v114, v146, v126 + 0.0, a4, v120, a6, v129);
      }

      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v162);
    }
  }

  unint64_t v21 = *(void *)(a3 + 184);
  if (v21)
  {
    GridLayout.Metrics.maxColumnWidth.getter((uint64_t)&v168);
    if (v169)
    {
      sub_7CF4(&v168, (uint64_t)&v158);
      uint64_t v22 = *((void *)&v159 + 1);
      uint64_t v23 = v160;
      sub_ACA0(&v158, *((uint64_t *)&v159 + 1));
      j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v22, v23);
      double v20 = AnyDimension.value(in:rounded:)(v156, v14, v22, v23);
      v17(v14, v11);
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v158);
    }

    else
    {
      sub_8144((uint64_t)&v168, &qword_F3EB0);
      double v20 = round((a6 - v153 * (double)(v21 - 1)) / (double)v21);
    }

    if ((*(_BYTE *)(a3 + 192) & 1) != 0) {
      uint64_t v24 = -1LL;
    }
    else {
      uint64_t v24 = *(void *)(a3 + 184);
    }
    uint64_t v147 = v24;
    goto LABEL_12;
  }

void *sub_9A594(void *a1)
{
  return a1;
}

uint64_t sub_9A5C8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_9A5EC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_9A5FC( uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14)
{
  unint64_t v21 = *(void *)(a1 + 16);
  double v22 = 0.0;
  if (v21)
  {
    uint64_t v23 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    unint64_t v24 = v21;
    do
    {
      sub_6AFA4(v23, (uint64_t)&v55);
      sub_6666C((uint64_t)&v55, (uint64_t)v54);
      *((void *)&v54[2] + 1) = v58;
      *(double *)&v54[3] = v59;
      if (v22 <= v59) {
        double v22 = v59;
      }
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v54);
      sub_8144((uint64_t)&v55, &qword_F52D0);
      v23 += 56LL;
      --v24;
    }

    while (v24);
    swift_bridgeObjectRelease();
  }

  uint64_t v46 = a1 + 32;
  unint64_t v25 = v21 - 1;
  swift_bridgeObjectRetain(a1);
  unint64_t v26 = 0LL;
  while (1)
  {
    if (v26 == v21)
    {
      unint64_t v26 = v21;
      memset(v54, 0, sizeof(v54));
      goto LABEL_12;
    }

    if (v26 >= v21) {
      break;
    }
    sub_6AFA4(v46 + 56 * v26, (uint64_t)v51);
    *(void *)&v54[0] = v26;
    *(_OWORD *)((char *)v54 + 8) = v51[0];
    *(_OWORD *)((char *)&v54[1] + 8) = v51[1];
    *(_OWORD *)((char *)&v54[2] + 8) = v52;
    *((void *)&v54[3] + 1) = v53;
    ++v26;
LABEL_12:
    sub_92954((uint64_t)v54, (uint64_t)&v55, &qword_F6910);
    if (!v57)
    {
      swift_bridgeObjectRelease();
      return;
    }

    uint64_t v27 = v55;
    double v28 = v59;
    double v29 = v60;
    sub_7CF4(&v56, (uint64_t)&v50);
    *(double *)&__int128 v52 = v28;
    *((double *)&v52 + 1) = v29;
    sub_7CF4((__int128 *)&v50, (uint64_t)v54);
    *((double *)&v54[2] + 1) = v28;
    *(double *)&v54[3] = v29;
    if ((a11 & 1) != 0)
    {
      uint64_t v30 = a11;
      uint64_t v31 = a14;
      double v32 = a3;
      if ((a12 & 1) == 0)
      {
        sub_6666C((uint64_t)v54, (uint64_t)v47);
        double v48 = v28;
        double v49 = v29;
        _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v47);
        double v32 = (v22 - v29) * 0.5 + a3;
      }

      uint64_t v33 = *((void *)&v54[1] + 1);
      sub_ACA0(v54, *((uint64_t *)&v54[1] + 1));
      v34.n128_f64[0] = a6;
      v35.n128_f64[0] = a7;
      v36.n128_f64[0] = a8;
      v37.n128_f64[0] = a9;
      v38.n128_f64[0] = a2;
      CGRect.withLayoutDirection(in:relativeTo:)(v34, v35, v36, v37, v38, v32, v28, v29);
      dispatch thunk of LayoutView.frame.setter(v33);
      a14 = v31;
      a11 = v30;
      unint64_t v25 = v21 - 1;
    }

    if (v27 == v25) {
      double v39 = 0.0;
    }
    else {
      double v39 = a4;
    }
    double v40 = a5;
    if ((*(_BYTE *)(a14 + 48) & 1) == 0)
    {
      sub_6666C((uint64_t)v54, (uint64_t)v47);
      double v48 = v28;
      double v49 = v29;
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v47);
      double v40 = v28;
    }

    a2 = a2 + v39 + v40;
    sub_8144((uint64_t)v54, &qword_F52D0);
  }

  __break(1u);
}

void *sub_9A8F0(void *a1)
{
  return a1;
}

uint64_t sub_9A924(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_9A934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

id sub_9A93C@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

  ;
}

id sub_9A950(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v2 + 328), v1);
}

uint64_t sub_9A95C(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

uint64_t ServiceProductPageLayout.init(metrics:detailsPosition:contentView:detailsView:)@<X0>( void *__src@<X0>, char a2@<W1>, uint64_t a3@<X2>, __int128 *a4@<X3>, _BYTE *a5@<X8>)
{
  char v8 = a2 & 1;
  memcpy(a5, __src, 0x98uLL);
  a5[152] = v8;
  sub_940E4(a3, (uint64_t)(a5 + 160));
  return sub_7CF4(a4, (uint64_t)(a5 + 200));
}

uint64_t ServiceProductPageLayout.placeChildren(relativeTo:in:)( uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = type metadata accessor for FloatingPointRoundingRule(0LL);
  __chkstk_darwin(v9);
  CGFloat v10 = *(double *)(v4 + 8);
  sub_3A08C((void *)(v4 + 32));
  sub_3A060();
  double v12 = v11;
  sub_3A0B0();
  sub_6662C(v4 + 72, (uint64_t)v45, &qword_F3EB0);
  if (v46)
  {
    sub_3A08C(v45);
    sub_3A060();
    double Height = v13;
    sub_3A0B0();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v45);
  }

  else
  {
    sub_8144((uint64_t)v45, &qword_F3EB0);
    v47.origin.x = sub_1BE3C();
    double Height = CGRectGetHeight(v47);
  }

  sub_3A08C((void *)(v4 + 112));
  sub_3A060();
  double v15 = v14;
  sub_3A0B0();
  double v42 = v10;
  if ((*(_BYTE *)(v4 + 152) & 1) != 0)
  {
    double v16 = v15 + sub_9B668();
    double v17 = v12 + v16;
  }

  else
  {
    v48.origin.x = sub_1BE3C();
    double v16 = CGRectGetMaxX(v48) - v15 - v12;
    double v17 = sub_9B668();
  }

  sub_6662C(v4 + 160, (uint64_t)&v43, &qword_F5108);
  if (v44)
  {
    sub_7CF4(&v43, (uint64_t)v45);
    v49.origin.x = v10;
    v49.origin.y = a2;
    v49.size.CGFloat width = a3;
    v49.size.CGFloat height = a4;
    unint64_t v18 = *(void *)&v16;
    double v19 = v17;
    CGFloat v20 = CGRectGetMidY(v49) + Height * -0.5;
    uint64_t v21 = v46;
    sub_ACA0(v45, v46);
    v22.n128_f64[0] = sub_9B654();
    v23.n128_u64[0] = v18;
    double v24 = v20;
    double v17 = v19;
    CGRect.withLayoutDirection(in:relativeTo:)(v22, v25, v26, v27, v23, v24, v12, Height);
    dispatch thunk of LayoutView.frame.setter(v21);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v45);
  }

  else
  {
    sub_8144((uint64_t)&v43, &qword_F5108);
  }

  v50.origin.x = sub_9B654();
  CGRectGetWidth(v50);
  v51.origin.x = sub_9B654();
  CGRectGetHeight(v51);
  uint64_t v28 = *(void *)(v4 + 224);
  sub_ACA0((void *)(v4 + 200), v28);
  double v29 = dispatch thunk of Measurable.measurements(fitting:in:)(a1, v28);
  double v31 = v30;
  v52.origin.x = sub_9B654();
  double v32 = round(CGRectGetMidY(v52) + v31 * -0.5);
  uint64_t v33 = *(void *)(v4 + 224);
  sub_ACA0((void *)(v4 + 200), v33);
  v34.n128_f64[0] = sub_9B654();
  v35.n128_f64[0] = v42 + v17;
  CGRect.withLayoutDirection(in:relativeTo:)(v34, v36, v37, v38, v35, v32, v29, v31);
  dispatch thunk of LayoutView.frame.setter(v33);
  double v39 = sub_9B654();
  return LayoutRect.init(representing:)(v39);
}

double ServiceWelcomeFeatureListLayout.Metrics.contentMargins.getter()
{
  return *(double *)v0;
}

void ServiceWelcomeFeatureListLayout.Metrics.contentMargins.setter( double a1, double a2, double a3, double a4)
{
  *uint64_t v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  v4[3] = a4;
}

void ServiceProductPageLayout.Metrics.contentWidth.getter(uint64_t a1@<X8>)
{
}

uint64_t ServiceProductPageLayout.Metrics.contentWidth.setter(__int128 *a1)
{
  int v3 = (void *)(v1 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v3);
  return sub_1543C(a1, (uint64_t)v3);
}

double (*ServiceWelcomeFeatureListLayout.Metrics.featureHeight.modify())(double, double)
{
  return NSDirectionalEdgeInsets.edgeInsets.getter;
}

void ServiceProductPageLayout.Metrics.contentHeight.getter(uint64_t a1@<X8>)
{
}

uint64_t ServiceProductPageLayout.Metrics.contentHeight.setter(uint64_t a1)
{
  return sub_1BF14(a1, v1 + 72);
}

double (*ServiceWelcomeFeatureListLayout.Metrics.featureSpacing.modify())(double, double)
{
  return NSDirectionalEdgeInsets.edgeInsets.getter;
}

void ServiceProductPageLayout.Metrics.contentMargin.getter(uint64_t a1@<X8>)
{
}

uint64_t ServiceProductPageLayout.Metrics.contentMargin.setter(__int128 *a1)
{
  int v3 = (void *)(v1 + 112);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v3);
  return sub_1543C(a1, (uint64_t)v3);
}

void *ServiceProductPageLayout.Metrics.init(byCopying:)@<X0>(void *__src@<X0>, void *a2@<X8>)
{
  return memcpy(a2, __src, 0x98uLL);
}

uint64_t ServiceProductPageLayout.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_93FDC(v1, a1);
}

uint64_t ServiceProductPageLayout.detailsPosition.getter()
{
  return *(unsigned __int8 *)(v0 + 152);
}

void ServiceProductPageLayout.contentView.getter(uint64_t a1@<X8>)
{
}

void ServiceProductPageLayout.detailsView.getter(uint64_t a1@<X8>)
{
}

unint64_t sub_9AE3C()
{
  unint64_t result = qword_F7B60;
  if (!qword_F7B60)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ServiceProductPageLayout.DetailsPosition,  &type metadata for ServiceProductPageLayout.DetailsPosition);
    atomic_store(result, (unint64_t *)&qword_F7B60);
  }

  return result;
}

uint64_t destroy for ServiceProductPageLayout(void *a1)
{
  if (a1[12]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 9);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 14);
  if (a1[23]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 20);
  }
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 25);
}

uint64_t initializeWithCopy for ServiceProductPageLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  __int128 v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 56) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 32, a2 + 32);
  uint64_t v6 = (_OWORD *)(a1 + 72);
  uint64_t v7 = (_OWORD *)(a2 + 72);
  uint64_t v8 = *(void *)(a2 + 96);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v8;
    *(void *)(a1 + 104) = v9;
    (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
  }

  else
  {
    __int128 v10 = *(_OWORD *)(a2 + 88);
    *uint64_t v6 = *v7;
    *(_OWORD *)(a1 + 88) = v10;
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
  }

  __int128 v11 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 136) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 112, a2 + 112);
  *(_BYTE *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 152);
  double v12 = (_OWORD *)(a1 + 160);
  double v13 = (_OWORD *)(a2 + 160);
  uint64_t v14 = *(void *)(a2 + 184);
  if (v14)
  {
    uint64_t v15 = *(void *)(a2 + 192);
    *(void *)(a1 + 184) = v14;
    *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v15;
    (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
  }

  else
  {
    __int128 v16 = *(_OWORD *)(a2 + 176);
    _OWORD *v12 = *v13;
    *(_OWORD *)(a1 + 176) = v16;
    *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 192);
  }

  __int128 v17 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 224) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 200, a2 + 200);
  return a1;
}

uint64_t assignWithCopy for ServiceProductPageLayout(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_4290((void *)(a1 + 32), (void *)(a2 + 32));
  uint64_t v4 = *(void *)(a2 + 96);
  if (*(void *)(a1 + 96))
  {
    if (v4)
    {
      sub_4290((void *)(a1 + 72), (void *)(a2 + 72));
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  }

  else if (v4)
  {
    *(void *)(a1 + 96) = v4;
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 72, a2 + 72);
    goto LABEL_8;
  }

  __int128 v5 = *(_OWORD *)(a2 + 72);
  __int128 v6 = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v5;
  *(_OWORD *)(a1 + 88) = v6;
LABEL_8:
  sub_4290((void *)(a1 + 112), (void *)(a2 + 112));
  *(_BYTE *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 152);
  uint64_t v7 = *(void *)(a2 + 184);
  if (!*(void *)(a1 + 184))
  {
    if (v7)
    {
      *(void *)(a1 + 184) = v7;
      *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 192);
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 160, a2 + 160);
      goto LABEL_15;
    }

void *initializeWithTake for ServiceProductPageLayout(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xF0uLL);
}

uint64_t assignWithTake for ServiceProductPageLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 32));
  __int128 v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  if (*(void *)(a1 + 96)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  }
  __int128 v6 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v6;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 112));
  __int128 v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_BYTE *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 152);
  if (*(void *)(a1 + 184)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 160));
  }
  __int128 v8 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v8;
  *(void *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 192);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 200));
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 2swift_unknownObjectWeakDestroy(v0 + 16) = *(_OWORD *)(a2 + 216);
  *(void *)(a1 + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 232);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceProductPageLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 240))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 56);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceProductPageLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0LL;
    *(_OWORD *)(result + 2swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 240) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 240) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for ServiceProductPageLayout()
{
}

uint64_t storeEnumTagSinglePayload for ServiceProductPageLayout.DetailsPosition( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_9B300 + 4 * byte_BBFB5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_9B334 + 4 * byte_BBFB0[v4]))();
}

uint64_t sub_9B334(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_9B33C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9B344LL);
  }
  return result;
}

uint64_t sub_9B350(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x9B358LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_9B35C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9B364(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ServiceProductPageLayout.DetailsPosition()
{
}

uint64_t destroy for ServiceProductPageLayout.Metrics(void *a1)
{
  if (a1[12]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 9);
  }
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 14);
}

uint64_t initializeWithCopy for ServiceProductPageLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  __int128 v5 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 56) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 32, a2 + 32);
  __int128 v6 = (_OWORD *)(a1 + 72);
  __int128 v7 = (_OWORD *)(a2 + 72);
  uint64_t v8 = *(void *)(a2 + 96);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 104);
    *(void *)(a1 + 96) = v8;
    *(void *)(a1 + 104) = v9;
    (**(void (***)(_OWORD *, _OWORD *))(v8 - 8))(v6, v7);
  }

  else
  {
    __int128 v10 = *(_OWORD *)(a2 + 88);
    *__int128 v6 = *v7;
    *(_OWORD *)(a1 + 88) = v10;
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
  }

  __int128 v11 = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 136) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 112, a2 + 112);
  return a1;
}

uint64_t assignWithCopy for ServiceProductPageLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  sub_4290((void *)(a1 + 32), (void *)(a2 + 32));
  uint64_t v4 = *(void *)(a2 + 96);
  if (!*(void *)(a1 + 96))
  {
    if (v4)
    {
      *(void *)(a1 + 96) = v4;
      *(void *)(a1 + 104) = *(void *)(a2 + 104);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 72, a2 + 72);
      goto LABEL_8;
    }

uint64_t assignWithTake for ServiceProductPageLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 32));
  __int128 v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  if (*(void *)(a1 + 96)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  }
  __int128 v6 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = v6;
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 112));
  __int128 v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceProductPageLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 152))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 56);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceProductPageLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 56) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void type metadata accessor for ServiceProductPageLayout.Metrics()
{
}

double sub_9B654()
{
  return v0;
}

double sub_9B668()
{
  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.CGFloat width = v1;
  v5.size.CGFloat height = v0;
  return CGRectGetMinX(v5);
}

uint64_t sub_9B68C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_9B6C8 + 4 * asc_BC0C0[a1]))( 0x6C2D656461637261LL,  0xEB000000006F676FLL);
}

unint64_t sub_9B6C8()
{
  return 0xD000000000000011LL;
}

uint64_t sub_9B6E4()
{
  return 0x6C2D64756F6C6369LL;
}

uint64_t sub_9B6F8()
{
  return 0x6F6C2D636973756DLL;
}

uint64_t sub_9B714()
{
  return 0x756C702D7377656ELL;
}

uint64_t sub_9B738()
{
  return 0x6F676F6C2D656E6FLL;
}

uint64_t sub_9B750()
{
  return 0x2D73756C702D7674LL;
}

uint64_t storeEnumTagSinglePayload for ServiceSymbol(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_9B7BC + 4 * byte_BC0CC[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_9B7F0 + 4 * byte_BC0C7[v4]))();
}

uint64_t sub_9B7F0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_9B7F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9B800LL);
  }
  return result;
}

uint64_t sub_9B80C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x9B814LL);
  }
  *(_BYTE *)unint64_t result = a2 + 6;
  return result;
}

uint64_t sub_9B818(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9B820(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ServiceSymbol()
{
  return &type metadata for ServiceSymbol;
}

unint64_t sub_9B840()
{
  unint64_t result = qword_F7B68;
  if (!qword_F7B68)
  {
    unint64_t result = swift_getWitnessTable(&unk_BC134, &type metadata for ServiceSymbol);
    atomic_store(result, (unint64_t *)&qword_F7B68);
  }

  return result;
}

unint64_t sub_9B87C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEFC8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 7) {
    return 7LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_9B8C4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_9B8F4 + 4 * byte_BC0D1[a1]))( 0x656461637261LL,  0xE600000000000000LL);
}

uint64_t sub_9B8F4()
{
  return 0x507373656E746966LL;
}

uint64_t sub_9B914()
{
  return 0x64756F6C4369LL;
}

uint64_t sub_9B924()
{
  return 0x636973756DLL;
}

uint64_t sub_9B938()
{
  return 0x73756C507377656ELL;
}

uint64_t sub_9B950()
{
  return 6647407LL;
}

uint64_t sub_9B960()
{
  return 0x73756C507674LL;
}

void sub_9B970(char *a1)
{
}

void sub_9B97C()
{
}

void sub_9B984(uint64_t a1)
{
}

void sub_9B98C(uint64_t a1)
{
}

unint64_t sub_9B994@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_9B87C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_9B9C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_9B8C4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ServiceWelcomeFeatureListLayout.init(metrics:leadingView:centerView:trailingView:)@<X0>( void *__src@<X0>, __int128 *a2@<X1>, __int128 *a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  return sub_7CF4(a4, a5 + 192);
}

uint64_t ServiceWelcomeFeatureListLayout.Metrics.featureHeight.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1C8B8(v1 + 32, a1);
}

uint64_t ServiceWelcomeFeatureListLayout.Metrics.featureHeight.setter(uint64_t a1)
{
  return sub_1BF14(a1, v1 + 32);
}

uint64_t ServiceWelcomeFeatureListLayout.Metrics.featureSpacing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_460C(v1 + 72, a1);
}

uint64_t ServiceWelcomeFeatureListLayout.Metrics.featureSpacing.setter(__int128 *a1)
{
  unint64_t v3 = (void *)(v1 + 72);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v3);
  return sub_7CF4(a1, (uint64_t)v3);
}

void *ServiceWelcomeFeatureListLayout.Metrics.init(byCopying:)@<X0>(void *__src@<X0>, void *a2@<X8>)
{
  return memcpy(a2, __src, 0x70uLL);
}

uint64_t ServiceWelcomeFeatureListLayout.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_9BAC4((__int128 *)(v1 + 80), a1);
}

uint64_t sub_9BAC4(__int128 *a1, uint64_t a2)
{
  return a2;
}

double ServiceWelcomeFeatureListLayout.measurements(fitting:in:)(uint64_t a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1C8B8(v3 + 112, (uint64_t)v14);
  uint64_t v10 = v15;
  if (v15)
  {
    uint64_t v11 = v16;
    sub_ACA0(v14, v15);
    j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v10, v11);
    AnyDimension.value(in:rounded:)(a1, v9, v10, v11);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v14);
  }

  else
  {
    sub_11788((uint64_t)v14);
  }

  return a2;
}

uint64_t ServiceWelcomeFeatureListLayout.placeChildren(relativeTo:in:)( CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  uint64_t v9 = type metadata accessor for FloatingPointRoundingRule(0LL);
  __chkstk_darwin(v9);
  unint64_t v10 = v4[11];
  sub_1C8B8((uint64_t)(v4 + 14), (uint64_t)v32);
  if (v32[3])
  {
    sub_3A08C(v32);
    sub_3A060();
    sub_9C484();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v32);
  }

  else
  {
    sub_11788((uint64_t)v32);
    v33.origin.x = a1;
    v33.origin.y = a2;
    v33.size.CGFloat width = a3;
    v33.size.CGFloat height = a4;
    CGRectGetHeight(v33);
  }

  sub_3A08C(v4 + 19);
  sub_3A060();
  double v31 = v11;
  sub_9C484();
  v12.n128_f64[0] = sub_9C438(v4 + 5);
  v13.n128_f64[0] = a4;
  v14.n128_u64[0] = v10;
  sub_9C460(v12, v15, v16, v13, v14);
  sub_9C494();
  double v17 = v31 + sub_9C470();
  v18.n128_f64[0] = sub_9C438(v4);
  v19.n128_f64[0] = a4;
  v20.n128_f64[0] = v17;
  sub_9C460(v18, v21, v22, v19, v20);
  sub_9C494();
  double v23 = v31 + sub_9C470();
  uint64_t v24 = v4[27];
  v25.n128_f64[0] = sub_9C438(v4 + 24);
  v26.n128_f64[0] = a4;
  v27.n128_f64[0] = v23;
  sub_9C460(v25, v28, v29, v26, v27);
  dispatch thunk of LayoutView.frame.setter(v24);
  return LayoutRect.init(representing:)(a1);
}

double sub_9BE00(uint64_t a1, double a2)
{
  return ServiceWelcomeFeatureListLayout.measurements(fitting:in:)(a1, a2);
}

uint64_t destroy for ServiceWelcomeFeatureListLayout(void *a1)
{
  if (a1[17]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 14);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 19);
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 24);
}

uint64_t initializeWithCopy for ServiceWelcomeFeatureListLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v6;
  uint64_t v7 = (_OWORD *)(a1 + 112);
  uint64_t v8 = (_OWORD *)(a2 + 112);
  uint64_t v9 = *(void *)(a2 + 136);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 144);
    *(void *)(a1 + 136) = v9;
    *(void *)(a1 + 144) = v10;
    (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
  }

  else
  {
    __int128 v11 = *(_OWORD *)(a2 + 128);
    *uint64_t v7 = *v8;
    *(_OWORD *)(a1 + 128) = v11;
    *(void *)(a1 + 144) = *(void *)(a2 + 144);
  }

  __int128 v12 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 176) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 152, a2 + 152);
  __int128 v13 = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 2swift_unknownObjectWeakDestroy(v0 + 16) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 192, a2 + 192);
  return a1;
}

uint64_t assignWithCopy for ServiceWelcomeFeatureListLayout(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v4 = *(void *)(a2 + 136);
  if (!*(void *)(a1 + 136))
  {
    if (v4)
    {
      *(void *)(a1 + 136) = v4;
      *(void *)(a1 + 144) = *(void *)(a2 + 144);
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 112, a2 + 112);
      goto LABEL_8;
    }

uint64_t assignWithTake for ServiceWelcomeFeatureListLayout(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 72);
  __int128 v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  if (*(void *)(a1 + 136)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 112));
  }
  __int128 v6 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v6;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 152));
  *(_OWORD *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(void *)(a1 + 184) = *(void *)(a2 + 184);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 192));
  __int128 v7 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v7;
  *(void *)(a1 + 224) = *(void *)(a2 + 224);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceWelcomeFeatureListLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 232))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceWelcomeFeatureListLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 2swift_unknownObjectWeakDestroy(v0 + 16) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ServiceWelcomeFeatureListLayout()
{
  return &type metadata for ServiceWelcomeFeatureListLayout;
}

uint64_t destroy for ServiceWelcomeFeatureListLayout.Metrics(void *a1)
{
  if (a1[7]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 4);
  }
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 9);
}

uint64_t initializeWithCopy for ServiceWelcomeFeatureListLayout.Metrics(uint64_t a1, __int128 *a2)
{
  __int128 v5 = *a2;
  __int128 v6 = a2[1];
  __int128 v4 = a2 + 2;
  *(_OWORD *)a1 = v5;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
  uint64_t v7 = a1 + 32;
  uint64_t v8 = *((void *)a2 + 7);
  if (v8)
  {
    uint64_t v9 = *((void *)a2 + 8);
    *(void *)(a1 + 56) = v8;
    *(void *)(a1 + 64) = v9;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v7, (uint64_t)v4);
  }

  else
  {
    __int128 v10 = v4[1];
    *(_OWORD *)uint64_t v7 = *v4;
    *(_OWORD *)(v7 + swift_unknownObjectWeakDestroy(v0 + 16) = v10;
    *(void *)(v7 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v4 + 4);
  }

  __int128 v11 = a2[6];
  *(_OWORD *)(a1 + 96) = v11;
  (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 72, (uint64_t)a2 + 72);
  return a1;
}

void *assignWithCopy for ServiceWelcomeFeatureListLayout.Metrics(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  __int128 v4 = a1 + 4;
  __int128 v5 = a2 + 4;
  uint64_t v6 = a2[7];
  if (!a1[7])
  {
    if (v6)
    {
      a1[7] = v6;
      a1[8] = a2[8];
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 4), (uint64_t)(a2 + 4));
      goto LABEL_8;
    }

void *initializeWithTake for ServiceWelcomeFeatureListLayout.Metrics(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for ServiceWelcomeFeatureListLayout.Metrics(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  uint64_t v5 = a1 + 32;
  if (*(void *)(a1 + 56)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 32));
  }
  __int128 v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
  *(void *)(v5 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 64);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 72));
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceWelcomeFeatureListLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 96);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceWelcomeFeatureListLayout.Metrics( uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0LL;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 96) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ServiceWelcomeFeatureListLayout.Metrics()
{
  return &type metadata for ServiceWelcomeFeatureListLayout.Metrics;
}

double sub_9C438(void *a1)
{
  return v2;
}

uint64_t sub_9C460(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5)
{
  return CGRect.withLayoutDirection(in:relativeTo:)(a1, a2, a3, a4, a5, v5, v6, v7);
}

double sub_9C470()
{
  v5.origin.x = v2;
  v5.origin.y = v0;
  v5.size.CGFloat width = v1;
  v5.size.CGFloat height = v3;
  return CGRectGetMaxX(v5);
}

uint64_t sub_9C484()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_9C494()
{
  return dispatch thunk of LayoutView.frame.setter(v0);
}

id sub_9C4A0(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)sub_119B4();
  __int128 v10 = &v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_layoutMetrics];
  void v28[3] = &type metadata for Double;
  v28[4] = &protocol witness table for Double;
  v28[0] = 0x4073600000000000LL;
  __n128 v26 = &type metadata for Double;
  __n128 v27 = &protocol witness table for Double;
  *(void *)&__int128 v25 = 0x404E000000000000LL;
  memset(&__src[2], 0, 40);
  __src[0] = xmmword_BC230;
  __src[1] = xmmword_BC230;
  __int128 v11 = v4;
  sub_1BF14((uint64_t)v28, (uint64_t)&__src[2]);
  sub_7CF4(&v25, (uint64_t)&__src[4] + 8);
  memcpy(v10, __src, 0x70uLL);
  id v12 = objc_allocWithZone((Class)type metadata accessor for ServiceWelcomeFeatureView());
  id v13 = sub_9CDD0(v12);
  id v14 = sub_9CE18((uint64_t)v13, OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureLeading);
  id v15 = sub_9CDD0(v14);
  id v16 = sub_9CE18((uint64_t)v15, OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureCenter);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureTrailing] = sub_9CDD0(v16);

  v23.receiver = v11;
  v23.super_class = v9;
  id v17 = objc_msgSendSuper2(&v23, "initWithFrame:", a1, a2, a3, a4);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v21 = v17;
  objc_msgSend(v21, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  sub_3E6B0();
  sub_3E6B0();
  sub_3E6B0();

  return v21;
}

void sub_9C678()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_layoutMetrics];
  void v6[3] = &type metadata for Double;
  v6[4] = &protocol witness table for Double;
  CGRect v5 = &protocol witness table for Double;
  v6[0] = 0x4073600000000000LL;
  __int128 v4 = &type metadata for Double;
  *(void *)&__int128 v3 = 0x404E000000000000LL;
  memset(&__src[2], 0, 40);
  __src[0] = xmmword_BC230;
  __src[1] = xmmword_BC230;
  sub_1BF14((uint64_t)v6, (uint64_t)&__src[2]);
  sub_7CF4(&v3, (uint64_t)&__src[4] + 8);
  memcpy(v1, __src, 0x70uLL);

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeFeatureListView_tvOS.swift",  61LL,  2LL,  37LL,  0);
  __break(1u);
}

id sub_9C770(void *a1)
{
  unint64_t v8 = a1[2];
  if (v8)
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    uint64_t v6 = a1[8];
    sub_9CE34();
    sub_9CE24();
    swift_bridgeObjectRetain(v6);
  }

  else
  {
    sub_9CE00();
  }

  v17[0] = v2;
  v17[1] = v3;
  v17[2] = v4;
  v17[3] = v5;
  v17[4] = v6;
  sub_9CE2C((uint64_t)v17);
  sub_9CDE8();
  if (v8 <= 1)
  {
    sub_9CE00();
  }

  else
  {
    uint64_t v2 = a1[9];
    uint64_t v3 = a1[10];
    uint64_t v4 = a1[11];
    uint64_t v5 = a1[12];
    uint64_t v6 = a1[13];
    sub_9CE34();
    sub_9CE24();
    swift_bridgeObjectRetain(v6);
  }

  v16[0] = v2;
  v16[1] = v3;
  _OWORD v16[2] = v4;
  v16[3] = v5;
  v16[4] = v6;
  sub_9CE2C((uint64_t)v16);
  sub_9CDE8();
  if (v8 <= 2)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  else
  {
    uint64_t v9 = a1[14];
    uint64_t v10 = a1[15];
    uint64_t v11 = a1[16];
    uint64_t v12 = a1[17];
    uint64_t v13 = a1[18];
    sub_9CE34();
    sub_9CE24();
    swift_bridgeObjectRetain(v13);
  }

  v15[0] = v9;
  v15[1] = v10;
  v15[2] = v11;
  v15[3] = v12;
  v15[4] = v13;
  sub_9CE2C((uint64_t)v15);
  sub_9CBEC(v9, v10, v11, v12, v13);
  return [v1 setNeedsLayout];
}

void *sub_9C8DC()
{
  uint64_t v1 = v0;
  uint64_t v2 = (objc_class *)sub_119B4();
  uint64_t v3 = type metadata accessor for LayoutRect(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  *(void *)&double v5 = __chkstk_darwin(v3).n128_u64[0];
  double v7 = (char *)&v14[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v15.receiver = v1;
  v15.super_class = v2;
  objc_msgSendSuper2(&v15, "layoutSubviews", v5);
  sub_9C9A8(v14);
  [v1 bounds];
  ServiceWelcomeFeatureListLayout.placeChildren(relativeTo:in:)(v8, v9, v10, v11);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return sub_9CD68(v14);
}

id sub_9C9A8@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureLeading);
  uint64_t v4 = type metadata accessor for ServiceWelcomeFeatureView();
  a1[8] = v4;
  a1[9] = &protocol witness table for UIView;
  a1[4] = &protocol witness table for UIView;
  a1[5] = v3;
  double v5 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureCenter);
  a1[3] = v4;
  *a1 = v5;
  id v9 = *(id *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView_featureTrailing);
  a1[27] = v4;
  a1[28] = &protocol witness table for UIView;
  a1[24] = v9;
  id v6 = v3;
  id v7 = v5;
  return v9;
}

double sub_9CB18(double a1)
{
  return sub_9CC28(v1, a1);
}

uint64_t type metadata accessor for ServiceWelcomeFeatureListView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin29ServiceWelcomeFeatureListView);
}

uint64_t sub_9CBEC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3)
  {
    uint64_t v6 = result;
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a5);
    return swift_release(v6);
  }

  return result;
}

double sub_9CC28(uint64_t a1, double a2)
{
  uint64_t v4 = type metadata accessor for FloatingPointRoundingRule(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9C9A8(v14);
  sub_1C8B8((uint64_t)&v15, (uint64_t)v11);
  uint64_t v8 = v12;
  if (v12)
  {
    uint64_t v9 = v13;
    sub_ACA0(v11, v12);
    j___s5JetUI10DimensionsV19defaultRoundingRules013FloatingPointeF0OvgZ(v8, v9);
    AnyDimension.value(in:rounded:)(a1, v7, v8, v9);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v11);
  }

  else
  {
    sub_11788((uint64_t)v11);
  }

  sub_9CD68(v14);
  return a2;
}

void *sub_9CD68(void *a1)
{
  return a1;
}

void *sub_9CD9C(void *a1)
{
  return a1;
}

id sub_9CDD0(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v1 + 4056), 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_9CDE8()
{
  return sub_9CBEC(v0, v1, v2, v3, v4);
}

  ;
}

id sub_9CE18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a1;
  return objc_allocWithZone(v3);
}

uint64_t sub_9CE24()
{
  return swift_bridgeObjectRetain(v0);
}

id sub_9CE2C(uint64_t a1)
{
  return sub_9CE3C(a1, v1);
}

uint64_t sub_9CE34()
{
  return swift_retain(v0);
}

id sub_9CE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  sub_68434(a1, (uint64_t)v20, &qword_F7C28);
  if (v21) {
    NSString v6 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v6 = 0LL;
  }
  sub_9DFDC();

  sub_68434(a1, (uint64_t)v18, &qword_F7C28);
  if (v19) {
    NSString v7 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v7 = 0LL;
  }
  sub_9DFDC();

  sub_68434(a1, (uint64_t)&v13, &qword_F7C28);
  if ((void)v14)
  {
    v16[0] = v13;
    v16[1] = v14;
    uint64_t v17 = v15;
    sub_68434((uint64_t)v16, (uint64_t)&v22, &qword_F4320);
    sub_68434((uint64_t)&v22, (uint64_t)&v23, &qword_F4320);
    uint64_t v8 = v23;
    if (v23)
    {
      uint64_t v9 = *(void **)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_artworkView];
      CGFloat v10 = *(void (**)(uint64_t, uint64_t))&stru_108.segname[(swift_isaMask & *v9) + 16];
      sub_26A80(&v22);
      CGFloat v11 = v9;
      v10(v8, a2);

      sub_4FA64(&v22);
    }
  }

  return [v3 setNeedsLayout];
}

char *sub_9CFC8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)sub_119B4();
  id v10 = objc_allocWithZone(&OBJC_CLASS___UILabel);
  CGFloat v11 = v4;
  double v12 = sub_9DFC4();
  id v14 = objc_msgSend(v10, v13, v12);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_titleLabel] = v14;
  id v15 = objc_allocWithZone(&OBJC_CLASS___UILabel);
  double v16 = sub_9DFC4();
  id v19 = objc_msgSend(v17, v18, v16);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_descriptionLabel] = v19;
  id v20 = objc_allocWithZone((Class)type metadata accessor for ArtworkImageView(0LL));
  uint64_t v21 = (void *)ArtworkImageView.init(artworkSize:frame:)(200.0, 90.0, 0.0, 0.0, 0.0, 0.0);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_artworkView] = v21;
  id v22 = v21;
  sub_B0B10((uint64_t)v22, 90.0);

  v38.receiver = v11;
  v38.super_class = v9;
  id v23 = objc_msgSendSuper2(&v38, "initWithFrame:", a1, a2, a3, a4);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  __n128 v27 = (char *)v23;
  objc_msgSend(v27, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  uint64_t v28 = OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_titleLabel;
  __n128 v29 = *(void **)&v27[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_titleLabel];
  objc_opt_self(&OBJC_CLASS___UIColor);
  id v30 = v29;
  id v31 = sub_11820((uint64_t)v30, "_tvLabelOpacityBColor");
  [v30 setTextColor:v31];

  double v32 = *(void **)&v27[v28];
  sub_668FC(v32, "setNumberOfLines:");
  sub_668FC(v32, "setLineBreakMode:");
  [v32 setTextAlignment:1];
  uint64_t v33 = OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_descriptionLabel;
  id v34 = *(id *)&v27[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_descriptionLabel];
  id v35 = sub_11820((uint64_t)v34, "_tvLabelOpacityBColor");
  [v34 setTextColor:v35];

  __n128 v36 = *(void **)&v27[v33];
  sub_668FC(v36, "setNumberOfLines:");
  sub_668FC(v36, "setLineBreakMode:");
  [v36 setTextAlignment:1];
  sub_9D268();
  sub_9DFEC();
  sub_9DFEC();
  [v27 addSubview:v36];

  return v27;
}

void sub_9D268()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_titleLabel];
  sub_AD98(0LL, &qword_F7C38, &OBJC_CLASS___UIFont_ptr);
  if (qword_F37A8 != -1) {
    swift_once(&qword_F37A8, sub_9D478);
  }
  uint64_t v2 = type metadata accessor for FontUseCase(0LL);
  uint64_t v3 = sub_50698(v2, (uint64_t)qword_F7BD0);
  id v4 = [v0 traitCollection];
  uint64_t v5 = (void *)static UIFont.preferredFont(forUseWith:compatibleWith:)(v3, v4);

  [v1 setFont:v5];
  NSString v6 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_descriptionLabel];
  if (qword_F37A0 != -1) {
    swift_once(&qword_F37A0, sub_9D464);
  }
  uint64_t v7 = sub_50698(v2, (uint64_t)qword_F7BB8);
  id v8 = [v0 traitCollection];
  id v9 = (id)static UIFont.preferredFont(forUseWith:compatibleWith:)(v7, v8);

  [v6 setFont:v9];
}

void sub_9D400()
{
}

id sub_9D464(uint64_t a1)
{
  return sub_9D48C(a1, qword_F7BB8, (id *)&UIFontTextStyleCallout);
}

id sub_9D478(uint64_t a1)
{
  return sub_9D48C(a1, qword_F7BD0, (id *)&UIFontTextStyleHeadline);
}

id sub_9D48C(uint64_t a1, uint64_t *a2, id *a3)
{
  uint64_t v5 = type metadata accessor for FontUseCase(0LL);
  sub_506BC(v5, a2);
  uint64_t v6 = sub_50698(v5, (uint64_t)a2);
  id v8 = *a3;
  *(void *)uint64_t v6 = *a3;
  *(_DWORD *)(v6 + 8) = 0;
  (*(void (**)(void))(*(void *)(v5 - 8) + 104LL))();
  return v8;
}

uint64_t sub_9D50C(uint64_t a1)
{
  uint64_t v2 = v1;
  v10.receiver = v1;
  v10.super_class = (Class)sub_119B4();
  objc_msgSendSuper2(&v10, "traitCollectionDidChange:", a1);
  sub_9D268();
  id v4 = [v1 traitCollection];
  int v5 = UITraitCollection.prefersAccessibilityLayouts.getter();

  if (!a1) {
    return (uint64_t)[v2 setNeedsLayout];
  }
  uint64_t v6 = UITraitCollection.prefersAccessibilityLayouts.getter();
  id v7 = sub_11820(v6, "traitCollection");
  int v8 = UITraitCollection.prefersRightToLeftLayouts.getter() & 1;

  uint64_t result = UITraitCollection.prefersRightToLeftLayouts.getter();
  if ((result & 1) != v8) {
    return (uint64_t)[v2 setNeedsLayout];
  }
  return result;
}

uint64_t sub_9D63C()
{
  uint64_t v1 = (objc_class *)sub_119B4();
  uint64_t v2 = type metadata accessor for LayoutRect(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_B058();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v11 = v10 - v9;
  v17.receiver = v0;
  v17.super_class = v1;
  objc_msgSendSuper2(&v17, "layoutSubviews");
  sub_9D738(v11);
  [v0 bounds];
  VerticalFlowLayout.placeChildren(relativeTo:in:)(v0, v12, v13, v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_9D738@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v57 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v4 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v50 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v7 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v60 = type metadata accessor for VerticalFlowLayout.Child(0LL);
  uint64_t v51 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  CGRect v49 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  double v54 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_44DC(&qword_F3E90);
  uint64_t v53 = v12;
  uint64_t v15 = swift_allocObject( v14,  ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
        + *(void *)(v12 + 72),
          *(unsigned __int8 *)(v12 + 80) | 7LL);
  *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5B40;
  static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v15);
  v67[0] = v15;
  unint64_t v16 = sub_13958();
  uint64_t v17 = sub_44DC(&qword_F3EA0);
  unint64_t v18 = sub_11744();
  uint64_t v52 = v11;
  dispatch thunk of SetAlgebra.init<A>(_:)(v67, v17, v18, v11, v16);
  uint64_t v55 = a1;
  VerticalFlowLayout.init(expandChildrenToFit:children:)(0LL, _swiftEmptyArrayStorage);
  uint64_t v19 = v2;
  uint64_t v45 = v2;
  id v20 = *(void **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_artworkView);
  uint64_t v68 = type metadata accessor for ArtworkImageView(0LL);
  CGFloat v69 = &protocol witness table for UIView;
  v67[0] = v20;
  double v65 = &type metadata for Double;
  double v66 = &protocol witness table for Double;
  uint64_t v63 = 0LL;
  v64[0] = 0x4059000000000000LL;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  unsigned int v59 = enum case for VerticalFlowLayout.HorizontalPlacement.center(_:);
  __int128 v56 = *(void (**)(char *))(v7 + 104);
  uint64_t v21 = v7;
  uint64_t v22 = v50;
  v56(v9);
  unsigned int v48 = enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:);
  uint64_t v23 = v4;
  CGRect v47 = *(void (**)(char *))(v4 + 104);
  __int128 v43 = v6;
  uint64_t v24 = v57;
  v47(v6);
  id v25 = v20;
  __n128 v26 = v49;
  __n128 v27 = v54;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v67,  v64,  &v61,  v6,  v9,  v54);
  uint64_t v58 = *(void (**)(char *, uint64_t))(v23 + 8);
  v58(v6, v24);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v21 + 8);
  v46(v9, v22);
  sub_11788((uint64_t)&v61);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v64);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v67);
  VerticalFlowLayout.addChild(_:)(v26);
  uint64_t v51 = *(void *)(v51 + 8);
  uint64_t v28 = v26;
  uint64_t v29 = v60;
  ((void (*)(char *, uint64_t))v51)(v26, v60);
  id v30 = *(void **)(v19 + OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_titleLabel);
  uint64_t v44 = sub_AD98(0LL, &qword_F7C30, &OBJC_CLASS___UILabel_ptr);
  uint64_t v68 = v44;
  CGFloat v69 = &protocol witness table for UIView;
  v67[0] = v30;
  double v66 = &protocol witness table for Double;
  double v65 = &type metadata for Double;
  uint64_t v63 = 0LL;
  v64[0] = 0x4053000000000000LL;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  ((void (*)(char *, void, uint64_t))v56)(v9, v59, v22);
  id v31 = v43;
  uint64_t v32 = v48;
  uint64_t v33 = v57;
  id v34 = (void (*)(char *, uint64_t, uint64_t))v47;
  ((void (*)(char *, void, uint64_t))v47)(v43, v48, v57);
  id v35 = v30;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v67,  v64,  &v61,  v31,  v9,  v27);
  v58(v31, v33);
  __n128 v36 = v46;
  v46(v9, v22);
  sub_11788((uint64_t)&v61);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v64);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v67);
  VerticalFlowLayout.addChild(_:)(v28);
  uint64_t v37 = v29;
  objc_super v38 = (void (*)(char *, uint64_t))v51;
  ((void (*)(char *, uint64_t))v51)(v28, v37);
  double v39 = *(void **)(v45 + OBJC_IVAR____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView_descriptionLabel);
  uint64_t v68 = v44;
  CGFloat v69 = &protocol witness table for UIView;
  v67[0] = v39;
  double v66 = &protocol witness table for Double;
  double v65 = &type metadata for Double;
  uint64_t v63 = 0LL;
  v64[0] = 0x4047000000000000LL;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  v34(v31, v32, v33);
  ((void (*)(char *, void, uint64_t))v56)(v9, v59, v22);
  id v40 = v39;
  uint64_t v41 = v54;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v67,  v64,  &v61,  v31,  v9,  v54);
  v36(v9, v22);
  v58(v31, v33);
  sub_11788((uint64_t)&v61);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v64);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v67);
  VerticalFlowLayout.addChild(_:)(v28);
  v38(v28, v60);
  return (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v41, v52);
}

double sub_9DD9C(double a1, double a2)
{
  uint64_t v5 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v9 = v8 - v7;
  sub_9D738(v8 - v7);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return v10;
}

uint64_t type metadata accessor for ServiceWelcomeFeatureView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin25ServiceWelcomeFeatureView);
}

double sub_9DEF4(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9D738((uint64_t)v9);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(a1, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

double sub_9DFC4()
{
  return 0.0;
}

id sub_9DFDC()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 1096), v1);
}

id sub_9DFEC()
{
  return [v0 *(SEL *)(v1 + 8)];
}

char *sub_9DFF8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)sub_119B4();
  double v10 = &v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler];
  *(void *)double v10 = 0LL;
  *((void *)v10 + 1) = 0LL;
  uint64_t v11 = (void *)objc_opt_self(&OBJC_CLASS___UIButton);
  uint64_t v12 = v4;
  id v13 = [v11 buttonWithType:1];
  *(void *)&v12[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButton] = v13;

  v21.receiver = v12;
  v21.super_class = v9;
  id v14 = objc_msgSendSuper2(&v21, "initWithFrame:", a1, a2, a3, a4);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  unint64_t v18 = (char *)v14;
  objc_msgSend(v18, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  sub_9E140();
  uint64_t v19 = *(void **)&v18[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButton];
  [v19 addTarget:v18 action:"didTapButton:" forControlEvents:0x2000];
  [v18 addSubview:v19];

  return v18;
}

void sub_9E140()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButton];
  sub_AD98(0LL, &qword_F7C38, &OBJC_CLASS___UIFont_ptr);
  if (qword_F37B0 != -1) {
    swift_once(&qword_F37B0, sub_9E3F4);
  }
  uint64_t v2 = type metadata accessor for FontUseCase(0LL);
  uint64_t v3 = sub_50698(v2, (uint64_t)qword_F7C40);
  id v4 = [v0 traitCollection];
  id v5 = (id)static UIFont.preferredFont(forUseWith:compatibleWith:)(v3, v4);

  [v1 setFont:v5];
}

void sub_9E23C()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler];
  *(void *)uint64_t v1 = 0LL;
  *((void *)v1 + 1) = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeFooterView_tvOS.swift",  56LL,  2LL,  41LL,  0);
  __break(1u);
}

uint64_t sub_9E2C0(uint64_t a1)
{
  uint64_t v2 = v1;
  v9.receiver = v1;
  v9.super_class = (Class)sub_119B4();
  objc_msgSendSuper2(&v9, "traitCollectionDidChange:", a1);
  sub_9E140();
  id v4 = [v1 traitCollection];
  int v5 = UITraitCollection.prefersAccessibilityLayouts.getter();

  if (!a1) {
    return (uint64_t)[v2 setNeedsLayout];
  }
  id v6 = [v2 traitCollection];
  int v7 = UITraitCollection.prefersRightToLeftLayouts.getter() & 1;

  uint64_t result = UITraitCollection.prefersRightToLeftLayouts.getter();
  if ((result & 1) != v7) {
    return (uint64_t)[v2 setNeedsLayout];
  }
  return result;
}

UIFontTextStyle sub_9E3F4()
{
  uint64_t v0 = type metadata accessor for FontUseCase(0LL);
  sub_506BC(v0, qword_F7C40);
  uint64_t v1 = sub_50698(v0, (uint64_t)qword_F7C40);
  *(void *)uint64_t v1 = UIFontTextStyleCallout;
  *(_DWORD *)(v1 + 8) = 2;
  (*(void (**)(void))(*(void *)(v0 - 8) + 104LL))();
  return UIFontTextStyleCallout;
}

uint64_t sub_9E478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = *(void **)(v4 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButton);
  if (a2) {
    NSString v8 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v8 = 0LL;
  }
  [v7 setTitle:v8 forState:0];

  objc_super v9 = (uint64_t *)(v4 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler);
  uint64_t v10 = *(void *)(v4 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler);
  uint64_t v11 = v9[1];
  *objc_super v9 = a3;
  v9[1] = a4;
  sub_4548(a3, a4);
  return sub_AC90(v10, v11);
}

uint64_t sub_9E50C()
{
  uint64_t v1 = (objc_class *)sub_119B4();
  uint64_t v2 = type metadata accessor for LayoutRect(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_B058();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v11 = v10 - v9;
  v17.receiver = v0;
  v17.super_class = v1;
  objc_msgSendSuper2(&v17, "layoutSubviews");
  sub_9E608(v11);
  [v0 bounds];
  VerticalFlowLayout.placeChildren(relativeTo:in:)(v0, v12, v13, v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_9E608@<X0>(uint64_t a1@<X8>)
{
  v28[1] = a1;
  uint64_t v31 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v1 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  id v30 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for VerticalFlowLayout.Child(0LL);
  uint64_t v32 = *(void *)(v7 - 8);
  uint64_t v33 = v7;
  __chkstk_darwin(v7);
  uint64_t v29 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  double v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = sub_44DC(&qword_F3E90);
  uint64_t v14 = swift_allocObject( v13,  ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
        + 3LL * *(void *)(v10 + 72),
          *(unsigned __int8 *)(v10 + 80) | 7LL);
  *(_OWORD *)(v14 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v15 = static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v14);
  static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v15);
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v16);
  v36[0] = v14;
  unint64_t v17 = sub_13958();
  uint64_t v18 = sub_44DC(&qword_F3EA0);
  unint64_t v19 = sub_11744();
  v28[0] = v9;
  dispatch thunk of SetAlgebra.init<A>(_:)(v36, v18, v19, v9, v17);
  VerticalFlowLayout.init(expandChildrenToFit:children:)(0LL, _swiftEmptyArrayStorage);
  v35[0] = *(void *)(v28[2] + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButton);
  uint64_t v20 = sub_AD98(0LL, &qword_F7C90, &OBJC_CLASS___UIButton_ptr);
  LayoutView.withMeasurements(representing:)(v20, &protocol witness table for UIView, 430.0, 70.0);
  v35[3] = &type metadata for Double;
  v35[4] = &protocol witness table for Double;
  v35[0] = 0LL;
  _OWORD v34[3] = &type metadata for CGFloat;
  v34[4] = &protocol witness table for CGFloat;
  v34[0] = 0x4049000000000000LL;
  uint64_t v21 = v4;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))( v6,  enum case for VerticalFlowLayout.HorizontalPlacement.center(_:),  v3);
  uint64_t v22 = v1;
  uint64_t v23 = *(void (**)(char *, void, uint64_t))(v1 + 104);
  id v25 = v30;
  uint64_t v24 = v31;
  v23(v30, enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:), v31);
  __n128 v26 = v29;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v36,  v35,  v34,  v25,  v6,  v12);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v25, v24);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v3);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v36);
  sub_ACC4((uint64_t)v34, &qword_F3EB0);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v35);
  VerticalFlowLayout.addChild(_:)(v26);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v33);
  return (*(uint64_t (**)(char *, void))(v10 + 8))(v12, v28[0]);
}

double sub_9EA30(double a1, double a2)
{
  uint64_t v5 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v9 = v8 - v7;
  sub_9E608(v8 - v7);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return v10;
}

uint64_t sub_9EB20(uint64_t result)
{
  uint64_t v2 = *(void (**)(uint64_t, __n128))(v1
                                              + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView_actionButtonHandler + 8);
    __n128 v5 = swift_retain(v4);
    v2(v3, v5);
    return sub_AC90((uint64_t)v2, v4);
  }

  return result;
}

uint64_t type metadata accessor for ServiceWelcomeFooterView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin24ServiceWelcomeFooterView);
}

double sub_9EC54(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9E608((uint64_t)v9);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(a1, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

UIFontTextStyle sub_9ED24()
{
  uint64_t v0 = type metadata accessor for FontUseCase(0LL);
  sub_506BC(v0, qword_103228);
  uint64_t v1 = sub_50698(v0, (uint64_t)qword_103228);
  *(void *)uint64_t v1 = UIFontTextStyleTitle1;
  *(_DWORD *)(v1 + 8) = 2;
  (*(void (**)(void))(*(void *)(v0 - 8) + 104LL))();
  return UIFontTextStyleTitle1;
}

char *sub_9EDA8(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = (objc_class *)sub_119B4();
  id v10 = objc_allocWithZone(&OBJC_CLASS___UILabel);
  uint64_t v11 = v4;
  id v12 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel] = v12;

  v27.receiver = v11;
  v27.super_class = v9;
  id v13 = objc_msgSendSuper2(&v27, "initWithFrame:", a1, a2, a3, a4);
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  unint64_t v17 = (char *)v13;
  objc_msgSend(v17, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);
  uint64_t v18 = OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel;
  unint64_t v19 = *(void **)&v17[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel];
  uint64_t v20 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v21 = v19;
  id v22 = objc_msgSend(v20, "ams_primaryText");
  [v21 setTextColor:v22];

  uint64_t v23 = *(void **)&v17[v18];
  id v25 = sub_9F928(v24, "setNumberOfLines:");
  sub_9F928((uint64_t)v25, "setLineBreakMode:");
  sub_9EF40();
  [v23 setTextAlignment:1];
  [v17 addSubview:v23];

  return v17;
}

void sub_9EF40()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel];
  sub_AD98(0LL, &qword_F7C38, &OBJC_CLASS___UIFont_ptr);
  if (qword_F37B8 != -1) {
    swift_once(&qword_F37B8, sub_9ED24);
  }
  uint64_t v2 = type metadata accessor for FontUseCase(0LL);
  uint64_t v3 = sub_50698(v2, (uint64_t)qword_103228);
  id v4 = [v0 traitCollection];
  id v5 = (id)static UIFont.preferredFont(forUseWith:compatibleWith:)(v3, v4);

  [v1 setFont:v5];
}

void sub_9F03C()
{
}

uint64_t sub_9F0A0(uint64_t a1)
{
  uint64_t v2 = v1;
  v9.receiver = v1;
  v9.super_class = (Class)sub_119B4();
  objc_msgSendSuper2(&v9, "traitCollectionDidChange:", a1);
  sub_9EF40();
  id v4 = [v1 traitCollection];
  int v5 = UITraitCollection.prefersAccessibilityLayouts.getter();

  if (!a1
    || ((UITraitCollection.prefersAccessibilityLayouts.getter() ^ v5) & 1) != 0
    || (id v6 = [v2 traitCollection],
        int v7 = UITraitCollection.prefersRightToLeftLayouts.getter() & 1,
        v6,
        uint64_t result = UITraitCollection.prefersRightToLeftLayouts.getter(),
        (result & 1) != v7))
  {
    [*(id *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel] setTextAlignment:1];
    return (uint64_t)[v2 setNeedsLayout];
  }

  return result;
}

void sub_9F1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel);
  if (a2) {
    NSString v4 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v4 = 0LL;
  }
  id v5 = v4;
  objc_msgSend(v3, "setText:");
}

double sub_9F248(double a1, double a2)
{
  uint64_t v5 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v9 = v8 - v7;
  sub_9F434(v8 - v7);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  return v10;
}

uint64_t sub_9F338()
{
  uint64_t v1 = (objc_class *)sub_119B4();
  uint64_t v2 = type metadata accessor for LayoutRect(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  sub_B058();
  uint64_t v6 = v5 - v4;
  uint64_t v7 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v11 = v10 - v9;
  v17.receiver = v0;
  v17.super_class = v1;
  objc_msgSendSuper2(&v17, "layoutSubviews");
  sub_9F434(v11);
  [v0 bounds];
  VerticalFlowLayout.placeChildren(relativeTo:in:)(v0, v12, v13, v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
}

uint64_t sub_9F434@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  v33[1] = a1;
  uint64_t v3 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v36 = *(void *)(v3 - 8);
  uint64_t v37 = v3;
  __chkstk_darwin(v3);
  id v35 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for VerticalFlowLayout.Child(0LL);
  uint64_t v38 = *(void *)(v9 - 8);
  uint64_t v39 = v9;
  __chkstk_darwin(v9);
  id v34 = (char *)v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  double v14 = (char *)v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_44DC(&qword_F3E90);
  uint64_t v16 = swift_allocObject( v15,  ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
        + 3LL * *(void *)(v12 + 72),
          *(unsigned __int8 *)(v12 + 80) | 7LL);
  *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v17 = static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v16);
  static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v17);
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v18);
  v43[0] = v16;
  unint64_t v19 = sub_13958();
  uint64_t v20 = sub_44DC(&qword_F3EA0);
  unint64_t v21 = sub_11744();
  v33[0] = v11;
  dispatch thunk of SetAlgebra.init<A>(_:)(v43, v20, v21, v11, v19);
  VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, _swiftEmptyArrayStorage);
  id v22 = *(void **)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView_titleLabel);
  uint64_t v23 = sub_AD98(0LL, &qword_F7C30, &OBJC_CLASS___UILabel_ptr);
  v43[4] = &protocol witness table for UIView;
  v43[3] = v23;
  void v42[4] = &protocol witness table for Double;
  v43[0] = v22;
  v42[3] = &type metadata for Double;
  uint64_t v41 = 0LL;
  v42[0] = 0LL;
  memset(v40, 0, sizeof(v40));
  uint64_t v24 = v6;
  id v25 = *(void (**)(char *, void, uint64_t))(v6 + 104);
  uint64_t v26 = v5;
  v25(v8, enum case for VerticalFlowLayout.HorizontalPlacement.center(_:), v5);
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  uint64_t v29 = v37;
  (*(void (**)(char *, void, uint64_t))(v36 + 104))( v35,  enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:),  v37);
  id v30 = v22;
  uint64_t v31 = v34;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v43,  v42,  v40,  v28,  v8,  v14);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v26);
  sub_11788((uint64_t)v40);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v42);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v43);
  VerticalFlowLayout.addChild(_:)(v31);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v31, v39);
  return (*(uint64_t (**)(char *, void))(v12 + 8))(v14, v33[0]);
}

uint64_t type metadata accessor for ServiceWelcomeHeaderView()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin24ServiceWelcomeHeaderView);
}

double sub_9F858(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9F434((uint64_t)v9);
  double v10 = VerticalFlowLayout.measurements(fitting:in:)(a1, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v10;
}

id sub_9F928(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, 0);
}

void *sub_9F934(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = (void *)a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (void *)(v19 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v19);
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    uint64_t v8 = a2[6];
    v4[5] = a2[5];
    void v4[6] = v8;
    uint64_t v9 = a2[7];
    v4[7] = v9;
    uint64_t v10 = *(int *)(a3 + 28);
    uint64_t v11 = (char *)v4 + v10;
    uint64_t v12 = (uint64_t)a2 + v10;
    uint64_t v13 = type metadata accessor for PageMetrics(0LL);
    double v14 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16LL);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    v14(v11, v12, v13);
    uint64_t v15 = *(int *)(a3 + 32);
    uint64_t v16 = (void *)((char *)v4 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain(v18);
  }

  return v4;
}

uint64_t sub_9FA30(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_9FA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v8;
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for PageMetrics(0LL);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  v13(v10, v11, v12);
  uint64_t v14 = *(int *)(a3 + 32);
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain(v17);
  return a1;
}

void *sub_9FB64(void *a1, void *a2, uint64_t a3)
{
  a1[5] = a2[5];
  uint64_t v6 = a2[6];
  a1[6] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  uint64_t v7 = a2[7];
  a1[7] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 28);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 32);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  *uint64_t v13 = *v14;
  uint64_t v15 = v14[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_9FC30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  *(_OWORD *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  *(_OWORD *)(a1 + *(int *)(a3 + 32)) = *(_OWORD *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t sub_9FCC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 32);
  uint64_t v12 = (void *)(a1 + v11);
  uint64_t v13 = (uint64_t *)(a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_9FD74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9FD80);
}

uint64_t sub_9FD80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for PageMetrics(0LL);
    return sub_4AC4(a1 + *(int *)(a3 + 28), a2, v8);
  }

uint64_t sub_9FDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9FE00);
}

uint64_t sub_9FE00(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 24) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for PageMetrics(0LL);
    return sub_4AD0(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for ServiceWelcomePageDestination(uint64_t a1)
{
  uint64_t result = qword_F7D20;
  if (!qword_F7D20) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceWelcomePageDestination);
  }
  return result;
}

uint64_t sub_9FEA4(uint64_t a1)
{
  v4[0] = "(";
  v4[1] = &unk_BC308;
  v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  uint64_t result = type metadata accessor for PageMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[3] = *(void *)(result - 8) + 64LL;
    void v4[4] = &unk_BC308;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t sub_9FF30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = type metadata accessor for JSONObject(0LL);
  uint64_t v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))( a2,  a1 + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80LL)),  v5);
    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 1LL;
  }

  return sub_4AD0(a2, v7, 1LL, v6);
}

void sub_9FFA8(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v130 = a2;
  uint64_t v117 = a3;
  uint64_t v118 = type metadata accessor for PageMetrics(0LL);
  uint64_t v121 = *(void *)(v118 - 8);
  sub_B088();
  __chkstk_darwin(v4);
  sub_154AC();
  uint64_t v116 = v5;
  uint64_t v134 = type metadata accessor for JSONContext(0LL);
  uint64_t v131 = *(void *)(v134 - 8);
  sub_B088();
  __chkstk_darwin(v6);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v7);
  CGFloat v112 = (char *)&v104 - v8;
  sub_44DC(&qword_F3968);
  sub_B088();
  __chkstk_darwin(v9);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v10);
  uint64_t v122 = (uint64_t)&v104 - v11;
  sub_44DC(&qword_F7D68);
  sub_B088();
  __chkstk_darwin(v12);
  sub_154AC();
  uint64_t v124 = v13;
  sub_44DC(&qword_F41E0);
  sub_B088();
  __chkstk_darwin(v14);
  sub_15758();
  uint64_t v125 = v15;
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v104 - v17;
  uint64_t v19 = type metadata accessor for JSONArray(0LL);
  CGFloat v129 = *(uint64_t (***)(void *, char *, uint64_t))(v19 - 8);
  sub_B088();
  __chkstk_darwin(v20);
  sub_154AC();
  uint64_t v128 = v21;
  uint64_t v22 = type metadata accessor for JSONObject(0LL);
  uint64_t v23 = *(void (***)(uint64_t, uint64_t, uint64_t))(v22 - 8);
  __chkstk_darwin(v22);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v24);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v25);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v26);
  sub_A0F14();
  uint64_t v119 = v27;
  __chkstk_darwin(v28);
  id v30 = (char *)&v104 - v29;
  __chkstk_darwin(v31);
  sub_A0F14();
  uint64_t v123 = v32;
  __chkstk_darwin(v33);
  id v35 = (char *)&v104 - v34;
  __chkstk_darwin(v36);
  uint64_t v38 = (char *)&v104 - v37;
  uint64_t v39 = sub_397F4();
  uint64_t v40 = a1;
  uint64_t v42 = JSONObject.subscript.getter(v39, v41);
  uint64_t v111 = JSONObject.string.getter(v42);
  uint64_t v44 = v43;
  CGFloat v120 = v23;
  uint64_t v45 = v23[1];
  sub_A0EFC((uint64_t)v38);
  if (v44)
  {
    uint64_t v126 = v44;
    uint64_t v127 = v40;
    uint64_t v46 = sub_A0EE0();
    uint64_t v48 = JSONObject.subscript.getter(v46, v47);
    CGRect v49 = v35;
    JSONObject.array.getter(v48);
    sub_A0EFC((uint64_t)v35);
    uint64_t v50 = v45;
    if (sub_4AC4((uint64_t)v18, 1LL, v19) == 1)
    {
      sub_A0ED8();
      sub_ACC4((uint64_t)v18, &qword_F41E0);
LABEL_9:
      sub_8448();
      unint64_t v63 = sub_A0ED0();
      sub_A0E60(v63);
      uint64_t v64 = sub_A0E74();
      *CGRect v49 = 0x736D657469LL;
      v49[1] = 0xE500000000000000LL;
      v49[2] = v64;
      sub_A0E4C(v64, enum case for JSONError.missingProperty(_:));
      sub_8630();
      sub_A0E84();
      ((void (*)(uint64_t, uint64_t))v50)(v127, v22);
      goto LABEL_12;
    }

    CGRect v49 = v128;
    uint64_t v53 = v129;
    uint64_t v54 = v129[4](v128, v18, v19);
    if (JSONArray.count.getter(v54) < 1)
    {
      ((void (*)(void *, uint64_t))v53[1])(v49, v19);
      sub_A0ED8();
      goto LABEL_9;
    }

    uint64_t v55 = v127;
    uint64_t v56 = JSONObject.subscript.getter(0x736E6F74747562LL, 0xE700000000000000LL);
    uint64_t v57 = v125;
    uint64_t v58 = v30;
    JSONObject.array.getter(v56);
    unsigned int v59 = v50;
    ((void (*)(char *, uint64_t))v50)(v30, v22);
    int v60 = sub_4AC4(v57, 1LL, v19);
    uint64_t v107 = v19;
    if (v60 == 1)
    {
      sub_ACC4(v57, &qword_F41E0);
      uint64_t v61 = v124;
      sub_4AD0(v124, 1LL, 1LL, v22);
      __int128 v62 = v129;
LABEL_11:
      sub_A0ED8();
      sub_ACC4(v61, &qword_F7D68);
      sub_8448();
      unint64_t v66 = sub_A0ED0();
      sub_A0E60(v66);
      uint64_t v67 = sub_A0E74();
      *uint64_t v58 = 0x736E6F74747562LL;
      v58[1] = 0xE700000000000000LL;
      v58[2] = v67;
      sub_A0E4C(v67, enum case for JSONError.missingProperty(_:));
      sub_8630();
      sub_A0E84();
      ((void (*)(uint64_t, uint64_t))v50)(v55, v22);
      ((void (*)(void *, uint64_t))v62[1])(v128, v107);
      goto LABEL_12;
    }

    uint64_t v58 = (void *)JSONArray.objects.getter();
    __int128 v62 = v129;
    double v65 = (uint64_t (**)(void *, char *, uint64_t))v129[1];
    ((void (*)(uint64_t, uint64_t))v65)(v57, v19);
    uint64_t v61 = v124;
    sub_9FF30((uint64_t)v58, v124);
    swift_bridgeObjectRelease();
    CGFloat v129 = v65;
    uint64_t v68 = v123;
    v120[4](v123, v61, v22);
    CGFloat v69 = v119;
    uint64_t v70 = sub_A0EF4(1954047348LL, 0xE400000000000000LL);
    CGFloat v71 = (void *)JSONObject.string.getter(v70);
    uint64_t v73 = v72;
    ((void (*)(uint64_t *, uint64_t))v59)(v69, v22);
    if (v73)
    {
      double v106 = v71;
      uint64_t v124 = v73;
      uint64_t v125 = v22;
      uint64_t v74 = v110;
      JSONObject.subscript.getter(0x7274654D65676170LL, 0xEB00000000736369LL);
      uint64_t v75 = v130;
      double v76 = v112;
      double v105 = *(void (**)(void, void, void))(v131 + 16);
      v105(v112, v130, v134);
      uint64_t v77 = v113;
      PageMetrics.init(deserializing:using:)(v74, v76);
      if (v77)
      {
        swift_errorRelease(v77);
        uint64_t v78 = 1LL;
      }

      else
      {
        uint64_t v78 = 0LL;
      }

      uint64_t v81 = v118;
      uint64_t v83 = v121;
      uint64_t v82 = v122;
      uint64_t v84 = v116;
      sub_4AD0(v122, v78, 1LL, v118);
      uint64_t v85 = v82;
      uint64_t v86 = v114;
      sub_A0BD4(v85, v114);
      uint64_t v87 = sub_4AC4(v86, 1LL, v81);
      if ((_DWORD)v87 == 1)
      {
        static PageMetrics.notInstrumented.getter(v87);
        sub_ACC4(v86, &qword_F3968);
      }

      else
      {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v84, v86, v81);
      }

      uint64_t v88 = type metadata accessor for ServiceWelcomePageDestination(0LL);
      double v89 = v117;
      double v90 = *(void (**)(void))(v83 + 32);
      CGFloat v120 = (void (**)(uint64_t, uint64_t, uint64_t))((char *)v117 + *(int *)(v88 + 28));
      v90();
      double v91 = (void *)((char *)v89 + *(int *)(v88 + 32));
      uint64_t v92 = v126;
      uint64_t v119 = v91;
      *double v91 = v111;
      v91[1] = v92;
      uint64_t v93 = type metadata accessor for ActionFactory(0LL);
      swift_initStackObject(v93, v132);
      uint64_t v94 = v115;
      JSONObject.subscript.getter(0x6575676573LL, 0xE500000000000000LL);
      ActionFactory.action(deserializing:using:)(&v133, v94, v75);
      sub_A0EB4(v94);
      sub_7CF4(&v133, (uint64_t)v89);
      uint64_t v95 = v124;
      v89[5] = v106;
      v89[6] = v95;
      uint64_t v96 = v108;
      uint64_t v97 = sub_A0EE0();
      uint64_t v98 = v127;
      JSONObject.subscript.getter(v97, v99);
      uint64_t v100 = v109;
      v105(v109, v75, v134);
      unint64_t v101 = sub_A0C1C();
      uint64_t v102 = Array<A>.init(deserializing:using:)( v96,  v100,  &type metadata for ServiceWelcomePageDestination.Feature,  v101);
      sub_A0EBC();
      uint64_t v103 = sub_A0EB4(v98);
      sub_A0F20(v103, &qword_F3968);
      sub_A0EB4(v123);
      sub_A0EA4();
      v89[7] = v102;
    }

    else
    {
      sub_A0ED8();
      sub_8448();
      unint64_t v79 = sub_A0ED0();
      sub_A0E60(v79);
      uint64_t v80 = sub_A0E74();
      void *v71 = 0xD000000000000010LL;
      v71[1] = 0x80000000000C0020LL;
      v71[2] = v80;
      sub_A0E4C(v80, enum case for JSONError.missingProperty(_:));
      sub_8630();
      sub_A0E84();
      ((void (*)(uint64_t, uint64_t))v59)(v55, v22);
      ((void (*)(uint64_t, uint64_t))v59)(v68, v22);
      ((void (*)(void *, uint64_t))v129)(v128, v107);
    }
  }

  else
  {
    sub_8448();
    unint64_t v51 = sub_A0ED0();
    sub_A0E60(v51);
    uint64_t v52 = sub_A0E74();
    *(void *)&dword_0 = 0x656C746974LL;
    *(void *)&dword_8 = 0xE500000000000000LL;
    *(void *)&dword_10 = v52;
    sub_A0E4C(v52, enum case for JSONError.missingProperty(_:));
    sub_8630();
    sub_A0E84();
    sub_A0EFC(v40);
  }

LABEL_12:
  sub_8314();
}

void sub_A0914(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v5 = type metadata accessor for JSONContext(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = type metadata accessor for JSONObject(0LL);
  v35[1] = *(void *)(v37 - 8);
  sub_B088();
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v35 - v13;
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)v35 - v16;
  type metadata accessor for Artwork(0LL);
  uint64_t v40 = a1;
  JSONObject.subscript.getter(0x6B726F77747261LL, 0xE700000000000000LL);
  uint64_t v39 = v6;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v42 = a2;
  uint64_t v41 = v5;
  v18(v8, a2, v5);
  uint64_t v19 = v36;
  uint64_t v20 = Artwork.__allocating_init(deserializing:using:)(v17, v8);
  if (v19)
  {
    swift_errorRelease(v19);
    uint64_t v36 = 0LL;
  }

  else
  {
    uint64_t v36 = v20;
  }

  uint64_t v21 = v40;
  uint64_t v22 = sub_A0EF4(0x7470697263736564LL, 0xEB000000006E6F69LL);
  uint64_t v23 = JSONObject.string.getter(v22);
  unint64_t v25 = v24;
  sub_A0F0C((uint64_t)v14);
  if (v25) {
    uint64_t v26 = v23;
  }
  else {
    uint64_t v26 = 0LL;
  }
  if (v25) {
    unint64_t v27 = v25;
  }
  else {
    unint64_t v27 = 0xE000000000000000LL;
  }
  uint64_t v28 = sub_397F4();
  uint64_t v30 = sub_A0EF4(v28, v29);
  uint64_t v31 = JSONObject.string.getter(v30);
  unint64_t v33 = v32;
  sub_A0F0C((uint64_t)v11);
  if (!v33)
  {
    uint64_t v31 = 0LL;
    unint64_t v33 = 0xE000000000000000LL;
  }

  (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v42, v41);
  sub_A0F0C(v21);
  uint64_t v34 = v38;
  *uint64_t v38 = v36;
  v34[1] = v26;
  _OWORD v34[2] = v27;
  _OWORD v34[3] = v31;
  v34[4] = v33;
  sub_8314();
}

double sub_A0B3C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!v3)
  {
    double result = *(double *)v7;
    __int128 v6 = v7[1];
    *(_OWORD *)a3 = v7[0];
    *(_OWORD *)(a3 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
    *(void *)(a3 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v8;
  }

  return result;
}

uint64_t sub_A0B80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 28);
  uint64_t v5 = type metadata accessor for PageMetrics(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, v4, v5);
}

void sub_A0BC0(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
}

uint64_t sub_A0BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F3968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_A0C1C()
{
  unint64_t result = qword_F7D70;
  if (!qword_F7D70)
  {
    unint64_t result = swift_getWitnessTable(&unk_BC390, &type metadata for ServiceWelcomePageDestination.Feature);
    atomic_store(result, (unint64_t *)&qword_F7D70);
  }

  return result;
}

uint64_t destroy for ServiceWelcomePageDestination.Feature(void *a1)
{
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t *initializeWithCopy for ServiceWelcomePageDestination.Feature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = a2[4];
  a1[4] = v7;
  swift_retain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t *assignWithCopy for ServiceWelcomePageDestination.Feature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t *assignWithTake for ServiceWelcomePageDestination.Feature(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  uint64_t v5 = a2[2];
  uint64_t v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = a2[4];
  uint64_t v8 = a1[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServiceWelcomePageDestination.Feature(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ServiceWelcomePageDestination.Feature(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ServiceWelcomePageDestination.Feature()
{
  return &type metadata for ServiceWelcomePageDestination.Feature;
}

uint64_t sub_A0E4C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 104LL))(v3, a2, v2);
}

uint64_t sub_A0E60(uint64_t a1)
{
  return swift_allocError(v1, a1, 0LL, 0LL);
}

uint64_t sub_A0E74()
{
  return type metadata accessor for ServiceWelcomePageDestination(0LL);
}

uint64_t sub_A0E84()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 152) + 8LL))( *(void *)(v0 - 160),  *(void *)(v0 - 72));
}

void sub_A0E94()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_A0EA4()
{
  return (*(uint64_t (**)(void, void))(v0 - 168))(*(void *)(v0 - 176), *(void *)(v0 - 344));
}

uint64_t sub_A0EB4(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_A0EBC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 152) + 8LL))(v0, v1);
}

unint64_t sub_A0ED0()
{
  return sub_6F328();
}

uint64_t sub_A0ED8()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 192));
}

uint64_t sub_A0EE0()
{
  return 0x736D657469LL;
}

uint64_t sub_A0EF4(uint64_t a1, uint64_t a2)
{
  return JSONObject.subscript.getter(a1, a2);
}

uint64_t sub_A0EFC(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_A0F04(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_A0F0C(uint64_t a1)
{
  return v2(a1, v1);
}

  ;
}

uint64_t sub_A0F20(uint64_t a1, uint64_t *a2)
{
  return sub_ACC4(*(void *)(v2 - 224), a2);
}

id sub_A0F28(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_A2158();
  sub_A218C(v9);
  id v10 = objc_allocWithZone((Class)type metadata accessor for ServiceWelcomeHeaderView());
  uint64_t v11 = v4;
  id v12 = objc_msgSend(v10, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_headerView] = v12;
  id v13 = objc_allocWithZone((Class)type metadata accessor for ServiceWelcomeFeatureListView());
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_featureListView] = sub_A2160(v13);
  id v14 = objc_allocWithZone((Class)type metadata accessor for ServiceWelcomeFooterView());
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_footerView] = sub_A2160(v14);

  v20.receiver = v11;
  v20.super_class = (Class)sub_A1D98();
  id v15 = objc_msgSendSuper2(&v20, "initWithFrame:", a1, a2, a3, a4);
  double v16 = sub_18700();
  objc_msgSend(v17, v18, v16);
  sub_3E6B0();
  sub_3E6B0();
  sub_3E6B0();

  return v15;
}

void sub_A10AC()
{
  uint64_t v1 = sub_A2158();
  sub_A218C(v1);

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomePageView_tvOS.swift",  54LL,  2LL,  36LL,  0);
  __break(1u);
}

void sub_A1138()
{
  uint64_t v2 = type metadata accessor for LayoutRect(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = sub_A213C();
  uint64_t v5 = type metadata accessor for VerticalFlowLayout(v4);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  sub_186A4();
  sub_44DC(&qword_F6DB8);
  sub_B088();
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v10 = v9 - v8;
  v18.receiver = v0;
  v18.super_class = (Class)sub_A1D98();
  objc_msgSendSuper2(&v18, "layoutSubviews");
  uint64_t v11 = (uint64_t)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_destination];
  swift_beginAccess(&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_destination], v17, 0LL, 0LL);
  sub_A20F4(v11, v10);
  uint64_t v12 = sub_A2158();
  LODWORD(v11) = sub_4AC4(v10, 1LL, v12);
  sub_ACC4(v10, &qword_F6DB8);
  if ((_DWORD)v11 != 1)
  {
    sub_A1400();
    [v0 bounds];
    VerticalFlowLayout.placeChildren(relativeTo:in:)(v0, v13, v14, v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    sub_A21BC(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }

  sub_855C();
}

void sub_A12C4(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_B058();
  uint64_t v10 = v9 - v8;
  sub_A1400();
  VerticalFlowLayout.measurements(fitting:in:)(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  sub_18700();
}

void sub_A1400()
{
  uint64_t v1 = v0;
  uint64_t v45 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v2 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  sub_154AC();
  uint64_t v4 = v3;
  uint64_t v44 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v49 = *(void *)(v44 - 8);
  sub_B088();
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v8 = v7 - v6;
  uint64_t v52 = type metadata accessor for VerticalFlowLayout.Child(0LL);
  uint64_t v46 = *(void *)(v52 - 8);
  sub_B088();
  __chkstk_darwin(v9);
  sub_154AC();
  uint64_t v43 = v10;
  uint64_t v11 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_B058();
  uint64_t v53 = v14 - v13;
  uint64_t v15 = sub_44DC(&qword_F3E90);
  uint64_t v48 = v12;
  uint64_t v16 = swift_allocObject( v15,  ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
        + 3LL * *(void *)(v12 + 72),
          *(unsigned __int8 *)(v12 + 80) | 7LL);
  *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v17 = static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v16);
  static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v17);
  static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter(v18);
  v56[0] = v16;
  unint64_t v19 = sub_13958();
  uint64_t v20 = sub_44DC(&qword_F3EA0);
  unint64_t v21 = sub_11744();
  dispatch thunk of SetAlgebra.init<A>(_:)(v56, v20, v21, v11, v19);
  VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, _swiftEmptyArrayStorage);
  uint64_t v22 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_headerView);
  uint64_t v23 = type metadata accessor for ServiceWelcomeHeaderView();
  uint64_t v58 = &protocol witness table for UIView;
  uint64_t v57 = v23;
  uint64_t v55 = &protocol witness table for Double;
  v56[0] = (uint64_t)v22;
  double v24 = sub_A2178((uint64_t)&type metadata for Double);
  unsigned int v42 = enum case for VerticalFlowLayout.HorizontalPlacement.center(_:);
  uint64_t v41 = *(void (**)(uint64_t, double))(v49 + 104);
  v41(v8, v24);
  unsigned int v51 = enum case for VerticalFlowLayout.VerticalPlacement.firstBaseline(_:);
  uint64_t v50 = *(void (**)(uint64_t))(v2 + 104);
  v50(v4);
  id v25 = v22;
  uint64_t v26 = sub_2AD60();
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v26,  v27,  v28,  v4,  v8,  v53);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v4, v45);
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v8, v44);
  sub_ACC4((uint64_t)v54, &qword_F3EB0);
  sub_2AD48();
  VerticalFlowLayout.addChild(_:)(v43);
  uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
  v47(v43, v52);
  uint64_t v29 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_featureListView);
  uint64_t v57 = type metadata accessor for ServiceWelcomeFeatureListView();
  uint64_t v58 = &protocol witness table for UIView;
  v56[0] = (uint64_t)v29;
  uint64_t v55 = &protocol witness table for Double;
  double v30 = sub_A2178((uint64_t)&type metadata for Double);
  ((void (*)(uint64_t, void, uint64_t, double))v41)(v8, v42, v44, v30);
  ((void (*)(uint64_t, void, uint64_t))v50)(v4, v51, v45);
  id v31 = v29;
  uint64_t v32 = sub_2AD60();
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v32,  v33,  v34,  v4,  v8,  v53);
  sub_A21B0(v4);
  sub_A21A0();
  sub_ACC4((uint64_t)v54, &qword_F3EB0);
  sub_2AD48();
  VerticalFlowLayout.addChild(_:)(v43);
  v47(v43, v52);
  id v35 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_footerView);
  uint64_t v57 = type metadata accessor for ServiceWelcomeFooterView();
  uint64_t v58 = &protocol witness table for UIView;
  v56[0] = (uint64_t)v35;
  uint64_t v55 = &protocol witness table for Double;
  double v36 = sub_A2178((uint64_t)&type metadata for Double);
  ((void (*)(uint64_t, void, uint64_t, double))v41)(v8, v42, v44, v36);
  ((void (*)(uint64_t, void, uint64_t))v50)(v4, v51, v45);
  id v37 = v35;
  uint64_t v38 = sub_2AD60();
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( v38,  v39,  v40,  v4,  v8,  v53);
  sub_A21B0(v4);
  sub_A21A0();
  sub_ACC4((uint64_t)v54, &qword_F3EB0);
  sub_2AD48();
  VerticalFlowLayout.addChild(_:)(v43);
  v47(v43, v52);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v53, v11);
  sub_855C();
}

id sub_A18DC()
{
  return objc_msgSend(v0, "measurementsWithFitting:in:", v0);
}

void sub_A1940(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  sub_44DC(&qword_F6DB8);
  sub_B088();
  __chkstk_darwin(v8);
  uint64_t v9 = sub_A213C();
  uint64_t v10 = type metadata accessor for ServiceWelcomePageDestination(v9);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_9F1F0(*(void *)(a1 + *(int *)(v14 + 32)), *(void *)(a1 + *(int *)(v14 + 32) + 8));
  sub_9C770(*(void **)(a1 + 56));
  uint64_t v15 = *(void *)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_footerView];
  uint64_t v23 = *(void *)(a1 + 40);
  uint64_t v24 = v15;
  uint64_t v22 = *(void *)(a1 + 48);
  uint64_t v16 = swift_allocObject(&unk_E7530, 24LL, 7LL);
  swift_unknownObjectWeakInit(v16 + 16);
  sub_A1F08(a1, (uint64_t)v13);
  uint64_t v17 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v18 = (v17 + 24) & ~v17;
  unint64_t v19 = (v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v20 = swift_allocObject(&unk_E7558, v19 + 8, v17 | 7);
  *(void *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = v16;
  sub_A2018((uint64_t)v13, v20 + v18);
  *(void *)(v20 + v19) = a3;
  swift_retain(v16);
  swift_retain(a3);
  sub_9E478(v23, v22, (uint64_t)sub_A205C, v20);
  swift_release();
  swift_release();
  sub_A1F08(a1, v4);
  sub_4AD0(v4, 0LL, 1LL, v10);
  uint64_t v21 = (uint64_t)&v5[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_destination];
  swift_beginAccess(&v5[OBJC_IVAR____TtC20StoreDynamicUIPlugin22ServiceWelcomePageView_destination], v25, 33LL, 0LL);
  sub_A20AC(v4, v21);
  swift_endAccess(v25);
  [v5 setNeedsLayout];
  sub_855C();
}

uint64_t sub_A1B30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a2 + 16;
  swift_beginAccess(a2 + 16, v9, 0LL, 0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(v6);
  if (result)
  {
    uint64_t v8 = (void *)result;
    sub_A1BA4(a3, a4);

    return swift_release();
  }

  return result;
}

uint64_t sub_A1BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = sub_A213C();
  uint64_t v9 = type metadata accessor for MetricsFieldsContext(v7, v8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_186A4();
  uint64_t v11 = type metadata accessor for ResultingActionDispatcher(0LL);
  uint64_t v12 = type metadata accessor for BaseObjectGraph(0LL);
  inject<A, B>(_:from:)(v11, a2, v11, v12);
  uint64_t v13 = *(void *)&v18[0];
  __n128 v14 = inject<A, B>(_:from:)(v9, a2, v9, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t, __n128))(v10 + 16))(v2, v3, v9, v14);
  uint64_t v15 = sub_44DC((uint64_t *)&unk_F6780);
  sub_4AD0(v2, 0LL, 1LL, v15);
  memset(v18, 0, sizeof(v18));
  char v19 = -1;
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _OWORD *))(*(void *)v13 + 216LL))(a1, v2, a2, v18);
  swift_release();
  sub_ACC4((uint64_t)v18, &qword_F5090);
  sub_A1EA8(v2);
  sub_A21BC(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  return v16;
}

id sub_A1D08()
{
  v2.receiver = v0;
  v2.super_class = (Class)sub_A1D98();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_A1D98()
{
  return type metadata accessor for ServiceWelcomePageView(0LL);
}

uint64_t type metadata accessor for ServiceWelcomePageView(uint64_t a1)
{
  uint64_t result = qword_F7DC0;
  if (!qword_F7DC0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceWelcomePageView);
  }
  return result;
}

void sub_A1DD8(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 4LL, v4, a1 + 80);
  }

void sub_A1E54(uint64_t a1)
{
  if (!qword_F7DD0)
  {
    uint64_t v2 = type metadata accessor for ServiceWelcomePageDestination(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_F7DD0);
    }
  }

uint64_t sub_A1EA8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ResultingActionDispatcher.MetricsBehavior(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_A1EE4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_A1F08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ServiceWelcomePageDestination(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A1F4C()
{
  uint64_t v1 = sub_A2158();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 8;
  swift_release();
  uint64_t v7 = (void *)(v0 + v4);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __n128 v8 = (char *)v7 + *(int *)(v1 + 28);
  uint64_t v9 = type metadata accessor for PageMetrics(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject(v0, v6, v5);
}

uint64_t sub_A2018(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for ServiceWelcomePageDestination(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A205C(uint64_t a1)
{
  uint64_t v3 = *(void *)(sub_A2158() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  return sub_A1B30( a1,  *(void *)(v1 + 16),  v1 + v4,  *(void *)(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFF8LL)));
}

uint64_t sub_A20AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F6DB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A20F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_44DC(&qword_F6DB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_A213C()
{
  return 0LL;
}

uint64_t sub_A2158()
{
  return type metadata accessor for ServiceWelcomePageDestination(0LL);
}

id sub_A2160(void *a1)
{
  return objc_msgSend(a1, *(SEL *)(v1 + 4056), 0.0, 0.0, 0.0, 0.0);
}

double sub_A2178@<D0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 144) = a1;
  *(void *)(v1 - 176) = 0LL;
  *(void *)(v1 - 168) = 0LL;
  double result = 0.0;
  *(_OWORD *)(v1 - 208) = 0u;
  *(_OWORD *)(v1 - 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
  return result;
}

uint64_t sub_A218C(uint64_t a1)
{
  return sub_4AD0(v1, 1LL, 1LL, a1);
}

uint64_t sub_A21A0()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 256))(v1, v0);
}

uint64_t sub_A21B0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 248))(a1, v1);
}

uint64_t sub_A21BC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

id sub_A21C8(uint64_t a1, uint64_t a2)
{
  uint64_t v49 = a1;
  uint64_t v5 = type metadata accessor for Bag(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v51 = v5;
  uint64_t v52 = v6;
  __chkstk_darwin(v5);
  sub_154AC();
  uint64_t v50 = v7;
  sub_44DC(&qword_F3968);
  sub_8690();
  __chkstk_darwin(v8);
  sub_154AC();
  uint64_t v48 = v9;
  type metadata accessor for MetricsFieldsContext(0LL, v10);
  sub_8690();
  __chkstk_darwin(v11);
  sub_154AC();
  uint64_t v44 = v12;
  uint64_t v13 = type metadata accessor for MetricsPipeline(0LL);
  uint64_t v47 = *(void *)(v13 - 8);
  uint64_t v14 = v47;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  char v19 = (char *)&v43 - v18;
  v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_didApply] = 0;
  id v20 = objc_allocWithZone((Class)type metadata accessor for ServiceWelcomePageView(0LL));
  uint64_t v21 = v2;
  id v22 = objc_msgSend(v20, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageView] = v22;
  sub_A1F08(a1, (uint64_t)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_destination]);
  uint64_t v43 = OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_objectGraph;
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_objectGraph] = a2;
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_visualEffect] = objc_msgSend(objc_allocWithZone(AMSUICommonVisualEffectView), "init", swift_retain(a2).n128_f64[0]);
  uint64_t v23 = type metadata accessor for AppMetricsPresenter(0LL);
  type metadata accessor for BaseObjectGraph(0LL);
  sub_A3250(v23, a2, v23);
  uint64_t v24 = v54;
  id v25 = v19;
  uint64_t v45 = v13;
  uint64_t v46 = v19;
  sub_A3250(v13, a2, v13);
  uint64_t v26 = sub_44DC(&qword_F4030);
  sub_A3250(v26, a2, v26);
  uint64_t v27 = v54;
  uint64_t v28 = v55;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v16, v25, v13);
  swift_retain(v24);
  swift_unknownObjectRetain(v27);
  uint64_t v29 = v44;
  static MetricsFieldsContext.createFieldsContext(impressionsTracker:)(v27, v28, v30);
  swift_unknownObjectRelease(v27);
  uint64_t v31 = sub_3C794();
  uint64_t v32 = v48;
  sub_4AD0(v48, 1LL, 1LL, v31);
  uint64_t v33 = sub_3C758();
  swift_allocObject(v33, *(unsigned int *)(v33 + 48), *(unsigned __int16 *)(v33 + 52));
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_metricsPresenter] = PageMetricsPresenter.init(appMetrics:pipeline:context:data:)(v24, v16, v29, v32);
  uint64_t v35 = v50;
  uint64_t v34 = v51;
  sub_A3250(v51, a2, v51);
  type metadata accessor for DynamicViewController(0LL);
  __n128 v36 = swift_retain(*(void *)&v21[v43]);
  uint64_t v37 = static DynamicViewController.setupPageRenderPresenterWrapper(with:bag:)(v36);
  swift_release();
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter] = v37;
  type metadata accessor for Unstable.ImpressionsCalculator(0LL, v38);
  uint64_t v39 = swift_unknownObjectRetain(v27);
  *(void *)&v21[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_impressionsCalculator] = Unstable.ImpressionsCalculator.__allocating_init(impressionableThreshold:tracker:)(v39, v28, 0.5);

  uint64_t v40 = (objc_class *)sub_A311C();
  v53.receiver = v21;
  v53.super_class = v40;
  id v41 = objc_msgSendSuper2(&v53, "initWithNibName:bundle:", 0, 0);
  swift_release();
  swift_unknownObjectRelease(v27);
  swift_release();
  sub_A31FC(v49);
  (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v35, v34);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v45);
  return v41;
}

void sub_A2580()
{
  v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_didApply] = 0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomePageViewController_tvOS.swift",  64LL,  2LL,  47LL,  0);
  __break(1u);
}

void sub_A2600()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_A311C();
  sub_3C774((uint64_t)v8.super_class, "didReceiveMemoryWarning", v1, v2, v3, v4, v5, v6, v8);
  sub_3C758();
  ViewControllerPresenter.viewDidReceiveMemoryWarning()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 208LL))();
  }
  sub_21464();
}

void sub_A269C()
{
  uint64_t v7 = sub_A311C();
  sub_A3294(v7, "viewDidAppear:");
  PageMetricsPresenter.viewDidAppear()();
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v5 + 184LL))(v3, v4);
    sub_A2158();
    uint64_t v6 = sub_3C794();
    sub_A3238(v6);
    sub_A327C( enum case for PageRenderMetricsPresenter.ActivityEnd.fetchPrimaryDataCompleted(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 104));
    sub_A3258();
    sub_3E6EC(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }

  sub_8738();
}

void sub_A27B4()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_A311C();
  sub_3C760((uint64_t)v8.super_class, "viewDidDisappear:", v1, v2, v3, v4, v5, v6, v8);
  sub_3C758();
  ViewControllerPresenter.viewDidDisappear()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 192LL))();
  }
  sub_21464();
}

void sub_A2860()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for PageRenderMetricsPresenter.ActivityEnd(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v20.receiver = v0;
  v20.super_class = (Class)sub_A311C();
  id v4 = objc_msgSendSuper2(&v20, "viewDidLoad");
  id v5 = sub_118D0((uint64_t)v4, "navigationController");
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 setNavigationBarHidden:1 animated:0];
  }

  id v7 = sub_3C74C();
  if (!v7)
  {
    __break(1u);
    goto LABEL_10;
  }

  objc_super v8 = v7;
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v10 = objc_msgSend(v9, "ams_clear");
  sub_A3288((uint64_t)v10, "setBackgroundColor:");

  uint64_t v11 = *(void **)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_visualEffect];
  id v12 = [(id)objc_opt_self(UIBlurEffect) effectWithStyle:4];
  sub_A3288((uint64_t)v12, "setEffect:");

  id v13 = objc_msgSend(v9, "ams_clear");
  [v11 setBackgroundColor:v13];

  id v14 = sub_3C74C();
  if (!v14)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  uint64_t v15 = v14;
  [v14 addSubview:v11];

  id v16 = sub_3C74C();
  if (!v16)
  {
LABEL_11:
    __break(1u);
    return;
  }

  uint64_t v17 = v16;
  [v16 addSubview:*(void *)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageView]];

  sub_3C758();
  ViewControllerPresenter.viewDidLoad()();
  uint64_t v18 = *(void *)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter];
  if (v18)
  {
    (*(void (**)(void))(*(void *)v18 + 168LL))();
    sub_A2158();
    uint64_t v19 = sub_3C794();
    sub_A3238(v19);
    sub_A327C( enum case for PageRenderMetricsPresenter.ActivityEnd.fetchPrimaryDataCompleted(_:),  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 104));
    sub_A3258();
    sub_3E6EC(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  }

void sub_A2AF8()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_A311C();
  sub_3C760((uint64_t)v8.super_class, "viewWillAppear:", v1, v2, v3, v4, v5, v6, v8);
  sub_3C758();
  ViewControllerPresenter.viewWillAppear()();
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter];
  if (v7) {
    (*(void (**)(void))(*(void *)v7 + 176LL))();
  }
  sub_21464();
}

void sub_A2BA4()
{
  uint64_t v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_A311C();
  v6[0] = v0;
  v6[1] = v4;
  sub_A3294(v4, "viewWillDisappear:");
  sub_3C788();
  PageMetricsPresenter.viewWillDisappear(forReason:)(v3);
  sub_3C79C();
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageRenderPresenter);
  if (v5)
  {
    sub_3C788();
    (*(void (**)(char *))(*(void *)v5 + 200LL))(v3);
    sub_3C79C();
  }

  sub_8738();
}

id sub_A2C98()
{
  v22.receiver = v0;
  v22.super_class = (Class)sub_A311C();
  id v7 = sub_3C774((uint64_t)v22.super_class, "viewWillLayoutSubviews", v1, v2, v3, v4, v5, v6, v22);
  id result = sub_118D0((uint64_t)v7, "view");
  if (result)
  {
    uint64_t v9 = result;
    [result bounds];
    sub_11878();

    double v10 = sub_18700();
    sub_A2F58((uint64_t)objc_msgSend(v11, v12, v10));
    sub_11878();
    id v13 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_pageView];
    objc_msgSend(v13, "sizeThatFits:", v14, v15);
    double v17 = v16;
    double v19 = v18;
    v23.origin.x = sub_18700();
    CGFloat v20 = CGRectGetMidX(v23) - v17 * 0.5;
    v24.origin.x = sub_18700();
    CGFloat v21 = CGRectGetMidY(v24) - v19 * 0.5;
    v25.origin.x = sub_18700();
    return objc_msgSend(v13, "setFrame:", v20, v21, CGRectGetWidth(v25), v19);
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_A2DF8()
{
  v7.receiver = v0;
  v7.super_class = (Class)sub_A311C();
  sub_3C774((uint64_t)v7.super_class, "viewDidLayoutSubviews", v1, v2, v3, v4, v5, v6, v7);
  sub_A2E5C();
}

void sub_A2E5C()
{
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_didApply) & 1) == 0)
  {
    *(_BYTE *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_didApply) = 1;
    uint64_t v4 = v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_destination;
    sub_A1940( v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_destination,  *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_impressionsCalculator),  *(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceWelcomePageViewController_objectGraph));
    uint64_t v5 = v4 + *(int *)(sub_A2158() + 28);
    uint64_t v6 = sub_3C794();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(v3, v5, v6);
    sub_4AD0((uint64_t)v3, 0LL, 1LL, v6);
    PageMetricsPresenter.data.setter(v3);
  }

void sub_A2F58(uint64_t a1)
{
  id v5 = sub_118D0(a1, "view");
  if (v5)
  {
    uint64_t v6 = v5;
    [v5 bounds];
    sub_11878();

    id v8 = sub_118D0(v7, "view");
    if (v8)
    {
      uint64_t v9 = v8;
      [v8 safeAreaInsets];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      CGRect.subtracting(insets:)(v11, v13, v15, v17, v1, v2, v3, v4);
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

void sub_A3028()
{
}

id sub_A3078()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_A311C();
  return sub_3C774((uint64_t)v8.super_class, "dealloc", v1, v2, v3, v4, v5, v6, v8);
}

uint64_t sub_A311C()
{
  return type metadata accessor for ServiceWelcomePageViewController(0LL);
}

uint64_t type metadata accessor for ServiceWelcomePageViewController(uint64_t a1)
{
  uint64_t result = qword_F7E40;
  if (!qword_F7E40) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ServiceWelcomePageViewController);
  }
  return result;
}

uint64_t sub_A315C(uint64_t a1)
{
  uint64_t result = type metadata accessor for ServiceWelcomePageDestination(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_BC408;
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[3] = (char *)&value witness table for Builtin.NativeObject + 64;
    void v4[4] = (char *)&value witness table for Builtin.NativeObject + 64;
    void v4[5] = &unk_BC420;
    void v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 8LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_A31FC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ServiceWelcomePageDestination(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_A3238(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 16LL))(v1, v2, a1);
}

uint64_t sub_A3250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return inject<A, B>(_:from:)(a1, a2, a3, v3);
}

uint64_t sub_A3258()
{
  return (*(uint64_t (**)(uint64_t))(*(void *)v0 + 160LL))(v1);
}

  ;
}

uint64_t sub_A327C@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v3, a1, v2);
}

id sub_A3288(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id sub_A3294(uint64_t a1, const char *a2)
{
  return objc_msgSendSuper2((objc_super *)(v3 - 64), a2, v2 & 1);
}

uint64_t SingleComponentLayout.init(view:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_7CF4(a1, a2);
}

uint64_t SingleComponentLayout.placeChildren(relativeTo:in:)( uint64_t a1, double a2, double a3, double a4, double a5)
{
  return LayoutRect.init(origin:measurements:)(a2);
}

void SingleComponentLayout.measurements(fitting:in:)(uint64_t a1)
{
  uint64_t v3 = v1[3];
  sub_ACA0(v1, v3);
  dispatch thunk of Measurable.measurements(fitting:in:)(a1, v3);
}

  ;
}

void sub_A33B8()
{
}

unint64_t sub_A33E8()
{
  unint64_t result = qword_F7E50;
  if (!qword_F7E50)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for SingleComponentLayout,  &type metadata for SingleComponentLayout);
    atomic_store(result, (unint64_t *)&qword_F7E50);
  }

  return result;
}

ValueMetadata *type metadata accessor for SingleComponentLayout()
{
  return &type metadata for SingleComponentLayout;
}

ValueMetadata *type metadata accessor for SingleComponentLayout.Metrics()
{
  return &type metadata for SingleComponentLayout.Metrics;
}

id sub_A3444(char a1)
{
  *(_BYTE *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox__isChecked) = a1;
  return [*(id *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView) reloadData];
}

id sub_A3468(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_title);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_title + 8);
  *uint64_t v3 = a1;
  v3[1] = a2;
  swift_bridgeObjectRelease(v4);
  return [*(id *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView) reloadData];
}

char *sub_A34A8(double a1, double a2, double a3, double a4)
{
  uint64_t v11 = type metadata accessor for UICollectionLayoutListConfiguration.Appearance(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = sub_A4184();
  uint64_t v14 = type metadata accessor for UICollectionLayoutListConfiguration(v13);
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  sub_186A4();
  v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox__isChecked] = 0;
  *(_OWORD *)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_title] = xmmword_BC520;
  v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_didSelectCollectionViewCell] = 0;
  sub_AD98(0LL, &qword_F7F78, &OBJC_CLASS___UICollectionViewCompositionalLayout_ptr);
  (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))( v5,  enum case for UICollectionLayoutListConfiguration.Appearance.plain(_:),  v11);
  double v16 = v4;
  UICollectionLayoutListConfiguration.init(appearance:)(v5);
  double v17 = (void *)static UICollectionViewCompositionalLayout.list(using:)(v6);
  sub_A41C4(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
  id v18 = objc_msgSend( objc_allocWithZone(UICollectionView),  "initWithFrame:collectionViewLayout:",  v17,  0.0,  0.0,  0.0,  0.0);
  *(void *)&v16[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView] = v18;

  v34.receiver = v16;
  v34.super_class = (Class)type metadata accessor for StandaloneTableViewCheckbox();
  double v19 = (char *)objc_msgSendSuper2(&v34, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v20 = OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView;
  CGFloat v21 = *(void **)&v19[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView];
  objc_super v22 = v19;
  id v23 = sub_A41E4((uint64_t)v22, "setDataSource:");
  sub_A41E4((uint64_t)v23, "setDelegate:");
  [v21 setClipsToBounds:0];
  uint64_t v24 = sub_AD98(0LL, (unint64_t *)&unk_F7F80, &OBJC_CLASS___UICollectionViewListCell_ptr);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v24);
  id v26 = v21;
  NSString v27 = sub_A41A0();
  [v26 registerClass:ObjCClassFromMetadata forCellWithReuseIdentifier:v27];

  uint64_t v28 = *(void **)&v19[v20];
  [v22 addSubview:v28];
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v32 = v28;
  sub_B05E8(1LL, UIEdgeInsetsZero.top, left, bottom, right);

  return v22;
}

void sub_A3748()
{
  v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox__isChecked] = 0;
  *(_OWORD *)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_title] = xmmword_BC520;
  v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_didSelectCollectionViewCell] = 0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/StandaloneTableViewCheckbox.swift",  54LL,  2LL,  51LL,  0);
  __break(1u);
}

void sub_A37E8()
{
  uint64_t v1 = type metadata accessor for IndexPath(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  sub_B058();
  uint64_t v5 = v4 - v3;
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for StandaloneTableViewCheckbox();
  objc_msgSendSuper2(&v8, "layoutSubviews");
  if ((v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_didSelectCollectionViewCell] & 1) == 0)
  {
    v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_didSelectCollectionViewCell] = 1;
    uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_collectionView];
    IndexPath.init(item:section:)(0LL, 0LL);
    NSIndexPath v9 = IndexPath._bridgeToObjectiveC()();
    Class isa = v9.super.isa;
    (*(void (**)(uint64_t, uint64_t, NSUInteger, void *))(v2 + 8))(v5, v1, v9._length, v9._reserved);
    [v6 selectItemAtIndexPath:isa animated:1 scrollPosition:0];
  }

void sub_A390C(void *a1)
{
  uint64_t v3 = v1;
  sub_44DC(&qword_F7F68);
  sub_B088();
  __chkstk_darwin(v5);
  sub_154AC();
  uint64_t v37 = v6;
  uint64_t v7 = type metadata accessor for UICellAccessory.CheckmarkOptions(0LL);
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v39 = v7;
  sub_B088();
  __chkstk_darwin(v8);
  sub_B058();
  uint64_t v11 = v10 - v9;
  uint64_t v12 = type metadata accessor for UICellAccessory.DisplayedState(0LL);
  uint64_t v35 = *(void *)(v12 - 8);
  uint64_t v36 = v12;
  sub_B088();
  __chkstk_darwin(v13);
  sub_B058();
  uint64_t v16 = v15 - v14;
  uint64_t v17 = type metadata accessor for UIListContentConfiguration(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  sub_53728();
  NSString v19 = sub_A41A0();
  uint64_t v20 = (void *)IndexPath._bridgeToObjectiveC()();
  id v21 = [a1 dequeueReusableCellWithReuseIdentifier:v19 forIndexPath:v20];

  uint64_t v22 = objc_opt_self(&OBJC_CLASS___UICollectionViewListCell);
  swift_dynamicCastObjCClassUnconditional(v21, v22, 0LL, 0LL, 0LL);
  UICollectionViewListCell.defaultContentConfiguration()();
  uint64_t v23 = *(void *)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_title);
  uint64_t v24 = *(void *)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox_title + 8);
  swift_bridgeObjectRetain(v24);
  UIListContentConfiguration.text.setter(v23, v24);
  v40[3] = v17;
  v40[4] = &protocol witness table for UIListContentConfiguration;
  CGRect v25 = sub_AE98(v40);
  (*(void (**)(void *, uint64_t, uint64_t))(v18 + 16))(v25, v2, v17);
  id v26 = v21;
  UICollectionViewCell.contentConfiguration.setter(v40);

  if (*(_BYTE *)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox__isChecked) == 1)
  {
    uint64_t v27 = sub_44DC(&qword_F7F70);
    sub_A41D0();
    sub_A41B0();
    uint64_t v31 = (void *)swift_allocObject(v27, (v29 & ~v28) + v30, v28 | 7);
    *((_OWORD *)v31 + 1) = xmmword_B5B40;
    (*(void (**)(uint64_t, void, uint64_t))(v35 + 104))( v16,  enum case for UICellAccessory.DisplayedState.always(_:),  v36);
    uint64_t v32 = type metadata accessor for UICellAccessory.LayoutDimension(0LL);
    sub_A41D8(v37, v33, v34, v32);
    UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2LL, v37, 0LL);
    static UICellAccessory.checkmark(displayed:options:)(v16, v11);
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v11, v39);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v16, v36);
  }

  else
  {
    uint64_t v31 = _swiftEmptyArrayStorage;
  }

  UICollectionViewListCell.accessories.setter(v31);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v2, v17);
  sub_855C();
}

void sub_A3C8C(void *a1)
{
  uint64_t v5 = v1;
  sub_44DC(&qword_F7F68);
  sub_B088();
  __chkstk_darwin(v7);
  uint64_t v8 = sub_A4184();
  uint64_t v9 = type metadata accessor for UICellAccessory.CheckmarkOptions(v8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  sub_186A4();
  uint64_t v11 = type metadata accessor for UICellAccessory.DisplayedState(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_53728();
  NSIndexPath v28 = IndexPath._bridgeToObjectiveC()();
  Class isa = v28.super.isa;
  id v27 = objc_msgSend(a1, "cellForItemAtIndexPath:", v28.super.isa, v28._reserved);

  if (v27)
  {
    uint64_t v14 = objc_opt_self(&OBJC_CLASS___UICollectionViewListCell);
    if (!swift_dynamicCastObjCClass(v27, v14))
    {
      sub_855C();

      return;
    }

    sub_A3EA0();
    if ((v15 & 1) != 0)
    {
      uint64_t v16 = _swiftEmptyArrayStorage;
    }

    else
    {
      uint64_t v18 = sub_44DC(&qword_F7F70);
      sub_A41D0();
      sub_A41B0();
      uint64_t v16 = (void *)swift_allocObject(v18, (v20 & ~v19) + v21, v19 | 7);
      *((_OWORD *)v16 + 1) = xmmword_B5B40;
      (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))( v4,  enum case for UICellAccessory.DisplayedState.always(_:),  v11);
      uint64_t v22 = type metadata accessor for UICellAccessory.LayoutDimension(0LL);
      sub_A41D8(v2, v23, v24, v22);
      UICellAccessory.CheckmarkOptions.init(isHidden:reservedLayoutWidth:tintColor:)(2LL, v2, 0LL);
      static UICellAccessory.checkmark(displayed:options:)(v4, v3);
      sub_A41C4(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v4, v11);
    }

    UICollectionViewListCell.accessories.setter(v16);
    sub_A3EA0();
    char v26 = v25;

    *(_BYTE *)(v5 + OBJC_IVAR____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox__isChecked) = v26 & 1;
  }

  sub_855C();
}

void sub_A3EA0()
{
  uint64_t v26 = type metadata accessor for UICellAccessory.AccessoryType(0LL);
  uint64_t v28 = *(void *)(v26 - 8);
  sub_B088();
  __chkstk_darwin(v0);
  char v25 = (char *)v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v2);
  uint64_t v24 = (char *)v19 - v3;
  uint64_t v27 = sub_A41D0();
  uint64_t v4 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  sub_154AC();
  uint64_t v23 = v5;
  uint64_t v6 = UICollectionViewListCell.accessories.getter();
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    unint64_t v8 = (*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
    v19[1] = v6;
    unint64_t v9 = v6 + v8;
    unsigned int v22 = enum case for UICellAccessory.AccessoryType.checkmark(_:);
    uint64_t v10 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v4 + 16);
    uint64_t v20 = *(void *)(v4 + 72);
    uint64_t v21 = v10;
    uint64_t v11 = v23;
    uint64_t v12 = v24;
    uint64_t v13 = v27;
    uint64_t v14 = v28;
    uint64_t v16 = v25;
    uint64_t v15 = v26;
    do
    {
      uint64_t v17 = v21(v11, v9, v13);
      UICellAccessory.accessoryType.getter(v17);
      (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, v22, v15);
      int v29 = static UICellAccessory.AccessoryType.== infix(_:_:)(v12, v16);
      uint64_t v18 = *(void (**)(char *, uint64_t))(v14 + 8);
      v18(v16, v15);
      v18(v12, v15);
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v11, v13);
      if ((v29 & 1) != 0) {
        break;
      }
      v9 += v20;
      --v7;
    }

    while (v7);
  }

  swift_bridgeObjectRelease();
  sub_855C();
}

id sub_A40F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StandaloneTableViewCheckbox();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StandaloneTableViewCheckbox()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin27StandaloneTableViewCheckbox);
}

uint64_t sub_A4184()
{
  return 0LL;
}

NSString sub_A41A0()
{
  return String._bridgeToObjectiveC()();
}

  ;
}

uint64_t sub_A41C4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_A41D0()
{
  return type metadata accessor for UICellAccessory(0LL);
}

uint64_t sub_A41D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_4AD0(a1, 1LL, 1LL, a4);
}

id sub_A41E4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v3, a2, v2);
}

id sub_A41F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreDynamicUIPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_A4240()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StoreDynamicUIPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for StoreDynamicUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS___StoreDynamicUIPlugin);
}

uint64_t sub_A4290()
{
  if (qword_F3758 != -1) {
    swift_once(&qword_F3758, sub_708A4);
  }
  uint64_t v0 = swift_bridgeObjectRetain(qword_1031C0);
  uint64_t result = sub_3324C(v0);
  qword_103240 = (uint64_t)_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_A4304()
{
  return sub_72718(&qword_F37C0, &qword_103240);
}

void *sub_A4330()
{
  uint64_t result = sub_A434C();
  qword_103248 = (uint64_t)result;
  return result;
}

void *sub_A434C()
{
  if (qword_F3760 != -1) {
    swift_once(&qword_F3760, sub_71014);
  }
  swift_bridgeObjectRetain(qword_1031C8);
  sub_33270();
  if (qword_F37E0 != -1) {
    swift_once(&qword_F37E0, sub_A4600);
  }
  swift_bridgeObjectRetain(qword_103260);
  sub_33270();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_A43F4()
{
  return sub_72718(&qword_F37C8, &qword_103248);
}

void sub_A4420()
{
  if (qword_F3768 != -1) {
    swift_once(&qword_F3768, sub_71734);
  }
  swift_bridgeObjectRetain(qword_1031D0);
  sub_33320();
  qword_103250 = (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_A4494()
{
  return sub_72718(&qword_F37D0, &qword_103250);
}

uint64_t sub_A44C0()
{
  if (qword_F3770 != -1) {
    swift_once(&qword_F3770, sub_71A24);
  }
  uint64_t v0 = swift_bridgeObjectRetain(qword_1031D8);
  uint64_t result = sub_333D0(v0);
  qword_103258 = (uint64_t)_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_A4534()
{
  return sub_72718(&qword_F37D8, &qword_103258);
}

id sub_A4560()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SubscriptionsDynamicUIPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_A45B0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SubscriptionsDynamicUIPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SubscriptionsDynamicUIPlugin()
{
  return objc_opt_self(&OBJC_CLASS___SubscriptionsDynamicUIPlugin);
}

void sub_A4600()
{
  qword_103260 = (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_A4614()
{
  if (qword_F37E0 != -1) {
    swift_once(&qword_F37E0, sub_A4600);
  }
  return swift_bridgeObjectRetain(qword_103260);
}

uint64_t sub_A4654()
{
  return sub_A4614();
}

unint64_t sub_A4668(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DF090, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_A46B0@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_A4668(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_A46DC@<X0>(uint64_t a1@<X8>)
{
  return sub_8260(v1 + 128, a1);
}

void sub_A46E8(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = sub_E9C0(v8);
  uint64_t v10 = type metadata accessor for DynamicTextFactory(0LL);
  sub_E9C0(v10);
  uint64_t v11 = type metadata accessor for TextGradient(0LL);
  uint64_t v32 = a1;
  sub_64AC( 0x746E656964617267LL,  0xEF736E6F6974704FLL,  v11,  (uint64_t)sub_A4D0C,  (uint64_t)v31,  v12,  v13,  v14,  v29,  v30,  SBYTE4(v30),  BYTE5(v30));
  if (v2)
  {
    uint64_t v16 = sub_8440();
    sub_851C(v16);
    sub_8770();
    sub_E9EC();
    uint64_t v17 = sub_8484();
    sub_E998(v17);
  }

  else
  {
    uint64_t v37 = v9;
    uint64_t v18 = sub_A5ADC(v15);
    __chkstk_darwin(v18);
    sub_E9AC();
    sub_6D040();
    uint64_t v30 = a2 + 8;
    sub_D970((uint64_t)&v36, a2 + 8, &qword_F3930);
    v35[0] = sub_6F270();
    v35[1] = v19;
    uint64_t v20 = AnyHashable.init<A>(_:)(v35, &type metadata for String, &protocol witness table for String);
    __chkstk_darwin(v20);
    *(&v29 - _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a1;
    sub_5868(0xD000000000000011LL, 0x80000000000BD350LL, v11, (uint64_t)sub_D960, (uint64_t)(&v29 - 4), v21, v22, v23);
    sub_D970((uint64_t)v7, a2 + *(int *)(v11 + 36), &qword_F3838);
    __chkstk_darwin(v24);
    *(&v29 - _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v37;
    *(&v29 - 1) = a1;
    sub_5844();
    sub_D970((uint64_t)v35, a2 + *(int *)(v11 + 40), &qword_F38F8);
    __chkstk_darwin(v25);
    sub_E9AC();
    sub_6D040();
    sub_D970((uint64_t)&v34, a2 + 48, &qword_F3930);
    __chkstk_darwin(v26);
    sub_E9AC();
    sub_6D040();
    uint64_t v27 = type metadata accessor for JSONObject(0LL);
    sub_851C(v27);
    sub_E9EC();
    sub_8770();
    uint64_t v28 = sub_8484();
    sub_E998(v28);
    sub_7CF4(&v33, a2 + 88);
  }

void sub_A4B84(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

uint64_t sub_A4B98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (v8)
  {
    uint64_t v12 = sub_8484();
    sub_E998(v12);
    uint64_t v13 = sub_8440();
    return sub_851C(v13);
  }

  else
  {
    unsigned __int8 v10 = v9;
    char v11 = sub_6F368();
    char v15 = sub_6F368();
    uint64_t v16 = sub_8484();
    sub_E998(v16);
    uint64_t v17 = sub_8440();
    sub_851C(v17);
    if ((v15 & 1) != 0) {
      int v18 = 0x10000;
    }
    else {
      int v18 = 0;
    }
    if ((v11 & 1) != 0) {
      int v19 = 256;
    }
    else {
      int v19 = 0;
    }
    return v19 & 0xFFFFFF00 | v10 | v18;
  }

uint64_t sub_A4CAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_A4B98(a1, a2, a3, a4, a5, a6, a7, a8);
  if (!v8) {
    return sub_A5ADC(result);
  }
  return result;
}

uint64_t type metadata accessor for TextGradient(uint64_t a1)
{
  uint64_t result = qword_F8098;
  if (!qword_F8098) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TextGradient);
  }
  return result;
}

void sub_A4D0C(uint64_t a1@<X8>)
{
  *(_WORD *)a1 = v2;
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v3;
}

uint64_t storeEnumTagSinglePayload for TextGradient.GradientStyle( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_A4D88 + 4 * byte_BC5F5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_A4DBC + 4 * byte_BC5F0[v4]))();
}

uint64_t sub_A4DBC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_A4DC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xA4DCCLL);
  }
  return result;
}

uint64_t sub_A4DD8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xA4DE0LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_A4DE4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_A4DEC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TextGradient.GradientStyle()
{
  return &type metadata for TextGradient.GradientStyle;
}

uint64_t sub_A4E08(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *(void *)uint64_t v4 = *a2;
    uint64_t v4 = v11 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain(v11);
  }

  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((_BYTE *)a2 + 2);
    uint64_t v7 = (_OWORD *)(a1 + 8);
    uint64_t v8 = a2 + 1;
    uint64_t v9 = a2[4];
    if (v9)
    {
      uint64_t v10 = a2[5];
      *(void *)(v4 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v9;
      *(void *)(v4 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v10;
      (**(void (***)(_OWORD *, _OWORD *))(v9 - 8))(v7, v8);
    }

    else
    {
      __int128 v12 = *(_OWORD *)(a2 + 3);
      *uint64_t v7 = *v8;
      *(_OWORD *)(v4 + 24) = v12;
      *(void *)(v4 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = a2[5];
    }

    uint64_t v13 = (_OWORD *)(v4 + 48);
    uint64_t v14 = a2 + 6;
    uint64_t v15 = a2[9];
    if (v15)
    {
      uint64_t v16 = a2[10];
      *(void *)(v4 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v15;
      *(void *)(v4 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v16;
      (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
    }

    else
    {
      __int128 v17 = *((_OWORD *)a2 + 4);
      *uint64_t v13 = *v14;
      *(_OWORD *)(v4 + 64) = v17;
      *(void *)(v4 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = a2[10];
    }

    __int128 v18 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v18;
    (**(void (***)(uint64_t, uint64_t))(v18 - 8))(v4 + 88, (uint64_t)(a2 + 11));
    __int128 v19 = *(_OWORD *)(a2 + 19);
    *(_OWORD *)(v4 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v19;
    (**(void (***)(uint64_t, uint64_t))(v19 - 8))(v4 + 128, (uint64_t)(a2 + 16));
    uint64_t v20 = *(int *)(a3 + 36);
    uint64_t v21 = (void *)(v4 + v20);
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v22, 1LL, v23))
    {
      uint64_t v24 = sub_44DC(&qword_F3838);
      memcpy(v21, v22, *(void *)(*(void *)(v24 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v23 - 8) + 16LL))(v21, v22, v23);
      sub_4AD0((uint64_t)v21, 0LL, 1LL, v23);
    }

    uint64_t v25 = *(int *)(a3 + 40);
    uint64_t v26 = v4 + v25;
    uint64_t v27 = (uint64_t)a2 + v25;
    uint64_t v28 = *(uint64_t *)((char *)a2 + v25 + 24);
    if (v28)
    {
      uint64_t v29 = *(void *)(v27 + 32);
      *(void *)(v26 + 24) = v28;
      *(void *)(v26 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v29;
      (**(void (***)(void))(v28 - 8))();
    }

    else
    {
      __int128 v30 = *(_OWORD *)(v27 + 16);
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v27;
      *(_OWORD *)(v26 + swift_unknownObjectWeakDestroy(v0 + 16) = v30;
      *(void *)(v26 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v27 + 32);
    }
  }

  return v4;
}

void *sub_A4FE4(void *a1, uint64_t a2)
{
  if (a1[4]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 1);
  }
  if (a1[9]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 6);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 11);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 16);
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 36);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t result = (void *)((char *)a1 + *(int *)(a2 + 40));
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t sub_A5098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 2);
  uint64_t v6 = a1 + 8;
  uint64_t v7 = a2 + 8;
  uint64_t v8 = *(void *)(a2 + 32);
  if (v8)
  {
    uint64_t v9 = *(void *)(a2 + 40);
    *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v8;
    *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v9;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v6, v7);
  }

  else
  {
    __int128 v10 = *(_OWORD *)(v7 + 16);
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
    *(_OWORD *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = v10;
    *(void *)(v6 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v7 + 32);
  }

  uint64_t v11 = (_OWORD *)(a1 + 48);
  __int128 v12 = (_OWORD *)(a2 + 48);
  uint64_t v13 = *(void *)(a2 + 72);
  if (v13)
  {
    uint64_t v14 = *(void *)(a2 + 80);
    *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v13;
    *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v14;
    (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
  }

  else
  {
    __int128 v15 = *(_OWORD *)(a2 + 64);
    *uint64_t v11 = *v12;
    *(_OWORD *)(a1 + 64) = v15;
    *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 80);
  }

  __int128 v16 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v16;
  (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1 + 88, a2 + 88);
  __int128 v17 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v17;
  (**(void (***)(uint64_t, uint64_t))(v17 - 8))(a1 + 128, a2 + 128);
  uint64_t v18 = *(int *)(a3 + 36);
  __int128 v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v20, 1LL, v21))
  {
    uint64_t v22 = sub_44DC(&qword_F3838);
    memcpy(v19, v20, *(void *)(*(void *)(v22 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v19, v20, v21);
    sub_4AD0((uint64_t)v19, 0LL, 1LL, v21);
  }

  uint64_t v23 = *(int *)(a3 + 40);
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  uint64_t v26 = *(void *)(a2 + v23 + 24);
  if (v26)
  {
    uint64_t v27 = *(void *)(v25 + 32);
    *(void *)(v24 + 24) = v26;
    *(void *)(v24 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v27;
    (**(void (***)(void))(v26 - 8))();
  }

  else
  {
    __int128 v28 = *(_OWORD *)(v25 + 16);
    *(_OWORD *)uint64_t v24 = *(_OWORD *)v25;
    *(_OWORD *)(v24 + swift_unknownObjectWeakDestroy(v0 + 16) = v28;
    *(void *)(v24 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v25 + 32);
  }

  return a1;
}

uint64_t sub_A5248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 2);
  uint64_t v6 = a1 + 8;
  uint64_t v7 = (__int128 *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 32);
  if (*(void *)(a1 + 32))
  {
    if (v8)
    {
      sub_4290((void *)(a1 + 8), (void *)(a2 + 8));
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 8));
  }

  else if (v8)
  {
    *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v8;
    *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 40);
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 8, a2 + 8);
    goto LABEL_8;
  }

  __int128 v9 = *v7;
  __int128 v10 = v7[1];
  *(void *)(v6 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v7 + 4);
  *(_OWORD *)uint64_t v6 = v9;
  *(_OWORD *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = v10;
LABEL_8:
  uint64_t v11 = *(void *)(a2 + 72);
  if (*(void *)(a1 + 72))
  {
    if (v11)
    {
      sub_4290((void *)(a1 + 48), (void *)(a2 + 48));
      goto LABEL_15;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 48));
  }

  else if (v11)
  {
    *(void *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v11;
    *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 80);
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 48, a2 + 48);
    goto LABEL_15;
  }

  __int128 v12 = *(_OWORD *)(a2 + 48);
  __int128 v13 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v12;
  *(_OWORD *)(a1 + 64) = v13;
LABEL_15:
  sub_4290((void *)(a1 + 88), (void *)(a2 + 88));
  sub_4290((void *)(a1 + 128), (void *)(a2 + 128));
  uint64_t v14 = *(int *)(a3 + 36);
  __int128 v15 = (void *)(a1 + v14);
  __int128 v16 = (const void *)(a2 + v14);
  uint64_t v17 = type metadata accessor for ImpressionMetrics(0LL);
  int v18 = sub_4AC4((uint64_t)v15, 1LL, v17);
  int v19 = sub_4AC4((uint64_t)v16, 1LL, v17);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v15, v16, v17);
      sub_4AD0((uint64_t)v15, 0LL, 1LL, v17);
      goto LABEL_21;
    }

    goto LABEL_20;
  }

  uint64_t v20 = *(void *)(v17 - 8);
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v15, v17);
LABEL_20:
    uint64_t v21 = sub_44DC(&qword_F3838);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64LL));
    goto LABEL_21;
  }

  (*(void (**)(void *, const void *, uint64_t))(v20 + 24))(v15, v16, v17);
LABEL_21:
  uint64_t v22 = *(int *)(a3 + 40);
  uint64_t v23 = a1 + v22;
  uint64_t v24 = (__int128 *)(a2 + v22);
  uint64_t v25 = *((void *)v24 + 3);
  if (!*(void *)(a1 + v22 + 24))
  {
    if (v25)
    {
      *(void *)(v23 + 24) = v25;
      *(void *)(v23 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v24 + 4);
      (**(void (***)(uint64_t, __int128 *))(v25 - 8))(v23, v24);
      return a1;
    }

uint64_t sub_A54B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 2);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 40);
  __int128 v6 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v6;
  *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 80);
  __int128 v7 = *(_OWORD *)(a2 + 88);
  __int128 v8 = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v8;
  *(_OWORD *)(a1 + 88) = v7;
  *(void *)(a1 + 16_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 160);
  __int128 v9 = *(_OWORD *)(a2 + 144);
  uint64_t v10 = *(int *)(a3 + 36);
  uint64_t v11 = (void *)(a1 + v10);
  __int128 v12 = (const void *)(a2 + v10);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v9;
  uint64_t v13 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v12, 1LL, v13))
  {
    uint64_t v14 = sub_44DC(&qword_F3838);
    memcpy(v11, v12, *(void *)(*(void *)(v14 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v13 - 8) + 32LL))(v11, v12, v13);
    sub_4AD0((uint64_t)v11, 0LL, 1LL, v13);
  }

  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = a1 + v15;
  uint64_t v17 = a2 + v15;
  __int128 v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = v18;
  *(void *)(v16 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v17 + 32);
  return a1;
}

uint64_t sub_A55E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_BYTE *)(a1 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_BYTE *)(a2 + 2);
  uint64_t v6 = a1 + 8;
  uint64_t v7 = a2 + 8;
  if (*(void *)(a1 + 32)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 8));
  }
  __int128 v8 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
  *(_OWORD *)(v6 + swift_unknownObjectWeakDestroy(v0 + 16) = v8;
  *(void *)(v6 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v7 + 32);
  if (*(void *)(a1 + 72)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 48));
  }
  __int128 v9 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v9;
  *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 80);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 88));
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(void *)(a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 120);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 128));
  __int128 v10 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v10;
  *(void *)(a1 + 16_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(void *)(a2 + 160);
  uint64_t v11 = *(int *)(a3 + 36);
  __int128 v12 = (void *)(a1 + v11);
  uint64_t v13 = (const void *)(a2 + v11);
  uint64_t v14 = type metadata accessor for ImpressionMetrics(0LL);
  int v15 = sub_4AC4((uint64_t)v12, 1LL, v14);
  int v16 = sub_4AC4((uint64_t)v13, 1LL, v14);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
      sub_4AD0((uint64_t)v12, 0LL, 1LL, v14);
      goto LABEL_11;
    }

    goto LABEL_10;
  }

  uint64_t v17 = *(void *)(v14 - 8);
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v12, v14);
LABEL_10:
    uint64_t v18 = sub_44DC(&qword_F3838);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64LL));
    goto LABEL_11;
  }

  (*(void (**)(void *, const void *, uint64_t))(v17 + 40))(v12, v13, v14);
LABEL_11:
  uint64_t v19 = *(int *)(a3 + 40);
  uint64_t v20 = a1 + v19;
  if (*(void *)(a1 + v19 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v19));
  }
  __int128 v21 = *(_OWORD *)(a2 + v19 + 16);
  *(_OWORD *)uint64_t v20 = *(_OWORD *)(a2 + v19);
  *(_OWORD *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = v21;
  *(void *)(v20 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + v19 + 32);
  return a1;
}

uint64_t sub_A57B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_A57C4);
}

uint64_t sub_A57C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 112);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F3838);
    return sub_4AC4(a1 + *(int *)(a3 + 36), a2, v8);
  }

uint64_t sub_A583C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_A5848);
}

uint64_t sub_A5848(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_44DC(&qword_F3838);
    return sub_4AD0(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }

  return result;
}

void sub_A58B8(uint64_t a1)
{
  v4[0] = &unk_BC688;
  v4[1] = &unk_BC6A0;
  v4[2] = &unk_BC6A0;
  v4[3] = &unk_BC6B8;
  void v4[4] = &unk_BC6B8;
  sub_5260(319LL);
  if (v3 <= 0x3F)
  {
    void v4[5] = *(void *)(v2 - 8) + 64LL;
    void v4[6] = &unk_BC6A0;
    swift_initStructMetadata(a1, 256LL, 7LL, v4, a1 + 16);
  }

uint64_t getEnumTagSinglePayload for TextGradient.GradientOptions(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v3 = -1;
    return (v3 + 1);
  }

  if (a2 >= 0xFF)
  {
    if ((a2 + 33554177) >> 24)
    {
      int v2 = a1[3];
      if (a1[3]) {
        goto LABEL_5;
      }
    }

    else
    {
      int v2 = *(unsigned __int16 *)(a1 + 3);
      if (*(_WORD *)(a1 + 3))
      {
LABEL_5:
        int v3 = (*(unsigned __int16 *)a1 | (a1[2] << 16) | (v2 << 24)) - 16776962;
        return (v3 + 1);
      }
    }
  }

  unsigned int v4 = a1[1];
  BOOL v5 = v4 >= 2;
  int v3 = (v4 + 2147483646) & 0x7FFFFFFF;
  if (!v5) {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for TextGradient.GradientOptions( uint64_t result, unsigned int a2, unsigned int a3)
{
  if ((a3 + 33554177) >> 24) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3 <= 0xFE) {
    int v3 = 0;
  }
  if (a2 > 0xFE)
  {
    *(_WORD *)uint64_t result = a2 - 255;
    *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = (a2 - 255) >> 16;
    if (v3)
    {
      unsigned int v4 = ((a2 - 255) >> 24) + 1;
      if (v3 == 2) {
        *(_WORD *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v4;
      }
      else {
        *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v4;
      }
    }
  }

  else
  {
    if (!v3) {
      goto LABEL_10;
    }
    if (v3 == 2)
    {
      *(_WORD *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0;
LABEL_10:
      if (!a2) {
        return result;
      }
LABEL_16:
      *(_BYTE *)(result + 1) = a2 + 1;
      return result;
    }

    *(_BYTE *)(result + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = 0;
    if (a2) {
      goto LABEL_16;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TextGradient.GradientOptions()
{
  return &type metadata for TextGradient.GradientOptions;
}

unint64_t sub_A5A5C()
{
  unint64_t result = qword_F80E8;
  if (!qword_F80E8)
  {
    uint64_t v1 = type metadata accessor for TextGradient(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BC6E0, v1);
    atomic_store(result, (unint64_t *)&qword_F80E8);
  }

  return result;
}

unint64_t sub_A5AA0()
{
  unint64_t result = qword_F80F0;
  if (!qword_F80F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_BC788, &type metadata for TextGradient.GradientStyle);
    atomic_store(result, (unint64_t *)&qword_F80F0);
  }

  return result;
}

uint64_t sub_A5ADC(uint64_t result)
{
  _BYTE *v1 = result;
  v1[1] = BYTE1(result) & 1;
  v1[2] = BYTE2(result) & 1;
  return result;
}

uint64_t sub_A5AF4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = v5 + ((v4 + 16LL) & ~(unint64_t)v4);
    swift_retain(v5);
  }

  else
  {
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    uint64_t v8 = a2[2];
    *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v8;
    __int128 v9 = a2 + 3;
    uint64_t v10 = a2[6];
    swift_retain(v5);
    __n128 v11 = swift_retain(v8);
    if (v10)
    {
      uint64_t v12 = a2[7];
      *(void *)(a1 + 48) = v10;
      *(void *)(a1 + 56) = v12;
      (**(void (***)(uint64_t, uint64_t, uint64_t, __n128))(v10 - 8))(a1 + 24, (uint64_t)v9, v10, v11);
    }

    else
    {
      __int128 v13 = *((_OWORD *)v9 + 1);
      *(_OWORD *)(a1 + 24) = *(_OWORD *)v9;
      *(_OWORD *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v13;
      *(void *)(a1 + 56) = v9[4];
    }

    __int128 v14 = *(_OWORD *)(a2 + 11);
    *(_OWORD *)(a1 + 88) = v14;
    (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 64, (uint64_t)(a2 + 8));
    __int128 v15 = *((_OWORD *)a2 + 8);
    *(_OWORD *)(a1 + 128) = v15;
    (**(void (***)(uint64_t, uint64_t))(v15 - 8))(a1 + 104, (uint64_t)(a2 + 13));
    uint64_t v16 = *(int *)(a3 + 40);
    uint64_t v17 = (void *)(a1 + v16);
    uint64_t v18 = (char *)a2 + v16;
    uint64_t v19 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v18, 1LL, v19))
    {
      uint64_t v20 = sub_44DC(&qword_F3838);
      memcpy(v17, v18, *(void *)(*(void *)(v20 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v19 - 8) + 16LL))(v17, v18, v19);
      sub_4AD0((uint64_t)v17, 0LL, 1LL, v19);
    }

    uint64_t v21 = *(int *)(a3 + 44);
    uint64_t v22 = a1 + v21;
    uint64_t v23 = (uint64_t)a2 + v21;
    uint64_t v24 = *(uint64_t *)((char *)a2 + v21 + 24);
    if (v24)
    {
      uint64_t v25 = *(void *)(v23 + 32);
      *(void *)(v22 + 24) = v24;
      *(void *)(v22 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v25;
      (**(void (***)(void))(v24 - 8))();
    }

    else
    {
      __int128 v26 = *(_OWORD *)(v23 + 16);
      *(_OWORD *)uint64_t v22 = *(_OWORD *)v23;
      *(_OWORD *)(v22 + swift_unknownObjectWeakDestroy(v0 + 16) = v26;
      *(void *)(v22 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v23 + 32);
    }
  }

  return a1;
}

void *sub_A5CB8(void *a1, uint64_t a2)
{
  if (a1[6]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 3);
  }
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 8);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 13);
  uint64_t v4 = (uint64_t)a1 + *(int *)(a2 + 40);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  unint64_t result = (void *)((char *)a1 + *(int *)(a2 + 44));
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t sub_A5D6C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v7 = a2[2];
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  uint64_t v8 = a2 + 3;
  uint64_t v9 = a2[6];
  swift_retain(v6);
  __n128 v10 = swift_retain(v7);
  if (v9)
  {
    uint64_t v11 = a2[7];
    *(void *)(a1 + 48) = v9;
    *(void *)(a1 + 56) = v11;
    (**(void (***)(uint64_t, uint64_t, uint64_t, __n128))(v9 - 8))(a1 + 24, (uint64_t)v8, v9, v10);
  }

  else
  {
    __int128 v12 = *((_OWORD *)v8 + 1);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v8;
    *(_OWORD *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v12;
    *(void *)(a1 + 56) = v8[4];
  }

  __int128 v13 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(a1 + 88) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 64, (uint64_t)(a2 + 8));
  __int128 v14 = *((_OWORD *)a2 + 8);
  *(_OWORD *)(a1 + 128) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 104, (uint64_t)(a2 + 13));
  uint64_t v15 = *(int *)(a3 + 40);
  uint64_t v16 = (void *)(a1 + v15);
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v17, 1LL, v18))
  {
    uint64_t v19 = sub_44DC(&qword_F3838);
    memcpy(v16, v17, *(void *)(*(void *)(v19 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, char *, uint64_t))(*(void *)(v18 - 8) + 16LL))(v16, v17, v18);
    sub_4AD0((uint64_t)v16, 0LL, 1LL, v18);
  }

  uint64_t v20 = *(int *)(a3 + 44);
  uint64_t v21 = a1 + v20;
  uint64_t v22 = (uint64_t)a2 + v20;
  uint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 24);
  if (v23)
  {
    uint64_t v24 = *(void *)(v22 + 32);
    *(void *)(v21 + 24) = v23;
    *(void *)(v21 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v24;
    (**(void (***)(void))(v23 - 8))();
  }

  else
  {
    __int128 v25 = *(_OWORD *)(v22 + 16);
    *(_OWORD *)uint64_t v21 = *(_OWORD *)v22;
    *(_OWORD *)(v21 + swift_unknownObjectWeakDestroy(v0 + 16) = v25;
    *(void *)(v21 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v22 + 32);
  }

  return a1;
}

uint64_t sub_A5F0C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  *(void *)a1 = *a2;
  swift_retain(v6);
  swift_release();
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  uint64_t v7 = a2[2];
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v7;
  swift_retain(v7);
  swift_release();
  uint64_t v8 = a2[6];
  if (*(void *)(a1 + 48))
  {
    if (v8)
    {
      sub_4290((void *)(a1 + 24), a2 + 3);
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 24));
  }

  else if (v8)
  {
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = a2[7];
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 24, (uint64_t)(a2 + 3));
    goto LABEL_8;
  }

  __int128 v9 = *(_OWORD *)(a2 + 3);
  __int128 v10 = *(_OWORD *)(a2 + 5);
  *(void *)(a1 + 56) = a2[7];
  *(_OWORD *)(a1 + 24) = v9;
  *(_OWORD *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v10;
LABEL_8:
  sub_4290((void *)(a1 + 64), a2 + 8);
  sub_4290((void *)(a1 + 104), a2 + 13);
  uint64_t v11 = *(int *)(a3 + 40);
  __int128 v12 = (void *)(a1 + v11);
  __int128 v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for ImpressionMetrics(0LL);
  int v15 = sub_4AC4((uint64_t)v12, 1LL, v14);
  int v16 = sub_4AC4((uint64_t)v13, 1LL, v14);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(void *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
      sub_4AD0((uint64_t)v12, 0LL, 1LL, v14);
      goto LABEL_14;
    }

    goto LABEL_13;
  }

  uint64_t v17 = *(void *)(v14 - 8);
  if (v16)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v12, v14);
LABEL_13:
    uint64_t v18 = sub_44DC(&qword_F3838);
    memcpy(v12, v13, *(void *)(*(void *)(v18 - 8) + 64LL));
    goto LABEL_14;
  }

  (*(void (**)(void *, char *, uint64_t))(v17 + 24))(v12, v13, v14);
LABEL_14:
  uint64_t v19 = *(int *)(a3 + 44);
  uint64_t v20 = a1 + v19;
  uint64_t v21 = (__int128 *)((char *)a2 + v19);
  uint64_t v22 = *((void *)v21 + 3);
  if (!*(void *)(a1 + v19 + 24))
  {
    if (v22)
    {
      *(void *)(v20 + 24) = v22;
      *(void *)(v20 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v21 + 4);
      (**(void (***)(uint64_t, __int128 *))(v22 - 8))(v20, v21);
      return a1;
    }

uint64_t sub_A6134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(_OWORD *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  __int128 v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v6;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  __int128 v7 = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  uint64_t v8 = *(int *)(a3 + 40);
  __int128 v9 = (void *)(a1 + v8);
  __int128 v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v7;
  uint64_t v11 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v10, 1LL, v11))
  {
    uint64_t v12 = sub_44DC(&qword_F3838);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
    sub_4AD0((uint64_t)v9, 0LL, 1LL, v11);
  }

  uint64_t v13 = *(int *)(a3 + 44);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  __int128 v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + swift_unknownObjectWeakDestroy(v0 + 16) = v16;
  *(void *)(v14 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v15 + 32);
  return a1;
}

uint64_t sub_A625C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(void *)(a2 + 16);
  swift_release();
  if (*(void *)(a1 + 48)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 24));
  }
  __int128 v6 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v6;
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 64));
  __int128 v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v7;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 104));
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = *(_OWORD *)(a2 + 120);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  uint64_t v8 = *(int *)(a3 + 40);
  __int128 v9 = (void *)(a1 + v8);
  __int128 v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for ImpressionMetrics(0LL);
  int v12 = sub_4AC4((uint64_t)v9, 1LL, v11);
  int v13 = sub_4AC4((uint64_t)v10, 1LL, v11);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
      sub_4AD0((uint64_t)v9, 0LL, 1LL, v11);
      goto LABEL_9;
    }

    goto LABEL_8;
  }

  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v9, v11);
LABEL_8:
    uint64_t v15 = sub_44DC(&qword_F3838);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_9;
  }

  (*(void (**)(void *, const void *, uint64_t))(v14 + 40))(v9, v10, v11);
LABEL_9:
  uint64_t v16 = *(int *)(a3 + 44);
  uint64_t v17 = a1 + v16;
  if (*(void *)(a1 + v16 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v16));
  }
  __int128 v18 = *(_OWORD *)(a2 + v16 + 16);
  *(_OWORD *)uint64_t v17 = *(_OWORD *)(a2 + v16);
  *(_OWORD *)(v17 + swift_unknownObjectWeakDestroy(v0 + 16) = v18;
  *(void *)(v17 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + v16 + 32);
  return a1;
}

uint64_t sub_A6414(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_A6420);
}

uint64_t sub_A6420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 88);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F3838);
    return sub_4AC4(a1 + *(int *)(a3 + 40), a2, v8);
  }

uint64_t sub_A6498(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_A64A4);
}

uint64_t sub_A64A4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 88) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_44DC(&qword_F3838);
    return sub_4AD0(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }

  return result;
}

uint64_t type metadata accessor for TextHeader(uint64_t a1)
{
  uint64_t result = qword_F8150;
  if (!qword_F8150) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TextHeader);
  }
  return result;
}

void sub_A654C(uint64_t a1)
{
  v4[0] = "\b";
  v4[1] = &unk_BC828;
  v4[2] = "\b";
  v4[3] = &unk_BC840;
  void v4[4] = &unk_BC858;
  void v4[5] = &unk_BC858;
  sub_5260(319LL);
  if (v3 <= 0x3F)
  {
    void v4[6] = *(void *)(v2 - 8) + 64LL;
    void v4[7] = &unk_BC840;
    swift_initStructMetadata(a1, 256LL, 8LL, v4, a1 + 16);
  }

unint64_t sub_A65E0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_DEBD0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_A6628(char a1)
{
  if (!a1) {
    return 0x657261757173LL;
  }
  if (a1 == 1) {
    return 0x6C6F626D7973LL;
  }
  return 1952671090LL;
}

void sub_A6670(unsigned __int8 *a1, unsigned __int8 *a2)
{
}

void sub_A667C()
{
}

uint64_t sub_A6684(uint64_t a1)
{
  return sub_76780(a1, *v1);
}

void sub_A668C(uint64_t a1)
{
}

unint64_t sub_A6694@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_A65E0(*a1);
  *a2 = result;
  return result;
}

void sub_A66C0(uint64_t *a1@<X8>)
{
  *a1 = sub_A6628(*v1);
  a1[1] = v3;
  sub_4960();
}

uint64_t sub_A66E4@<X0>(uint64_t a1@<X8>)
{
  return sub_8260(v1 + 104, a1);
}

unint64_t sub_A66F4()
{
  unint64_t result = qword_F81A0;
  if (!qword_F81A0)
  {
    uint64_t v1 = type metadata accessor for TextHeader(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BC870, v1);
    atomic_store(result, (unint64_t *)&qword_F81A0);
  }

  return result;
}

void sub_A6734(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  uint64_t v7 = &v43[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = sub_E9C0(v8);
  uint64_t v10 = type metadata accessor for DynamicTextFactory(0LL);
  sub_E9C0(v10);
  uint64_t v11 = type metadata accessor for TextHeader(0LL);
  uint64_t v44 = a1;
  sub_5A94(0x6B726F77747261LL, 0xE700000000000000LL, v11, (uint64_t)sub_16924, (uint64_t)v43, v12, v13, v14);
  if (v2)
  {
    swift_errorRelease(v2);
    uint64_t v15 = 0LL;
  }

  *(void *)a2 = v15;
  v49._countAndFlagsBits = sub_6F270();
  unint64_t v16 = sub_A65E0(v49);
  else {
    char v17 = v16;
  }
  *(_BYTE *)(a2 + 8) = v17;
  __chkstk_darwin(v16);
  sub_EA0C();
  unint64_t v18 = sub_A6D24();
  sub_5A94(v18, v19, v20, v21, v22, v23, v24, v25);
  *(void *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v26;
  uint64_t v27 = sub_6F270();
  uint64_t v48 = v9;
  v47[0] = v27;
  v47[1] = v28;
  uint64_t v29 = AnyHashable.init<A>(_:)(v47, &type metadata for String, &protocol witness table for String);
  __chkstk_darwin(v29);
  sub_EA0C();
  unint64_t v30 = sub_A6D24();
  sub_5868(v30, v31, v32, v33, v34, v35, v36, v37);
  sub_D970((uint64_t)v7, a2 + *(int *)(v11 + 40), &qword_F3838);
  __chkstk_darwin(v38);
  *(void *)&v43[-16] = v48;
  *(void *)&v43[-8] = a1;
  sub_5844();
  sub_D970((uint64_t)v47, a2 + *(int *)(v11 + 44), &qword_F38F8);
  __chkstk_darwin(v39);
  sub_E9AC();
  sub_6D040();
  sub_D970((uint64_t)&v46, a2 + 24, &qword_F3930);
  __chkstk_darwin(v40);
  sub_E9AC();
  sub_6D040();
  uint64_t v41 = type metadata accessor for JSONObject(0LL);
  sub_851C(v41);
  sub_E9EC();
  sub_8770();
  uint64_t v42 = sub_8484();
  sub_E998(v42);
  sub_7CF4(&v45, a2 + 64);
}

void sub_A6BC0(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
}

void sub_A6BD4(void *a1@<X8>)
{
  *a1 = v2;
  sub_4960();
}

void sub_A6BF4(void *a1@<X8>)
{
  *a1 = v2;
  sub_4960();
}

uint64_t storeEnumTagSinglePayload for TextHeader.ArtworkStyle(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_A6C64 + 4 * byte_BC7F5[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_A6C98 + 4 * byte_BC7F0[v4]))();
}

uint64_t sub_A6C98(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_A6CA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xA6CA8LL);
  }
  return result;
}

uint64_t sub_A6CB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xA6CBCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_A6CC0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_A6CC8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TextHeader.ArtworkStyle()
{
  return &type metadata for TextHeader.ArtworkStyle;
}

unint64_t sub_A6CE8()
{
  unint64_t result = qword_F81A8;
  if (!qword_F81A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_BC990, &type metadata for TextHeader.ArtworkStyle);
    atomic_store(result, (unint64_t *)&qword_F81A8);
  }

  return result;
}

unint64_t sub_A6D24()
{
  return 0xD000000000000011LL;
}

uint64_t sub_A6D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t KeyPath = swift_getKeyPath(&off_BC9E8);
  sub_44DC(&qword_F81F8);
  sub_19D8C(KeyPath);
  sub_8770();
  BOOL v7 = v42[3] != 0LL;
  sub_19D4C((uint64_t)v42);
  *(_BYTE *)(v4 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_isLargeTitle) = v7;
  sub_A7B00();
  uint64_t v8 = swift_getKeyPath(&unk_BCA08);
  sub_19D8C(v8);
  sub_8770();
  uint64_t v9 = v42[0];
  if (v42[0])
  {
    uint64_t v10 = swift_getKeyPath(&unk_BCA68);
    sub_19D8C(v10);
    swift_release();
    sub_A8198(v9, v42[0], a3);
    sub_8770();
  }

  uint64_t v11 = swift_getKeyPath(&off_BC9E8);
  sub_19D8C(v11);
  sub_8770();
  if (v40)
  {
    uint64_t v12 = sub_7CF4(&v38, (uint64_t)v42);
    uint64_t v20 = sub_A7124(v12, v13, v14, v15, v16, v17, v18, v19, v38, *((uint64_t *)&v38 + 1), v39, v40, v41, v42[0]);
    v21(v20);
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v42);
  }

  else
  {
    sub_19D4C((uint64_t)&v38);
  }

  uint64_t v22 = swift_getKeyPath(&unk_BCA28);
  sub_19D8C(v22);
  uint64_t v23 = swift_release();
  uint64_t v31 = sub_A7124(v23, v24, v25, v26, v27, v28, v29, v30, v38, *((uint64_t *)&v38 + 1), v39, v40, v41, v42[0]);
  v32(v31);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v42);
  uint64_t v33 = swift_getKeyPath(&unk_BCA48);
  sub_19D8C(v33);
  uint64_t result = sub_8770();
  uint64_t v35 = v42[0];
  if (v42[0])
  {
    swift_retain(v42[0]);
    sub_A7168(v36);
    swift_retain(*(void *)(v35 + 24));
    sub_A7C4C(v37, a3);
    swift_release();
    return swift_release();
  }

  return result;
}

uint64_t sub_A6F3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for TextHeaderComponent();
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_A6F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for TextHeaderComponent();
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_A6FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BC9C8, a4);
  return ComponentCell.apply(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_A7040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BC9C8, a4);
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_A709C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BC9C8, a4);
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_A70F8()
{
  return sub_8A80(&qword_F6D80, type metadata accessor for TextHeader, (uint64_t)&unk_BC898);
}

char *sub_A7124( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  return &a14;
}

uint64_t sub_A713C(uint64_t a1)
{
  return sub_B068(a1);
}

uint64_t sub_A7148(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher);
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher + 8);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_AC90(v4, v5);
}

uint64_t sub_A7168(uint64_t a1)
{
  return sub_B068(a1);
}

void sub_A7174(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView);
  *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView) = a1;
}

void sub_A7188(uint64_t a1@<X8>)
{
  double v3 = (*(double (**)(void))((char *)&stru_68.offset
                           + (swift_isaMask & **(void **)(v1
                                                          + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkView))))();
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkTopSpace);
  *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = &type metadata for CGFloat;
  *(void *)(a1 + 48) = &protocol witness table for CGFloat;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v4;
  *(void *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = &type metadata for CGFloat;
  *(void *)(a1 + 88) = &protocol witness table for CGFloat;
  *(void *)(a1 + 56) = 0x4034000000000000LL;
  *(void *)(a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = &type metadata for CGFloat;
  *(void *)(a1 + 128) = &protocol witness table for CGFloat;
  *(void *)(a1 + 96) = 0x4034000000000000LL;
  *(double *)a1 = v3;
}

id sub_A7214(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetchSubject;
  uint64_t v10 = sub_44DC(&qword_F3B20);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  uint64_t v11 = v4;
  *(void *)&v4[v9] = PassthroughSubject.init()();
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetchSubscription] = 0LL;
  uint64_t v12 = &v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher];
  *(void *)uint64_t v12 = 0LL;
  *((void *)v12 + 1) = 0LL;
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkTopSpace] = 0LL;
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtwork] = 0LL;
  uint64_t v13 = OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkView;
  if (qword_F37E8 != -1) {
    swift_once(&qword_F37E8, sub_A90BC);
  }
  double v14 = *(double *)&qword_F8200;
  double v15 = *(double *)algn_F8208;
  id v16 = objc_allocWithZone((Class)sub_11930());
  sub_11984();
  *(void *)&v11[v13] = ArtworkImageView.init(artworkSize:frame:)(v14, v15, v17, v18, v19, v20);
  uint64_t v21 = OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_subtitleLabel;
  sub_11998();
  uint64_t v22 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
  id v23 = objc_msgSend(v22, "ams_primaryText");
  uint64_t v24 = type metadata accessor for FontSource(0LL);
  uint64_t v37 = v24;
  __int128 v38 = &protocol witness table for FontSource;
  *sub_AE98(v36) = UIFontTextStyleBody;
  uint64_t v25 = *(void (**)(void))(*(void *)(v24 - 8) + 104LL);
  v25();
  uint64_t v26 = UIFontTextStyleBody;
  *(void *)&v11[v21] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(1LL, v23, v36);
  uint64_t v27 = OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_titleLabel;
  id v28 = objc_msgSend(v22, "ams_primaryText");
  uint64_t v37 = v24;
  __int128 v38 = &protocol witness table for FontSource;
  uint64_t v29 = sub_AE98(v36);
  *uint64_t v29 = UIFontTextStyleTitle1;
  v29[1] = *(void *)&UIFontWeightBold;
  uint64_t v30 = enum case for FontUseCase.preferredFontDerivative(_:);
  uint64_t v31 = type metadata accessor for FontUseCase(0LL);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104LL))(v29, v30, v31);
  ((void (*)(void *, void, uint64_t))v25)(v29, enum case for FontSource.useCase(_:), v24);
  uint64_t v32 = UIFontTextStyleTitle1;
  *(void *)&v11[v27] = DynamicLabel.__allocating_init(alignment:color:customTextStyle:)(1LL, v28, v36);
  *(void *)&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView] = 0LL;
  swift_weakInit(&v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_objectGraph], 0LL);
  v11[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_isLargeTitle] = 1;

  v35.receiver = v11;
  v35.super_class = (Class)type metadata accessor for TextHeaderComponent();
  id v33 = objc_msgSendSuper2(&v35, "initWithFrame:", a1, a2, a3, a4);
  sub_A7A58((uint64_t)[v33 setUserInteractionEnabled:0]);

  return v33;
}

void sub_A7534()
{
  uint64_t v6 = v0;
  uint64_t v7 = type metadata accessor for LayoutRect(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  sub_186A4();
  uint64_t v9 = (objc_class *)type metadata accessor for TextHeaderComponent();
  v27.receiver = v0;
  v27.super_class = v9;
  id v10 = objc_msgSendSuper2(&v27, "layoutSubviews");
  id v11 = sub_118D0((uint64_t)v10, "contentView");
  [v11 bounds];
  sub_11878();

  double v12 = sub_A923C();
  CGRect.subtracting(insets:)(v12, v13, v14, v15, v2, v3, v4, v5);
  sub_11878();
  sub_A7188((uint64_t)v26);
  id v16 = *(void **)&v6[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkView];
  v26[20] = sub_11930();
  v26[21] = &protocol witness table for UIView;
  v26[17] = v16;
  double v17 = *(void **)&v6[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_subtitleLabel];
  uint64_t v18 = sub_11998();
  v26[25] = v18;
  sub_A919C((unint64_t *)&qword_F3E80, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicLabel);
  v26[22] = v17;
  double v19 = *(void **)&v6[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_titleLabel];
  v26[30] = v18;
  v26[31] = v20;
  v26[26] = v20;
  v26[27] = v19;
  id v21 = v16;
  id v22 = v17;
  id v23 = sub_32438((uint64_t)v19, "contentView");
  sub_A9298(v23, v2, v3, v4, v5);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v1, v7);
  uint64_t v24 = *(void **)&v6[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView];
  if (v24)
  {
    id v25 = v24;
    sub_A87C8();
    [v25 frame];
    sub_A82D4();
  }

  sub_A91D0(v26);
  sub_5356C();
}

double sub_A7730(double a1, double a2, float a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_B058();
  uint64_t v10 = v9 - v8;
  double v11 = sub_A923C();
  double v12 = CGSize.subtracting(insets:)(v11);
  double v14 = v13;
  sub_A7188((uint64_t)v27);
  double v15 = *(void **)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkView);
  v27[20] = sub_11930();
  v27[21] = &protocol witness table for UIView;
  v27[17] = v15;
  id v16 = *(void **)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_subtitleLabel);
  uint64_t v17 = sub_11998();
  v27[25] = v17;
  sub_A919C((unint64_t *)&qword_F3E80, (uint64_t (*)(uint64_t))&type metadata accessor for DynamicLabel);
  v27[22] = v16;
  uint64_t v18 = *(void **)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_titleLabel);
  v27[30] = v17;
  v27[31] = v19;
  v27[26] = v19;
  v27[27] = v18;
  id v20 = v15;
  id v21 = v16;
  id v22 = sub_118D0((uint64_t)v18, "contentView");
  sub_A93F8(v10);
  VerticalFlowLayout.measurements(fitting:in:)(v22, v12, v14);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);

  double v23 = sub_A923C();
  double v24 = CGSize.adding(outsets:)(v23);
  if (a3 == 1000.0) {
    double v25 = a1;
  }
  else {
    double v25 = v24;
  }
  sub_A91D0(v27);
  return v25;
}

uint64_t sub_A7970()
{
  uint64_t v1 = v0;
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for TextHeaderComponent();
  id v2 = objc_msgSendSuper2(&v7, "prepareForReuse");
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView];
  if (v3)
  {
    double v4 = *(void (**)(void))((char *)&stru_108.reloff + (swift_isaMask & *v3));
    double v5 = v3;
    v4();
  }

  (*(void (**)(id))((char *)&stru_108.reloff
                             + (swift_isaMask & **(void **)&v1[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkView])))(v2);
  sub_11808(OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_subtitleLabel);
  return sub_11808(OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_titleLabel);
}

void sub_A7A58(uint64_t a1)
{
  id v1 = sub_118D0(a1, "contentView");
  sub_3748C(v1);

  id v3 = sub_118D0(v2, "contentView");
  sub_3748C(v3);

  id v5 = sub_118D0(v4, "contentView");
  sub_3748C(v5);
}

uint64_t sub_A7B00()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_titleLabel);
  (*(void (**)(uint64_t))((char *)&stru_68.offset + (swift_isaMask & *v1)))(1LL);
  id v2 = objc_msgSend((id)objc_opt_self(UIColor), "ams_primaryText");
  (*(void (**)(id))((char *)&stru_68.reserved2 + (swift_isaMask & *v1)))(v2);
  uint64_t v3 = type metadata accessor for FontSource(0LL);
  v10[3] = v3;
  v10[4] = &protocol witness table for FontSource;
  uint64_t v4 = sub_AE98(v10);
  *uint64_t v4 = UIFontTextStyleTitle1;
  v4[1] = *(void *)&UIFontWeightBold;
  uint64_t v5 = enum case for FontUseCase.preferredFontDerivative(_:);
  uint64_t v6 = type metadata accessor for FontUseCase(0LL);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 104LL))(v4, v5, v6);
  (*(void (**)(void *, void, uint64_t))(*(void *)(v3 - 8) + 104LL))( v4,  enum case for FontSource.useCase(_:),  v3);
  objc_super v7 = *(uint64_t (**)(void *))&stru_B8.segname[(swift_isaMask & *v1) + 8];
  uint64_t v8 = UIFontTextStyleTitle1;
  return v7(v10);
}

uint64_t sub_A7C4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_weakAssign(&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_objectGraph], a2);
  double height = CGSizeZero.height;
  id v7 = objc_allocWithZone((Class)sub_11930());
  sub_11984();
  uint64_t v12 = ArtworkImageView.init(artworkSize:frame:)(CGSizeZero.width, height, v8, v9, v10, v11);
  sub_A7174(v12);
  id v14 = sub_32438(v13, "contentView");
  id v15 = [v14 layer];

  [v15 setMasksToBounds:0];
  id v16 = *(void **)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView];
  if (v16)
  {
    id v17 = v16;
    id v18 = sub_32438((uint64_t)v17, "layer");
    [v18 setZPosition:-100.0];

    id v20 = sub_32438(v19, "contentView");
    [v20 addSubview:v17];

    id v22 = sub_32438(v21, "contentView");
    [v22 sendSubviewToBack:v17];
  }

  uint64_t v23 = sub_1186C((uint64_t)&unk_E7A50);
  swift_weakInit(v23 + 16, a2);
  uint64_t v24 = sub_1186C((uint64_t)&unk_E7A78);
  swift_unknownObjectWeakInit(v24 + 16);
  double v25 = (void *)swift_allocObject(&unk_E7AA0, 48LL, 7LL);
  v25[2] = v23;
  v25[3] = v24;
  v25[4] = v3;
  v25[5] = a1;
  uint64_t v26 = v3;
  swift_retain(a1);
  sub_A7148((uint64_t)sub_A9190, (uint64_t)v25);
  objc_super v27 = *(void (**)(__n128))&v26[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher];
  if (v27)
  {
    uint64_t v28 = *(void *)&v26[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher + 8];
    __n128 v29 = swift_retain(v28);
    v27(v29);
    sub_AC90((uint64_t)v27, v28);
  }

  return sub_A8B44();
}

void sub_A7E68(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v8);
  double v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 += 16LL;
  swift_beginAccess(a1, v40, 0LL, 0LL);
  uint64_t Strong = swift_weakLoadStrong(a1);
  if (Strong)
  {
    uint64_t v12 = Strong;
    uint64_t v13 = a2 + 16;
    swift_beginAccess(v13, v39, 0LL, 0LL);
    uint64_t v14 = swift_unknownObjectWeakLoadStrong(v13);
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = sub_44DC((uint64_t *)&unk_F7110);
      uint64_t v17 = type metadata accessor for LogMessage(0LL);
      uint64_t v18 = swift_allocObject( v16,  ((*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL))
            + 3LL * *(void *)(*(void *)(v17 - 8) + 72LL),
              *(unsigned __int8 *)(*(void *)(v17 - 8) + 80LL) | 7LL);
      *(_OWORD *)(v18 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
      uint64_t v38 = type metadata accessor for TextHeaderComponent();
      v37[0] = a3;
      id v19 = (id)AMSLogKey(a3);
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
        uint64_t v23 = v22;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
        v24._countAndFlagsBits = 0LL;
        v24._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v24);
        uint64_t v25 = v38;
        uint64_t v26 = sub_ACA0(v37, v38);
        uint64_t DynamicType = swift_getDynamicType(v26, v25, 1LL);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v35[0] = DynamicType;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v35);
        sub_8144((uint64_t)v35, &qword_F6300);
        v28._countAndFlagsBits = 5972026LL;
        v28._object = (void *)0xE300000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v28);
        MetatypeMetadata = &type metadata for String;
        v35[0] = v21;
        v35[1] = v23;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v35);
        sub_8144((uint64_t)v35, &qword_F6300);
        uint64_t v29 = 93LL;
      }

      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
        v30._countAndFlagsBits = 0LL;
        v30._object = (void *)0xE000000000000000LL;
        LogMessage.StringInterpolation.appendLiteral(_:)(v30);
        uint64_t v31 = v38;
        uint64_t v32 = sub_ACA0(v37, v38);
        uint64_t v33 = swift_getDynamicType(v32, v31, 1LL);
        MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        v35[0] = v33;
        LogMessage.StringInterpolation.appendInterpolation(safe:)(v35);
        sub_8144((uint64_t)v35, &qword_F6300);
        uint64_t v29 = 58LL;
      }

      unint64_t v34 = 0xE100000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v29);
      LogMessage.init(stringInterpolation:)(v10);
      type metadata accessor for Log();
      _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v37);
      LogMessage.init(stringLiteral:)(0xD000000000000029LL);
      uint64_t v38 = type metadata accessor for Artwork(0LL);
      v37[0] = a4;
      swift_retain(a4);
      static LogMessage.safe(_:)(v37);
      sub_8144((uint64_t)v37, &qword_F6300);
      sub_70594(v18);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))&stru_108.segname[(swift_isaMask & *v15) + 16])(a4, v12);
      swift_release();
    }

    else
    {
      swift_release();
    }
  }

uint64_t sub_A8198(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *(void **)(v3 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkView);
  double v9 = sub_A8238(a2);
  (*(void (**)(double))((char *)&stru_68.reloff + (swift_isaMask & *v8)))(v9);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))&stru_108.segname[(swift_isaMask & *v8) + 16])(a1, a3);
  double v11 = 12.0;
  if ((a2 & 0xFE) == 0) {
    double v11 = 0.0;
  }
  *(double *)(v4 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkTopSpace) = v11;
  return result;
}

double sub_A8238(char a1)
{
  if (!a1)
  {
    id v2 = [(id)objc_opt_self(UIDevice) currentDevice];
    uint64_t v3 = (char *)[v2 userInterfaceIdiom];

    double v1 = 90.0;
    if (v3 != (_BYTE *)&dword_0 + 1) {
      return 80.0;
    }
    return v1;
  }

  if (a1 == 1) {
    return 92.0;
  }
  return 220.0;
}

void sub_A82D4()
{
  double v2 = v1;
  double v4 = v3;
  uint64_t v6 = v5;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  sub_B088();
  __chkstk_darwin(v7);
  sub_B058();
  uint64_t v8 = sub_44DC((uint64_t *)&unk_F7110);
  uint64_t v9 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
  uint64_t v10 = *(void *)(v9 + 72);
  uint64_t v11 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v12 = (v11 + 32) & ~v11;
  uint64_t v49 = v11 | 7;
  uint64_t v13 = swift_allocObject(v8, v12 + 3 * v10, v11 | 7);
  *(_OWORD *)(v13 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v52 = v13;
  uint64_t v48 = type metadata accessor for TextHeaderComponent();
  uint64_t v58 = (void *)v48;
  double v56 = *(double *)&v0;
  double v14 = COERCE_DOUBLE(v0);
  uint64_t v51 = v8;
  uint64_t v50 = v12 + 3 * v10;
  if ((id)AMSLogKey(*(void *)&v14))
  {
    uint64_t v15 = sub_B244();
    uint64_t v17 = v16;

    sub_B0C4();
    sub_B1A0();
    sub_B014(&v56);
    uint64_t v18 = sub_B094();
    sub_A9208(v18);
    sub_8144((uint64_t)&v53, &qword_F6300);
    sub_B078();
    uint64_t v55 = &type metadata for String;
    uint64_t v53 = v15;
    uint64_t v54 = v17;
    LogMessage.StringInterpolation.appendInterpolation(safe:)(&v53);
    sub_8144((uint64_t)&v53, &qword_F6300);
    uint64_t v19 = 93LL;
  }

  else
  {
    sub_B154();
    sub_B1A0();
    sub_B014(&v56);
    uint64_t v20 = sub_B094();
    sub_A9208(v20);
    sub_8144((uint64_t)&v53, &qword_F6300);
    uint64_t v19 = 58LL;
  }

  sub_7EE6C(v19);
  sub_A9290();
  type metadata accessor for Log();
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v56);
  static LogMessage.identity(_:)(*(void *)&v14);
  LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(76LL, 3LL);
  v21._countAndFlagsBits = 0xD00000000000002DLL;
  v21._object = (void *)0x80000000000C03C0LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v21);
  uint64_t v22 = *(uint64_t (**)(void))((char *)&stru_68.reserved2 + (swift_isaMask & *v6));
  char v23 = v22();
  uint64_t v58 = &type metadata for Bool;
  LOBYTE(v56) = v23 & 1;
  sub_A9284();
  sub_A9264();
  v24._countAndFlagsBits = 0x726F77747261203BLL;
  v24._object = (void *)0xEF203A657A69536BLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v24);
  uint64_t v25 = *(double (**)(void))((char *)&stru_68.offset + (swift_isaMask & *v6));
  double v26 = v25();
  double v28 = v27;
  type metadata accessor for CGSize(0LL);
  double v29 = v14;
  uint64_t v31 = v30;
  uint64_t v58 = v30;
  double v56 = v26;
  double v57 = v28;
  sub_A9284();
  sub_A9264();
  v32._object = (void *)0xEF203A657A695374LL;
  v32._countAndFlagsBits = 0x6E65746E6F63203BLL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v32);
  uint64_t v58 = v31;
  double v56 = v4;
  double v57 = v2;
  LogMessage.StringInterpolation.appendInterpolation(safe:)(&v56);
  sub_A9264();
  v33._countAndFlagsBits = 41LL;
  v33._object = (void *)0xE100000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v33);
  sub_A9290();
  sub_70594(v52);
  uint64_t v34 = swift_bridgeObjectRelease();
  if ((((uint64_t (*)(uint64_t))v22)(v34) & 1) != 0
    && ((objc_super v35 = v6, v25() == v4) ? (v37 = v36 == v2) : (v37 = 0), v37))
  {
    uint64_t v40 = swift_allocObject(v51, v50, v49);
    *(_OWORD *)(v40 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    uint64_t v58 = (void *)v48;
    double v56 = v29;
    id v41 = *(id *)&v29;
    if ((id)AMSLogKey(v41))
    {
      uint64_t v42 = sub_B244();
      uint64_t v44 = v43;

      sub_B0C4();
      sub_B1A0();
      sub_B014(&v56);
      uint64_t v45 = sub_B094();
      sub_A9208(v45);
      sub_A9270((uint64_t)&v53);
      sub_B078();
      uint64_t v55 = &type metadata for String;
      uint64_t v53 = v42;
      uint64_t v54 = v44;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v53);
      sub_A9270((uint64_t)&v53);
      uint64_t v46 = 93LL;
    }

    else
    {
      sub_B154();
      sub_B1A0();
      sub_B014(&v56);
      uint64_t v47 = sub_B094();
      sub_A9208(v47);
      sub_8144((uint64_t)&v53, &qword_F6300);
      uint64_t v46 = 58LL;
    }

    sub_7EE6C(v46);
    sub_A9290();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v56);
    static LogMessage.identity(_:)(v41);
    LogMessage.init(stringLiteral:)(0xD000000000000021LL);
    sub_70594(v40);
    swift_bridgeObjectRelease();
  }

  else
  {
    (*(void (**)(double, double))((char *)&stru_68.reloff + (swift_isaMask & *v6)))(v4, v2);
    uint64_t v38 = sub_44DC(&qword_F3B20);
    sub_A9088(&qword_F3B50, &qword_F3B20);
    Subject<>.send()(v38, v39);
  }

  sub_5356C();
}

void sub_A87C8()
{
  double v2 = v0;
  type metadata accessor for LogMessage.StringInterpolation(0LL);
  sub_B088();
  __chkstk_darwin(v3);
  sub_186A4();
  double v4 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_backgroundArtworkView];
  if (!v4) {
    goto LABEL_14;
  }
  uint64_t Strong = swift_weakLoadStrong(&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_objectGraph]);
  if (!Strong) {
    goto LABEL_14;
  }
  uint64_t v6 = Strong;
  uint64_t v7 = type metadata accessor for NavigationControllerList(0LL);
  uint64_t v8 = type metadata accessor for BaseObjectGraph(0LL);
  id v9 = v4;
  __n128 v10 = inject<A, B>(_:from:)(v7, v6, v7, v8);
  uint64_t v11 = *(uint64_t (**)(__n128))(*(void *)v40[0] + 88LL);
  uint64_t v12 = (void *)v11(v10);
  if (!v12
    || (uint64_t v13 = v12,
        id v14 = [v12 topViewController],
        v13,
        !v14))
  {
    Swift::String v21 = (void *)sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v22 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    uint64_t v23 = swift_allocObject( v21,  ((*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80))
          + 2LL * *(void *)(v22 + 72),
            *(unsigned __int8 *)(v22 + 80) | 7LL);
    *(_OWORD *)(v23 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    v40[3] = type metadata accessor for TextHeaderComponent();
    v40[0] = v2;
    if ((id)AMSLogKey(v2))
    {
      uint64_t v24 = sub_B244();
      id v25 = v9;
      uint64_t v27 = v26;

      sub_B0C4();
      sub_186BC();
      sub_B014(v40);
      uint64_t v28 = sub_B094();
      sub_A9250(v28);
      sub_A9270((uint64_t)v39);
      sub_B078();
      void v39[3] = &type metadata for String;
      v39[0] = v24;
      v39[1] = v27;
      id v9 = v25;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v39);
      sub_A9270((uint64_t)v39);
      uint64_t v29 = 93LL;
    }

    else
    {
      sub_B154();
      sub_186BC();
      sub_B014(v40);
      uint64_t v30 = sub_B094();
      sub_A9250(v30);
      sub_8144((uint64_t)v39, &qword_F6300);
      uint64_t v29 = 58LL;
    }

    unint64_t v31 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v29);
    LogMessage.init(stringInterpolation:)(v1);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v40);
    LogMessage.init(stringLiteral:)(0xD000000000000043LL);
    sub_705B4(v23);

    sub_B14C();
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }

  uint64_t v15 = (void *)((uint64_t (*)(void))v11)();
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = [v15 navigationBar];

    [v17 frame];
    double v19 = v18;

    double v20 = v19 + 20.0;
  }

  else
  {
    double v20 = 20.0;
  }

  id v32 = v9;
  sub_A9278();
  double v34 = v33;
  sub_A9278();
  double v36 = v35;
  id v37 = [v14 view];
  if (v37)
  {
    uint64_t v38 = v37;
    [v37 frame];

    [*(id *)&v2[OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_subtitleLabel] frame];
    CGRectGetMaxY(v41);
    objc_msgSend(v32, "setFrame:", NSDirectionalEdgeInsets.edgeInsets.getter(-v34, v36 - v20));
    sub_B14C();
    swift_release();

LABEL_14:
    sub_5356C();
    return;
  }

  __break(1u);
}

uint64_t sub_A8B44()
{
  uint64_t v4 = v3 - v2;
  uint64_t v31 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride(0LL);
  uint64_t v29 = *(void *)(v31 - 8);
  sub_B088();
  __chkstk_darwin(v5);
  sub_B058();
  uint64_t v8 = v7 - v6;
  uint64_t v32 = sub_44DC(&qword_F3B10);
  uint64_t v33 = *(void *)(v32 - 8);
  sub_B088();
  __chkstk_darwin(v9);
  sub_B058();
  uint64_t v12 = v11 - v10;
  uint64_t v34 = sub_44DC(&qword_F3B18);
  uint64_t v35 = *(void *)(v34 - 8);
  sub_B088();
  __chkstk_darwin(v13);
  sub_B058();
  uint64_t v30 = v15 - v14;
  id v37 = *(id *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetchSubject);
  swift_retain(v37);
  static NSRunLoop.SchedulerTimeType.Stride.seconds(_:)(v16, 1.0);
  id v17 = (void *)objc_opt_self(&OBJC_CLASS___NSRunLoop);
  id v36 = [v17 mainRunLoop];
  type metadata accessor for NSRunLoop.SchedulerOptions(0LL);
  sub_B138();
  uint64_t v18 = sub_44DC(&qword_F3B20);
  unint64_t v19 = sub_A9020();
  sub_A9088(&qword_F3B30, &qword_F3B20);
  uint64_t v21 = v20;
  sub_A919C((unint64_t *)&qword_F3B38, (uint64_t (*)(uint64_t))sub_A9020);
  uint64_t v23 = v22;
  Publisher.debounce<A>(for:scheduler:options:)(v8, &v36, v4, v18, v19, v21, v22);
  sub_8144(v4, &qword_F3B08);

  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v8, v31);
  swift_release();
  id v37 = [v17 mainRunLoop];
  sub_B138();
  sub_A9088(&qword_F3B40, &qword_F3B10);
  Publisher.receive<A>(on:options:)(&v37, v4, v32, v19, v24, v23);
  sub_8144(v4, &qword_F3B08);

  (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v12, v32);
  uint64_t v25 = sub_1186C((uint64_t)&unk_E7A28);
  swift_unknownObjectWeakInit(v25 + 16);
  sub_A9088(&qword_F3B48, &qword_F3B18);
  uint64_t v27 = Publisher<>.sink(receiveValue:)(sub_A9080, v25, v34, v26);
  sub_B14C();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v30, v34);
  return sub_A713C(v27);
}

void sub_A8E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = *(void (**)(void))(Strong + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher);
    uint64_t v6 = *(void *)(Strong + OBJC_IVAR____TtC20StoreDynamicUIPlugin19TextHeaderComponent_artworkFetcher + 8);
    sub_4548((uint64_t)v5, v6);

    if (v5)
    {
      v5();
      sub_AC90((uint64_t)v5, v6);
    }
  }

void sub_A8EFC()
{
}

id sub_A8F34()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TextHeaderComponent();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TextHeaderComponent()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin19TextHeaderComponent);
}

unint64_t sub_A9020()
{
  unint64_t result = qword_F3B28;
  if (!qword_F3B28)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSRunLoop);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_F3B28);
  }

  return result;
}

uint64_t sub_A905C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_A9080(uint64_t a1)
{
}

void sub_A9088(unint64_t *a1, uint64_t *a2)
{
  if (!*a1)
  {
    uint64_t v3 = sub_ABD0(a2);
    atomic_store(sub_537B8(v3), a1);
  }

  sub_4960();
}

void sub_A90BC()
{
  id v0 = [(id)objc_opt_self(UIDevice) currentDevice];
  uint64_t v1 = (char *)[v0 userInterfaceIdiom];

  double v2 = 80.0;
  if (v1 == (_BYTE *)&dword_0 + 1) {
    double v2 = 90.0;
  }
  qword_F8200 = *(void *)&v2;
  *(double *)algn_F8208 = v2;
}

uint64_t sub_A9130()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_A9154()
{
  swift_release(*(void *)(v0 + 40));
  return swift_deallocObject(v0, 48LL, 7LL);
}

void sub_A9190()
{
}

void sub_A919C(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_537B8(v3), a1);
  }

  sub_4960();
}

void *sub_A91D0(void *a1)
{
  return a1;
}

uint64_t sub_A9208(uint64_t a1)
{
  *(void *)(v2 - 16_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = a1;
  *(void *)(v2 - 184) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 184);
}

  ;
}

double sub_A923C()
{
  return 0.0;
}

uint64_t sub_A9250(uint64_t a1)
{
  *(void *)(v2 - 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a1;
  *(void *)(v2 - 176) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 176);
}

void sub_A9264()
{
}

void sub_A9270(uint64_t a1)
{
}

id sub_A9278()
{
  return [v0 *(SEL *)(v1 + 4040)];
}

uint64_t sub_A9284()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v0 - 152);
}

uint64_t sub_A9290()
{
  return LogMessage.init(stringInterpolation:)(v0);
}

void sub_A9298(void *a1, double a2, double a3, double a4, double a5)
{
  uint64_t v6 = v5;
  uint64_t v12 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  sub_B058();
  uint64_t v16 = v15 - v14;
  sub_A93F8(v15 - v14);
  VerticalFlowLayout.placeChildren(relativeTo:in:)(a1, a2, a3, a4, a5);
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v16, v12);
  id v17 = [a1 traitCollection];
  UITraitCollection.prefersAccessibilityLayouts.getter();

  uint64_t v18 = v6[20];
  sub_ACA0(v6 + 17, v18);
  uint64_t v19 = v6[20];
  uint64_t v20 = v6[21];
  sub_ACA0(v6 + 17, v19);
  dispatch thunk of LayoutView.frame.getter(v19, v20);
  dispatch thunk of LayoutView.frame.setter(v18);
}

uint64_t sub_A93F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v67 = a1;
  uint64_t v71 = type metadata accessor for VerticalFlowLayout.HorizontalPlacement(0LL);
  uint64_t v68 = *(void *)(v71 - 8);
  __chkstk_darwin(v71);
  sub_B058();
  uint64_t v62 = v4 - v3;
  uint64_t v58 = type metadata accessor for VerticalFlowLayout.VerticalPlacement(0LL);
  uint64_t v57 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  sub_B058();
  uint64_t v7 = v6 - v5;
  uint64_t v8 = type metadata accessor for VerticalFlowLayout.ExclusionCondition(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v61 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v55 - v12;
  uint64_t v70 = sub_44DC(&qword_F3E90);
  uint64_t v66 = v9;
  uint64_t v14 = *(void *)(v9 + 72);
  uint64_t v15 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v16 = (v15 + 32) & ~v15;
  uint64_t v69 = v15 | 7;
  uint64_t v17 = swift_allocObject(v70, v16 + 3 * v14, v15 | 7);
  __int128 v73 = xmmword_B5060;
  *(_OWORD *)(v17 + swift_weakDestroy(v0 + 16) = xmmword_B5060;
  uint64_t v18 = static VerticalFlowLayout.ExclusionCondition.hasNoHeight.getter((__n128)xmmword_B5060);
  uint64_t v19 = static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v18);
  static VerticalFlowLayout.ExclusionCondition.isHidden.getter(v19);
  uint64_t v79 = v17;
  unint64_t v20 = sub_13958();
  unint64_t v60 = v20;
  uint64_t v21 = sub_44DC(&qword_F3EA0);
  unsigned int v59 = (void (*)(uint64_t, uint64_t))v21;
  unint64_t v22 = sub_11744();
  double v65 = v13;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v79, v21, v22, v8, v20);
  uint64_t v23 = sub_44DC(&qword_F3E88);
  uint64_t v24 = *(void *)(type metadata accessor for VerticalFlowLayout.Child(0LL) - 8);
  unint64_t v25 = *(void *)(v24 + 72);
  uint64_t v26 = *(unsigned __int8 *)(v24 + 80);
  uint64_t v27 = (v26 + 32) & ~v26;
  unint64_t v63 = v25;
  uint64_t v28 = swift_allocObject(v23, v27 + 3 * v25, v26 | 7);
  *(_OWORD *)(v28 + swift_weakDestroy(v0 + 16) = v73;
  uint64_t v64 = v28;
  uint64_t v29 = v28 + v27;
  uint64_t v30 = *(void *)(v2 + 160);
  uint64_t v31 = *(void *)(v2 + 168);
  sub_ACA0((void *)(v2 + 136), v30);
  LayoutView.withMeasurements(representing:)(v30, v31, *(double *)v2, *(double *)(v2 + 8));
  uint64_t v56 = v2 + 16;
  uint64_t v78 = 0LL;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  uint64_t v32 = v57;
  uint64_t v33 = *(void (**)(void))(v57 + 104);
  LODWORD(v7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = enum case for VerticalFlowLayout.VerticalPlacement.top(_:);
  uint64_t v72 = v33;
  v33(v7);
  uint64_t v34 = swift_allocObject(v70, v16 + v14, v69);
  *(_OWORD *)(v34 + swift_weakDestroy(v0 + 16) = xmmword_B5B40;
  static VerticalFlowLayout.ExclusionCondition.hasNoContent.getter(v34);
  *(void *)&v74[0] = v34;
  uint64_t v35 = v61;
  dispatch thunk of SetAlgebra.init<A>(_:)(v74, v59, v22, v8, v60);
  uint64_t v36 = v68;
  id v37 = *(void (**)(uint64_t))(v68 + 104);
  uint64_t v38 = v62;
  LODWORD(v7_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = enum case for VerticalFlowLayout.HorizontalPlacement.leading(_:);
  uint64_t v69 = (uint64_t)v37;
  v37(v62);
  unint64_t v60 = v29;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v79,  v56,  &v76,  v7,  v38,  v35);
  sub_AA1D8(*(uint64_t (**)(void))(v36 + 8));
  uint64_t v39 = *(uint64_t (**)(void))(v66 + 8);
  uint64_t v66 = v8;
  sub_AA1D8(v39);
  sub_AA1D8(*(uint64_t (**)(void))(v32 + 8));
  sub_11788((uint64_t)&v76);
  sub_15508();
  uint64_t v40 = *(void *)(v2 + 240);
  uint64_t v41 = *(void *)(v2 + 248);
  uint64_t v42 = sub_ACA0((void *)(v2 + 216), v40);
  uint64_t v80 = v40;
  uint64_t v43 = sub_154FC(*(void *)(v41 + 8));
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v40 - 8) + 16LL))(v43, v42, v40);
  if ((sub_A99C0() & 1) != 0)
  {
    *((void *)&v77 + 1) = &type metadata for CGFloat;
    uint64_t v78 = &protocol witness table for CGFloat;
    *(void *)&__int128 v76 = 0LL;
  }

  else
  {
    sub_460C(v2 + 96, (uint64_t)&v76);
  }

  unint64_t v44 = v63;
  unint64_t v45 = v60;
  uint64_t v75 = 0LL;
  memset(v74, 0, sizeof(v74));
  sub_AA1A0();
  uint64_t v46 = v71;
  sub_AA1C8(v38, v70);
  uint64_t v47 = v65;
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v79,  &v76,  v74,  v7,  v38,  v65);
  uint64_t v48 = v59;
  v59(v38, v46);
  sub_AA1B4();
  sub_11788((uint64_t)v74);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v76);
  sub_15508();
  unint64_t v63 = v45 + 2 * v44;
  uint64_t v49 = *(void *)(v2 + 200);
  uint64_t v50 = *(void *)(v2 + 208);
  uint64_t v51 = sub_ACA0((void *)(v2 + 176), v49);
  uint64_t v80 = v49;
  uint64_t v52 = sub_154FC(*(void *)(v50 + 8));
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v49 - 8) + 16LL))(v52, v51, v49);
  uint64_t v78 = 0LL;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  sub_AA1A0();
  sub_AA1C8(v38, v70);
  static VerticalFlowLayout.Child.make(forView:topSpace:bottomSpace:verticalPlacement:horizontalPlacement:excludeWhen:)( &v79,  v2 + 56,  &v76,  v7,  v38,  v47);
  v48(v38, v46);
  sub_AA1B4();
  sub_11788((uint64_t)&v76);
  sub_15508();
  __n128 v53 = VerticalFlowLayout.init(expandChildrenToFit:children:)(1LL, v64);
  return ((uint64_t (*)(char *, uint64_t, __n128))v61)(v47, v66, v53);
}

uint64_t sub_A99C0()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  sub_ACA0(v0 + 17, v2);
  char v4 = dispatch thunk of LayoutView.hasContent.getter(v2, v3);
  sub_A9BE8(v1, v9);
  if ((v4 & 1) != 0)
  {
    uint64_t v5 = v11;
    uint64_t v6 = v12;
    sub_ACA0(v10, v11);
    char v7 = dispatch thunk of LayoutView.isHidden.getter(v5, v6);
  }

  else
  {
    char v7 = 1;
  }

  sub_A91D0(v9);
  return v7 & 1;
}

  ;
}

void sub_A9A78()
{
}

_OWORD *sub_A9A9C@<X0>(_OWORD *a1@<X8>)
{
  return sub_A9BB4(v1, a1);
}

double sub_A9AAC(uint64_t a1, double a2, double a3)
{
  uint64_t v6 = type metadata accessor for VerticalFlowLayout(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_B058();
  uint64_t v10 = v9 - v8;
  sub_A93F8(v9 - v8);
  double v11 = VerticalFlowLayout.measurements(fitting:in:)(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
  return v11;
}

unint64_t sub_A9B78()
{
  unint64_t result = qword_F8290;
  if (!qword_F8290)
  {
    unint64_t result = swift_getWitnessTable(&unk_BCB10, &type metadata for TextHeaderLayout);
    atomic_store(result, (unint64_t *)&qword_F8290);
  }

  return result;
}

_OWORD *sub_A9BB4(_OWORD *a1, _OWORD *a2)
{
  return a2;
}

_OWORD *sub_A9BE8(_OWORD *a1, _OWORD *a2)
{
  return a2;
}

uint64_t destroy for TextHeaderLayout.Metrics(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 12);
}

_OWORD *initializeWithCopy for TextHeaderLayout.Metrics(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  __int128 v4 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  __int128 v5 = a2[5];
  a1[5] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 56, (uint64_t)a2 + 56);
  __int128 v6 = *(_OWORD *)((char *)a2 + 120);
  *(_OWORD *)((char *)a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 6), (uint64_t)(a2 + 6));
  return a1;
}

void *assignWithCopy for TextHeaderLayout.Metrics(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_4290(a1 + 2, a2 + 2);
  sub_4290(a1 + 7, a2 + 7);
  sub_4290(a1 + 12, a2 + 12);
  return a1;
}

void *initializeWithTake for TextHeaderLayout.Metrics(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x88uLL);
}

uint64_t assignWithTake for TextHeaderLayout.Metrics(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 16));
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 96));
  __int128 v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextHeaderLayout.Metrics(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 136))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TextHeaderLayout.Metrics(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 136) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 136) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TextHeaderLayout.Metrics()
{
  return &type metadata for TextHeaderLayout.Metrics;
}

uint64_t destroy for TextHeaderLayout(void *a1)
{
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(a1 + 27);
}

_OWORD *initializeWithCopy for TextHeaderLayout(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  __int128 v4 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))((uint64_t)(a1 + 1), (uint64_t)(a2 + 1));
  __int128 v5 = a2[5];
  a1[5] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 56, (uint64_t)a2 + 56);
  __int128 v6 = *(_OWORD *)((char *)a2 + 120);
  *(_OWORD *)((char *)a1 + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 6), (uint64_t)(a2 + 6));
  __int128 v7 = a2[10];
  a1[10] = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))((uint64_t)a1 + 136, (uint64_t)a2 + 136);
  __int128 v8 = *(_OWORD *)((char *)a2 + 200);
  *(_OWORD *)((char *)a1 + 20_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v8;
  (**(void (***)(uint64_t, uint64_t))(v8 - 8))((uint64_t)(a1 + 11), (uint64_t)(a2 + 11));
  __int128 v9 = a2[15];
  a1[15] = v9;
  (**(void (***)(uint64_t, uint64_t))(v9 - 8))((uint64_t)a1 + 216, (uint64_t)a2 + 216);
  return a1;
}

void *assignWithCopy for TextHeaderLayout(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  sub_4290(a1 + 2, a2 + 2);
  sub_4290(a1 + 7, a2 + 7);
  sub_4290(a1 + 12, a2 + 12);
  sub_4290(a1 + 17, a2 + 17);
  sub_4290(a1 + 22, a2 + 22);
  sub_4290(a1 + 27, a2 + 27);
  return a1;
}

uint64_t assignWithTake for TextHeaderLayout(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 16));
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 96));
  __int128 v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 11_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v5;
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 136));
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 152);
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 176));
  __int128 v6 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 176) = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v6;
  *(void *)(a1 + 208) = *(void *)(a2 + 208);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 216));
  *(_OWORD *)(a1 + 2swift_weakDestroy(v0 + 16) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  return a1;
}

uint64_t getEnumTagSinglePayload for TextHeaderLayout(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 256))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TextHeaderLayout(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 248) = 0LL;
    *(_OWORD *)(result + 23_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 2swift_weakDestroy(v0 + 16) = 0u;
    *(_OWORD *)(result + 20_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 15_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 256) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 256) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TextHeaderLayout()
{
  return &type metadata for TextHeaderLayout;
}

uint64_t sub_AA1A0()
{
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 - 248))(v0, *(unsigned int *)(v2 - 240), v1);
}

uint64_t sub_AA1B4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 280))(v0, v1);
}

uint64_t sub_AA1C8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 272))(a1, a2, v2);
}

uint64_t sub_AA1D8@<X0>(uint64_t (*a1)(void)@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return a1();
}

id TimingCurve.caMediaTimingFunction.getter(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    __asm { BR              X9 }
  }

  id v5 = objc_allocWithZone(&OBJC_CLASS___CAMediaTimingFunction);
  LODWORD(v_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = HIDWORD(a1);
  LODWORD(v6) = a1;
  LODWORD(v9) = HIDWORD(a2);
  LODWORD(v8) = a2;
  return [v5 initWithControlPoints:v6 :v7 :v8 :v9];
}

id sub_AA260()
{
  uint64_t v0 = (void *)objc_opt_self(&OBJC_CLASS___CAMediaTimingFunction);
  return sub_AA678(v0, "functionWithName:");
}

double TimingCurve.controlPoint1.getter(uint64_t a1, uint64_t a2, char a3)
{
  return sub_AA340(a1, a2, a3, 1LL);
}

double TimingCurve.controlPoint2.getter(uint64_t a1, uint64_t a2, char a3)
{
  return sub_AA340(a1, a2, a3, 2LL);
}

double sub_AA340(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = 0LL;
  id v5 = TimingCurve.caMediaTimingFunction.getter(a1, a2, a3 & 1);
  [v5 getControlPointAtIndex:a4 values:&v7];

  return *(float *)&v7;
}

unint64_t TimingCurve.reversed.getter(uint64_t a1, uint64_t a2, char a3)
{
  char v5 = a3 & 1;
  TimingCurve.controlPoint1.getter(a1, a2, a3 & 1);
  *(float *)&unsigned int v6 = 1.0 - TimingCurve.controlPoint2.getter(a1, a2, v5);
  *(float *)&double v7 = 1.0 - v7;
  return v6 | ((unint64_t)LODWORD(v7) << 32);
}

void *TimingCurve.customNavigation.unsafeMutableAddressor()
{
  return &static TimingCurve.customNavigation;
}

void static TimingCurve.customNavigation.getter()
{
}

unint64_t sub_AA46C()
{
  unint64_t result = TimingCurve.reversed.getter(0x3B16BB993E404EA5LL, 0x3F76809D3F0A36E3LL, 0);
  static TimingCurve.customNavigationPop = result;
  unk_103270 = v1;
  byte_103278 = 0;
  return result;
}

uint64_t *TimingCurve.customNavigationPop.unsafeMutableAddressor()
{
  if (qword_F37F0 != -1) {
    swift_once(&qword_F37F0, sub_AA46C);
  }
  return &static TimingCurve.customNavigationPop;
}

uint64_t static TimingCurve.customNavigationPop.getter()
{
  if (qword_F37F0 != -1) {
    swift_once(&qword_F37F0, sub_AA46C);
  }
  return static TimingCurve.customNavigationPop;
}

void *TimingCurve.horizontalPush.unsafeMutableAddressor()
{
  return &static TimingCurve.horizontalPush;
}

void static TimingCurve.horizontalPush.getter()
{
}

void *TimingCurve.easingCurve1.unsafeMutableAddressor()
{
  return &static TimingCurve.easingCurve1;
}

void static TimingCurve.easingCurve1.getter()
{
}

void *TimingCurve.easingCurve2.unsafeMutableAddressor()
{
  return &static TimingCurve.easingCurve2;
}

void static TimingCurve.easingCurve2.getter()
{
}

void *TimingCurve.easingCurve3.unsafeMutableAddressor()
{
  return &static TimingCurve.easingCurve3;
}

void static TimingCurve.easingCurve3.getter()
{
}

__n128 initializeBufferWithCopyOfBuffer for TimingCurve(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for TimingCurve(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for TimingCurve(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 9) = 0LL;
    *(void *)(result + 4) = 0LL;
    *(_DWORD *)__n128 result = a2 - 1;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 1_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = v3;
  return result;
}

uint64_t sub_AA624(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_AA640(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    char v2 = 1;
  }

  else
  {
    char v2 = 0;
  }

  *(_BYTE *)(result + swift_weakDestroy(v0 + 16) = v2;
  return result;
}

ValueMetadata *type metadata accessor for TimingCurve()
{
  return &type metadata for TimingCurve;
}

  ;
}

id sub_AA678(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2);
}

void sub_AA680(uint64_t a1)
{
  uint64_t v1 = a1;
  unint64_t v38 = (unint64_t)_swiftEmptyArrayStorage;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v2 = a1;
    }
    else {
      uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = __CocoaSet.makeIterator()(v2);
    unint64_t v4 = sub_AAB30();
    unint64_t v5 = sub_AAB6C();
    unsigned int v6 = Set.Iterator.init(_cocoa:)(v37, v3, v4, v5);
    uint64_t v1 = v37[0];
    uint64_t v34 = v37[1];
    uint64_t v7 = v37[2];
    int64_t v8 = v37[3];
    unint64_t v9 = v37[4];
  }

  else
  {
    uint64_t v10 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v34 = a1 + 56;
    uint64_t v7 = ~v10;
    uint64_t v11 = -v10;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v9 = v12 & *(void *)(a1 + 56);
    unsigned int v6 = (void *)swift_bridgeObjectRetain(a1);
    int64_t v8 = 0LL;
  }

  int64_t v13 = (unint64_t)(v7 + 64) >> 6;
  while (v1 < 0)
  {
    uint64_t v17 = __CocoaSet.Iterator.next()(v6);
    if (!v17) {
      goto LABEL_42;
    }
    uint64_t v18 = v17;
    uint64_t v35 = v17;
    unint64_t v19 = sub_AAB30();
    swift_unknownObjectRetain(v18);
    swift_dynamicCast(&v36, &v35, (char *)&type metadata for Swift.AnyObject + 8, v19, 7LL);
    id v20 = v36;
    swift_unknownObjectRelease(v18);
    int64_t v16 = v8;
    uint64_t v14 = v9;
    if (!v20) {
      goto LABEL_42;
    }
LABEL_29:
    uint64_t v23 = objc_opt_self(&OBJC_CLASS___UIWindowScene);
    uint64_t v24 = (void *)swift_dynamicCastObjCClass(v20, v23);
    if (!v24)
    {

      goto LABEL_35;
    }

    id v25 = [v24 keyWindow];

    int64_t v8 = v16;
    unint64_t v9 = v14;
    if (v25)
    {
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v26);
      unint64_t v28 = *(void *)((char *)&dword_10 + (v38 & 0xFFFFFFFFFFFFFF8LL));
      unint64_t v27 = *(void *)((char *)&dword_18 + (v38 & 0xFFFFFFFFFFFFFF8LL));
      if (v28 >= v27 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1LL);
      }
      uint64_t v29 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v28, v25);
      unsigned int v6 = (void *)specialized Array._endMutation()(v29, v30, v31, v32);
LABEL_35:
      int64_t v8 = v16;
      unint64_t v9 = v14;
    }
  }

  if (v9)
  {
    uint64_t v14 = (v9 - 1) & v9;
    unint64_t v15 = __clz(__rbit64(v9)) | (v8 << 6);
    int64_t v16 = v8;
LABEL_28:
    id v20 = *(id *)(*(void *)(v1 + 48) + 8 * v15);
    if (!v20) {
      goto LABEL_42;
    }
    goto LABEL_29;
  }

  int64_t v16 = v8 + 1;
  if (!__OFADD__(v8, 1LL))
  {
    if (v16 >= v13) {
      goto LABEL_42;
    }
    unint64_t v21 = *(void *)(v34 + 8 * v16);
    if (!v21)
    {
      int64_t v22 = v8 + 2;
      if (v8 + 2 >= v13) {
        goto LABEL_42;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (v21) {
        goto LABEL_26;
      }
      int64_t v22 = v8 + 3;
      if (v8 + 3 >= v13) {
        goto LABEL_42;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (v21) {
        goto LABEL_26;
      }
      int64_t v22 = v8 + 4;
      if (v8 + 4 >= v13) {
        goto LABEL_42;
      }
      unint64_t v21 = *(void *)(v34 + 8 * v22);
      if (v21)
      {
LABEL_26:
        int64_t v16 = v22;
      }

      else
      {
        int64_t v16 = v8 + 5;
        if (v8 + 5 >= v13) {
          goto LABEL_42;
        }
        unint64_t v21 = *(void *)(v34 + 8 * v16);
        if (!v21)
        {
          int64_t v33 = v8 + 6;
          while (v33 < v13)
          {
            unint64_t v21 = *(void *)(v34 + 8 * v33++);
            if (v21)
            {
              int64_t v16 = v33 - 1;
              goto LABEL_27;
            }
          }

void static UIApplication.isCompact()()
{
  uint64_t v0 = (void *)static UIApplication.window.getter();
  if (v0)
  {
    uint64_t v1 = v0;
    [v0 frame];
    CGRectGetWidth(v2);
  }

  sub_AAC14();
}

void *UIApplication.regularWidth.unsafeMutableAddressor()
{
  return &static UIApplication.regularWidth;
}

double static UIApplication.regularWidth.getter()
{
  return 375.0;
}

uint64_t static UIApplication.window.getter()
{
  id v1 = [(id)swift_getObjCClassFromMetadata(v0) sharedApplication];
  id v2 = [v1 connectedScenes];

  unint64_t v3 = sub_AAB30();
  unint64_t v4 = sub_AAB6C();
  uint64_t v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v2, v3, v4);

  sub_AA680(v5);
  uint64_t v7 = v6;
  uint64_t result = swift_bridgeObjectRelease();
  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v11);
    uint64_t result = swift_bridgeObjectRelease();
    if (!v9) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v9 = *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFF8LL));
    if (!v9)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      return v9;
    }
  }

  if ((v7 & 0xC000000000000001LL) != 0)
  {
    id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v7);
    goto LABEL_6;
  }

  if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFF8LL)))
  {
    id v10 = *(id *)(v7 + 32);
LABEL_6:
    uint64_t v9 = (uint64_t)v10;
    goto LABEL_7;
  }

  __break(1u);
  return result;
}

unint64_t sub_AAB30()
{
  unint64_t result = qword_F8298;
  if (!qword_F8298)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___UIScene);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_F8298);
  }

  return result;
}

unint64_t sub_AAB6C()
{
  unint64_t result = qword_F82A0;
  if (!qword_F82A0)
  {
    unint64_t v1 = sub_AAB30();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_F82A0);
  }

  return result;
}

void static UIApplication.hasNotch()()
{
  uint64_t v0 = (void *)static UIApplication.window.getter();
  if (v0)
  {
    unint64_t v1 = v0;
    [v0 safeAreaInsets];
  }

  sub_AAC14();
}

unint64_t sub_AABF0(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFF8LL)) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

  ;
}

__n128 initializeWithCopy for WrappingHStackLayout(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + swift_weakDestroy(v0 + 16) = v3;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for WrappingHStackLayout(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 50))
    {
      int v2 = *(_DWORD *)a1 + 254;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 49);
      BOOL v4 = v3 >= 2;
      int v2 = (v3 + 2147483646) & 0x7FFFFFFF;
      if (!v4) {
        int v2 = -1;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WrappingHStackLayout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(void *)__n128 result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 5_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 5_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 49) = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for WrappingHStackLayout()
{
  return &type metadata for WrappingHStackLayout;
}

unint64_t sub_AACF0()
{
  unint64_t result = qword_F82A8;
  if (!qword_F82A8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for EmptyAnimatableData,  &type metadata for EmptyAnimatableData);
    atomic_store(result, (unint64_t *)&qword_F82A8);
  }

  return result;
}

double sub_AAD2C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_AADF0(a1, a2 & 1, a3, a4, a5);
  if ((a2 & 1) != 0)
  {
    uint64_t v8 = v7[2];
    if (v8)
    {
      uint64_t v9 = (double *)(v7 + 5);
      double v10 = 0.0;
      do
      {
        double v11 = *v9;
        v9 += 4;
        double v12 = v11;
        if (v10 <= v11) {
          double v10 = v12;
        }
        --v8;
      }

      while (v8);
    }

    else
    {
      double v10 = 0.0;
    }
  }

  else
  {
    double v10 = *(double *)&a1;
  }

  uint64_t v13 = sub_ABF74((uint64_t)v7);
  double v15 = v14;
  double v17 = v16;
  swift_bridgeObjectRelease();
  if (v13)
  {
    swift_bridgeObjectRelease();
    double v18 = v17 + v15;
  }

  else
  {
    double v18 = 0.0;
  }

  return NSDirectionalEdgeInsets.edgeInsets.getter(v10, v18);
}

void *sub_AADF0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v220 = type metadata accessor for ViewSpacing(0LL);
  unint64_t v8 = *(void *)(v220 - 8);
  __chkstk_darwin(v220);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v9);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v10);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v11);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v12);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v13);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v14);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v15);
  v210 = (char *)v195 - v16;
  uint64_t v214 = type metadata accessor for WrappingHStackLayout.RowItem(0LL);
  uint64_t v223 = *(void *)(v214 - 8);
  sub_B088();
  __chkstk_darwin(v17);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v18);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v19);
  sub_5382C((uint64_t)v195 - v20);
  uint64_t v228 = sub_44DC(&qword_F82B8);
  sub_B088();
  __chkstk_darwin(v21);
  sub_154AC();
  sub_5382C(v22);
  sub_44DC(&qword_F82C0);
  sub_B088();
  __chkstk_darwin(v23);
  sub_154AC();
  uint64_t v216 = v24;
  uint64_t v25 = type metadata accessor for LayoutSubview(0LL);
  unint64_t v224 = *(void *)(v25 - 8);
  sub_B088();
  __chkstk_darwin(v26);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v27);
  sub_A0F14();
  sub_A0E94();
  __chkstk_darwin(v28);
  uint64_t v30 = (char *)v195 - v29;
  sub_44DC(&qword_F82C8);
  sub_B088();
  __chkstk_darwin(v31);
  sub_15758();
  sub_A0E94();
  __chkstk_darwin(v32);
  uint64_t v34 = (void *)((char *)v195 - v33);
  uint64_t v35 = type metadata accessor for LayoutSubviews(0LL);
  uint64_t v207 = *(void *)(v35 - 8);
  sub_B088();
  __chkstk_darwin(v36);
  sub_154AC();
  sub_5382C(v37);
  sub_44DC(&qword_F82D0);
  sub_B088();
  __chkstk_darwin(v38);
  sub_154AC();
  sub_5382C(v39);
  v229 = (void *)sub_44DC(&qword_F82D8);
  sub_B088();
  __chkstk_darwin(v40);
  sub_154AC();
  sub_5382C(v41);
  if ((a2 & 1) != 0) {
    double v42 = INFINITY;
  }
  else {
    double v42 = *(double *)&a1;
  }
  sub_ACAAC(&qword_F82E0, (uint64_t)&protocol conformance descriptor for LayoutSubviews);
  uint64_t v44 = v43;
  uint64_t v45 = sub_AD084();
  uint64_t v46 = dispatch thunk of Collection.count.getter(v45);
  uint64_t v47 = _swiftEmptyArrayStorage;
  unint64_t v225 = v8;
  *(void *)&__int128 v230 = v25;
  v222 = (void (*)(uint64_t, uint64_t, uint64_t))v35;
  if (v46)
  {
    uint64_t v48 = v46;
    v231 = _swiftEmptyArrayStorage;
    sub_2CB38(0LL, v46 & ~(v46 >> 63), 0);
    uint64_t v49 = sub_AD084();
    dispatch thunk of Collection.startIndex.getter(v49);
    if (v48 < 0) {
      goto LABEL_85;
    }
    do
    {
      sub_AD094((uint64_t)&v235, (uint64_t)&v242);
      unint64_t v50 = v224;
      (*(void (**)(char *))(v224 + 16))(v30);
      uint64_t v51 = sub_AD0D4();
      uint64_t v52 = static ProposedViewSize.unspecified.getter(v51);
      uint64_t v54 = v53 & 1;
      LOBYTE(v235) = v54;
      LOBYTE(v24_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v55 & 1;
      double v57 = LayoutSubview.sizeThatFits(_:)(v52, v54, v56, v55 & 1);
      uint64_t v59 = v58;
      (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v25);
      uint64_t v47 = v231;
      if ((swift_isUniquelyReferenced_nonNull_native(v231) & 1) == 0)
      {
        sub_2CB38(0LL, v47[2] + 1LL, 1);
        uint64_t v47 = v231;
      }

      unint64_t v61 = v47[2];
      unint64_t v60 = v47[3];
      uint64_t v35 = (uint64_t)v222;
      if (v61 >= v60 >> 1)
      {
        sub_2CB38((char *)(v60 > 1), v61 + 1, 1);
        uint64_t v47 = v231;
      }

      void v47[2] = v61 + 1;
      uint64_t v62 = (double *)&v47[2 * v61];
      _OWORD v62[4] = v57;
      *((void *)v62 + 5) = v59;
      sub_AD0FC((uint64_t)&v242);
      --v48;
      unint64_t v8 = v225;
      uint64_t v25 = v230;
    }

    while (v48);
  }

  uint64_t v63 = v207;
  uint64_t v64 = (uint64_t)v227;
  v205 = *(void (**)(void *, uint64_t, uint64_t))(v207 + 16);
  v205(v227, a5, v35);
  (*(void (**)(void *, uint64_t, uint64_t))(v63 + 32))(v206, v64, v35);
  sub_ACAAC(&qword_F82E8, (uint64_t)&protocol conformance descriptor for LayoutSubviews);
  uint64_t v65 = v219;
  dispatch thunk of Sequence.makeIterator()(v35, v66);
  uint64_t v197 = *((int *)v229 + 9);
  *(void *)(v65 + v19_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = 0LL;
  uint64_t v48 = v65 + *(int *)(sub_44DC(&qword_F82F0) + 36);
  uint64_t v211 = v195[0] + 24LL;
  v221 = v47 + 4;
  double v67 = 0.0;
  __int128 v204 = xmmword_B5B40;
  double v68 = 0.0;
  v227 = _swiftEmptyArrayStorage;
  v229 = _swiftEmptyArrayStorage;
  sub_AD0BC();
  v217 = v34;
  uint64_t v208 = v44;
  while (1)
  {
    uint64_t v69 = *(void *)v48;
    uint64_t v70 = sub_AD084();
    dispatch thunk of Collection.endIndex.getter(v70);
    if (v69 == v235)
    {
      uint64_t v71 = v216;
      sub_4AD0(v216, 1LL, 1LL, v230);
      uint64_t v72 = v218;
LABEL_15:
      sub_8144(v71, &qword_F82C0);
      uint64_t v81 = v215;
      sub_4AD0((uint64_t)v215, 1LL, 1LL, v228);
      goto LABEL_18;
    }

    sub_AD094((uint64_t)&v235, v48);
    __int128 v73 = *(void (**)(uint64_t))(v64 + 16);
    uint64_t v74 = v216;
    uint64_t v64 = v230;
    v73(v216);
    sub_AD0D4();
    uint64_t v75 = v206;
    v205(v206, v65, v35);
    sub_AD0FC(v48);
    __int128 v76 = v75;
    uint64_t v71 = v74;
    (*(void (**)(void *, uint64_t))(v207 + 8))(v76, v35);
    sub_4AD0(v74, 0LL, 1LL, v64);
    sub_AD0BC();
    int v80 = sub_4AC4(v77, v78, v79);
    uint64_t v72 = v218;
    if (v80 == 1) {
      goto LABEL_15;
    }
    uint64_t v82 = v47;
    uint64_t v83 = v48;
    uint64_t v44 = v8;
    uint64_t v84 = v198;
    uint64_t v64 = v230;
    sub_AD0F4(v198, v71);
    uint64_t v85 = v199 + *(int *)(v228 + 48);
    unint64_t v8 = v219;
    uint64_t v48 = v197;
    uint64_t v86 = *(void *)(v219 + v197);
    sub_AD0F4(v85, v84);
    if (__OFADD__(v86, 1LL)) {
      goto LABEL_84;
    }
    *(void *)(v8 + v48) = v86 + 1;
    uint64_t v87 = v228;
    uint64_t v81 = v215;
    uint64_t v88 = (uint64_t)v215 + *(int *)(v228 + 48);
    void *v215 = v86;
    sub_AD0F4(v88, v85);
    sub_4AD0((uint64_t)v81, 0LL, 1LL, v87);
    uint64_t v72 = v218;
    sub_AD0BC();
    unint64_t v8 = v44;
    uint64_t v44 = v208;
    uint64_t v48 = v83;
    uint64_t v47 = v82;
    uint64_t v34 = v217;
LABEL_18:
    sub_92954((uint64_t)v81, (uint64_t)v34, &qword_F82C8);
    int v89 = sub_4AC4((uint64_t)v34, 1LL, v228);
    double v90 = v227;
    if (v89 == 1)
    {
      sub_8144(v219, &qword_F82D8);
      swift_bridgeObjectRelease();
      if (v229[2])
      {
        swift_bridgeObjectRetain(v229);
        sub_AD07C();
        sub_AD01C();
        if ((v134 & 1) != 0) {
          goto LABEL_43;
        }
        goto LABEL_86;
      }

      unint64_t v138 = v90[2];
      sub_AD01C();
      goto LABEL_47;
    }

    unint64_t v8 = *v34;
    sub_AD108(v226, (uint64_t)v34 + *(int *)(v228 + 48), *(uint64_t (**)(uint64_t, uint64_t, void))(v64 + 32));
    uint64_t v91 = v229[2];
    if (v91)
    {
      sub_AC604( (uint64_t)v229 + ((*(unsigned __int8 *)(v223 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v223 + 80))
      + *(void *)(v223 + 72) * (v91 - 1),
        v72);
      sub_92954(v211, (uint64_t)v238, &qword_F82F8);
      sub_92954((uint64_t)v238, (uint64_t)&v242, &qword_F82F8);
      if ((v243 & 1) != 0)
      {
        uint64_t v92 = v210;
        uint64_t v93 = ((uint64_t (*)(void))LayoutSubview.spacing.getter)();
        uint64_t v94 = v209;
        LayoutSubview.spacing.getter(v93);
        double v95 = ViewSpacing.distance(to:along:)(v94, 0LL);
        uint64_t v96 = *(void (**)(uint64_t, uint64_t))(v225 + 8);
        uint64_t v97 = v94;
        uint64_t v98 = v92;
        uint64_t v44 = v208;
        uint64_t v99 = v220;
        v96(v97, v220);
        v96((uint64_t)v98, v99);
        double v90 = v227;
      }

      else
      {
        double v95 = v242;
      }

      sub_AC648(v72);
    }

    else
    {
      double v95 = 0.0;
    }

    if ((v8 & 0x8000000000000000LL) != 0) {
      break;
    }
    if (v8 >= v47[2]) {
      goto LABEL_80;
    }
    uint64_t v100 = (double *)&v221[2 * v8];
    double v101 = v95 + v68 + *v100;
    if (v101 <= v42)
    {
      double v117 = v68 + v95;
      if (v67 <= v100[1]) {
        double v67 = v100[1];
      }
      uint64_t v118 = v213;
      sub_AD108(v213, v226, *(uint64_t (**)(uint64_t, uint64_t, void))(v64 + 16));
      uint64_t v119 = v214;
      __int128 v120 = *(_OWORD *)v100;
      *(double *)(v118 + *(int *)(v214 + 20)) = v117;
      *(_OWORD *)(v118 + *(int *)(v119 + swift_release(*(void *)(v0 + 24)) = v120;
      uint64_t v121 = v229;
      if ((sub_AD07C() & 1) == 0)
      {
        sub_41A80(0, v121[2] + 1LL, 1, (uint64_t)v121);
        uint64_t v121 = v129;
      }

      unint64_t v8 = v225;
      v229 = v121;
      unint64_t v123 = v121[2];
      unint64_t v122 = v121[3];
      if (v123 >= v122 >> 1)
      {
        char v130 = sub_AD0E0(v122);
        sub_41A80(v130, v131, v132, (uint64_t)v229);
        v229 = v133;
      }

      v229[2] = v123 + 1;
      sub_AD0C8();
      sub_ACAFC(v213, v125 + v124 + *(void *)(v126 + 72) * v123);
      uint64_t v114 = v230;
      sub_AD0BC();
      uint64_t v113 = v226;
    }

    else
    {
      if ((sub_AD07C() & 1) == 0)
      {
        sub_AD030();
        double v90 = v127;
      }

      v227 = v90;
      unint64_t v103 = v90[2];
      unint64_t v102 = v90[3];
      if (v103 >= v102 >> 1)
      {
        sub_AD0E0(v102);
        sub_419D0();
        v227 = v128;
      }

      uint64_t v104 = v227;
      v227[2] = v103 + 1;
      sub_AD054(&v104[4 * v103]);
      uint64_t v105 = sub_44DC(&qword_F52D8);
      uint64_t v106 = *(unsigned __int8 *)(v223 + 80);
      uint64_t v107 = (v106 + 32) & ~v106;
      uint64_t v108 = (void *)swift_allocObject(v105, v107 + *(void *)(v223 + 72), v106 | 7);
      *((_OWORD *)v108 + 1) = v204;
      v229 = v108;
      uint64_t v109 = (char *)v108 + v107;
      double v110 = *v100;
      uint64_t v111 = (double *)&v221[2 * v8];
      uint64_t v112 = *((void *)v111 + 1);
      uint64_t v113 = v226;
      uint64_t v114 = v230;
      (*(void (**)(char *, uint64_t, void))(v64 + 16))(v109, v226, v230);
      uint64_t v115 = v214;
      *(void *)&v109[*(int *)(v214 + 20)] = 0LL;
      uint64_t v116 = (double *)&v109[*(int *)(v115 + 24)];
      *uint64_t v116 = v110;
      *((void *)v116 + 1) = v112;
      double v101 = *v100;
      double v67 = v111[1];
      unint64_t v8 = v225;
    }

    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v113, v114);
    double v68 = v101;
    uint64_t v34 = v217;
    uint64_t v35 = (uint64_t)v222;
    uint64_t v65 = v219;
  }

  __break(1u);
LABEL_80:
  __break(1u);
  while (1)
  {
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    sub_AD030();
    double v90 = v193;
LABEL_43:
    uint64_t v135 = v90;
    unint64_t v136 = v90[2];
    uint64_t v137 = v135;
    unint64_t v138 = v136 + 1;
    if (v136 >= v135[3] >> 1)
    {
      sub_419D0();
      uint64_t v137 = v194;
    }

    v137[2] = v138;
    uint64_t v139 = &v137[4 * v136];
    double v90 = v137;
    sub_AD054(v139);
LABEL_47:
    if (v138 < 2) {
      break;
    }
    sub_92954(v195[0] + 40LL, (uint64_t)v239, &qword_F82F8);
    unint64_t v140 = v90[2];
    unint64_t v142 = 1LL;
    v221 = (void *)v138;
    while (v142 - 1 < v140)
    {
      if (v142 >= v140) {
        goto LABEL_82;
      }
      uint64_t v143 = (uint64_t)&v90[4 * v142];
      double v145 = *(double *)(v143 + 16);
      double v144 = *(double *)(v143 + 24);
      uint64_t v146 = v90[4 * v142 + 4];
      uint64_t v147 = *(void *)v143;
      sub_92954((uint64_t)v239, (uint64_t)&v240, &qword_F82F8);
      if ((v241 & 1) != 0)
      {
        unint64_t v224 = v142;
        v227 = v90;
        swift_bridgeObjectRetain_n(v146, 2LL);
        uint64_t v228 = v147;
        uint64_t v148 = sub_AD0B4();
        uint64_t v149 = v203;
        static ViewSpacing.zero.getter(v148);
        unsigned int v150 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
        v150(v212, v149, v220);
        uint64_t v151 = *(void *)(v146 + 16);
        uint64_t v226 = v146;
        if (v151)
        {
          v222 = v150;
          uint64_t v152 = v223;
          sub_AD0C8();
          uint64_t v48 = v146 + v153;
          swift_bridgeObjectRetain(v146);
          uint64_t v154 = v212;
          *(void *)&__int128 v230 = *(void *)(v152 + 72);
          uint64_t v149 = v8;
          double v155 = v210;
          uint64_t v156 = v220;
          uint64_t v157 = v209;
          uint64_t v44 = v200;
          do
          {
            uint64_t v158 = sub_AC604(v48, v44);
            uint64_t v159 = LayoutSubview.spacing.getter(v158);
            uint64_t v160 = static Edge.Set.all.getter(v159);
            ViewSpacing.union(_:edges:)(v157, v160);
            uint64_t v161 = *(void (**)(uint64_t, uint64_t))(v149 + 8);
            v161(v157, v156);
            sub_AC648(v44);
            v161(v154, v156);
            uint64_t v162 = *(void (**)(uint64_t, char *, uint64_t))(v149 + 32);
            v162(v154, v155, v156);
            v48 += v230;
            --v151;
          }

          while (v151);
          sub_AD114();
          sub_AD01C();
          unint64_t v8 = v149;
          unsigned int v150 = v222;
        }

        else
        {
          uint64_t v162 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
        }

        sub_AD0A4(v202, v212);
        uint64_t v164 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
        sub_6E8B8(v203);
        sub_AD114();
        uint64_t v165 = v228;
        uint64_t v166 = sub_AD0B4();
        static ViewSpacing.zero.getter(v166);
        v150(v44, v48, v149);
        uint64_t v167 = *(void *)(v165 + 16);
        uint64_t v168 = v44;
        if (v167)
        {
          uint64_t v169 = v223;
          sub_AD0C8();
          uint64_t v171 = v165 + v170;
          sub_AD0B4();
          *(void *)&__int128 v230 = *(void *)(v169 + 72);
          uint64_t v172 = v209;
          CGRect v173 = v210;
          uint64_t v174 = v220;
          uint64_t v175 = v200;
          do
          {
            uint64_t v176 = sub_AC604(v171, v175);
            uint64_t v177 = LayoutSubview.spacing.getter(v176);
            uint64_t v178 = static Edge.Set.all.getter(v177);
            ViewSpacing.union(_:edges:)(v172, v178);
            v164(v172, v174);
            sub_AC648(v175);
            v164(v168, v174);
            v162(v168, v173, v174);
            v171 += v230;
            --v167;
          }

          while (v167);
          sub_7EDF0();
          unint64_t v8 = v225;
          uint64_t v48 = v201;
        }

        uint64_t v179 = v196;
        uint64_t v44 = v168;
        sub_AD0A4(v196, v168);
        sub_6E8B8(v48);
        sub_7EDF0();
        uint64_t v180 = v202;
        double v163 = ViewSpacing.distance(to:along:)(v179, 1LL);
        sub_6E8B8(v179);
        sub_6E8B8(v180);
        sub_7EDF0();
        sub_AD114();
        double v90 = v227;
        unint64_t v138 = (unint64_t)v221;
        unint64_t v142 = v224;
      }

      else
      {
        double v163 = v240;
      }

      if ((sub_AD07C() & 1) == 0)
      {
        sub_ACAE8();
        double v90 = v181;
      }

      unint64_t v140 = v90[2];
      if (v142 >= v140) {
        goto LABEL_83;
      }
      *(double *)&v90[4 * v142++ + 7] = v144 + v145 + v163;
      if (v142 == v138) {
        goto LABEL_49;
      }
    }
  }

  unint64_t v140 = v138;
LABEL_49:
  if ((*(_BYTE *)(v195[0] + 49LL) & 1) != 0)
  {
    if (v140)
    {
      v234 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(v90);
      v182 = v90;
      sub_2CB1C(0LL, v140, 0);
      uint64_t v141 = v234;
      v183 = v90 + 7;
      do
      {
        uint64_t v184 = *v183;
        __int128 v185 = *((_OWORD *)v183 - 1);
        v231 = (void *)*(v183 - 3);
        __int128 v232 = v185;
        uint64_t v233 = v184;
        sub_AC684((uint64_t)&v231, &v235, v42);
        uint64_t v186 = v235;
        __int128 v187 = v236;
        uint64_t v188 = v237;
        v234 = v141;
        unint64_t v190 = v141[2];
        unint64_t v189 = v141[3];
        if (v190 >= v189 >> 1)
        {
          __int128 v230 = v236;
          sub_2CB1C((char *)(v189 > 1), v190 + 1, 1);
          __int128 v187 = v230;
          double v90 = v182;
          uint64_t v141 = v234;
        }

        v141[2] = v190 + 1;
        v191 = &v141[4 * v190];
        v191[4] = v186;
        *(_OWORD *)(v191 + 5) = v187;
        v191[7] = v188;
        v183 += 4;
        --v140;
      }

      while (v140);
      sub_AD048();
      swift_bridgeObjectRelease_n(v90, 2LL);
    }

    else
    {
      swift_bridgeObjectRelease();
      sub_AD048();
      return _swiftEmptyArrayStorage;
    }
  }

  else
  {
    sub_AD048();
    return v90;
  }

  return v141;
}

uint64_t sub_ABF74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1) {
    return swift_bridgeObjectRetain(*(void *)(a1 + 32 * v1));
  }
  else {
    return 0LL;
  }
}

void sub_ABFCC(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v52 = type metadata accessor for WrappingHStackLayout.RowItem(0LL);
  uint64_t v51 = *(void *)(v52 - 8);
  sub_B088();
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_AADF0(a1, a2 & 1, v14, v15, a5);
  uint64_t v17 = v16;
  if (*(_BYTE *)(v5 + 16) == 1) {
    static Alignment.center.getter(v16);
  }
  sub_AC25C();
  uint64_t v54 = v17[2];
  if (v54)
  {
    double v20 = v18;
    double v21 = v19;
    uint64_t v50 = a3;
    unint64_t v22 = 0LL;
    char v53 = v17 + 4;
    uint64_t v23 = a2 & 1;
    unsigned __int8 v24 = a4 & 1;
    uint64_t v49 = v17;
    while (v22 < v17[2])
    {
      uint64_t v25 = (double *)&v53[4 * v22];
      uint64_t v26 = *(void *)(*(void *)v25 + 16LL);
      if (v26)
      {
        unint64_t v56 = v22;
        double v27 = v25[1];
        double v60 = v25[2];
        double v61 = v27;
        double v59 = v25[3];
        uint64_t v28 = *(int *)(v52 + 20);
        uint64_t v57 = *(int *)(v52 + 24);
        uint64_t v58 = v28;
        uint64_t v29 = v51;
        sub_AD0C8();
        uint64_t v32 = v30 + v31;
        uint64_t v55 = v30;
        swift_bridgeObjectRetain(v30);
        uint64_t v33 = a1;
        uint64_t v34 = *(void *)(v29 + 72);
        uint64_t v35 = v50;
        do
        {
          sub_AC604(v32, (uint64_t)v13);
          double v36 = *(double *)&v13[v58];
          v64.origin.x = sub_1BE3C();
          double v37 = v36 + CGRectGetMinX(v64);
          v65.origin.x = sub_1BE3C();
          double v38 = v37 + v20 * (CGRectGetWidth(v65) - v61);
          v66.origin.x = sub_1BE3C();
          CGFloat MinY = CGRectGetMinY(v66);
          double v40 = NSDirectionalEdgeInsets.edgeInsets.getter(v38, v59 + MinY + v21 * (v60 - *(double *)&v13[v57 + 8]));
          double v41 = v20;
          double v43 = v42;
          double v44 = static UnitPoint.topLeading.getter();
          double v46 = v45;
          char v63 = v23;
          unsigned __int8 v62 = v24;
          double v47 = v43;
          double v20 = v41;
          LayoutSubview.place(at:anchor:proposal:)(v33, v23, v35, v24, v40, v47, v44, v46);
          sub_AC648((uint64_t)v13);
          v32 += v34;
          --v26;
        }

        while (v26);
        swift_bridgeObjectRelease();
        a1 = v33;
        uint64_t v17 = v49;
        unint64_t v22 = v56;
      }

      if (++v22 == v54)
      {
        swift_bridgeObjectRelease();
        sub_B030();
        return;
      }
    }

    __break(1u);
  }

  else
  {
    sub_B030();
    swift_bridgeObjectRelease();
  }

uint64_t sub_AC25C()
{
  uint64_t v0 = static Alignment.leading.getter();
  if ((static Alignment.== infix(_:_:)(v0) & 1) != 0) {
    return static UnitPoint.leading.getter();
  }
  uint64_t v2 = static Alignment.topLeading.getter();
  if ((static Alignment.== infix(_:_:)(v2) & 1) != 0) {
    return static UnitPoint.topLeading.getter();
  }
  uint64_t v3 = static Alignment.top.getter();
  if ((static Alignment.== infix(_:_:)(v3) & 1) != 0) {
    return static UnitPoint.top.getter();
  }
  uint64_t v4 = static Alignment.topTrailing.getter();
  if ((static Alignment.== infix(_:_:)(v4) & 1) != 0) {
    return static UnitPoint.topTrailing.getter();
  }
  uint64_t v5 = static Alignment.trailing.getter();
  if ((static Alignment.== infix(_:_:)(v5) & 1) != 0) {
    return static UnitPoint.trailing.getter();
  }
  uint64_t v6 = static Alignment.bottomTrailing.getter();
  if ((static Alignment.== infix(_:_:)(v6) & 1) != 0) {
    return static UnitPoint.bottomTrailing.getter();
  }
  uint64_t v7 = static Alignment.bottom.getter();
  if ((static Alignment.== infix(_:_:)(v7) & 1) != 0) {
    return static UnitPoint.bottom.getter();
  }
  uint64_t v8 = static Alignment.bottomLeading.getter();
  if ((static Alignment.== infix(_:_:)(v8) & 1) != 0) {
    return static UnitPoint.bottomLeading.getter();
  }
  else {
    return static UnitPoint.center.getter();
  }
}

uint64_t sub_AC380()
{
  return LayoutProperties.stackOrientation.setter(0LL);
}

double sub_AC3B4(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
  return sub_AAD2C(a1, a2 & 1, a3, a4 & 1, a5);
}

void sub_AC404(uint64_t a1, char a2, uint64_t a3, char a4, uint64_t a5)
{
}

uint64_t sub_AC454( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_AC4AC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_AC480( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_AC4AC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  (uint64_t (*)(uint64_t))&Layout.explicitAlignment(of:in:proposal:subviews:cache:));
}

uint64_t sub_AC4AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t (*a10)(uint64_t))
{
  return a10(a1);
}

double sub_AC4E8()
{
  return NSDirectionalEdgeInsets.edgeInsets.getter(*(double *)(v0 + 32), *(double *)(v0 + 16));
}

void (*sub_AC52C(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = Animatable<>.animatableData.modify();
  return sub_33834;
}

unint64_t sub_AC590()
{
  unint64_t result = qword_F82B0;
  if (!qword_F82B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_BCC48, &type metadata for WrappingHStackLayout);
    atomic_store(result, (unint64_t *)&qword_F82B0);
  }

  return result;
}

uint64_t type metadata accessor for WrappingHStackLayout.RowItem(uint64_t a1)
{
  uint64_t result = qword_F8358;
  if (!qword_F8358) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for WrappingHStackLayout.RowItem);
  }
  return result;
}

uint64_t sub_AC604(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WrappingHStackLayout.RowItem(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_AC648(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for WrappingHStackLayout.RowItem(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_AC684(uint64_t a1@<X0>, uint64_t *a2@<X8>, double a3@<D0>)
{
  double v42 = a2;
  uint64_t v43 = type metadata accessor for WrappingHStackLayout.RowItem(0LL);
  uint64_t v6 = *(void *)(v43 - 8);
  __chkstk_darwin(v43);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)a1;
  __int128 v44 = *(_OWORD *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 24);
  int64_t v11 = *(void *)(v9 + 16);
  double v41 = (void *)v6;
  if (v11)
  {
    double v47 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain_n(v9, 2LL);
    sub_2CB70(0LL, v11, 0);
    uint64_t v12 = v9 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v13 = *(void *)(v6 + 72);
    uint64_t v14 = v47;
    do
    {
      sub_AC604(v12, (uint64_t)v8);
      char v46 = 0;
      char v45 = 0;
      double v3 = LayoutSubview.sizeThatFits(_:)(0x7FF0000000000000LL, 0LL, 0LL, 0LL);
      sub_AC648((uint64_t)v8);
      if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) == 0)
      {
        sub_2CB70(0LL, v14[2] + 1LL, 1);
        uint64_t v14 = v47;
      }

      unint64_t v16 = v14[2];
      unint64_t v15 = v14[3];
      if (v16 >= v15 >> 1)
      {
        sub_2CB70((char *)(v15 > 1), v16 + 1, 1);
        uint64_t v14 = v47;
      }

      v14[2] = v16 + 1;
      *(double *)&v14[v16 + 4] = v3;
      v12 += v13;
      --v11;
    }

    while (v11);
    swift_bridgeObjectRelease();
  }

  else
  {
    swift_bridgeObjectRetain(v9);
    uint64_t v14 = _swiftEmptyArrayStorage;
  }

  int64_t v17 = v14[2];
  if (v17)
  {
    double v47 = _swiftEmptyArrayStorage;
    sub_2CB54(0LL, v17, 0);
    uint64_t v18 = 0LL;
    double v19 = v47;
    uint64_t v20 = v47[2];
    do
    {
      double v3 = *(double *)&v14[v18 + 4];
      double v47 = v19;
      unint64_t v21 = v19[3];
      if (v20 + v18 >= v21 >> 1)
      {
        sub_2CB54((char *)(v21 > 1), v20 + v18 + 1, 1);
        double v19 = v47;
      }

      void v19[2] = v20 + v18 + 1;
      *((_BYTE *)v19 + v20 + v18++ + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v3 == INFINITY;
    }

    while (v17 != v18);
    swift_bridgeObjectRelease();
  }

  else
  {
    swift_bridgeObjectRelease();
    double v19 = _swiftEmptyArrayStorage;
  }

  double v22 = a3 - *(double *)&v44;
  unint64_t v23 = v19[2];
  if (!v23) {
    goto LABEL_32;
  }
  uint64_t v24 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = v19 + 4;
  do
  {
    uint64_t v27 = *((unsigned __int8 *)v19 + v24 + 32);
    BOOL v28 = __OFADD__(v25, v27);
    v25 += v27;
    if (v28)
    {
      __break(1u);
      goto LABEL_41;
    }

    ++v24;
  }

  while (v23 != v24);
  if (v25 <= 0)
  {
LABEL_32:
    swift_bridgeObjectRelease();
    unint64_t v35 = *(void *)(v9 + 16);
    uint64_t v26 = (void *)v43;
    double v19 = v41;
    if (v35 >= 2)
    {
      double v3 = (double)(uint64_t)(v35 - 1);
      if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) != 0) {
        goto LABEL_34;
      }
      goto LABEL_43;
    }

    goto LABEL_39;
  }

  unint64_t v29 = *(void *)(v9 + 16);
  uint64_t v30 = v43;
  if (!v29)
  {
LABEL_38:
    swift_bridgeObjectRelease();
LABEL_39:
    uint64_t v39 = v42;
    *double v42 = v9;
    *(_OWORD *)(v39 + 1) = v44;
    void v39[3] = v10;
    return;
  }

  if (v29 <= v23)
  {
    unint64_t v31 = 0LL;
    double v22 = v22 / (double)v25;
    double v3 = 0.0;
    uint64_t v32 = v41;
    do
    {
      if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
      {
        sub_ACB40(v9);
        uint64_t v9 = v34;
      }

      if (v31 >= *(void *)(v9 + 16))
      {
        while (1)
        {
          __break(1u);
LABEL_43:
          sub_ACB40(v9);
          uint64_t v9 = v40;
LABEL_34:
          unint64_t v36 = 1LL;
          while (1)
          {
            unint64_t v37 = *(void *)(v9 + 16);
            if (v36 >= v37) {
              break;
            }
            unint64_t v38 = v9
            *(double *)(v38 + *((int *)v26 + 5)) = v22 / v3 * (double)(uint64_t)v36++
                                                 + *(double *)(v38 + *((int *)v26 + 5));
            if (v36 >= v37) {
              goto LABEL_39;
            }
          }

LABEL_41:
          __break(1u);
        }
      }

      unint64_t v33 = v9
      *(double *)(v33 + *(int *)(v30 + 20)) = v3 + *(double *)(v33 + *(int *)(v30 + 20));
      if (*((_BYTE *)v26 + v31) == 1)
      {
        double v3 = v22 + v3;
        *(double *)(v33 + *(int *)(v30 + swift_release(*(void *)(v0 + 24)) = v22 + *(double *)(v33 + *(int *)(v30 + 24));
      }

      ++v31;
    }

    while (v29 != v31);
    goto LABEL_38;
  }

  __break(1u);
}

void sub_ACAAC(unint64_t *a1, uint64_t a2)
{
  if (!*a1)
  {
    uint64_t v4 = type metadata accessor for LayoutSubviews(255LL);
    atomic_store(swift_getWitnessTable(a2, v4), a1);
  }

  sub_4960();
}

void sub_ACAE8()
{
}

uint64_t sub_ACAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for WrappingHStackLayout.RowItem(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_ACB40(uint64_t a1)
{
}

uint64_t destroy for WrappingHStackLayout.Row(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t initializeWithCopy for WrappingHStackLayout.Row(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)a1 = *a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
  *(void *)(a1 + 24) = a2[3];
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for WrappingHStackLayout.Row(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  return a1;
}

uint64_t *assignWithTake for WrappingHStackLayout.Row(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  a1[3] = a2[3];
  return a1;
}

uint64_t getEnumTagSinglePayload for WrappingHStackLayout.Row(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      uint64_t v2 = *a1;
    }
  }

  else
  {
    LODWORD(sub_7AC68(OBJC_IVAR____TtC20StoreDynamicUIPlugin21OfferPlatterComponent_isToggled, v2) = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for WrappingHStackLayout.Row(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + swift_weakDestroy(v0 + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for WrappingHStackLayout.Row()
{
  return &type metadata for WrappingHStackLayout.Row;
}

uint64_t *sub_ACCC8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v9);
  }

  else
  {
    uint64_t v7 = type metadata accessor for LayoutSubview(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    *(_OWORD *)((char *)a1 + v8) = *(_OWORD *)((char *)a2 + v8);
  }

  return a1;
}

uint64_t sub_ACD58(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for LayoutSubview(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
}

uint64_t sub_ACD8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LayoutSubview(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_ACDF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LayoutSubview(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t sub_ACE68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LayoutSubview(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_ACECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for LayoutSubview(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_OWORD *)(a1 + v_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = *(_OWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_ACF30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_ACF3C);
}

uint64_t sub_ACF3C()
{
  uint64_t v2 = sub_AD06C();
  return sub_4AC4(v1, v0, v2);
}

uint64_t sub_ACF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_ACF70);
}

uint64_t sub_ACF70()
{
  uint64_t v2 = sub_AD06C();
  return sub_4AD0(v1, v0, v0, v2);
}

uint64_t sub_ACF9C(uint64_t a1)
{
  uint64_t result = type metadata accessor for LayoutSubview(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[2] = &unk_BCD20;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

  ;
}

void sub_AD030()
{
}

uint64_t sub_AD048()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 312));
}

void sub_AD054(void *a1@<X8>)
{
  a1[4] = *(void *)(v1 - 312);
  a1[5] = v3;
  a1[6] = v2;
  a1[7] = 0LL;
}

uint64_t sub_AD06C()
{
  return type metadata accessor for LayoutSubview(0LL);
}

uint64_t sub_AD07C()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_AD084()
{
  return v0;
}

uint64_t sub_AD094(uint64_t a1, uint64_t a2)
{
  return dispatch thunk of Collection.subscript.read(a1, a2, v2, v3);
}

uint64_t sub_AD0A4(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, *(void *)(v3 - 384));
}

uint64_t sub_AD0B4()
{
  return swift_bridgeObjectRetain(v0);
}

  ;
}

  ;
}

uint64_t sub_AD0D4()
{
  return v0(v1 - 232, 0LL);
}

BOOL sub_AD0E0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t sub_AD0F4(uint64_t a1, uint64_t a2)
{
  return v3(a1, a2, v2);
}

uint64_t sub_AD0FC(uint64_t a1)
{
  return dispatch thunk of Collection.formIndex(after:)(a1, v1, v2);
}

uint64_t sub_AD108@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, void)@<X8>)
{
  return a3(a1, a2, *(void *)(v3 - 304));
}

uint64_t sub_AD114()
{
  return swift_bridgeObjectRelease(v0);
}

Swift::Void __swiftcall UICollectionViewCell.setFloatingStyle()()
{
}

void sub_AD130(double a1)
{
  id v2 = sub_AD1B0();
  [v2 setCornerRadius:a1];

  id v3 = sub_AD1B0();
  [v3 setMasksToBounds:1];
}

id sub_AD1B0()
{
  return [v0 *(SEL *)(v1 + 392)];
}

void sub_AD1BC(void *a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8 = swift_allocObject(&unk_E7E68, 24LL, 7LL);
  swift_unknownObjectWeakInit(v8 + 16);
  uint64_t v9 = swift_allocObject(&unk_E7E90, 32LL, 7LL);
  *(void *)(v9 + swift_weakDestroy(v0 + 16) = v8;
  *(double *)(v9 + 24) = a3;
  uint64_t v10 = sub_32418((uint64_t)sub_45D9C, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v11, v13);
  swift_release();
  if (a1)
  {
    a1 = sub_32418((uint64_t)sub_AD3CC, (uint64_t)_NSConcreteStackBlock, 1107296256LL, v12, v14);
    swift_retain(a2);
    swift_release();
  }

  [(id)objc_opt_self(UIView) animateWithDuration:134 delay:v10 options:a1 animations:a4 completion:0.0];
  _Block_release(a1);
  _Block_release(v10);
}

uint64_t sub_AD2F8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_AD31C(uint64_t a1, double a2)
{
  uint64_t v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0LL, 0LL);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    int v5 = Strong;
    [Strong setAlpha:a2];
  }

uint64_t sub_AD384()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

void sub_AD3A8()
{
}

uint64_t sub_AD3B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v2;
  return swift_retain(v2);
}

uint64_t sub_AD3C4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_AD3CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_AD410(char a1, char a2)
{
  uint64_t v4 = (void *)objc_opt_self(&OBJC_CLASS___UIView);
  id v5 = [v4 areAnimationsEnabled];
  [v4 setAnimationsEnabled:a2 & 1];
  sub_AD488(a1);
  return [v4 setAnimationsEnabled:v5];
}

void sub_AD488(char a1)
{
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___UIView);
  uint64_t v3 = swift_allocObject(&unk_E7F08, 24LL, 7LL);
  swift_unknownObjectWeakInit(v3 + 16);
  if ((a1 & 1) != 0)
  {
    uint64_t v9 = sub_AD760;
    uint64_t v10 = v3;
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 1107296256LL;
    uint64_t v7 = sub_45D9C;
    uint64_t v8 = &unk_E7F48;
    uint64_t v4 = _Block_copy(&v5);
    swift_release();
    [v2 animateWithDuration:v4 animations:0.165];
  }

  else
  {
    uint64_t v9 = sub_AD740;
    uint64_t v10 = v3;
    id v5 = _NSConcreteStackBlock;
    uint64_t v6 = 1107296256LL;
    uint64_t v7 = sub_45D9C;
    uint64_t v8 = &unk_E7F20;
    uint64_t v4 = _Block_copy(&v5);
    swift_release();
    [v2 animateWithDuration:v4 animations:0.25];
  }

  _Block_release(v4);
}

uint64_t sub_AD5BC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_AD5E0(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    CGAffineTransformMakeScale(&v6, 0.97, 0.97);
    [v3 setTransform:&v6];
  }

  swift_beginAccess(v1, &v6, 0LL, 0LL);
  uint64_t v4 = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (v4)
  {
    id v5 = v4;
    [v4 setAlpha:0.5];
  }

void sub_AD69C(uint64_t a1)
{
  uint64_t v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0LL, 0LL);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    uint64_t v3 = Strong;
    v6[0] = 0x3FF0000000000000LL;
    v6[1] = 0LL;
    void v6[2] = 0LL;
    void v6[3] = 0x3FF0000000000000LL;
    v6[4] = 0LL;
    void v6[5] = 0LL;
    [Strong setTransform:v6];
  }

  swift_beginAccess(v1, v6, 0LL, 0LL);
  uint64_t v4 = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (v4)
  {
    id v5 = v4;
    [v4 setAlpha:1.0];
  }

void sub_AD740()
{
}

uint64_t sub_AD748(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v2;
  return swift_retain(v2);
}

uint64_t sub_AD758(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_AD760()
{
}

id static UIVisualEffect.defaultComponentBackground.getter()
{
  return [(id)objc_opt_self(UIBlurEffect) effectWithStyle:5001];
}

id static UIVisualEffect.defaultBackground.getter()
{
  return [(id)objc_opt_self(UIBlurEffect) effectWithStyle:5003];
}

uint64_t sub_AD7D0@<X0>(void *a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v5 = type metadata accessor for ActionFactory(0LL);
  swift_allocObject(v5, 16LL, 7LL);
  updated = (int *)type metadata accessor for UpdateGranularSettingsAction(0LL);
  sub_5D6C();
  if (v1)
  {
    uint64_t v7 = sub_8440();
    sub_851C(v7);
    sub_8770();
    uint64_t v8 = sub_8484();
    return sub_85AC(v8);
  }

  else
  {
    uint64_t v10 = *(uint64_t (**)(void))(v4 + 32);
    double v19 = (char *)a1 + updated[6];
    uint64_t v11 = v10();
    __chkstk_darwin(v11);
    sub_2C130();
    sub_7DC68();
    sub_53EE0((uint64_t)&v18, (uint64_t)a1 + updated[7]);
    sub_6F444(0x6163696669746F6ELL, 0xEF7364496E6F6974LL, (uint64_t)updated);
    *a1 = v12;
    uint64_t v13 = sub_6F270();
    a1[1] = v13;
    a1[2] = v14;
    __chkstk_darwin(v13);
    sub_2C130();
    sub_7DC68();
    uint64_t v15 = sub_8440();
    sub_851C(v15);
    sub_8770();
    uint64_t v16 = sub_8484();
    sub_85AC(v16);
    return sub_53EE0((uint64_t)&v17, (uint64_t)a1 + updated[8]);
  }

uint64_t sub_ADAC8@<X0>(void *a1@<X8>)
{
  return sub_AD7D0(a1);
}

uint64_t type metadata accessor for UpdateGranularSettingsAction(uint64_t a1)
{
  uint64_t result = qword_F83F0;
  if (!qword_F83F0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UpdateGranularSettingsAction);
  }
  return result;
}

uint64_t sub_ADB14(uint64_t a1)
{
  uint64_t v2 = sub_44DC(&qword_F38F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t *sub_ADB54(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  uint64_t v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    uint64_t v7 = (uint64_t *)(v4 + ((v3 + 16LL) & ~(unint64_t)v3));
    swift_retain(v4);
  }

  else
  {
    uint64_t v7 = a1;
    uint64_t v8 = a2[2];
    a1[1] = a2[1];
    a1[2] = v8;
    uint64_t v9 = a3[6];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for ActionMetrics(0LL);
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL);
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v8);
    v13(v10, v11, v12);
    uint64_t v14 = a3[7];
    uint64_t v15 = (char *)v7 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(uint64_t *)((char *)a2 + v14 + 24);
    if (v17)
    {
      uint64_t v18 = *((void *)v16 + 4);
      *((void *)v15 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v17;
      *((void *)v15 + 4) = v18;
      (**(void (***)(void))(v17 - 8))();
    }

    else
    {
      __int128 v19 = *((_OWORD *)v16 + 1);
      *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
      *((_OWORD *)v15 + 1) = v19;
      *((void *)v15 + 4) = *((void *)v16 + 4);
    }

    uint64_t v20 = a3[8];
    unint64_t v21 = (char *)v7 + v20;
    double v22 = (char *)a2 + v20;
    uint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 24);
    if (v23)
    {
      uint64_t v24 = *((void *)v22 + 4);
      *((void *)v21 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v23;
      *((void *)v21 + 4) = v24;
      (**(void (***)(void))(v23 - 8))();
    }

    else
    {
      __int128 v25 = *((_OWORD *)v22 + 1);
      *(_OWORD *)unint64_t v21 = *(_OWORD *)v22;
      *((_OWORD *)v21 + 1) = v25;
      *((void *)v21 + 4) = *((void *)v22 + 4);
    }
  }

  return v7;
}

void *sub_ADC8C(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[6];
  uint64_t v5 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  CGAffineTransform v6 = (void *)(a1 + a2[7]);
  if (v6[3]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v6);
  }
  uint64_t result = (void *)(a1 + a2[8]);
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t *sub_ADD1C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v8 = a2[2];
  a1[2] = v8;
  uint64_t v9 = a3[6];
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for ActionMetrics(0LL);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  v13(v10, v11, v12);
  uint64_t v14 = a3[7];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = *(uint64_t *)((char *)a2 + v14 + 24);
  if (v17)
  {
    uint64_t v18 = *((void *)v16 + 4);
    *((void *)v15 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v17;
    *((void *)v15 + 4) = v18;
    (**(void (***)(void))(v17 - 8))();
  }

  else
  {
    __int128 v19 = *((_OWORD *)v16 + 1);
    *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
    *((_OWORD *)v15 + 1) = v19;
    *((void *)v15 + 4) = *((void *)v16 + 4);
  }

  uint64_t v20 = a3[8];
  unint64_t v21 = (char *)a1 + v20;
  double v22 = (char *)a2 + v20;
  uint64_t v23 = *(uint64_t *)((char *)a2 + v20 + 24);
  if (v23)
  {
    uint64_t v24 = *((void *)v22 + 4);
    *((void *)v21 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v23;
    *((void *)v21 + 4) = v24;
    (**(void (***)(void))(v23 - 8))();
  }

  else
  {
    __int128 v25 = *((_OWORD *)v22 + 1);
    *(_OWORD *)unint64_t v21 = *(_OWORD *)v22;
    *((_OWORD *)v21 + 1) = v25;
    *((void *)v21 + 4) = *((void *)v22 + 4);
  }

  return a1;
}

uint64_t *sub_ADE2C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  uint64_t v7 = a2[2];
  a1[2] = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease();
  uint64_t v8 = a3[6];
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(uint64_t *)((char *)a2 + v12 + 24);
  if (*(uint64_t *)((char *)a1 + v12 + 24))
  {
    if (v15)
    {
      sub_4290(v13, v14);
      goto LABEL_8;
    }

    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v13);
  }

  else if (v15)
  {
    *((void *)v13 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v15;
    *((void *)v13 + 4) = *((void *)v14 + 4);
    (**(void (***)(char *, char *))(v15 - 8))(v13, v14);
    goto LABEL_8;
  }

  __int128 v16 = *(_OWORD *)v14;
  __int128 v17 = *((_OWORD *)v14 + 1);
  *((void *)v13 + 4) = *((void *)v14 + 4);
  *(_OWORD *)uint64_t v13 = v16;
  *((_OWORD *)v13 + 1) = v17;
LABEL_8:
  uint64_t v18 = a3[8];
  __int128 v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = *((void *)v20 + 3);
  if (!*(uint64_t *)((char *)a1 + v18 + 24))
  {
    if (v21)
    {
      *((void *)v19 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v21;
      *((void *)v19 + 4) = *((void *)v20 + 4);
      (**(void (***)(char *, char *))(v21 - 8))(v19, v20);
      return a1;
    }

uint64_t sub_ADFA0(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v6 = a3[6];
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = a3[8];
  uint64_t v12 = a1 + v10;
  uint64_t v13 = a2 + v10;
  __int128 v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + swift_unknownObjectWeakDestroy(v0 + 16) = v14;
  *(void *)(v12 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v13 + 32);
  uint64_t v15 = a1 + v11;
  uint64_t v16 = a2 + v11;
  __int128 v17 = *(_OWORD *)(v16 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = v17;
  *(void *)(v15 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v16 + 32);
  return a1;
}

void *sub_AE048(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = a3[6];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  uint64_t v11 = a3[7];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  __int128 v14 = *((_OWORD *)v13 + 1);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  *((_OWORD *)v12 + 1) = v14;
  *((void *)v12 + 4) = *((void *)v13 + 4);
  uint64_t v15 = a3[8];
  uint64_t v16 = (char *)a1 + v15;
  __int128 v17 = *(_OWORD *)((char *)a2 + v15 + 16);
  *(_OWORD *)uint64_t v16 = *(_OWORD *)((char *)a2 + v15);
  *((_OWORD *)v16 + 1) = v17;
  *((void *)v16 + 4) = *(void *)((char *)a2 + v15 + 32);
  return a1;
}

uint64_t sub_AE124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_AE130);
}

uint64_t sub_AE130(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for ActionMetrics(0LL);
    return sub_4AC4((uint64_t)a1 + *(int *)(a3 + 24), a2, v8);
  }

uint64_t sub_AE1A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_AE1B0);
}

void *sub_AE1B0(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for ActionMetrics(0LL);
    return (void *)sub_4AD0((uint64_t)v5 + *(int *)(a4 + 24), a2, a2, v7);
  }

  return result;
}

uint64_t sub_AE21C(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v4[1] = &unk_BCDD0;
  uint64_t result = type metadata accessor for ActionMetrics(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(result - 8) + 64LL;
    void v4[3] = &unk_BCDE8;
    void v4[4] = &unk_BCDE8;
    swift_initStructMetadata(a1, 256LL, 5LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

unint64_t sub_AE2A8(uint64_t a1)
{
  unint64_t result = sub_AE2CC();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_AE2CC()
{
  unint64_t result = qword_F6D00;
  if (!qword_F6D00)
  {
    uint64_t updated = type metadata accessor for UpdateGranularSettingsAction(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BCD50, updated);
    atomic_store(result, (unint64_t *)&qword_F6D00);
  }

  return result;
}

uint64_t sub_AE30C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1;
  if (a1 >> 62) {
    goto LABEL_11;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  swift_bridgeObjectRetain(a1);
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter(v16))
  {
    unint64_t v17 = v3 & 0xC000000000000001LL;
    uint64_t v5 = 4LL;
    while (1)
    {
      id v6 = v17 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      uint64_t v7 = v6;
      uint64_t v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1LL)) {
        break;
      }
      id v9 = [v6 items];
      uint64_t v10 = sub_AD98(0LL, &qword_F8510, &OBJC_CLASS___AMSNotificationSettingsItem_ptr);
      uint64_t v11 = v3;
      uint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

      swift_bridgeObjectRetain(a3);
      unint64_t v13 = v12;
      uint64_t v3 = v11;
      __int128 v14 = sub_AF44C(v13, a3);
      sub_B0070(0LL, 0LL, (uint64_t)v14);

      ++v5;
      if (v8 == v4) {
        goto LABEL_9;
      }
    }

    __break(1u);
LABEL_11:
    if (v3 < 0) {
      uint64_t v16 = v3;
    }
    else {
      uint64_t v16 = v3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v3);
  }

void sub_AE480(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

uint64_t sub_AE4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v78 = a1;
  uint64_t v6 = sub_B05D8();
  uint64_t v80 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v81 = v7;
  uint64_t v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_5867C();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v79 = v11;
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v71 - v14;
  uint64_t v16 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_AD98(0LL, &qword_F62C0, &OBJC_CLASS___ACAccount_ptr);
  BaseObjectGraph.optional<A>(_:)(aBlock, v19, v19);
  uint64_t v20 = (void *)aBlock[0];
  if (aBlock[0])
  {
    uint64_t v82 = v12;
    uint64_t v83 = v15;
    __int128 v76 = v8;
    uint64_t v21 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v22 = *(void *)(type metadata accessor for LogMessage(0LL) - 8);
    __int128 v23 = *(void **)(v22 + 72);
    uint64_t v24 = *(unsigned __int8 *)(v22 + 80);
    id v75 = v23;
    uint64_t v25 = swift_allocObject(v21, ((v24 + 32) & ~v24) + 2LL * (void)v23, v24 | 7);
    *(_OWORD *)(v25 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    uint64_t updated = (void *)type metadata accessor for UpdateGranularSettingsActionImplementation();
    aBlock[0] = v4;
    uint64_t v77 = v4;
    swift_retain(v4);
    id v27 = (id)AMSLogKey(v26);
    if (v27)
    {
      BOOL v28 = v27;
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
      uint64_t v31 = v30;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      sub_B05C8();
      sub_B05A4();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_B0590(MetatypeMetadata);
      sub_B05E0();
      v33._countAndFlagsBits = 5972026LL;
      v33._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v33);
      v88[3] = &type metadata for String;
      v88[0] = v29;
      v88[1] = v31;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(v88);
      sub_B05E0();
      uint64_t v34 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      sub_B05C8();
      sub_B05A4();
      uint64_t v39 = swift_getMetatypeMetadata();
      sub_B0590(v39);
      sub_B05E0();
      uint64_t v34 = 58LL;
    }

    unint64_t v40 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v34);
    LogMessage.init(stringInterpolation:)(v18);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(aBlock);
    LogMessage.init(stringLiteral:)(0xD000000000000021LL);
    sub_70594(v25);
    swift_bridgeObjectRelease();
    uint64_t v41 = type metadata accessor for BaseObjectGraph(0LL);
    double v42 = v83;
    inject<A, B>(_:from:)(v9, a3, v9, v41);
    uint64_t v43 = sub_AD98(0LL, &qword_F62C8, &OBJC_CLASS___AMSProcessInfo_ptr);
    inject<A, B>(_:from:)(v43, a3, v43, v41);
    uint64_t v44 = aBlock[0];
    id v75 = (id)aBlock[0];
    uint64_t v45 = v78;
    uint64_t v46 = *(void *)(v78 + 8);
    uint64_t v47 = *(void *)(v78 + 16);
    swift_bridgeObjectRetain(v47);
    id v48 = v20;
    id v72 = v48;
    uint64_t v49 = Bag.amsBag.getter();
    id v50 = objc_allocWithZone(&OBJC_CLASS___AMSNotificationSettingsTask);
    id v51 = sub_AFC24(v46, v47, v48, v49);
    id v74 = v51;
    [v51 setClientInfo:v44];
    uint64_t v52 = sub_44DC((uint64_t *)&unk_F7130);
    uint64_t v53 = Promise.__allocating_init()(v52);
    id v73 = [v51 fetchAllSettings];
    uint64_t v54 = (uint64_t)v76;
    sub_AFC9C(v45, (uint64_t)v76);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v82, v42, v9);
    uint64_t v55 = *(unsigned __int8 *)(v80 + 80);
    uint64_t v56 = (v55 + 16) & ~v55;
    unint64_t v57 = (v81 + v56 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    unint64_t v58 = (v57 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v59 = v9;
    unint64_t v60 = (v58 + 15) & 0xFFFFFFFFFFFFFFF8LL;
    uint64_t v61 = *(unsigned __int8 *)(v10 + 80);
    uint64_t v62 = v10;
    uint64_t v63 = (v61 + v60 + 8) & ~v61;
    uint64_t v64 = swift_allocObject(&unk_E7FD0, v63 + v79, v55 | v61 | 7);
    sub_AFE20(v54, v64 + v56);
    uint64_t v65 = v77;
    *(void *)(v64 + v5_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 7) = v77;
    *(void *)(v64 + v58) = v53;
    CGRect v66 = v72;
    *(void *)(v64 + v6_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v72;
    (*(void (**)(uint64_t, char *, uint64_t))(v62 + 32))(v64 + v63, v82, v59);
    uint64_t v86 = sub_AFE64;
    uint64_t v87 = v64;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256LL;
    aBlock[2] = sub_A1F0;
    uint64_t updated = &unk_E7FE8;
    double v67 = _Block_copy(aBlock);
    swift_retain(v65);
    id v68 = v66;
    swift_retain(v53);
    swift_release();
    id v69 = v73;
    [v73 addFinishBlock:v67];
    _Block_release(v67);

    uint64_t updated = (void *)type metadata accessor for SyncTaskScheduler(0LL);
    uint64_t v86 = (void (*)(void *, uint64_t))&protocol witness table for SyncTaskScheduler;
    sub_AE98(aBlock);
    SyncTaskScheduler.init()();
    uint64_t v38 = Promise.map<A>(on:_:)(aBlock, sub_5C61C, 0LL, &type metadata for ResultingActionOutcome);

    swift_release();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(aBlock);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v83, v59);
  }

  else
  {
    sub_44DC(&qword_F84F8);
    unint64_t v35 = sub_AFBE8();
    uint64_t v36 = swift_allocError(&type metadata for UpdateGranularSettingsActionImplementation.PerformError, v35, 0LL, 0LL);
    *unint64_t v37 = 2;
    return Promise.__allocating_init(error:)(v36);
  }

  return v38;
}

void sub_AEAAC(void *a1, uint64_t a2, uint64_t *a3, void **a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v14 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v14);
  uint64_t v99 = (char *)&v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a1)
  {
    if (a2)
    {
      uint64_t v45 = a2;
    }

    else
    {
      unint64_t v62 = sub_AFBE8();
      uint64_t v45 = swift_allocError(&type metadata for UpdateGranularSettingsActionImplementation.PerformError, v62, 0LL, 0LL);
      *uint64_t v63 = 0;
    }

    uint64_t v64 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v65 = type metadata accessor for LogMessage(0LL);
    uint64_t v66 = swift_allocObject( v64,  ((*(unsigned __int8 *)(*(void *)(v65 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v65 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v65 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v65 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v66 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    uint64_t updated = (void *)type metadata accessor for UpdateGranularSettingsActionImplementation();
    __int128 aBlock = a4;
    swift_retain(a4);
    uint64_t v67 = swift_errorRetain(a2);
    id v68 = (id)AMSLogKey(v67);
    if (v68)
    {
      id v69 = v68;
      uint64_t v70 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
      uint64_t v72 = v71;

      id v73 = v99;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v74._countAndFlagsBits = 0LL;
      v74._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v74);
      id v75 = updated;
      __int128 v76 = sub_ACA0(&aBlock, (uint64_t)updated);
      uint64_t DynamicType = swift_getDynamicType(v76, v75, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v108 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v108);
      sub_4558((uint64_t)&v108);
      v78._countAndFlagsBits = 5972026LL;
      v78._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v78);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v108 = v70;
      uint64_t v109 = v72;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v108);
      sub_4558((uint64_t)&v108);
      uint64_t v79 = 93LL;
    }

    else
    {
      id v73 = v99;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v80._countAndFlagsBits = 0LL;
      v80._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v80);
      uint64_t v81 = updated;
      uint64_t v82 = sub_ACA0(&aBlock, (uint64_t)updated);
      uint64_t v83 = swift_getDynamicType(v82, v81, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v108 = v83;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v108);
      sub_4558((uint64_t)&v108);
      uint64_t v79 = 58LL;
    }

    unint64_t v84 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v79);
    LogMessage.init(stringInterpolation:)(v73);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&aBlock);
    LogMessage.init(stringLiteral:)(0xD000000000000025LL);
    swift_getErrorValue(v45, v107, v106);
    uint64_t v85 = Error.localizedDescription.getter(v106[1], v106[2]);
    uint64_t updated = &type metadata for String;
    __int128 aBlock = (void **)v85;
    uint64_t v101 = v86;
    static LogMessage.safe(_:)(&aBlock);
    sub_4558((uint64_t)&aBlock);
    sub_705B4(v66);
    swift_bridgeObjectRelease();
    Promise.reject(_:)(v45);
    swift_errorRelease(v45);
    return;
  }

  uint64_t v98 = a6;
  uint64_t v94 = a7;
  uint64_t v95 = a5;
  uint64_t v16 = *a3;
  id v17 = a1;
  uint64_t v18 = swift_bridgeObjectRetain(v16);
  uint64_t v19 = sub_53DDC(v18);
  uint64_t v20 = swift_allocObject(&unk_E8020, 24LL, 7LL);
  uint64_t v96 = v20;
  id v97 = v17;
  *(void *)(v20 + swift_unknownObjectWeakDestroy(v0 + 16) = _swiftEmptyArrayStorage;
  uint64_t v21 = (uint64_t *)(v20 + 16);
  id v22 = [v17 sections];
  uint64_t v23 = sub_AD98(0LL, &qword_F8508, &OBJC_CLASS___AMSNotificationSettingsSection_ptr);
  unint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v22, v23);

  swift_bridgeObjectRetain(v19);
  sub_AE30C(v24, (uint64_t)v21, v19);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = *v21;
  unint64_t v26 = (unint64_t)*v21 >> 62;
  if (v26)
  {
    if (v25 < 0) {
      uint64_t v92 = *v21;
    }
    else {
      uint64_t v92 = v25 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(*v21, 2LL);
    uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v92);
    if (v27) {
      goto LABEL_4;
    }
  }

  else
  {
    uint64_t v27 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain_n(*v21, 2LL);
    if (v27)
    {
LABEL_4:
      if (v27 < 1)
      {
        __break(1u);
        return;
      }

      for (uint64_t i = 0LL; i != v27; ++i)
      {
        if ((v25 & 0xC000000000000001LL) != 0) {
          id v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v25);
        }
        else {
          id v29 = *(id *)(v25 + 8 * i + 32);
        }
        uint64_t v30 = v29;
        [v29 setEnabled:1];
      }
    }
  }

  swift_bridgeObjectRelease_n(v25, 2LL);
  if (v26)
  {
    if (v25 < 0) {
      uint64_t v93 = v25;
    }
    else {
      uint64_t v93 = v25 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v25);
    uint64_t v31 = _CocoaArrayWrapper.endIndex.getter(v93);
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v31 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v32 = v98;
  if (v31)
  {
    uint64_t v33 = a3[1];
    uint64_t v34 = a3[2];
    swift_bridgeObjectRetain(v34);
    id v35 = v32;
    uint64_t v36 = Bag.amsBag.getter();
    id v37 = objc_allocWithZone(&OBJC_CLASS___AMSNotificationSettingsTask);
    uint64_t v99 = (char *)sub_AFC24(v33, v34, v35, v36);
    uint64_t v38 = *v21;
    sub_AD98(0LL, &qword_F8510, &OBJC_CLASS___AMSNotificationSettingsItem_ptr);
    swift_bridgeObjectRetain(v38);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v40 = [v99 updateSettings:isa];

    if (v40)
    {
      uint64_t v41 = (void *)swift_allocObject(&unk_E8048, 40LL, 7LL);
      uint64_t v42 = v95;
      uint64_t v43 = v96;
      v41[2] = a4;
      v41[3] = v43;
      v41[4] = v42;
      uint64_t v104 = sub_AFF74;
      uint64_t v105 = v41;
      __int128 aBlock = _NSConcreteStackBlock;
      uint64_t v101 = 1107296256LL;
      unint64_t v102 = sub_AE480;
      uint64_t updated = &unk_E8060;
      uint64_t v44 = _Block_copy(&aBlock);
      swift_retain(a4);
      swift_retain(v43);
      swift_retain(v42);
      swift_release();
      [v40 addFinishBlock:v44];

      _Block_release(v44);
      swift_release();
    }

    else
    {
      swift_release();
    }
  }

  else
  {
    uint64_t v46 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v47 = type metadata accessor for LogMessage(0LL);
    uint64_t v48 = swift_allocObject( v46,  ((*(unsigned __int8 *)(*(void *)(v47 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v47 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v47 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v47 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v48 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    uint64_t updated = (void *)type metadata accessor for UpdateGranularSettingsActionImplementation();
    __int128 aBlock = a4;
    swift_retain(a4);
    id v50 = (id)AMSLogKey(v49);
    if (v50)
    {
      id v51 = v50;
      uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
      uint64_t v54 = v53;

      uint64_t v55 = v99;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v56._countAndFlagsBits = 0LL;
      v56._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v56);
      unint64_t v57 = updated;
      unint64_t v58 = sub_ACA0(&aBlock, (uint64_t)updated);
      uint64_t v59 = swift_getDynamicType(v58, v57, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v108 = v59;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v108);
      sub_4558((uint64_t)&v108);
      v60._countAndFlagsBits = 5972026LL;
      v60._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v60);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v108 = v52;
      uint64_t v109 = v54;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v108);
      sub_4558((uint64_t)&v108);
      uint64_t v61 = 93LL;
    }

    else
    {
      uint64_t v55 = v99;
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v87._countAndFlagsBits = 0LL;
      v87._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v87);
      uint64_t v88 = updated;
      int v89 = sub_ACA0(&aBlock, (uint64_t)updated);
      uint64_t v90 = swift_getDynamicType(v89, v88, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v108 = v90;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v108);
      sub_4558((uint64_t)&v108);
      uint64_t v61 = 58LL;
    }

    unint64_t v91 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v61);
    LogMessage.init(stringInterpolation:)(v55);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&aBlock);
    LogMessage.init(stringLiteral:)(0xD000000000000012LL);
    sub_70594(v48);
    swift_bridgeObjectRelease();
    LOBYTE(aBlock) = 1;
    Promise.resolve(_:)(&aBlock);
    swift_release();
  }

uint64_t sub_AF318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(void *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      uint64_t v12 = v11[1];
      BOOL v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0LL) & 1) != 0) {
        return 1LL;
      }
      uint64_t v15 = ~v7;
      unint64_t v16 = (v8 + 1) & v15;
      if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
      {
        while (1)
        {
          id v17 = (void *)(v10 + 16 * v16);
          uint64_t v18 = v17[1];
          BOOL v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v16 = (v16 + 1) & v15;
          if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

void *sub_AF44C(unint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0LL;
      unint64_t v19 = v2 & 0xC000000000000001LL;
      uint64_t v5 = v2 & 0xFFFFFFFFFFFFFF8LL;
      while (v19)
      {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v2);
LABEL_7:
        uint64_t v7 = v6;
        unint64_t v8 = v4 + 1;
        if (__OFADD__(v4, 1LL)) {
          goto LABEL_15;
        }
        uint64_t v9 = v2;
        id v10 = [v6 identifier];
        uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
        uint64_t v13 = v12;

        LOBYTE(v1_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = sub_AF318(v11, v13, a2);
        uint64_t v14 = swift_bridgeObjectRelease();
        if ((v10 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v14);
          uint64_t v15 = _swiftEmptyArrayStorage[2];
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
          uint64_t v16 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v15, v7);
          specialized ContiguousArray._endMutation()(v16);
        }

        else
        {
        }

        uint64_t v2 = v9;
        ++v4;
        if (v8 == v3) {
          goto LABEL_20;
        }
      }

      if (v4 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      if (v2 < 0) {
        uint64_t v17 = v2;
      }
      else {
        uint64_t v17 = v2 & 0xFFFFFFFFFFFFFF8LL;
      }
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v17);
      if (!v3) {
        goto LABEL_20;
      }
    }

    id v6 = *(id *)(v2 + 8 * v4 + 32);
    goto LABEL_7;
  }

uint64_t sub_AF5EC(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = type metadata accessor for LogMessage.StringInterpolation(0LL);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = (uint64_t *)(a4 + 16);
  if ((a1 & 1) != 0)
  {
    uint64_t v14 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v15 = type metadata accessor for LogMessage(0LL);
    uint64_t v16 = swift_allocObject( v14,  ((*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL))
          + 2LL * *(void *)(*(void *)(v15 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v15 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v16 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5050;
    uint64_t updated = (void *)type metadata accessor for UpdateGranularSettingsActionImplementation();
    v72[0] = a3;
    swift_retain(a3);
    id v18 = (id)AMSLogKey(v17);
    if (v18)
    {
      unint64_t v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      uint64_t v22 = v21;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v23._countAndFlagsBits = 0LL;
      v23._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v23);
      unint64_t v24 = updated;
      uint64_t v25 = sub_ACA0(v72, (uint64_t)updated);
      uint64_t DynamicType = swift_getDynamicType(v25, v24, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v69 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v69);
      sub_4558((uint64_t)&v69);
      v27._countAndFlagsBits = 5972026LL;
      v27._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v27);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v69 = v20;
      uint64_t v70 = v22;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v69);
      sub_4558((uint64_t)&v69);
      uint64_t v28 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v30._countAndFlagsBits = 0LL;
      v30._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v30);
      uint64_t v31 = updated;
      uint64_t v32 = sub_ACA0(v72, (uint64_t)updated);
      uint64_t v33 = swift_getDynamicType(v32, v31, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v69 = v33;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v69);
      sub_4558((uint64_t)&v69);
      uint64_t v28 = 58LL;
    }

    unint64_t v34 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v28);
    LogMessage.init(stringInterpolation:)(v12);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v72);
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(55LL, 1LL);
    v35._countAndFlagsBits = 0xD000000000000037LL;
    v35._object = (void *)0x80000000000C05D0LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v35);
    swift_beginAccess(v13, &v69, 0LL, 0LL);
    uint64_t v36 = *v13;
    uint64_t updated = (void *)sub_44DC(&qword_F8518);
    v72[0] = v36;
    swift_bridgeObjectRetain(v36);
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v72);
    sub_4558((uint64_t)v72);
    v37._countAndFlagsBits = 0LL;
    v37._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v37);
    LogMessage.init(stringInterpolation:)(v12);
    sub_70594(v16);
    swift_bridgeObjectRelease();
    LOBYTE(v72[0]) = 1;
    return Promise.resolve(_:)(v72);
  }

  else
  {
    v66[1] = a5;
    if (a2)
    {
      uint64_t v29 = a2;
    }

    else
    {
      unint64_t v39 = sub_AFBE8();
      uint64_t v29 = swift_allocError(&type metadata for UpdateGranularSettingsActionImplementation.PerformError, v39, 0LL, 0LL);
      *id v40 = 1;
    }

    uint64_t v41 = sub_44DC((uint64_t *)&unk_F7110);
    uint64_t v42 = type metadata accessor for LogMessage(0LL);
    uint64_t v43 = swift_allocObject( v41,  ((*(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL))
          + 3LL * *(void *)(*(void *)(v42 - 8) + 72LL),
            *(unsigned __int8 *)(*(void *)(v42 - 8) + 80LL) | 7LL);
    *(_OWORD *)(v43 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B5060;
    uint64_t updated = (void *)type metadata accessor for UpdateGranularSettingsActionImplementation();
    v72[0] = a3;
    swift_retain(a3);
    uint64_t v44 = swift_errorRetain(a2);
    id v45 = (id)AMSLogKey(v44);
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v45);
      uint64_t v49 = v48;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(4LL, 2LL);
      v50._countAndFlagsBits = 0LL;
      v50._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v50);
      id v51 = updated;
      uint64_t v52 = sub_ACA0(v72, (uint64_t)updated);
      uint64_t v53 = swift_getDynamicType(v52, v51, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v69 = v53;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v69);
      sub_4558((uint64_t)&v69);
      v54._countAndFlagsBits = 5972026LL;
      v54._object = (void *)0xE300000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v54);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v69 = v47;
      uint64_t v70 = v49;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v69);
      sub_4558((uint64_t)&v69);
      uint64_t v55 = 93LL;
    }

    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(1LL, 1LL);
      v56._countAndFlagsBits = 0LL;
      v56._object = (void *)0xE000000000000000LL;
      LogMessage.StringInterpolation.appendLiteral(_:)(v56);
      unint64_t v57 = updated;
      unint64_t v58 = sub_ACA0(v72, (uint64_t)updated);
      uint64_t v59 = swift_getDynamicType(v58, v57, 1LL);
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v69 = v59;
      LogMessage.StringInterpolation.appendInterpolation(safe:)(&v69);
      sub_4558((uint64_t)&v69);
      uint64_t v55 = 58LL;
    }

    unint64_t v60 = 0xE100000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v55);
    LogMessage.init(stringInterpolation:)(v12);
    type metadata accessor for Log();
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v72);
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)(43LL, 1LL);
    v61._object = (void *)0x80000000000C05A0LL;
    v61._countAndFlagsBits = 0xD00000000000002BLL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v61);
    swift_beginAccess(v13, &v69, 0LL, 0LL);
    uint64_t v62 = *v13;
    uint64_t updated = (void *)sub_44DC(&qword_F8518);
    v72[0] = v62;
    swift_bridgeObjectRetain(v62);
    LogMessage.StringInterpolation.appendInterpolation(safe:)(v72);
    sub_4558((uint64_t)v72);
    v63._countAndFlagsBits = 0LL;
    v63._object = (void *)0xE000000000000000LL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v63);
    LogMessage.init(stringInterpolation:)(v12);
    swift_getErrorValue(v29, v68, v67);
    uint64_t v64 = Error.localizedDescription.getter(v67[1], v67[2]);
    uint64_t updated = &type metadata for String;
    v72[0] = v64;
    v72[1] = v65;
    static LogMessage.safe(_:)(v72);
    sub_4558((uint64_t)v72);
    sub_705B4(v43);
    swift_bridgeObjectRelease();
    Promise.reject(_:)(v29);
    return swift_errorRelease(v29);
  }

uint64_t type metadata accessor for UpdateGranularSettingsActionImplementation()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin42UpdateGranularSettingsActionImplementation);
}

uint64_t sub_AFBC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_AE4E0(a1, a2, a3);
}

unint64_t sub_AFBE8()
{
  unint64_t result = qword_F8500;
  if (!qword_F8500)
  {
    unint64_t result = swift_getWitnessTable( &unk_BCEF0,  &type metadata for UpdateGranularSettingsActionImplementation.PerformError);
    atomic_store(result, (unint64_t *)&qword_F8500);
  }

  return result;
}

id sub_AFC24(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v9 = [v4 initWithIdentifier:v8 account:a3 bag:a4];

  swift_unknownObjectRelease(a4);
  return v9;
}

uint64_t sub_AFC9C(uint64_t a1, uint64_t a2)
{
  uint64_t updated = type metadata accessor for UpdateGranularSettingsAction(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 16LL))(a2, a1, updated);
  return a2;
}

uint64_t sub_AFCE0()
{
  uint64_t v1 = (int *)sub_B05D8();
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = sub_5867C();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v17 = *(void *)(v7 + 64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = v0 + v4 + v1[6];
  uint64_t v10 = type metadata accessor for ActionMetrics(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL))(v9, v10);
  uint64_t v11 = (void *)(v0 + v4 + v1[7]);
  if (v11[3]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v11);
  }
  uint64_t v12 = (void *)(v0 + v4 + v1[8]);
  if (v12[3]) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v12);
  }
  uint64_t v13 = v3 | v8 | 7;
  unint64_t v14 = (((((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v15 = (v8 + v14 + 8) & ~v8;
  swift_release();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v15, v6);
  return swift_deallocObject(v0, v15 + v17, v13);
}

uint64_t sub_AFE20(uint64_t a1, uint64_t a2)
{
  uint64_t updated = type metadata accessor for UpdateGranularSettingsAction(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(updated - 8) + 32LL))(a2, a1, updated);
  return a2;
}

void sub_AFE64(void *a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_B05D8() - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v7 = (*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8LL;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(sub_5867C() - 8) + 80LL);
  sub_AEAAC( a1,  a2,  (uint64_t *)(v2 + v6),  *(void ***)(v2 + v7),  *(void *)(v2 + ((v7 + 15) & 0xFFFFFFFFFFFFFFF8LL)),  *(void **)(v2 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL)),  v2 + ((v8 + ((((v7 + 15) & 0xFFFFFFFFFFFFFFF8LL) + 15) & 0xFFFFFFFFFFFFFFF8LL) + 8) & ~v8));
}

uint64_t sub_AFF04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v2;
  return swift_retain(v2);
}

uint64_t sub_AFF14(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_AFF1C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_AFF40()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_AFF74(char a1, uint64_t a2)
{
  return sub_AF5EC(a1, a2, v2[2], v2[3], v2[4]);
}

void *sub_AFF80(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v4 = _swiftEmptyArrayStorage;
    }

    else
    {
      uint64_t v3 = sub_44DC(&qword_F6798);
      uint64_t v4 = (void *)swift_allocObject(v3, 8 * v2 + 32, 7LL);
      size_t v5 = j__malloc_size(v4);
      v4[2] = v2;
      void v4[3] = (2 * ((uint64_t)(v5 - 32) / 8)) | 1;
    }

    swift_bridgeObjectRetain(v1);
    specialized _ArrayBuffer._copyContents(initializing:)(v4 + 4, v2, v1);
    uint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_8:
    if (v1 < 0) {
      uint64_t v7 = v1;
    }
    else {
      uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v1);
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter(v7);
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }

  return v4;
}

uint64_t sub_B0070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v9 = a3;
    uint64_t v6 = a2;
    uint64_t v7 = a1;
    uint64_t v5 = *v4;
    if (!((unint64_t)*v4 >> 62))
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFF8LL));
      goto LABEL_4;
    }
  }

  if (v5 < 0) {
    uint64_t v32 = v5;
  }
  else {
    uint64_t v32 = v5 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v5);
  uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v32);
  swift_bridgeObjectRelease();
LABEL_4:
  if (v11 < v6)
  {
    __break(1u);
    goto LABEL_42;
  }

  uint64_t v3 = v6 - v7;
  if (__OFSUB__(v6, v7))
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }

  uint64_t v10 = (unint64_t)v9 >> 62;
  if (!((unint64_t)v9 >> 62))
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFF8LL));
    goto LABEL_8;
  }

uint64_t sub_B0408(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 == a3)
  {
    uint64_t v4 = result;
    if (result)
    {
      sub_AD98(0LL, &qword_F8510, &OBJC_CLASS___AMSNotificationSettingsItem_ptr);
      return swift_arrayInitWithCopy(a4, v4, a2);
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t storeEnumTagSinglePayload for UpdateGranularSettingsActionImplementation.PerformError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_77AC4(v3, v4) = 1;
  }
  else {
    LODWORD(sub_77AC4(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_B04C8 + 4 * byte_BCE25[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_B04FC + 4 * byte_BCE20[v4]))();
}

uint64_t sub_B04FC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_B0504(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xB050CLL);
  }
  return result;
}

uint64_t sub_B0518(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xB0520LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_B0524(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_B052C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UpdateGranularSettingsActionImplementation.PerformError()
{
  return &type metadata for UpdateGranularSettingsActionImplementation.PerformError;
}

unint64_t sub_B054C()
{
  unint64_t result = qword_F8520;
  if (!qword_F8520)
  {
    unint64_t result = swift_getWitnessTable( &unk_BCEC8,  &type metadata for UpdateGranularSettingsActionImplementation.PerformError);
    atomic_store(result, (unint64_t *)&qword_F8520);
  }

  return result;
}

uint64_t sub_B0590(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 12_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)(v2 - 120);
}

uint64_t sub_B05A4()
{
  uint64_t v1 = *(void *)(v0 - 144);
  uint64_t v2 = sub_ACA0((void *)(v0 - 168), v1);
  return swift_getDynamicType(v2, v1, 1LL);
}

void sub_B05C8()
{
  v0._countAndFlagsBits = 0LL;
  v0._object = (void *)0xE000000000000000LL;
  LogMessage.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t sub_B05D8()
{
  return type metadata accessor for UpdateGranularSettingsAction(0LL);
}

uint64_t sub_B05E0()
{
  return sub_4558(v0 - 120);
}

void sub_B05E8(uint64_t a1, double a2, double a3, double a4, double a5)
{
  char v5 = a1;
  id v10 = sub_118D0(a1, "superview");
  if (v10)
  {
    uint64_t v11 = v10;
    if ((v5 & 1) != 0)
    {
      id v12 = sub_11820((uint64_t)v10, "safeAreaLayoutGuide");
      id v13 = [v12 topAnchor];

      id v15 = sub_11820(v14, "safeAreaLayoutGuide");
      id v16 = [v15 bottomAnchor];
    }

    else
    {
      id v13 = sub_11820((uint64_t)v10, "topAnchor");
      id v17 = sub_11820((uint64_t)v13, "bottomAnchor");
      id v16 = v17;
    }

    sub_B0C10((uint64_t)v17, "setTranslatesAutoresizingMaskIntoConstraints:");
    uint64_t v18 = sub_44DC(&qword_F6798);
    uint64_t v19 = sub_4968(v18, 64LL);
    *(_OWORD *)(v19 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B93D0;
    id v20 = sub_118D0(v19, "topAnchor");
    id v21 = [v20 constraintEqualToAnchor:v13 constant:a2];

    *(void *)(v19 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v21;
    id v23 = sub_118D0(v22, "leadingAnchor");
    id v24 = sub_11820((uint64_t)v23, "leadingAnchor");
    id v25 = [v23 constraintEqualToAnchor:v24 constant:a3];

    *(void *)(v19 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v25;
    id v27 = sub_118D0(v26, "bottomAnchor");
    id v28 = [v27 constraintEqualToAnchor:v16 constant:-a4];

    *(void *)(v19 + 48) = v28;
    id v30 = sub_118D0(v29, "trailingAnchor");
    id v31 = sub_11820((uint64_t)v30, "trailingAnchor");
    id v32 = [v30 constraintEqualToAnchor:v31 constant:-a5];

    *(void *)(v19 + 56) = v32;
    specialized Array._endMutation()(v33, v34, v35, v36);
    sub_6683C();
    Class isa = sub_668D8().super.isa;
    int v37 = sub_450B8();
    sub_B0BF8(v37, "addConstraints:", v38, v39, v40, v41, v42, v43, (uint64_t)isa);

    sub_B0BE0(v45);
  }

void sub_B08B0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  id v8 = sub_118D0(a1, "superview");
  if (v8)
  {
    id v32 = v8;
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v9 = sub_44DC(&qword_F6798);
    uint64_t v10 = sub_4968(v9, 48LL);
    *(_OWORD *)(v10 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_BCF30;
    id v11 = sub_11820(v10, "centerXAnchor");
    id v12 = [v32 centerXAnchor];
    id v13 = sub_B0BE8();

    *(void *)(v10 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v13;
    id v15 = sub_11820(v14, "centerYAnchor");
    id v16 = [v32 centerYAnchor];
    id v17 = sub_B0BE8();

    *(void *)(v10 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v17;
    sub_B0C1C(v18, v19, v20, v21);
    sub_6683C();
    Class isa = sub_B0C04().super.isa;
    sub_450B8();
    [v32 addConstraints:isa];

    if ((a3 & 1) == 0)
    {
      uint64_t v23 = sub_4968(v9, 48LL);
      *(_OWORD *)(v23 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_BCF30;
      id v24 =  objc_msgSend( sub_11820(v23, "widthAnchor"),  "constraintEqualToConstant:",  *(double *)&a1);
      sub_21FA4();
      *(void *)(v23 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = a1;
      id v26 =  objc_msgSend( sub_11820(v25, "heightAnchor"),  "constraintEqualToConstant:",  *(double *)&a2);
      sub_21FA4();
      *(void *)(v23 + 4_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = a1;
      sub_B0C1C(v27, v28, v29, v30);
      Class v31 = sub_B0C04().super.isa;
      sub_450B8();
      [v4 addConstraints:v31];
    }

    sub_B0BE0(v32);
  }

void sub_B0B10(uint64_t a1, double a2)
{
  uint64_t v4 = sub_44DC(&qword_F6798);
  uint64_t v5 = sub_4968(v4, 40LL);
  *(_OWORD *)(v5 + swift_unknownObjectWeakDestroy(v0 + 16) = xmmword_B9390;
  id v6 =  objc_msgSend( sub_11820(v5, "heightAnchor"),  "constraintEqualToConstant:",  a2);
  sub_21FA4();
  *(void *)(v5 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v2;
  specialized Array._endMutation()(v7, v8, v9, v10);
  sub_6683C();
  Class isa = sub_668D8().super.isa;
  int v11 = sub_450B8();
  sub_B0BF8(v11, "addConstraints:", v12, v13, v14, v15, v16, v17, (uint64_t)isa);
}

void sub_B0BE0(id a1)
{
}

id sub_B0BE8()
{
  return objc_msgSend(v0, *(SEL *)(v2 + 280), v1);
}

id sub_B0BF8(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  return objc_msgSend(v9, a2, a9);
}

NSArray sub_B0C04()
{
  return Array._bridgeToObjectiveC()();
}

id sub_B0C10(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, 0);
}

uint64_t sub_B0C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized Array._endMutation()(a1, a2, a3, a4);
}

void sub_B0C28(uint64_t a1, double a2, float a3, double a4, double a5)
{
  id v10 = sub_B0D30();
  [v10 setShadowColor:a1];

  id v11 = sub_B0D30();
  [v11 setShadowRadius:a2];

  id v12 = sub_B0D30();
  *(float *)&double v13 = a3;
  [v12 setShadowOpacity:v13];

  id v14 = sub_B0D30();
  objc_msgSend(v14, "setShadowOffset:", a4, a5);

  id v15 = sub_B0D30();
  [v15 setMasksToBounds:0];
}

id sub_B0D30()
{
  return [v0 *(SEL *)(v1 + 392)];
}

id sub_B0D3C(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent_artworkContainer;
  id v10 = v4;
  uint64_t v11 = VisualAreaImageView.SizeConstraints.zero.unsafeMutableAddressor();
  uint64_t v12 = *(void *)(v11 + 16);
  id v19 = &type metadata for VisualAreaImageView.SizeConstraints;
  uint64_t v20 = &protocol witness table for VisualAreaImageView.SizeConstraints;
  __int128 v17 = *(_OWORD *)v11;
  uint64_t v18 = v12;
  id v13 = objc_allocWithZone((Class)type metadata accessor for AlignableVisualAreaImageViewContainer(0LL));
  *(void *)&v4[v9] = AlignableVisualAreaImageViewContainer.init(artworkSize:sizeConstraints:horizontalAlignment:accessibilityAlignment:)( &v17,  0LL,  4LL,  0.0,  0.0);

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for VisualAreaArtworkComponent();
  id v14 = objc_msgSendSuper2(&v16, "initWithFrame:", a1, a2, a3, a4);
  sub_B1070();

  return v14;
}

id sub_B0E4C()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for VisualAreaArtworkComponent();
  objc_msgSendSuper2(&v12, "layoutSubviews");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent_artworkContainer];
  id v2 = [v0 contentView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  return objc_msgSend(v1, "setFrame:", v4, v6, v8, v10);
}

double sub_B0F30(double a1, double a2, float a3, float a4)
{
  if (a3 != 1000.0) {
    a1 = 1.79769313e308;
  }
  if (a4 != 1000.0) {
    a2 = 1.79769313e308;
  }
  double v7 = *(void **)&v4[OBJC_IVAR____TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent_artworkContainer];
  id v8 = [v4 contentView];
  objc_msgSend(v7, "measurementsWithFitting:in:", v8, a1, a2);
  double v10 = v9;

  return v10;
}

void sub_B1070()
{
  id v1 = sub_B12C4();
  [v1 addSubview:*(void *)(v0 + OBJC_IVAR____TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent_artworkContainer)];

  id v2 = sub_B12C4();
  [v2 setIsAccessibilityElement:1];

  id v3 = sub_B12C4();
  [v3 setAccessibilityTraits:UIAccessibilityTraitNone];
}

void sub_B1118()
{
}

id sub_B1150()
{
  return sub_B115C((SEL *)&selRef_dealloc);
}

id sub_B115C(SEL *a1)
{
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for VisualAreaArtworkComponent();
  return objc_msgSendSuper2(&v4, *a1);
}

uint64_t type metadata accessor for VisualAreaArtworkComponent()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent);
}

id sub_B11C4(void *a1)
{
  id v2 = (void *)objc_opt_self(&OBJC_CLASS___NSCollectionLayoutDimension);
  id v3 = [a1 container];
  [v3 contentSize];
  double v5 = v4;
  swift_unknownObjectRelease(v3);
  id v6 = [v2 absoluteDimension:v5];
  id v7 = [v2 estimatedDimension:60.0];
  id v8 =  [(id)objc_opt_self(NSCollectionLayoutSize) sizeWithWidthDimension:v6 heightDimension:v7];

  return v8;
}

id sub_B12B0(void *a1)
{
  return sub_B11C4(a1);
}

id sub_B12C4()
{
  return [v0 *(SEL *)(v1 + 3976)];
}

unint64_t sub_B12D4()
{
  unint64_t result = qword_F8558;
  if (!qword_F8558)
  {
    uint64_t v1 = type metadata accessor for VisualAreaArtworkComponentModel(255LL);
    unint64_t result = swift_getWitnessTable(&unk_BCFB0, v1);
    atomic_store(result, (unint64_t *)&qword_F8558);
  }

  return result;
}

uint64_t type metadata accessor for VisualAreaArtworkComponentModel(uint64_t a1)
{
  uint64_t result = qword_F85B8;
  if (!qword_F85B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VisualAreaArtworkComponentModel);
  }
  return result;
}

uint64_t sub_B134C@<X0>(uint64_t a1@<X8>)
{
  return sub_8260(v1 + 56, a1);
}

uint64_t sub_B1358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_35484(v2 + *(int *)(a1 + 28), a2, &qword_F38F8);
}

uint64_t sub_B1380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_35484(v2 + *(int *)(a1 + 24), a2, &qword_F3838);
}

uint64_t sub_B13A8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_44DC(&qword_F3838);
  __chkstk_darwin(v5);
  id v7 = &v28[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for ActionFactory(0LL);
  uint64_t v9 = swift_allocObject(v8, 16LL, 7LL);
  uint64_t v10 = type metadata accessor for VisualAreaArtworkComponentModel(0LL);
  uint64_t v29 = a1;
  sub_B1F9C();
  sub_6680();
  if (v2)
  {
    uint64_t v11 = sub_8440();
    sub_851C(v11);
    sub_8770();
    uint64_t v12 = sub_8484();
    return sub_85AC(v12);
  }

  else
  {
    __int128 v14 = v32;
    *(_OWORD *)a2 = v31;
    *(_OWORD *)(a2 + swift_unknownObjectWeakDestroy(v0 + 16) = v14;
    *(_OWORD *)(a2 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v33;
    *(_BYTE *)(a2 + 48) = v34;
    sub_B1F9C();
    v30[0] = sub_6F270();
    v30[1] = v15;
    uint64_t v16 = AnyHashable.init<A>(_:)(v30, &type metadata for String, &protocol witness table for String);
    __chkstk_darwin(v16);
    *(void *)&v28[-16] = a1;
    sub_B1F9C();
    sub_5868(v17, v18, v19, v20, v21, v22, v23, v24);
    uint64_t v25 = sub_35454((uint64_t)v7, a2 + *(int *)(v10 + 24), &qword_F3838);
    __chkstk_darwin(v25);
    *(void *)&v28[-16] = v9;
    *(void *)&v28[-8] = a1;
    sub_B1F9C();
    sub_5844();
    uint64_t v26 = sub_8440();
    sub_851C(v26);
    sub_8770();
    uint64_t v27 = sub_8484();
    sub_85AC(v27);
    return sub_35454((uint64_t)v30, a2 + *(int *)(v10 + 28), &qword_F38F8);
  }

uint64_t sub_B1670@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_B13A8(a1, a2);
}

_BYTE *sub_B1684(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  double v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *(void *)double v4 = *a2;
    double v4 = (_BYTE *)(v17 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v17);
  }

  else
  {
    *a1 = *(_BYTE *)a2;
    uint64_t v7 = a2[1];
    *((void *)v4 + 1) = v7;
    v4[16] = *((_BYTE *)a2 + 16);
    *(_OWORD *)(v4 + 24) = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(v4 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = *(_OWORD *)((char *)a2 + 33);
    __int128 v8 = *((_OWORD *)a2 + 5);
    *((_OWORD *)v4 + 5) = v8;
    uint64_t v9 = v8;
    uint64_t v10 = **(void (***)(_BYTE *, uint64_t *, uint64_t, __n128))(v8 - 8);
    __n128 v11 = swift_retain(v7);
    v10(v4 + 56, a2 + 7, v9, v11);
    uint64_t v12 = *(int *)(a3 + 24);
    id v13 = &v4[v12];
    __int128 v14 = (char *)a2 + v12;
    uint64_t v15 = type metadata accessor for ImpressionMetrics(0LL);
    if (sub_4AC4((uint64_t)v14, 1LL, v15))
    {
      uint64_t v16 = sub_44DC(&qword_F3838);
      memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
      sub_4AD0((uint64_t)v13, 0LL, 1LL, v15);
    }

    uint64_t v18 = *(int *)(a3 + 28);
    uint64_t v19 = &v4[v18];
    uint64_t v20 = (uint64_t)a2 + v18;
    uint64_t v21 = *(uint64_t *)((char *)a2 + v18 + 24);
    if (v21)
    {
      uint64_t v22 = *(void *)(v20 + 32);
      *((void *)v19 + _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = v21;
      *((void *)v19 + 4) = v22;
      (**(void (***)(void))(v21 - 8))();
    }

    else
    {
      __int128 v23 = *(_OWORD *)(v20 + 16);
      *(_OWORD *)uint64_t v19 = *(_OWORD *)v20;
      *((_OWORD *)v19 + 1) = v23;
      *((void *)v19 + 4) = *(void *)(v20 + 32);
    }
  }

  return v4;
}

void *sub_B1800(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for ImpressionMetrics(0LL);
  uint64_t result = (void *)(a1 + *(int *)(a2 + 28));
  if (result[3]) {
    return (void *)_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(result);
  }
  return result;
}

uint64_t sub_B1894(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = *(_OWORD *)(a2 + 33);
  uint64_t v7 = a2 + 56;
  __int128 v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 8_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x80000000000BE090LL,  "StoreDynamicUIPlugin/ServiceWelcomeHeaderView_tvOS.swift",  56LL,  2LL,  44LL, 0) = v8;
  uint64_t v9 = v8;
  uint64_t v10 = **(void (***)(uint64_t, uint64_t, uint64_t, __n128))(v8 - 8);
  __n128 v11 = swift_retain(v6);
  v10(a1 + 56, v7, v9, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  id v13 = (void *)(a1 + v12);
  __int128 v14 = (const void *)(a2 + v12);
  uint64_t v15 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v14, 1LL, v15))
  {
    uint64_t v16 = sub_44DC(&qword_F3838);
    memcpy(v13, v14, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v15 - 8) + 16LL))(v13, v14, v15);
    sub_4AD0((uint64_t)v13, 0LL, 1LL, v15);
  }

  uint64_t v17 = *(int *)(a3 + 28);
  uint64_t v18 = a1 + v17;
  uint64_t v19 = a2 + v17;
  uint64_t v20 = *(void *)(a2 + v17 + 24);
  if (v20)
  {
    uint64_t v21 = *(void *)(v19 + 32);
    *(void *)(v18 + 24) = v20;
    *(void *)(v18 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v21;
    (**(void (***)(void))(v20 - 8))();
  }

  else
  {
    __int128 v22 = *(_OWORD *)(v19 + 16);
    *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
    *(_OWORD *)(v18 + swift_unknownObjectWeakDestroy(v0 + 16) = v22;
    *(void *)(v18 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v19 + 32);
  }

  return a1;
}

uint64_t sub_B19E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v6;
  swift_retain(v6);
  swift_release();
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  __int128 v7 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = *(_OWORD *)(a2 + 33);
  *(_OWORD *)(a1 + 24) = v7;
  sub_4290((void *)(a1 + 56), (void *)(a2 + 56));
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  uint64_t v11 = type metadata accessor for ImpressionMetrics(0LL);
  int v12 = sub_4AC4((uint64_t)v9, 1LL, v11);
  int v13 = sub_4AC4((uint64_t)v10, 1LL, v11);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
      sub_4AD0((uint64_t)v9, 0LL, 1LL, v11);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v14 = *(void *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    uint64_t v15 = sub_44DC(&qword_F3838);
    memcpy(v9, v10, *(void *)(*(void *)(v15 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, const void *, uint64_t))(v14 + 24))(v9, v10, v11);
LABEL_7:
  uint64_t v16 = *(int *)(a3 + 28);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = (__int128 *)(a2 + v16);
  uint64_t v19 = *((void *)v18 + 3);
  if (!*(void *)(a1 + v16 + 24))
  {
    if (v19)
    {
      *(void *)(v17 + 24) = v19;
      *(void *)(v17 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *((void *)v18 + 4);
      (**(void (***)(uint64_t, __int128 *))(v19 - 8))(v17, v18);
      return a1;
    }

uint64_t sub_B1B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v6;
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  __int128 v7 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v8);
  uint64_t v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = v7;
  uint64_t v11 = type metadata accessor for ImpressionMetrics(0LL);
  if (sub_4AC4((uint64_t)v10, 1LL, v11))
  {
    uint64_t v12 = sub_44DC(&qword_F3838);
    memcpy(v9, v10, *(void *)(*(void *)(v12 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32LL))(v9, v10, v11);
    sub_4AD0((uint64_t)v9, 0LL, 1LL, v11);
  }

  uint64_t v13 = *(int *)(a3 + 28);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  __int128 v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + swift_unknownObjectWeakDestroy(v0 + 16) = v16;
  *(void *)(v14 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(v15 + 32);
  return a1;
}

uint64_t sub_B1C98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(_BYTE *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 3) = *(_OWORD *)(a2 + 33);
  _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + 56));
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 7_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  uint64_t v6 = *(int *)(a3 + 24);
  __int128 v7 = (void *)(a1 + v6);
  uint64_t v8 = (const void *)(a2 + v6);
  uint64_t v9 = type metadata accessor for ImpressionMetrics(0LL);
  int v10 = sub_4AC4((uint64_t)v7, 1LL, v9);
  int v11 = sub_4AC4((uint64_t)v8, 1LL, v9);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
      sub_4AD0((uint64_t)v7, 0LL, 1LL, v9);
      goto LABEL_7;
    }

    goto LABEL_6;
  }

  uint64_t v12 = *(void *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    uint64_t v13 = sub_44DC(&qword_F3838);
    memcpy(v7, v8, *(void *)(*(void *)(v13 - 8) + 64LL));
    goto LABEL_7;
  }

  (*(void (**)(void *, const void *, uint64_t))(v12 + 40))(v7, v8, v9);
LABEL_7:
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = a1 + v14;
  if (*(void *)(a1 + v14 + 24)) {
    _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0((void *)(a1 + v14));
  }
  __int128 v16 = *(_OWORD *)(a2 + v14 + 16);
  *(_OWORD *)uint64_t v15 = *(_OWORD *)(a2 + v14);
  *(_OWORD *)(v15 + swift_unknownObjectWeakDestroy(v0 + 16) = v16;
  *(void *)(v15 + 3_s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(v0 + 2) = *(void *)(a2 + v14 + 32);
  return a1;
}

uint64_t sub_B1E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_B1E24);
}

uint64_t sub_B1E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_77AC4(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_44DC(&qword_F3838);
    return sub_4AC4(a1 + *(int *)(a3 + 24), a2, v8);
  }

uint64_t sub_B1E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_B1EA8);
}

uint64_t sub_B1EA8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_44DC(&qword_F3838);
    return sub_4AD0(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }

  return result;
}

void sub_B1F18(uint64_t a1)
{
  v4[0] = "1";
  v4[1] = &unk_BD048;
  sub_5260(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(v2 - 8) + 64LL;
    void v4[3] = &unk_BD060;
    swift_initStructMetadata(a1, 256LL, 4LL, v4, a1 + 16);
  }

uint64_t sub_B1FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_B2364();
  sub_44DC(&qword_F8648);
  sub_B236C(v5);
  swift_release();
  swift_release();
  double v6 = v21;
  if (v22) {
    double v6 = 0.0;
  }
  uint64_t v26 = &type metadata for VisualAreaImageView.SizeConstraints;
  uint64_t v27 = &protocol witness table for VisualAreaImageView.SizeConstraints;
  int32x2_t v7 = vdup_n_s32(v22);
  v8.i64[0] = v7.u32[0];
  v8.i64[1] = v7.u32[1];
  int8x16_t v24 = vandq_s8(v20, (int8x16_t)vcgezq_s64(vshlq_n_s64(v8, 0x3FuLL)));
  double v25 = v6;
  uint64_t v9 = *(void **)&v3[OBJC_IVAR____TtC20StoreDynamicUIPlugin26VisualAreaArtworkComponent_artworkContainer];
  uint64_t v10 = sub_B2364();
  sub_B236C(v10);
  swift_release();
  uint64_t v11 = v16;
  sub_460C((uint64_t)&v24, (uint64_t)v15);
  uint64_t v12 = sub_B2364();
  sub_B236C(v12);
  swift_release();
  swift_release();
  uint64_t v18 = v11;
  sub_7CF4(v15, (uint64_t)&v19);
  char v23 = v14;
  v17[0] = 4;
  (*(void (**)(char *, uint64_t))((char *)&stru_68.flags + (swift_isaMask & *v9)))(v17, a3);
  sub_B2330((uint64_t)v17);
  return _s20StoreDynamicUIPlugin20AlertFullSheetLayoutVwxx_0(&v24);
}

uint64_t sub_B2148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for VisualAreaArtworkComponent();
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_B219C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for VisualAreaArtworkComponent();
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, v9, a5);
}

uint64_t sub_B21F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BD088, a4);
  return ComponentCell.apply(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_B224C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BD088, a4);
  return ComponentCell.didSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_B22A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_BD088, a4);
  return ComponentCell.shouldSelect(contentsOf:with:asPartOf:)(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_B2304()
{
  return sub_8A80(&qword_F85F8, type metadata accessor for VisualAreaArtworkComponentModel, (uint64_t)&unk_BCF70);
}

uint64_t sub_B2330(uint64_t a1)
{
  return a1;
}

uint64_t sub_B2364()
{
  return swift_getKeyPath(v0);
}

uint64_t sub_B236C(uint64_t a1)
{
  return DiffableLens.subscript.getter(a1, v1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC20StoreDynamicUIPluginP33_AA6E6D8216892AB4F0F5C7F46C149B0D19ResourceBundleClass);
}