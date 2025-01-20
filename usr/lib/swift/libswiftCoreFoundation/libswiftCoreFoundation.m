CoreGraphics::CGFloat __swiftcall CGFloat.init()()
{
  return 0LL;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(_:)(Swift::Float a1)
{
  result.native = a1;
  return result;
}

void CGFloat.native.setter(double a1)
{
  double *v1 = a1;
}

uint64_t (*CGFloat.native.modify())()
{
  return CGFloat.native.modify;
}

uint64_t CGFloat.init<A>(exactly:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v6 = (uint64_t)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t v7 = Double.init<A>(exactly:)(v6, a2);
  LOBYTE(v6) = v8;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  if ((v6 & 1) != 0) {
    return 0LL;
  }
  else {
    return v7;
  }
}

uint64_t Double.init<A>(exactly:)(uint64_t a1, uint64_t a2)
{
  if (dispatch thunk of BinaryInteger.bitWidth.getter() > 64)
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    char v4 = static BinaryFloatingPoint<>._convert<A>(from:)();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
    if ((v4 & 1) != 0) {
      return v11;
    }
    goto LABEL_13;
  }

  char v6 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v7 = dispatch thunk of BinaryInteger._lowWord.getter();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  if ((v6 & 1) != 0)
  {
    double v8 = (double)v7;
    if ((double)v7 < 9.22337204e18)
    {
      *(double *)&uint64_t result = (double)v7;
      if ((~*(void *)&v8 & 0x7FF0000000000000LL) != 0)
      {
        if (v8 > -9.22337204e18)
        {
          uint64_t v9 = (uint64_t)v8;
          goto LABEL_12;
        }
      }

      else
      {
        __break(1u);
      }

      __break(1u);
      goto LABEL_17;
    }
  }

  else
  {
    double v10 = (double)(unint64_t)v7;
    if ((double)(unint64_t)v7 < 1.84467441e19)
    {
      *(double *)&uint64_t result = (double)(unint64_t)v7;
      if ((~*(void *)&v10 & 0x7FF0000000000000LL) != 0)
      {
        uint64_t v9 = (unint64_t)v10;
LABEL_12:
        if (v7 == v9) {
          return result;
        }
        goto LABEL_13;
      }

LABEL_17:
      __break(1u);
      return result;
    }
  }

LABEL_13:
  *(double *)&uint64_t result = 0.0;
  return result;
}

    lazy protocol witness table accessor for type CGFloat and conformance CGFloat();
    v41 = v76;
    static BinaryFloatingPoint._convert<A>(from:)();
    (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v41, a2);
    return v77;
  }

  if (v27 == 8)
  {
    if (v28 == 23)
    {
      v38 = v75;
      v37 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v21, v76, a2);
      v39 = swift_dynamicCast();
      v40 = *(float *)&v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v18, v37, a2);
      if (v39)
      {
        (*(void (**)(char *, uint64_t))(v38 + 8))(v18, a2);
        return v40;
      }

      else
      {
        v61 = dispatch thunk of FloatingPoint.sign.getter();
        v62 = v68;
        dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
        v63 = v70;
        swift_getAssociatedConformanceWitness();
        v64 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v62, v63);
        v65 = v71;
        dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
        (*(void (**)(char *, uint64_t))(v38 + 8))(v18, a2);
        v66 = v73;
        swift_getAssociatedConformanceWitness();
        v67 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v65, v66);
        return COERCE_FLOAT((v61 << 31) | (v64 << 23) | v67 & 0x7FFFFF);
      }
    }

    goto LABEL_13;
  }

  if (v27 != 5 || v28 != 10) {
    goto LABEL_13;
  }
  v30 = v75;
  v29 = v76;
  (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v26, v76, a2);
  v31 = swift_dynamicCast();
  _H8 = LOWORD(v77);
  (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v24, v29, a2);
  if (v31)
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v24, a2);
  }

  else
  {
    v43 = dispatch thunk of FloatingPoint.sign.getter();
    v44 = v68;
    dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
    v45 = v70;
    swift_getAssociatedConformanceWitness();
    v46 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v69 + 8))(v44, v45);
    v47 = v71;
    dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v24, a2);
    v48 = v73;
    swift_getAssociatedConformanceWitness();
    v49 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v72 + 8))(v47, v48);
    _H8 = (v43 << 15) | ((v46 & 0x1F) << 10) | v49 & 0x3FF;
  }

  __asm { FCVT            D8, H8 }

  return _D8;
}

double CGFloat.magnitude.getter(double a1)
{
  return fabs(a1);
}

double protocol witness for static SignedNumeric.- prefix(_:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X8>)
{
  double result = -*a1;
  *a2 = result;
  return result;
}

double protocol witness for SignedNumeric.negate() in conformance CGFloat()
{
  double result = -*v0;
  double *v0 = result;
  return result;
}

Swift::Void __swiftcall CGFloat.negate()()
{
  double *v0 = -*v0;
}

double protocol witness for Numeric.magnitude.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  double result = fabs(*v1);
  *a1 = result;
  return result;
}

double protocol witness for static Numeric.* infix(_:_:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 * *a2;
  *a3 = result;
  return result;
}

double static CGFloat.* infix(_:_:)(double a1, double a2)
{
  return a1 * a2;
}

double protocol witness for static Numeric.*= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *a2 * *a1;
  *a1 = result;
  return result;
}

double static CGFloat.*= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 * a2;
  *a1 = result;
  return result;
}

void protocol witness for static AdditiveArithmetic.zero.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0LL;
}

double protocol witness for static AdditiveArithmetic.+ infix(_:_:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 + *a2;
  *a3 = result;
  return result;
}

double static CGFloat.+ infix(_:_:)(double a1, double a2)
{
  return a1 + a2;
}

double protocol witness for static AdditiveArithmetic.+= infix(_:_:) in conformance CGFloat( double *a1, double *a2)
{
  double result = *a2 + *a1;
  *a1 = result;
  return result;
}

double static CGFloat.+= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 + a2;
  *a1 = result;
  return result;
}

double protocol witness for static AdditiveArithmetic.- infix(_:_:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 - *a2;
  *a3 = result;
  return result;
}

double static CGFloat.- infix(_:_:)(double a1, double a2)
{
  return a1 - a2;
}

double protocol witness for static AdditiveArithmetic.-= infix(_:_:) in conformance CGFloat( double *a1, double *a2)
{
  double result = *a1 - *a2;
  *a1 = result;
  return result;
}

double static CGFloat.-= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 - a2;
  *a1 = result;
  return result;
}

double protocol witness for ExpressibleByIntegerLiteral.init(integerLiteral:) in conformance CGFloat@<D0>( uint64_t *a1@<X0>, double *a2@<X8>)
{
  double result = (double)*a1;
  *a2 = result;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(integerLiteral:)(Swift::Int integerLiteral)
{
  result.native = (double)integerLiteral;
  return result;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t static CGFloat.exponentBitCount.getter()
{
  return 11LL;
}

uint64_t static CGFloat.significandBitCount.getter()
{
  return 52LL;
}

  ;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(bitPattern:)(Swift::UInt bitPattern)
{
  return (CoreGraphics::CGFloat)bitPattern;
}

uint64_t CGFloat.sign.getter(double a1)
{
  return *(void *)&a1 >> 63;
}

uint64_t CGFloat.exponentBitPattern.getter(double a1)
{
  return (*(void *)&a1 >> 52) & 0x7FFLL;
}

uint64_t CGFloat.significandBitPattern.getter(double a1)
{
  return *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
}

double CGFloat.init(sign:exponentBitPattern:significandBitPattern:)(uint64_t a1, __int16 a2, uint64_t a3)
{
  *(void *)&double result = ((unint64_t)(a2 & 0x7FF) << 52) | (a1 << 63) | a3 & 0xFFFFFFFFFFFFFLL;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.init(nan:signaling:)(Swift::UInt nan, Swift::Bool signaling)
{
  if (!(nan >> 50)) {
    return (CoreGraphics::CGFloat)((0x8000000000000uLL >> signaling) | nan | 0x7FF0000000000000LL);
  }
  __break(1u);
  return result;
}

double static CGFloat.infinity.getter()
{
  return INFINITY;
}

double static CGFloat.nan.getter()
{
  return NAN;
}

double static CGFloat.signalingNaN.getter()
{
  return NAN;
}

void static CGFloat.quietNaN.getter()
{
}

double static CGFloat.greatestFiniteMagnitude.getter()
{
  return 1.79769313e308;
}

double static CGFloat.pi.getter()
{
  return 3.14159265;
}

double CGFloat.ulp.getter(double a1)
{
  uint64_t v2 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v2)
  {
    double result = NAN;
    if (v2 != 2047) {
      return COERCE_DOUBLE(*(void *)&a1 & 0x7FF0000000000000LL) * 2.22044605e-16;
    }
  }

  else
  {
    *(void *)&double result = 1LL;
  }

  return result;
}

double static CGFloat.leastNormalMagnitude.getter()
{
  return 2.22507386e-308;
}

double static CGFloat.leastNonzeroMagnitude.getter()
{
  *(void *)&double result = 1LL;
  return result;
}

unint64_t CGFloat.exponent.getter(double a1)
{
  uint64_t v1 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v1 == 2047) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v3 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
  if (!(v1 | *(void *)&a1 & 0xFFFFFFFFFFFFFLL)) {
    return 0x8000000000000000LL;
  }
  if (v1) {
    return v1 - 1023;
  }
  if (v3) {
    return -1011LL - __clz(v3);
  }
  __break(1u);
  return result;
}

double CGFloat.significand.getter(double result)
{
  uint64_t v1 = (*(void *)&result >> 52) & 0x7FFLL;
  unint64_t v2 = *(void *)&result & 0xFFFFFFFFFFFFFLL;
  if ((*(void *)&result & 0xFFFFFFFFFFFFFLL) == 0 || v1 != 2047)
  {
    if (v1)
    {
      if (v1 != 2047)
      {
        *(void *)&unint64_t result = v2 | 0x3FF0000000000000LL;
        return result;
      }
    }

    else if (v2)
    {
      *(void *)&unint64_t result = (*(void *)&result << (__clz(v2) + 53)) & 0xFFFFFFFFFFFFFLL | 0x3FF0000000000000LL;
      return result;
    }

    *(void *)&unint64_t result = v1 << 52;
  }

  return result;
}

double CGFloat.init(sign:exponent:significand:)(char a1, uint64_t a2, double a3)
{
  return specialized Double.init(sign:exponent:significand:)(a1 & 1, a2, a3);
}

uint64_t CGFloat.round(_:)(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858]();
  char v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if ((_DWORD)result == *MEMORY[0x189619F78])
  {
    double *v1 = round(*v1);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F70])
  {
    double *v1 = rint(*v1);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F88])
  {
    double v8 = *v1;
LABEL_7:
    double *v1 = ceil(v8);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F90])
  {
    double v8 = *v1;
LABEL_10:
    double *v1 = floor(v8);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F60])
  {
    double *v1 = trunc(*v1);
  }

  else
  {
    if ((_DWORD)result == *MEMORY[0x189619F68])
    {
      double v8 = *v1;
      if ((*(void *)v1 & 0x8000000000000000LL) == 0) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }

    Double._roundSlowPath(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  return result;
}

double CGFloat.nextUp.getter(double a1)
{
  double result = a1 + 0.0;
  if (result < INFINITY) {
    *(void *)&result += (*(uint64_t *)&result >> 63) | 1;
  }
  return result;
}

double static CGFloat./= infix(_:_:)(double *a1, double a2)
{
  double result = *a1 / a2;
  *a1 = result;
  return result;
}

Swift::Void __swiftcall CGFloat.formTruncatingRemainder(dividingBy:)(CoreGraphics::CGFloat dividingBy)
{
  double *v1 = fmod(*v1, dividingBy.native);
}

Swift::Void __swiftcall CGFloat.formRemainder(dividingBy:)(CoreGraphics::CGFloat dividingBy)
{
  double *v1 = remainder(*v1, dividingBy.native);
}

Swift::Void __swiftcall CGFloat.formSquareRoot()()
{
  double *v0 = sqrt(*v0);
}

Swift::Void __swiftcall CGFloat.addProduct(_:_:)(CoreGraphics::CGFloat a1, CoreGraphics::CGFloat a2)
{
  *unint64_t v2 = *v2 + a1.native * a2.native;
}

Swift::Bool __swiftcall CGFloat.isEqual(to:)(CoreGraphics::CGFloat to)
{
  return v1 == to.native;
}

Swift::Bool __swiftcall CGFloat.isLess(than:)(CoreGraphics::CGFloat than)
{
  return v1 < than.native;
}

Swift::Bool __swiftcall CGFloat.isLessThanOrEqualTo(_:)(CoreGraphics::CGFloat a1)
{
  return v1 <= a1.native;
}

BOOL CGFloat.isNormal.getter(double a1)
{
  return ((*(void *)&a1 >> 52) & 0x7FFLL) != 0x7FF && ((*(void *)&a1 >> 52) & 0x7FFLL) != 0;
}

BOOL CGFloat.isFinite.getter(double a1)
{
  return (~*(void *)&a1 & 0x7FF0000000000000LL) != 0;
}

BOOL CGFloat.isZero.getter(double a1)
{
  return (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0;
}

BOOL CGFloat.isSubnormal.getter(double a1)
{
  return (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (*(void *)&a1 & 0x7FF0000000000000LL) == 0;
}

BOOL CGFloat.isInfinite.getter(double a1)
{
  return (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000LL;
}

BOOL CGFloat.isNaN.getter(double a1)
{
  return (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && (~*(void *)&a1 & 0x7FF0000000000000LL) == 0;
}

BOOL CGFloat.isSignalingNaN.getter(double a1)
{
  return (~*(void *)&a1 & 0x7FF0000000000000LL) == 0
      && (*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0
      && (*(void *)&a1 & 0x8000000000000LL) == 0;
}

void CGFloat.isSignaling.getter()
{
}

uint64_t CGFloat.isCanonical.getter()
{
  return 1LL;
}

double CGFloat.binade.getter(double a1)
{
  uint64_t v1 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v1 == 2047) {
    return NAN;
  }
  if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0 && !v1) {
    return COERCE_DOUBLE(COERCE_UNSIGNED_INT64(a1 * 4.50359963e15) & 0xFFF0000000000000LL) * 2.22044605e-16;
  }
  *(void *)&double result = *(void *)&a1 & 0xFFF0000000000000LL;
  return result;
}

uint64_t CGFloat.significandWidth.getter(double a1)
{
  unint64_t v1 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
  unint64_t v2 = __clz(__rbit64(*(void *)&a1 & 0xFFFFFFFFFFFFFLL));
  uint64_t v3 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (v3 && v3 != 2047)
  {
    unint64_t v6 = 52 - v2;
    if (v1) {
      return v6;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v4 = 63 - __clz(v1) - v2;
    if (v3) {
      uint64_t v4 = -1LL;
    }
    if (v1) {
      return v4;
    }
    else {
      return -1LL;
    }
  }
}

uint64_t protocol witness for BinaryFloatingPoint.init(sign:exponentBitPattern:significandBitPattern:) in conformance CGFloat@<X0>( uint64_t result@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = (result << 63) | ((*a2 & 0x7FFLL) << 52) | *a3 & 0xFFFFFFFFFFFFFLL;
  return result;
}

double protocol witness for BinaryFloatingPoint.init(_:) in conformance CGFloat@<D0>( double *a1@<X8>, float a2@<S0>)
{
  double result = a2;
  *a1 = result;
  return result;
}

void protocol witness for BinaryFloatingPoint.init(_:) in conformance CGFloat( double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
}

void protocol witness for BinaryFloatingPoint.init<A>(_:) in conformance CGFloat( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, double *a4@<X8>)
{
  *a4 = specialized BinaryFloatingPoint.init<A>(_:)(a1, a2, a3);
}

double specialized BinaryFloatingPoint.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v76 = a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v72 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v73 = AssociatedTypeWitness;
  ((void (*)(void))MEMORY[0x1895F8858])();
  v71 = (char *)&v68 - v6;
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v68 = (char *)&v68 - v9;
  uint64_t v75 = *(void *)(a2 - 8);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  v12 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  v15 = (char *)&v68 - v14;
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  v18 = (char *)&v68 - v17;
  uint64_t v19 = MEMORY[0x1895F8858](v16);
  v21 = (char *)&v68 - v20;
  uint64_t v22 = MEMORY[0x1895F8858](v19);
  v24 = (char *)&v68 - v23;
  MEMORY[0x1895F8858](v22);
  v26 = (char *)&v68 - v25;
  uint64_t v27 = dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter();
  uint64_t v74 = a3;
  uint64_t v28 = dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter();
  if (v27 == 11)
  {
    if (v28 == 52)
    {
      uint64_t v34 = v75;
      uint64_t v33 = v76;
      (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v15, v76, a2);
      int v35 = swift_dynamicCast();
      _D8 = v77;
      (*(void (**)(char *, uint64_t, uint64_t))(v34 + 32))(v12, v33, a2);
      if (v35)
      {
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, a2);
      }

      else
      {
        uint64_t v54 = dispatch thunk of FloatingPoint.sign.getter();
        v55 = v68;
        dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter();
        uint64_t v56 = v70;
        swift_getAssociatedConformanceWitness();
        __int16 v57 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v69 + 8))(v55, v56);
        v58 = v71;
        dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v12, a2);
        uint64_t v59 = v73;
        swift_getAssociatedConformanceWitness();
        uint64_t v60 = dispatch thunk of BinaryInteger._lowWord.getter();
        (*(void (**)(char *, uint64_t))(v72 + 8))(v58, v59);
        *(void *)&_D8 = (v54 << 63) | ((unint64_t)(v57 & 0x7FF) << 52) | v60 & 0xFFFFFFFFFFFFFLL;
      }

      return _D8;
    }

uint64_t protocol witness for BinaryFloatingPoint.init<A>(exactly:) in conformance CGFloat@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result = specialized BinaryFloatingPoint.init<A>(exactly:)(a1, a2, a3);
  *(void *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t specialized BinaryFloatingPoint.init<A>(exactly:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v166 = *(char **)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v160 = *(void *)(*((void *)v166 + 3) + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v161 = (char *)&v149 - v6;
  uint64_t v7 = swift_checkMetadataState();
  v167 = *(char **)(v7 - 8);
  uint64_t v8 = MEMORY[0x1895F8858](v7);
  uint64_t v10 = (char *)&v149 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = MEMORY[0x1895F8858](v8);
  v158 = (char *)&v149 - v12;
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  v157 = (char *)&v149 - v14;
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  v155 = (char *)&v149 - v16;
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  v156 = (char *)&v149 - v18;
  uint64_t v19 = MEMORY[0x1895F8858](v17);
  v153 = (char *)&v149 - v20;
  uint64_t v21 = MEMORY[0x1895F8858](v19);
  v164 = (void (*)(char *, uint64_t))((char *)&v149 - v22);
  uint64_t v23 = MEMORY[0x1895F8858](v21);
  v162 = (char *)&v149 - v24;
  uint64_t v25 = MEMORY[0x1895F8858](v23);
  v154 = (void (**)(char *, uint64_t))((char *)&v149 - v26);
  uint64_t v27 = MEMORY[0x1895F8858](v25);
  v163 = (char *)&v149 - v28;
  uint64_t v29 = MEMORY[0x1895F8858](v27);
  v165 = (char *)&v149 - v30;
  uint64_t v31 = MEMORY[0x1895F8858](v29);
  v168 = (char *)&v149 - v32;
  uint64_t v33 = MEMORY[0x1895F8858](v31);
  v169 = (char *)&v149 - v34;
  uint64_t v35 = *(void *)(a2 - 8);
  uint64_t v36 = MEMORY[0x1895F8858](v33);
  uint64_t v38 = (char *)&v149 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v36);
  float v40 = (char *)&v149 - v39;
  if ((dispatch thunk of FloatingPoint.isNaN.getter() & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(a1, a2);
    return 0LL;
  }

  uint64_t v152 = v7;
  uint64_t v42 = a1;
  if (dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter() >= 12)
  {
    __int16 v43 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
    v43(v40, v42, a2);
LABEL_7:
    char v45 = dispatch thunk of FloatingPoint.isFinite.getter();
    goto LABEL_9;
  }

  uint64_t v44 = dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter();
  __int16 v43 = *(void (**)(char *, uint64_t, uint64_t))(v35 + 16);
  v43(v40, v42, a2);
  if (v44 >= 53) {
    goto LABEL_7;
  }
  char v45 = 0;
LABEL_9:
  char v46 = *(void (**)(char *, uint64_t))(v35 + 8);
  v46(v40, a2);
  v43(v38, v42, a2);
  if ((v45 & 1) == 0)
  {
    v46(v38, a2);
    uint64_t v48 = v42;
    return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
  }

  char v47 = dispatch thunk of FloatingPoint.isZero.getter();
  v46(v38, a2);
  uint64_t v48 = v42;
  if ((v47 & 1) != 0) {
    return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
  }
  uint64_t v151 = a3;
  dispatch thunk of FloatingPoint.exponent.getter();
  uint64_t v49 = Double.exponent.getter();
  int64_t v171 = v49;
  uint64_t v50 = v152;
  v51 = v166;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
LABEL_22:
      uint64_t v57 = dispatch thunk of BinaryInteger._lowWord.getter();
      uint64_t v56 = (void (**)(char *, uint64_t))v167;
      if (v57 >= v49) {
        goto LABEL_23;
      }
      goto LABEL_41;
    }

    goto LABEL_18;
  }

  char v52 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v53 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v52 & 1) == 0)
  {
    if (v53 < 64) {
      goto LABEL_22;
    }
    uint64_t v56 = (void (**)(char *, uint64_t))v167;
    (*((void (**)(char *, char *, uint64_t))v167 + 2))(v10, v169, v50);
    uint64_t v170 = v49;
    if (v49 <= 0)
    {
      v56[1](v10, v50);
    }

    else
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      double v77 = v168;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v78 = dispatch thunk of static Comparable.< infix(_:_:)();
      v79 = v46;
      v80 = (void (*)(char *, uint64_t))*((void *)v167 + 1);
      v81 = v77;
      uint64_t v56 = (void (**)(char *, uint64_t))v167;
      v80(v81, v50);
      v80(v10, v50);
      char v46 = v79;
      if ((v78 & 1) != 0) {
        goto LABEL_41;
      }
    }

    goto LABEL_23;
  }

  if (v53 > 64)
  {
LABEL_18:
    lazy protocol witness table accessor for type Int and conformance Int();
    uint64_t v54 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v55 = dispatch thunk of static Comparable.< infix(_:_:)();
    uint64_t v56 = (void (**)(char *, uint64_t))v167;
    (*((void (**)(char *, uint64_t))v167 + 1))(v54, v50);
    if ((v55 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_41;
  }

  uint64_t v69 = AssociatedTypeWitness;
  uint64_t v70 = v160;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v72 = v161;
  MEMORY[0x186E1A9E8](&unk_182EB0388, 256LL, v69, AssociatedConformanceWitness);
  uint64_t v73 = v168;
  MEMORY[0x186E1A9B8](v72, v50, v70);
  uint64_t v74 = v169;
  LOBYTE(v69) = dispatch thunk of static Comparable.< infix(_:_:)();
  uint64_t v56 = (void (**)(char *, uint64_t))v167;
  uint64_t v75 = (void (*)(char *, uint64_t))*((void *)v167 + 1);
  v75(v73, v50);
  uint64_t v76 = v158;
  ((void (*)(char *, char *, uint64_t))v56[2])(v158, v74, v50);
  if ((v69 & 1) == 0)
  {
    v85 = v76;
    v86 = v46;
    int64_t v87 = v171;
    uint64_t v88 = dispatch thunk of BinaryInteger._lowWord.getter();
    v75(v85, v50);
    BOOL v141 = v88 < v87;
    char v46 = v86;
    if (v141) {
      goto LABEL_41;
    }
LABEL_23:
    v58 = (void (*)(uint64_t, uint64_t))v46;
    uint64_t v59 = Double.exponent.getter();
    int64_t v171 = v59;
    char v60 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v61 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v60 & 1) != 0)
    {
      if (v61 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v62 = v168;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        uint64_t v63 = v169;
        char v64 = dispatch thunk of static Comparable.< infix(_:_:)();
        v65 = v56[1];
        v65(v62, v50);
        uint64_t v66 = v63;
LABEL_36:
        v65(v66, v50);
        if ((v64 & 1) == 0)
        {
LABEL_37:
          a3 = v151;
          uint64_t v84 = dispatch thunk of BinaryFloatingPoint.significandWidth.getter();
          if (Double.significandWidth.getter() < v84) {
            goto LABEL_80;
          }
          return specialized BinaryFloatingPoint.init<A>(_:)(v48, a2, a3);
        }

LABEL_80:
        v58(v48, a2);
        return 0LL;
      }
    }

    else if (v61 > 63)
    {
      uint64_t v170 = v59;
      v82 = v157;
      ((void (*)(char *, char *, uint64_t))v56[4])(v157, v169, v50);
      if (v59 < 0)
      {
        v56[1](v82, v50);
        goto LABEL_80;
      }

      lazy protocol witness table accessor for type Int and conformance Int();
      v83 = v168;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v64 = dispatch thunk of static Comparable.< infix(_:_:)();
      v65 = v56[1];
      v65(v83, v50);
      uint64_t v66 = v82;
      goto LABEL_36;
    }

    int v67 = v169;
    uint64_t v68 = dispatch thunk of BinaryInteger._lowWord.getter();
    v56[1](v67, v50);
    if (v171 >= v68) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }

  v75(v76, v50);
LABEL_41:
  uint64_t v89 = Double.exponent.getter();
  int64_t v171 = v89;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    v90 = v169;
    if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64)
    {
      lazy protocol witness table accessor for type Int and conformance Int();
      v91 = v168;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      goto LABEL_47;
    }

LABEL_52:
    if (dispatch thunk of BinaryInteger._lowWord.getter() >= v89) {
      goto LABEL_53;
    }
    goto LABEL_87;
  }

  char v92 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v93 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v92 & 1) != 0)
  {
    if (v93 <= 64) {
      goto LABEL_73;
    }
    lazy protocol witness table accessor for type Int and conformance Int();
    v91 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v90 = v169;
LABEL_47:
    char v94 = dispatch thunk of static Comparable.< infix(_:_:)();
    v56[1](v91, v50);
    if ((v94 & 1) == 0) {
      goto LABEL_53;
    }
LABEL_87:
    v46((char *)v48, a2);
    v56[1](v90, v50);
    return 0LL;
  }

  if (v93 < 64)
  {
    v90 = v169;
    goto LABEL_52;
  }

  v121 = v155;
  ((void (*)(char *, char *, uint64_t))v56[2])(v155, v169, v50);
  uint64_t v170 = v89;
  if (v89 > 0)
  {
    lazy protocol witness table accessor for type Int and conformance Int();
    v122 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v123 = dispatch thunk of static Comparable.< infix(_:_:)();
    v124 = v56[1];
    v124(v122, v50);
    v124(v121, v50);
    v90 = v169;
    if ((v123 & 1) == 0) {
      goto LABEL_53;
    }
    goto LABEL_87;
  }

  v56[1](v121, v50);
  v90 = v169;
  while (1)
  {
LABEL_53:
    v150 = (void (*)(uint64_t, uint64_t))v46;
    v169 = (char *)dispatch thunk of BinaryFloatingPoint.significandWidth.getter();
    v95 = v56[4];
    v96 = v165;
    ((void (*)(char *, char *, uint64_t))v95)(v165, v90, v50);
    char v97 = dispatch thunk of static BinaryInteger.isSigned.getter();
    v98 = v163;
    v99 = v56[2];
    ((void (*)(char *, char *, uint64_t))v99)(v163, v96, v50);
    if ((v97 & 1) == 0)
    {
      v101 = v56[1];
      v101(v98, v50);
LABEL_60:
      v104 = v162;
      v102 = v99;
      goto LABEL_61;
    }

    uint64_t v100 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v101 = v56[1];
    v101(v98, v50);
    if (v100 <= 64) {
      goto LABEL_60;
    }
    uint64_t v56 = v154;
    v102 = v99;
    ((void (*)(void (**)(char *, uint64_t), char *, uint64_t))v99)(v154, v165, v50);
    int64_t v171 = 0x8000000000000000LL;
    if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
    {
      uint64_t v103 = dispatch thunk of BinaryInteger.bitWidth.getter();
      v104 = v162;
      if (v103 >= 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v138 = v168;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        char v139 = dispatch thunk of static Comparable.< infix(_:_:)();
        v101(v138, v50);
        v101((char *)v56, v50);
        if ((v139 & 1) == 0) {
          goto LABEL_61;
        }
      }

      else
      {
        uint64_t v105 = dispatch thunk of BinaryInteger._lowWord.getter();
        v101((char *)v56, v50);
        if (v105 >= v171) {
          goto LABEL_61;
        }
      }

      goto LABEL_101;
    }

    char v134 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v135 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v134 & 1) != 0)
    {
      if (v135 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        v136 = v168;
        uint64_t v50 = v152;
        v51 = v166;
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        char v137 = dispatch thunk of static Comparable.< infix(_:_:)();
        v101(v136, v50);
        v101((char *)v56, v50);
        v104 = v162;
        if ((v137 & 1) == 0) {
          goto LABEL_61;
        }
LABEL_101:
        __break(1u);
LABEL_102:
        uint64_t v50 = v152;
        v101((char *)v56, v152);
        v51 = v166;
        v104 = v162;
        goto LABEL_61;
      }

      uint64_t v142 = AssociatedTypeWitness;
      uint64_t v143 = v160;
      uint64_t v50 = v152;
      uint64_t v144 = swift_getAssociatedConformanceWitness();
      MEMORY[0x186E1A9E8](&unk_182EB0388, 256LL, v142, v144);
      v145 = v168;
      MEMORY[0x186E1A9B8](v161, v50, v143);
      v146 = v166;
      LOBYTE(v142) = dispatch thunk of static Comparable.< infix(_:_:)();
      v101(v145, v50);
      v51 = v153;
      ((void (*)(char *, void (**)(char *, uint64_t), uint64_t))v95)(v153, v56, v50);
      if ((v142 & 1) != 0) {
        goto LABEL_104;
      }
      int64_t v147 = v171;
      uint64_t v148 = dispatch thunk of BinaryInteger._lowWord.getter();
      v101(v51, v50);
      BOOL v141 = v148 < v147;
      v51 = v146;
    }

    else
    {
      if (v135 >= 64) {
        goto LABEL_102;
      }
      uint64_t v50 = v152;
      v51 = v166;
      uint64_t v140 = dispatch thunk of BinaryInteger._lowWord.getter();
      v101((char *)v56, v50);
      BOOL v141 = v140 < v171;
    }

    v104 = v162;
    if (v141) {
      goto LABEL_101;
    }
LABEL_61:
    v106 = v165;
    uint64_t v107 = dispatch thunk of BinaryInteger.bitWidth.getter();
    ((void (*)(char *, char *, uint64_t))v102)(v104, v106, v50);
    if (v107 >= 65)
    {
      v101(v104, v50);
      goto LABEL_63;
    }

    uint64_t v110 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v101(v104, v50);
    if (v110 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0) {
      break;
    }
LABEL_63:
    char v46 = v164;
    ((void (*)(void (*)(char *, uint64_t), char *, uint64_t))v102)(v164, v165, v50);
    int64_t v171 = 0x7FFFFFFFFFFFFFFFLL;
    char v108 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v109 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v108 & 1) != 0)
    {
      if (v109 <= 64) {
        goto LABEL_71;
      }
      lazy protocol witness table accessor for type Int and conformance Int();
    }

    else
    {
      if (v109 < 64)
      {
LABEL_71:
        v111 = (char *)v164;
        uint64_t v112 = dispatch thunk of BinaryInteger._lowWord.getter();
        v101(v111, v50);
        if (v171 >= v112) {
          break;
        }
        goto LABEL_72;
      }

      uint64_t v170 = 0x7FFFFFFFFFFFFFFFLL;
      lazy protocol witness table accessor for type Int and conformance Int();
    }

    v125 = v168;
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    char v46 = v164;
    char v126 = dispatch thunk of static Comparable.< infix(_:_:)();
    v101(v125, v50);
    v101((char *)v46, v50);
    if ((v126 & 1) == 0) {
      break;
    }
LABEL_72:
    __break(1u);
LABEL_73:
    uint64_t v113 = AssociatedTypeWitness;
    uint64_t v114 = v160;
    uint64_t v115 = swift_getAssociatedConformanceWitness();
    v116 = v161;
    MEMORY[0x186E1A9E8](&unk_182EB0388, 256LL, v113, v115);
    v117 = v168;
    MEMORY[0x186E1A9B8](v116, v50, v114);
    v118 = v169;
    LOBYTE(v113) = dispatch thunk of static Comparable.< infix(_:_:)();
    v119 = v56[1];
    v119(v117, v50);
    v120 = v156;
    ((void (*)(char *, char *, uint64_t))v56[2])(v156, v118, v50);
    if ((v113 & 1) != 0)
    {
      v119(v120, v50);
      v90 = v169;
      goto LABEL_87;
    }

    v130 = v120;
    v131 = v46;
    int64_t v132 = v171;
    uint64_t v133 = dispatch thunk of BinaryInteger._lowWord.getter();
    v119(v130, v50);
    BOOL v141 = v133 < v132;
    char v46 = v131;
    v90 = v169;
    if (v141) {
      goto LABEL_87;
    }
  }

  v127 = v165;
  uint64_t v128 = dispatch thunk of BinaryInteger._lowWord.getter();
  v101(v127, v50);
  uint64_t v129 = Double.exponent.getter();
  if (__OFSUB__(v128, v129))
  {
    __break(1u);
LABEL_104:
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v101)(v51, v50);
    __break(1u);
    return result;
  }

  a3 = v151;
  v150(v48, a2);
  return 0LL;
}

uint64_t protocol witness for static BinaryFloatingPoint.exponentBitCount.getter in conformance CGFloat()
{
  return 11LL;
}

uint64_t protocol witness for static BinaryFloatingPoint.significandBitCount.getter in conformance CGFloat()
{
  return 52LL;
}

void protocol witness for BinaryFloatingPoint.exponentBitPattern.getter in conformance CGFloat( uint64_t *a1@<X8>)
{
  *a1 = (*v1 >> 52) & 0x7FFLL;
}

void protocol witness for BinaryFloatingPoint.significandBitPattern.getter in conformance CGFloat( uint64_t *a1@<X8>)
{
  *a1 = *v1 & 0xFFFFFFFFFFFFFLL;
}

uint64_t protocol witness for BinaryFloatingPoint.binade.getter in conformance CGFloat@<X0>(void *a1@<X8>)
{
  uint64_t result = Double.binade.getter();
  *a1 = v3;
  return result;
}

uint64_t protocol witness for BinaryFloatingPoint.significandWidth.getter in conformance CGFloat()
{
  return Double.significandWidth.getter();
}

void protocol witness for FloatingPoint.init(sign:exponent:significand:) in conformance CGFloat( char a1@<W0>, uint64_t *a2@<X1>, double *a3@<X2>, double *a4@<X8>)
{
  *a4 = specialized Double.init(sign:exponent:significand:)(a1 & 1, *a2, *a3);
}

void protocol witness for FloatingPoint.init(signOf:magnitudeOf:) in conformance CGFloat( double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  *a3 = specialized BinaryFloatingPoint.init(signOf:magnitudeOf:)(*a1, *a2);
}

double protocol witness for FloatingPoint.init(_:) in conformance CGFloat@<D0>( uint64_t a1@<X0>, double *a2@<X8>)
{
  double result = (double)a1;
  *a2 = (double)a1;
  return result;
}

uint64_t protocol witness for FloatingPoint.init<A>(_:) in conformance CGFloat@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  double v6 = specialized CGFloat.init<A>(_:)(a1, a2);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  *a3 = v6;
  return result;
}

uint64_t protocol witness for Numeric.init<A>(exactly:) in conformance CGFloat@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  uint64_t v9 = Double.init<A>(exactly:)((uint64_t)v8, a2);
  char v11 = v10;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
  if ((v11 & 1) != 0) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = v9;
  }
  *(void *)a3 = v13;
  *(_BYTE *)(a3 + 8) = v11 & 1;
  return result;
}

uint64_t protocol witness for static FloatingPoint.radix.getter in conformance CGFloat()
{
  return 2LL;
}

void protocol witness for static FloatingPoint.nan.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FF8000000000000LL;
}

void protocol witness for static FloatingPoint.signalingNaN.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FF4000000000000LL;
}

void protocol witness for static FloatingPoint.infinity.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x7FF0000000000000LL;
}

void protocol witness for static FloatingPoint.greatestFiniteMagnitude.getter in conformance CGFloat( void *a1@<X8>)
{
  *a1 = 0x7FEFFFFFFFFFFFFFLL;
}

void protocol witness for static FloatingPoint.pi.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x400921FB54442D18LL;
}

double protocol witness for FloatingPoint.ulp.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  uint64_t v2 = (*v1 >> 52) & 0x7FFLL;
  if (v2)
  {
    if (v2 != 2047)
    {
      double result = COERCE_DOUBLE(*v1 & 0x7FF0000000000000LL) * 2.22044605e-16;
      *a1 = result;
      return result;
    }

    double v4 = NAN;
  }

  else
  {
    *(void *)&double v4 = 1LL;
  }

  double result = v4;
  *a1 = v4;
  return result;
}

void protocol witness for static FloatingPoint.ulpOfOne.getter in conformance CGFloat(void *a1@<X8>)
{
  *a1 = 0x3CB0000000000000LL;
}

void protocol witness for static FloatingPoint.leastNormalMagnitude.getter in conformance CGFloat( void *a1@<X8>)
{
  *a1 = 0x10000000000000LL;
}

void protocol witness for static FloatingPoint.leastNonzeroMagnitude.getter in conformance CGFloat( void *a1@<X8>)
{
  *a1 = 1LL;
}

uint64_t protocol witness for FloatingPoint.sign.getter in conformance CGFloat()
{
  return *v0 >> 63;
}

uint64_t protocol witness for FloatingPoint.exponent.getter in conformance CGFloat@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = Double.exponent.getter();
  *a1 = result;
  return result;
}

uint64_t protocol witness for FloatingPoint.significand.getter in conformance CGFloat@<X0>(void *a1@<X8>)
{
  uint64_t result = Double.significand.getter();
  *a1 = v3;
  return result;
}

double protocol witness for static FloatingPoint./ infix(_:_:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *a1 / *a2;
  *a3 = result;
  return result;
}

double static CGFloat./ infix(_:_:)(double a1, double a2)
{
  return a1 / a2;
}

double protocol witness for static FloatingPoint./= infix(_:_:) in conformance CGFloat( double *a1, double *a2)
{
  double result = *a1 / *a2;
  *a1 = result;
  return result;
}

void protocol witness for FloatingPoint.remainder(dividingBy:) in conformance CGFloat( double *a1@<X0>, double *a2@<X8>)
{
  *a2 = _stdlib_remainder(*v2, *a1);
}

void protocol witness for FloatingPoint.formRemainder(dividingBy:) in conformance CGFloat(double *a1)
{
  double *v1 = _stdlib_remainder(*v1, *a1);
}

void protocol witness for FloatingPoint.truncatingRemainder(dividingBy:) in conformance CGFloat( double *a1@<X0>, double *a2@<X8>)
{
  *a2 = fmod(*v2, *a1);
}

void protocol witness for FloatingPoint.formTruncatingRemainder(dividingBy:) in conformance CGFloat( double *a1)
{
  double *v1 = fmod(*v1, *a1);
}

void protocol witness for FloatingPoint.squareRoot() in conformance CGFloat(double *a1@<X8>)
{
  *a1 = _stdlib_squareRoot(*v1);
}

void protocol witness for FloatingPoint.formSquareRoot() in conformance CGFloat()
{
  double *v0 = _stdlib_squareRoot(*v0);
}

double protocol witness for FloatingPoint.addingProduct(_:_:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double result = *v3 + *a1 * *a2;
  *a3 = result;
  return result;
}

double protocol witness for FloatingPoint.addProduct(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  double result = *v2 + *a1 * *a2;
  *uint64_t v2 = result;
  return result;
}

double *protocol witness for static FloatingPoint.minimum(_:_:) in conformance CGFloat@<X0>( double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (*result > *a2)
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000LL) != 0) {
      double v3 = *a2;
    }
  }

  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.maximum(_:_:) in conformance CGFloat@<X0>( double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (*a2 >= *result)
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000LL) != 0) {
      double v3 = *a2;
    }
  }

  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.minimumMagnitude(_:_:) in conformance CGFloat@<X0>( double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (fabs(*result) > fabs(*a2))
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000LL) != 0) {
      double v3 = *a2;
    }
  }

  *a3 = v3;
  return result;
}

double *protocol witness for static FloatingPoint.maximumMagnitude(_:_:) in conformance CGFloat@<X0>( double *result@<X0>, double *a2@<X1>, double *a3@<X8>)
{
  double v3 = *result;
  double v4 = *a2;
  if (fabs(*a2) >= fabs(*result))
  {
    if ((*(void *)&v4 & 0xFFFFFFFFFFFFFLL) == 0) {
      double v3 = *a2;
    }
    if ((~*(void *)&v4 & 0x7FF0000000000000LL) != 0) {
      double v3 = *a2;
    }
  }

  *a3 = v3;
  return result;
}

uint64_t protocol witness for FloatingPoint.rounded(_:) in conformance CGFloat@<X0>( uint64_t a1@<X0>, double *a2@<X8>)
{
  uint64_t v5 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  double v9 = *v2;
  double v14 = *v2;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  if ((_DWORD)result == *MEMORY[0x189619F78])
  {
    double v11 = round(v9);
  }

  else if ((_DWORD)result == *MEMORY[0x189619F70])
  {
    double v11 = rint(v9);
  }

  else if ((_DWORD)result == *MEMORY[0x189619F88])
  {
    double v11 = ceil(v9);
  }

  else if ((_DWORD)result == *MEMORY[0x189619F90])
  {
    double v11 = floor(v9);
  }

  else if ((_DWORD)result == *MEMORY[0x189619F60])
  {
    double v11 = trunc(v9);
  }

  else if ((_DWORD)result == *MEMORY[0x189619F68])
  {
    double v11 = ceil(v9);
    double v12 = floor(v9);
    if (v9 < 0.0) {
      double v11 = v12;
    }
  }

  else
  {
    Double._roundSlowPath(_:)();
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    double v11 = v14;
  }

  *a2 = v11;
  return result;
}

uint64_t protocol witness for FloatingPoint.round(_:) in conformance CGFloat(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if ((_DWORD)result == *MEMORY[0x189619F78])
  {
    double *v1 = round(*v1);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F70])
  {
    double *v1 = rint(*v1);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F88])
  {
    double v8 = *v1;
LABEL_7:
    double *v1 = ceil(v8);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F90])
  {
    double v8 = *v1;
LABEL_10:
    double *v1 = floor(v8);
    return result;
  }

  if ((_DWORD)result == *MEMORY[0x189619F60])
  {
    double *v1 = trunc(*v1);
  }

  else
  {
    if ((_DWORD)result == *MEMORY[0x189619F68])
    {
      double v8 = *v1;
      if ((*(void *)v1 & 0x8000000000000000LL) == 0) {
        goto LABEL_7;
      }
      goto LABEL_10;
    }

    Double._roundSlowPath(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  return result;
}

void protocol witness for FloatingPoint.nextUp.getter in conformance CGFloat(double *a1@<X8>)
{
  double v2 = *v1 + 0.0;
  if (v2 < INFINITY) {
    *(void *)&v2 += (*(uint64_t *)&v2 >> 63) | 1;
  }
  *a1 = v2;
}

double protocol witness for FloatingPoint.nextDown.getter in conformance CGFloat@<D0>(double *a1@<X8>)
{
  double v2 = 0.0 - *v1;
  if (v2 < INFINITY) {
    *(void *)&v2 += (*(uint64_t *)&v2 >> 63) | 1;
  }
  double result = -v2;
  *a1 = result;
  return result;
}

BOOL protocol witness for FloatingPoint.isEqual(to:) in conformance CGFloat(double *a1)
{
  return *v1 == *a1;
}

BOOL protocol witness for FloatingPoint.isLess(than:) in conformance CGFloat(double *a1)
{
  return *v1 < *a1;
}

BOOL protocol witness for FloatingPoint.isLessThanOrEqualTo(_:) in conformance CGFloat(double *a1)
{
  return *v1 <= *a1;
}

uint64_t protocol witness for FloatingPoint.isTotallyOrdered(belowOrEqualTo:) in conformance CGFloat( double *a1)
{
  return specialized BinaryFloatingPoint.isTotallyOrdered(belowOrEqualTo:)(*a1, *v1);
}

uint64_t specialized BinaryFloatingPoint.isTotallyOrdered(belowOrEqualTo:)(double a1, double a2)
{
  if (a2 < a1) {
    return 1LL;
  }
  uint64_t result = *(void *)&a2 >> 63;
  if ((*(void *)&a1 & 0x8000000000000000LL) != 0)
  {
    if ((*(void *)&a2 & 0x8000000000000000LL) == 0) {
      return result;
    }
  }

  else if ((*(void *)&a2 & 0x8000000000000000LL) != 0)
  {
    return result;
  }

  unint64_t v3 = (*(void *)&a2 >> 52) & 0x7FFLL;
  unint64_t v4 = (*(void *)&a1 >> 52) & 0x7FFLL;
  unint64_t v5 = *(void *)&a2 & 0xFFFFFFFFFFFFFLL;
  unint64_t v6 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL;
  BOOL v8 = a2 >= 0.0 || v5 >= v6;
  if (v6 < v5) {
    BOOL v8 = *(void *)&a2 >> 63;
  }
  if (v3 < v4) {
    BOOL v8 = a2 >= 0.0;
  }
  if (v4 < v3) {
    return result;
  }
  else {
    return v8;
  }
}

BOOL protocol witness for FloatingPoint.isNormal.getter in conformance CGFloat()
{
  return ((*v0 >> 52) & 0x7FFLL) != 0x7FF && ((*v0 >> 52) & 0x7FFLL) != 0;
}

BOOL protocol witness for FloatingPoint.isFinite.getter in conformance CGFloat()
{
  return (~*v0 & 0x7FF0000000000000LL) != 0;
}

BOOL protocol witness for FloatingPoint.isZero.getter in conformance CGFloat()
{
  return (*v0 & 0x7FFFFFFFFFFFFFFFLL) == 0;
}

BOOL protocol witness for FloatingPoint.isSubnormal.getter in conformance CGFloat()
{
  return (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (*v0 & 0x7FF0000000000000LL) == 0;
}

BOOL protocol witness for FloatingPoint.isInfinite.getter in conformance CGFloat()
{
  return (*v0 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000LL;
}

BOOL protocol witness for FloatingPoint.isNaN.getter in conformance CGFloat()
{
  return (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (~*v0 & 0x7FF0000000000000LL) == 0;
}

BOOL protocol witness for FloatingPoint.isSignalingNaN.getter in conformance CGFloat()
{
  return (~*v0 & 0x7FF0000000000000LL) == 0 && (*v0 & 0xFFFFFFFFFFFFFLL) != 0 && (*v0 & 0x8000000000000LL) == 0;
}

uint64_t protocol witness for FloatingPoint.floatingPointClass.getter in conformance CGFloat()
{
  return specialized FloatingPoint.floatingPointClass.getter(*v0);
}

uint64_t protocol witness for FloatingPoint.isCanonical.getter in conformance CGFloat()
{
  return 1LL;
}

double protocol witness for ExpressibleByFloatLiteral.init(floatLiteral:) in conformance CGFloat@<D0>( double *a1@<X0>, void *a2@<X8>)
{
  double result = *a1;
  *a2 = *(void *)a1;
  return result;
}

uint64_t CGFloat.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance CGFloat()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CGFloat()
{
  return Double.description.getter();
}

void CGFloat.hash(into:)(double a1)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *(void *)&a1;
  }
  else {
    Swift::UInt64 v1 = 0LL;
  }
  Hasher._combine(_:)(v1);
}

uint64_t protocol witness for Hashable.hashValue.getter in conformance CGFloat()
{
  return Double.hashValue.getter();
}

void protocol witness for Hashable.hash(into:) in conformance CGFloat()
{
  if ((*v0 & 0x7FFFFFFFFFFFFFFFLL) != 0) {
    Swift::UInt64 v1 = *v0;
  }
  else {
    Swift::UInt64 v1 = 0LL;
  }
  Hasher._combine(_:)(v1);
}

uint64_t protocol witness for Hashable._rawHashValue(seed:) in conformance CGFloat()
{
  return static Hasher._hash(seed:_:)();
}

Swift::UInt8 __swiftcall UInt8.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1.native >= 256.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }

  return (int)a1.native;
}

Swift::Int8 __swiftcall Int8.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1.native <= -129.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1.native >= 128.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }

  return (int)a1.native;
}

Swift::UInt16 __swiftcall UInt16.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1.native >= 65536.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }

  return (int)a1.native;
}

Swift::Int16 __swiftcall Int16.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1.native <= -32769.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1.native >= 32768.0)
  {
LABEL_7:
    __break(1u);
    return v1;
  }

  return (int)a1.native;
}

Swift::UInt32 __swiftcall UInt32.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1.native <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1.native < 4294967300.0) {
    return a1.native;
  }
LABEL_7:
  __break(1u);
  return result;
}

Swift::Int32 __swiftcall Int32.init(_:)(CoreGraphics::CGFloat a1)
{
  if ((~*(void *)&a1.native & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1.native <= -2147483650.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1.native < 2147483650.0) {
    return (int)a1.native;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t UInt64.init(_:)(double a1)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1 <= -1.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1 < 1.84467441e19) {
    return (unint64_t)a1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t Int64.init(_:)(double a1)
{
  if ((~*(void *)&a1 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (a1 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (a1 < 9.22337204e18) {
    return (uint64_t)a1;
  }
LABEL_7:
  __break(1u);
  return result;
}

Swift::Float __swiftcall Float.init(_:)(CoreGraphics::CGFloat a1)
{
  return a1.native;
}

CoreGraphics::CGFloat __swiftcall CGFloat.distance(to:)(CoreGraphics::CGFloat to)
{
  result.native = to.native - v1;
  return result;
}

CoreGraphics::CGFloat __swiftcall CGFloat.advanced(by:)(CoreGraphics::CGFloat by)
{
  result.native = by.native + v1;
  return result;
}

double protocol witness for Strideable.distance(to:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X8>)
{
  double result = *a1 - *v2;
  *a2 = result;
  return result;
}

double protocol witness for Strideable.advanced(by:) in conformance CGFloat@<D0>( double *a1@<X0>, double *a2@<X8>)
{
  double result = *a1 + *v2;
  *a2 = result;
  return result;
}

double *protocol witness for static Strideable._step(after:from:by:) in conformance CGFloat( double *result, uint64_t a2, char a3, double *a4, double *a5, double *a6)
{
  double v6 = *a6;
  if ((a3 & 1) != 0)
  {
    double v8 = v6 + *a4;
    goto LABEL_5;
  }

  if (!__OFADD__(a2++, 1LL))
  {
    double v8 = *a5 + (double)a2 * v6;
LABEL_5:
    *double result = v8;
    return (double *)a2;
  }

  __break(1u);
  return result;
}

BOOL protocol witness for static Comparable.< infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 < *a2;
}

BOOL protocol witness for static Comparable.<= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a1 <= *a2;
}

BOOL protocol witness for static Comparable.>= infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a2 <= *a1;
}

BOOL protocol witness for static Comparable.> infix(_:_:) in conformance CGFloat(double *a1, double *a2)
{
  return *a2 < *a1;
}

uint64_t CGFloat._cVarArgEncoding.getter(double a1)
{
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16) = 1LL;
  *(double *)(result + 32) = a1;
  return result;
}

uint64_t CGFloat._cVarArgAlignment.getter()
{
  return 8LL;
}

uint64_t protocol witness for _CVarArgAligned._cVarArgAlignment.getter in conformance CGFloat()
{
  return 8LL;
}

uint64_t protocol witness for CVarArg._cVarArgEncoding.getter in conformance CGFloat()
{
  uint64_t v1 = *v0;
  uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(result + 16) = 1LL;
  *(void *)(result + 32) = v1;
  return result;
}

double CGFloat.init(from:)(void *a1)
{
  uint64_t v13 = type metadata accessor for DecodingError();
  uint64_t v3 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858](v13);
  uint64_t v4 = type metadata accessor for DecodingError.Context();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  double v8 = v14;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v8)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }

  else
  {
    double v14 = a1;
    v12[2] = v3;
    v12[3] = v7;
    v12[1] = v5;
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    dispatch thunk of SingleValueDecodingContainer.decode(_:)();
    double v1 = v9;
    uint64_t v10 = (uint64_t)v14;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    __swift_destroy_boxed_opaque_existential_1(v10);
  }

  return v1;
}

uint64_t CGFloat.encode(to:)(void *a1)
{
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t protocol witness for Decodable.init(from:) in conformance CGFloat@<X0>( void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v17 = type metadata accessor for DecodingError.Context();
  uint64_t v3 = *(void *)(v17 - 8);
  MEMORY[0x1895F8858](v17);
  uint64_t v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for DecodingError();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  double v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  uint64_t v10 = v19;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v10) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  v16[3] = v3;
  v16[4] = v9;
  v16[1] = v7;
  v16[2] = v5;
  uint64_t v19 = a1;
  double v11 = v18;
  __swift_project_boxed_opaque_existential_1(v20, v20[3]);
  dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = (uint64_t)v19;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  uint64_t result = __swift_destroy_boxed_opaque_existential_1(v14);
  *double v11 = v13;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance CGFloat(void *a1)
{
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

uint64_t specialized FloatingPoint.floatingPointClass.getter(double a1)
{
  uint64_t v1 = (*(void *)&a1 >> 52) & 0x7FFLL;
  if (a1 < 0.0) {
    unsigned int v2 = 5;
  }
  else {
    unsigned int v2 = 6;
  }
  if (a1 < 0.0) {
    int v3 = 4;
  }
  else {
    int v3 = 7;
  }
  if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0) {
    unsigned int v2 = v3;
  }
  if (a1 < 0.0) {
    int v4 = 3;
  }
  else {
    int v4 = 8;
  }
  if (a1 < 0.0) {
    int v5 = 2;
  }
  else {
    int v5 = 9;
  }
  if ((*(void *)&a1 & 0xFFFFFFFFFFFFFLL) != 0) {
    unsigned int v6 = (*(void *)&a1 >> 51) & 1;
  }
  else {
    unsigned int v6 = v5;
  }
  if (v1 != 2047) {
    unsigned int v6 = v4;
  }
  if (v1) {
    return v6;
  }
  else {
    return v2;
  }
}

double specialized CGFloat.init<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  int v5 = (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v3 + 16))(v5);
  if (dispatch thunk of BinaryInteger.bitWidth.getter() < 65)
  {
    char v7 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v8 = dispatch thunk of BinaryInteger._lowWord.getter();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
    if ((v7 & 1) != 0) {
      return (double)v8;
    }
    else {
      return (double)(unint64_t)v8;
    }
  }

  else
  {
    lazy protocol witness table accessor for type Double and conformance Double();
    lazy protocol witness table accessor for type UInt64 and conformance UInt64();
    static BinaryFloatingPoint<>._convert<A>(from:)();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a2);
    return *(double *)&v9[1];
  }

double specialized Double.init(sign:exponent:significand:)(char a1, uint64_t a2, double a3)
{
  double result = -a3;
  if ((a1 & 1) == 0) {
    double result = a3;
  }
  uint64_t v5 = (*(void *)&a3 >> 52) & 0x7FFLL;
  if (v5 != 2047 && v5 | *(void *)&a3 & 0xFFFFFFFFFFFFFLL)
  {
    if (a2 >= -1022)
    {
      if (a2 >= 1024)
      {
        if (a2 >= 3069) {
          a2 = 3069LL;
        }
        do
        {
          a2 -= 1023LL;
          double result = result * 8.98846567e307;
        }

        while ((unint64_t)a2 > 0x3FF);
      }
    }

    else
    {
      if (a2 <= -3066) {
        uint64_t v6 = -3066LL;
      }
      else {
        uint64_t v6 = a2;
      }
      do
      {
        a2 = v6 + 1022;
        double result = result * 2.22507386e-308;
        BOOL v7 = __CFADD__(v6, 2044LL);
        v6 += 1022LL;
      }

      while (!v7);
    }

    return result * COERCE_DOUBLE(((a2 << 52) + 0x3FF0000000000000LL) & 0x7FF0000000000000LL);
  }

  return result;
}

double _stdlib_squareRoot(double a1)
{
  return sqrt(a1);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x186E1AAC0]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type CGFloat and conformance CGFloat()
{
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type CGFloat and conformance CGFloat;
  if (!lazy protocol witness table cache variable for type CGFloat and conformance CGFloat)
  {
    unint64_t result = MEMORY[0x186E1AACC](&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type CGFloat and conformance CGFloat);
  }

  return result;
}

uint64_t associated type witness table accessor for ExpressibleByIntegerLiteral.IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral in CGFloat()
{
  return MEMORY[0x1896187A8];
}

unint64_t lazy protocol witness table accessor for type UInt and conformance UInt()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt and conformance UInt;
  if (!lazy protocol witness table cache variable for type UInt and conformance UInt)
  {
    unint64_t result = MEMORY[0x186E1AACC](MEMORY[0x189618CE8], MEMORY[0x189618CD8]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type UInt and conformance UInt);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = MEMORY[0x186E1AACC](MEMORY[0x189618768], MEMORY[0x189618740]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = MEMORY[0x186E1AACC](MEMORY[0x189618788], MEMORY[0x189618740]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }

  return result;
}

uint64_t associated type witness table accessor for ExpressibleByFloatLiteral.FloatLiteralType : _ExpressibleByBuiltinFloatLiteral in CGFloat()
{
  return MEMORY[0x1896185B0];
}

ValueMetadata *type metadata accessor for CGFloat()
{
  return &type metadata for CGFloat;
}

unint64_t lazy protocol witness table accessor for type Double and conformance Double()
{
  unint64_t result = lazy protocol witness table cache variable for type Double and conformance Double;
  if (!lazy protocol witness table cache variable for type Double and conformance Double)
  {
    unint64_t result = MEMORY[0x186E1AACC](MEMORY[0x189618568], MEMORY[0x189618560]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Double and conformance Double);
  }

  return result;
}

unint64_t lazy protocol witness table accessor for type UInt64 and conformance UInt64()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt64 and conformance UInt64;
  if (!lazy protocol witness table cache variable for type UInt64 and conformance UInt64)
  {
    unint64_t result = MEMORY[0x186E1AACC](MEMORY[0x18961A8F8], MEMORY[0x18961A8C8]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type UInt64 and conformance UInt64);
  }

  return result;
}

double specialized BinaryFloatingPoint.init(signOf:magnitudeOf:)(double a1, double a2)
{
  *(void *)&double result = *(void *)&a1 & 0x8000000000000000LL | *(void *)&a2 & 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

CFHashCode _CFObject.hashValue.getter()
{
  return CFHash(v0);
}

void _CFObject.hash(into:)()
{
  Swift::UInt v0 = dispatch thunk of Hashable.hashValue.getter();
  Hasher._combine(_:)(v0);
}

BOOL static _CFObject.== infix(_:_:)(const void *a1, const void *a2)
{
  return CFEqual(a1, a2) != 0;
}

uint64_t dispatch thunk of static BinaryFloatingPoint.exponentBitCount.getter()
{
  return MEMORY[0x1896177B0]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandWidth.getter()
{
  return MEMORY[0x1896177B8]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.exponentBitPattern.getter()
{
  return MEMORY[0x1896177C0]();
}

uint64_t dispatch thunk of static BinaryFloatingPoint.significandBitCount.getter()
{
  return MEMORY[0x1896177C8]();
}

uint64_t dispatch thunk of BinaryFloatingPoint.significandBitPattern.getter()
{
  return MEMORY[0x1896177D0]();
}

uint64_t static BinaryFloatingPoint._convert<A>(from:)()
{
  return MEMORY[0x1896177E8]();
}

uint64_t static BinaryFloatingPoint<>._convert<A>(from:)()
{
  return MEMORY[0x1896177F8]();
}

uint64_t dispatch thunk of FloatingPoint.sign.getter()
{
  return MEMORY[0x189617978]();
}

uint64_t dispatch thunk of FloatingPoint.isNaN.getter()
{
  return MEMORY[0x189617980]();
}

uint64_t dispatch thunk of FloatingPoint.isZero.getter()
{
  return MEMORY[0x189617988]();
}

uint64_t dispatch thunk of FloatingPoint.exponent.getter()
{
  return MEMORY[0x1896179B0]();
}

uint64_t dispatch thunk of FloatingPoint.isFinite.getter()
{
  return MEMORY[0x1896179C0]();
}

uint64_t dispatch thunk of Hashable.hashValue.getter()
{
  return MEMORY[0x189617A08]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x189617B40]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x189618390]();
}

uint64_t Double.description.getter()
{
  return MEMORY[0x189618500]();
}

uint64_t Double.significand.getter()
{
  return MEMORY[0x189618508]();
}

uint64_t Double._roundSlowPath(_:)()
{
  return MEMORY[0x189618510]();
}

uint64_t Double.significandWidth.getter()
{
  return MEMORY[0x189618520]();
}

uint64_t Double.binade.getter()
{
  return MEMORY[0x189618538]();
}

uint64_t Double.exponent.getter()
{
  return MEMORY[0x189618548]();
}

uint64_t Double.hashValue.getter()
{
  return MEMORY[0x189618550]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x189618E20]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x189618EA0]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x189618EA8]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x189618EB8]();
}

uint64_t type metadata accessor for DecodingError.Context()
{
  return MEMORY[0x189619390]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x1896193A0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A8]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x189619F98]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x18961A010]();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return MEMORY[0x18961A080]();
}

{
  return MEMORY[0x18961A088]();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return MEMORY[0x18961A0D8]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x18961A310]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x18961A678]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt64 a1)
{
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x18961A6F0]();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return MEMORY[0x18961A940]();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return MEMORY[0x18961A968]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

double fmod(double a1, double a2)
{
  return result;
}

double remainder(double a1, double a2)
{
  return result;
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x18961B3A8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}