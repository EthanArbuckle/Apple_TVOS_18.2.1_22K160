void sub_1460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1500(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_17F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_18A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DDC( uint64_t a1, void *a2, GPUTools::GL::WireframeRenderer *a3, unsigned int a4, unsigned int a5, unsigned int a6, void **a7, uint64_t a8, float a9)
{
  id v17 = a2;
  if ((GPUTools::GL::WireframeRenderer::IsBadDrawCall(a3, a5, a8, v18) & 1) != 0)
  {
LABEL_73:

    return;
  }

  id v58 = v17;
  v19 = (uint64_t (**)(id, uint64_t))[v17 gliDispatch];
  id v20 = [v17 gliContext];
  int v54 = v19[143](v20, 2929LL);
  ((void (*)(id, uint64_t, unsigned __int8 *))v19[99])(v20, 2930LL, &v67);
  v19[63](v20, 2929LL);
  v19[61](v20, 0LL);
  int v53 = v19[143](v20, 2960LL);
  ((void (*)(id, uint64_t, unsigned int *))v19[104])(v20, 2968LL, &v66);
  v19[63](v20, 2960LL);
  v19[255](v20, 0LL);
  unsigned int v50 = a4;
  v51 = a7;
  unsigned int v59 = a5;
  ((void (*)(id, uint64_t, _BYTE *))v19[99])(v20, 3107LL, v65);
  ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v19[49])(v20, 1LL, 1LL, 1LL, 1LL);
  int v21 = v19[143](v20, 2896LL);
  v19[63](v20, 2896LL);
  int v22 = v19[143](v20, 2912LL);
  v19[63](v20, 2912LL);
  int v23 = v19[143](v20, 3042LL);
  v19[63](v20, 3042LL);
  int v57 = v19[143](v20, 3058LL);
  v19[63](v20, 3058LL);
  int v56 = v19[143](v20, 2884LL);
  v19[63](v20, 2884LL);
  ((void (*)(id, uint64_t, unsigned int *))v19[104])(v20, 34016LL, &v64);
  unsigned int v60 = a6;
  ((void (*)(id, uint64_t, int *))v19[104])(v20, 2849LL, &v63);
  ((void (*)(id, float))v19[155])(v20, a9);
  uint64_t v24 = *(void *)(a1 + 8);
  uint64_t v25 = *(void *)(a1 + 16);
  int v55 = v21;
  if (v25 == v24)
  {
    ((void (*)(id, uint64_t, float *))v19[104])(v20, 34018LL, v68);
    LOBYTE(v61) = 0;
    uint64_t v24 = *(void *)(a1 + 8);
    uint64_t v25 = *(void *)(a1 + 16);
    if (SLODWORD(v68[0]) <= (unint64_t)(v25 - v24))
    {
      uint64_t v26 = a8;
      int v27 = v22;
      if (SLODWORD(v68[0]) < (unint64_t)(v25 - v24))
      {
        uint64_t v25 = v24 + SLODWORD(v68[0]);
        *(void *)(a1 + 16) = v25;
      }
    }

    else
    {
      uint64_t v26 = a8;
      sub_2748((void *)(a1 + 8), SLODWORD(v68[0]) - (v25 - v24), &v61);
      int v27 = v22;
      uint64_t v24 = *(void *)(a1 + 8);
      uint64_t v25 = *(void *)(a1 + 16);
    }
  }

  else
  {
    uint64_t v26 = a8;
    int v27 = v22;
  }

  int v28 = v23;
  if (v25 != v24)
  {
    unint64_t v29 = 0LL;
    do
    {
      v19[342](v20, (v29 + 33984));
      *(_BYTE *)(*(void *)(a1 + 8) + v29) = v19[143](v20, 3553LL);
      v19[63](v20, 3553LL);
      ++v29;
    }

    while (v29 < *(void *)(a1 + 16) - *(void *)(a1 + 8));
  }

  int v52 = v19[143](v20, 32886LL);
  v19[64](v20, 32886LL);
  ((void (*)(id, uint64_t, float *))v19[103])(v20, 2816LL, v68);
  v30 = (GPUTools::GL *)a6;
  ((void (*)(id, float, float, float, float))v19[37])(v20, 1.0, 1.0, 1.0, 1.0);
  if (((_DWORD)a3 - 4) > 2)
  {
    if (a6)
    {
      if ((int)v26 < 2) {
        ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void, void **))v19[67])( v20,  a3,  v59,  a6,  v51);
      }
      else {
        ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void, void **, uint64_t))v19[763])( v20,  a3,  v59,  a6,  v51,  v26);
      }
    }

    else if ((int)v26 < 2)
    {
      ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void, uint64_t))v19[762])( v20,  a3,  v50,  v59,  v26);
    }

    else
    {
      ((void (*)(id, GPUTools::GL::WireframeRenderer *, void, void))v19[65])(v20, a3, v50, v59);
    }

LABEL_51:
    ((void (*)(id, float))v19[155])(v20, (float)v63);
    if (v55) {
      v19[72](v20, 2896LL);
    }
    if (v56) {
      v19[72](v20, 2884LL);
    }
    if (v27) {
      v19[72](v20, 2912LL);
    }
    if (v57) {
      v19[72](v20, 3058LL);
    }
    if (v28) {
      v19[72](v20, 3042LL);
    }
    uint64_t v48 = *(void *)(a1 + 8);
    uint64_t v47 = *(void *)(a1 + 16);
    if (v47 != v48)
    {
      unint64_t v49 = 0LL;
      do
      {
        if (*(_BYTE *)(v48 + v49))
        {
          v19[342](v20, (v49 + 33984));
          v19[72](v20, 3553LL);
          uint64_t v48 = *(void *)(a1 + 8);
          uint64_t v47 = *(void *)(a1 + 16);
        }

        ++v49;
      }

      while (v49 < v47 - v48);
    }

    v19[342](v20, v64);
    if (v52) {
      v19[73](v20, 32886LL);
    }
    ((void (*)(id, float, float, float, float))v19[37])(v20, v68[0], v68[1], v68[2], v68[3]);
    ((void (*)(id, void, void, void, void))v19[49])(v20, v65[0], v65[1], v65[2], v65[3]);
    if (v53) {
      v19[72](v20, 2960LL);
    }
    v19[255](v20, v66);
    if (v54) {
      v19[72](v20, 2929LL);
    }
    v19[61](v20, v67);
    id v17 = v58;
    goto LABEL_73;
  }

  if (!a6)
  {
    int v62 = 0;
    ((void (*)(id, uint64_t, int *))v19[104])(v20, 34965LL, &v62);
    if (v62) {
      ((void (*)(id, uint64_t, void))v19[642])(v20, 34963LL, 0LL);
    }
    else {
      v35 = (GPUTools::GL *)&unk_1401;
    }
    v61 = 0LL;
    if ((_DWORD)a3 == 4)
    {
      unsigned int v36 = GPUTools::GL::dy_type_size(v35, v34);
      uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriList( (GPUTools::GL::WireframeRenderer *)&v61,  (void **)v50,  v59,  v36,  v37);
    }

    else
    {
      unsigned int v45 = GPUTools::GL::dy_type_size(v35, v34);
      if ((_DWORD)a3 == 5) {
        uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip( (GPUTools::GL::WireframeRenderer *)&v61,  (void **)v50,  v59,  v45,  v46);
      }
      else {
        uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan( (GPUTools::GL::WireframeRenderer *)&v61,  (void **)v50,  v59,  v45,  v46);
      }
    }

    if ((int)v26 < 2) {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *))v19[67])( v20,  1LL,  LineListFromTriList,  v35,  v61);
    }
    else {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))v19[763])( v20,  1LL,  LineListFromTriList,  v35,  v61,  v26);
    }
    free(v61);
    if (v62) {
      v19[642](v20, 34963LL);
    }
    goto LABEL_51;
  }

  int v62 = 0;
  ((void (*)(id, uint64_t, int *))v19[104])(v20, 34965LL, &v62);
  if (!v62)
  {
    v33 = v51;
    if (!v51) {
      goto LABEL_43;
    }
LABEL_31:
    v39 = (GPUTools::GL::WireframeRenderer *)v33;
    v61 = 0LL;
    if ((_DWORD)a3 == 4)
    {
      unsigned int v40 = GPUTools::GL::dy_type_size(v30, v31);
      uint64_t v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(v39, &v61, (void **)v59, v40, 0, v41);
    }

    else
    {
      unsigned int v43 = GPUTools::GL::dy_type_size(v30, v31);
      if ((_DWORD)a3 == 5) {
        uint64_t v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(v39, &v61, (void **)v59, v43, 0, v44);
      }
      else {
        uint64_t v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(v39, &v61, (void **)v59, v43, 0, v44);
      }
    }

    else {
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))v19[763])( v20,  1LL,  v42,  v30,  v61,  v26);
    }
    free(v61);
LABEL_43:
    if (v62)
    {
      v19[642](v20, 34963LL);
      v19[650](v20, 34963LL);
    }

    goto LABEL_51;
  }

  ((void (*)(id, uint64_t, uint64_t, void **))v19[651])(v20, 34963LL, 34660LL, &v61);
  uint64_t v32 = ((uint64_t (*)(id, uint64_t, void, void, uint64_t))v19[795])(v20, 34963LL, 0LL, (int)v61, 1LL);
  if (v32)
  {
    ((void (*)(id, uint64_t, void))v19[642])(v20, 34963LL, 0LL);
    v33 = (void **)((char *)v51 + v32);
    v30 = (GPUTools::GL *)v60;
    goto LABEL_31;
  }

  dy_abort("Unable to map element array buffer");
  __break(1u);
}

void sub_2670( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_26F8(GPUTools::GL::WireframeRenderer *a1)
{
}

void sub_270C(GPUTools::GL::WireframeRenderer *this)
{
  *(void *)this = &off_24650;
  v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }

  GPUTools::GL::WireframeRenderer::~WireframeRenderer(this);
}

void sub_2748(void *a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v4 = a2;
  v7 = (_BYTE *)a1[1];
  uint64_t v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }

      while (v4);
      v7 = v13;
    }

    a1[1] = v7;
  }

  else
  {
    v8 = &v7[-*a1];
    unint64_t v9 = (unint64_t)&v8[a2];
    unint64_t v10 = v6 - *a1;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      v12 = operator new(v11);
    }
    else {
      v12 = 0LL;
    }
    v14 = &v8[(void)v12];
    v15 = &v8[(void)v12 + v4];
    v16 = &v8[(void)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }

    while (v4);
    id v17 = (_BYTE *)*a1;
    if (v7 != (_BYTE *)*a1)
    {
      do
      {
        char v18 = *--v7;
        *--v14 = v18;
      }

      while (v7 != v17);
      v7 = (_BYTE *)*a1;
    }

    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7) {
      operator delete(v7);
    }
  }
}

void sub_2860()
{
}

void sub_2874(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_28C4(exception, a1);
}

void sub_28B0(_Unwind_Exception *a1)
{
}

std::logic_error *sub_28C4(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_28E8(uint64_t a1)
{
  *(void *)a1 = off_246B8;
  uint64_t v2 = a1 + 152;
  for (i = *(void **)(a1 + 168); i; i = (void *)*i)
  {
    for (j = (void *)i[5]; j; j = (void *)*j)
    {
      v5 = (void *)j[3];
      if (v5) {
        operator delete(v5);
      }
    }
  }

  sub_4AF0(a1 + 232);
  sub_4A34(a1 + 192);
  sub_4A34(v2);
  sub_4A34(a1 + 112);
  sub_49B8(a1 + 72);
  sub_49B8(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = 0LL;
  if (v6) {
    operator delete(v6);
  }
  v7 = *(id **)(a1 + 16);
  *(void *)(a1 + 16) = 0LL;
  if (v7) {
    sub_5680(a1 + 16, v7);
  }

  GPUTools::GL::WireframeRenderer::~WireframeRenderer((GPUTools::GL::WireframeRenderer *)a1);
}

void sub_29A8(void *a1)
{
}

void sub_29BC(uint64_t a1)
{
}

uint64_t sub_29D0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7 = a3;
  if (a4) {
    uint64_t v5 = DYCreatePrivateGLShader(**(void **)a1);
  }
  else {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 4752LL))(*(void *)(*(void *)a1 + 16LL));
  }
  (*(void (**)(void, void, uint64_t, uint64_t *, void))(*(void *)(a1 + 8) + 4760LL))( *(void *)(*(void *)a1 + 16LL),  v5,  1LL,  &v7,  0LL);
  (*(void (**)(void, void))(*(void *)(a1 + 8) + 4768LL))( *(void *)(*(void *)a1 + 16LL),  v5);
  return v5;
}

uint64_t sub_2A68(uint64_t a1)
{
  unsigned int v8 = 0;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  35725LL,  &v8);
  if (!v8) {
    return 0LL;
  }
  if (!v7[1]) {
    return 0LL;
  }
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) context]);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 sharegroup]);

  uint64_t v4 = sub_2BD8(a1, v3, v8);
  if (!(_DWORD)v4
    || (v7[0] = 0,
        (*(void (**)(void, void, uint64_t, _DWORD *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5264LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v8,  35722LL,  v7),  GPUTools::GL::CopyProgramActiveAttributes(*(GPUTools::GL **)(a1 + 24), (const Dispatcher *)v8, v4, v5),  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 4792LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v4),  (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5264LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v4,  35714LL,  &v9),  v9))
  {

    return v4;
  }

  uint64_t result = dy_abort("Failed to link program: %u", v4);
  __break(1u);
  return result;
}

void sub_2BB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2BD8(uint64_t a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  unsigned int v11 = a3;
  id v10 = v5;
  uint64_t v6 = sub_56B8((void *)(a1 + 192), (unint64_t *)&v10);
  if (v6 && (uint64_t v7 = sub_66E4(v6 + 3, &v11)) != 0LL) {
    uint64_t v8 = *(unsigned int *)v7[3];
  }
  else {
    uint64_t v8 = 0LL;
  }

  return v8;
}

void sub_2C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2C64(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = sub_29D0(*(void *)(a1 + 24), 35632LL, a2, 1);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) context]);
  uint64_t v5 = DYCreatePrivateGLProgram();

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5512LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v5,  33368LL,  1LL);
  (*(void (**)(void, void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 4784LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v5,  v3);
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 4792LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v5);
  (*(void (**)(void, void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 4744LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v5,  v3);
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 4728LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) context]);
  uint64_t v7 = DYCreatePrivateGLProgramPipeline();

  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 6552LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v7,  2LL,  v5);
  return v7;
}

void sub_2D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2DA0(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 6608LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  a2,  35633LL,  &v46);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) context]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sharegroup]);

  unsigned int v45 = v5;
  uint64_t v47 = (unint64_t *)&v45;
  uint64_t v6 = sub_4B64(a1 + 112, (unint64_t *)&v45, (uint64_t)&unk_237D1, &v47);
  uint64_t v47 = (unint64_t *)&v46;
  uint64_t v7 = *((unsigned int *)sub_5070((uint64_t)(v6 + 3), &v46, (uint64_t)&unk_237D1, (_DWORD **)&v47) + 5);
  uint64_t v47 = *(unint64_t **)(**(void **)(a1 + 24) + 16LL);
  uint64_t v8 = sub_5290((void *)(a1 + 72), &v47);
  if (!v8)
  {
    int v9 = sub_2C64(a1, (uint64_t)"void main() { gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0); }");
    unsigned int v45 = *(void **)(**(void **)(a1 + 24) + 16LL);
    uint64_t v47 = (unint64_t *)&v45;
    id v10 = sub_537C(a1 + 72, &v45, (uint64_t)&unk_237D1, &v47);
    unsigned int v11 = v10;
    v12 = (char *)v10[4];
    uint64_t v13 = (uint64_t)(v10 + 5);
    unint64_t v14 = v10[5];
    if ((unint64_t)v12 >= v14)
    {
      v16 = (char *)v10[3];
      uint64_t v17 = (v12 - v16) >> 2;
      unint64_t v18 = v14 - (void)v16;
      unint64_t v19 = (uint64_t)(v14 - (void)v16) >> 1;
      if (v19 <= v17 + 1) {
        unint64_t v19 = v17 + 1;
      }
      if (v18 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20)
      {
        int v21 = (char *)sub_564C(v13, v20);
        v16 = (char *)v11[3];
        v12 = (char *)v11[4];
      }

      else
      {
        int v21 = 0LL;
      }

      int v22 = &v21[4 * v17];
      int v23 = &v21[4 * v20];
      *(_DWORD *)int v22 = v9;
      v15 = v22 + 4;
      while (v12 != v16)
      {
        int v24 = *((_DWORD *)v12 - 1);
        v12 -= 4;
        *((_DWORD *)v22 - 1) = v24;
        v22 -= 4;
      }

      v11[3] = v22;
      v11[4] = v15;
      v11[5] = v23;
      if (v16) {
        operator delete(v16);
      }
    }

    else
    {
      *(_DWORD *)v12 = v9;
      v15 = v12 + 4;
    }

    v11[4] = v15;
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) context]);
    uint64_t v26 = (char *)[v25 API];

    if (v26 == (_BYTE *)&dword_0 + 3)
    {
      int v27 = sub_2C64( a1,  (uint64_t)"#version 300 es\n out lowp vec4 fragColor;\n"
                       "void main() { fragColor = vec4(1.0, 1.0, 1.0, 1.0); }");
      unsigned int v45 = *(void **)(**(void **)(a1 + 24) + 16LL);
      uint64_t v47 = (unint64_t *)&v45;
      int v28 = sub_537C(a1 + 72, &v45, (uint64_t)&unk_237D1, &v47);
      unint64_t v29 = v28;
      v30 = (char *)v28[4];
      uint64_t v31 = (uint64_t)(v28 + 5);
      unint64_t v32 = v28[5];
      if ((unint64_t)v30 >= v32)
      {
        unsigned int v34 = (char *)v28[3];
        uint64_t v35 = (v30 - v34) >> 2;
        unint64_t v36 = v32 - (void)v34;
        unint64_t v37 = (uint64_t)(v32 - (void)v34) >> 1;
        if (v37 <= v35 + 1) {
          unint64_t v37 = v35 + 1;
        }
        if (v36 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v38 = v37;
        }
        if (v38)
        {
          v39 = (char *)sub_564C(v31, v38);
          unsigned int v34 = (char *)v29[3];
          v30 = (char *)v29[4];
        }

        else
        {
          v39 = 0LL;
        }

        unsigned int v40 = &v39[4 * v35];
        BOOL v41 = &v39[4 * v38];
        *(_DWORD *)unsigned int v40 = v27;
        v33 = v40 + 4;
        while (v30 != v34)
        {
          int v42 = *((_DWORD *)v30 - 1);
          v30 -= 4;
          *((_DWORD *)v40 - 1) = v42;
          v40 -= 4;
        }

        v29[3] = v40;
        v29[4] = v33;
        v29[5] = v41;
        if (v34) {
          operator delete(v34);
        }
      }

      else
      {
        *(_DWORD *)v30 = v27;
        v33 = v30 + 4;
      }

      v29[4] = v33;
    }

    unsigned int v45 = *(void **)(**(void **)(a1 + 24) + 16LL);
    uint64_t v47 = (unint64_t *)&v45;
    uint64_t v8 = sub_537C(a1 + 72, &v45, (uint64_t)&unk_237D1, &v47);
  }

  uint64_t v43 = *(unsigned int *)(v8[3] + 4 * v7);
  (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 6552LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v43,  1LL,  v46);
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 6616LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v43);
  (*(void (**)(void, uint64_t, uint64_t, unint64_t **))(*(void *)(*(void *)(a1 + 24) + 8LL)
                                                                        + 6608LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v43,  35715LL,  &v47);
  if ((_DWORD)v47)
  {

    return v43;
  }

  else
  {
    uint64_t result = dy_abort("unable to validate wireframe pipeline for pipeline: %d", v2);
    __break(1u);
  }

  return result;
}

void sub_317C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_31C4( uint64_t a1, void *a2, GPUTools::GL::WireframeRenderer *a3, unsigned int a4, void **a5, GPUTools::GL *a6, GPUTools::GL::WireframeRenderer *a7, uint64_t a8, float a9)
{
  id v80 = a2;
  objc_storeStrong((id *)(a1 + 8), a2);
  uint64_t v17 = operator new(0x28uLL);
  unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 8) context]);
  sub_4948(v17, v18);
  unint64_t v19 = *(id **)(a1 + 16);
  *(void *)(a1 + 16) = v17;
  if (v19) {
    sub_5680(a1 + 16, v19);
  }

  unint64_t v20 = operator new(0x10uLL);
  uint64_t v21 = *(void *)(a1 + 16);
  id v22 = [*(id *)(a1 + 8) gliDispatch];
  *unint64_t v20 = v21;
  v20[1] = v22;
  int v23 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v20;
  if (v23) {
    operator delete(v23);
  }
  int v24 = (void *)objc_claimAutoreleasedReturnValue([v80 context]);
  uint64_t v25 = (char *)[v24 API];

  BOOL v26 = v25 == (_BYTE *)&dword_0 + 3
     && (*(uint64_t (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1144LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  36201LL) != 0;
  GLuint program = 0;
  (*(void (**)(void, uint64_t, GLuint *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  35725LL,  &program);
  unsigned int v87 = 0;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  33370LL,  &v87);
  if (program)
  {
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v80 context]);
    int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 sharegroup]);

    v89 = v28;
    unint64_t v29 = sub_56B8((void *)(a1 + 232), (unint64_t *)&v89);
    unint64_t v74 = __PAIR64__(a6, v26);
    if (v29)
    {
      v30 = (EAGLContext *)(id)v29[3];
    }

    else
    {
      uint64_t v31 = objc_alloc(&OBJC_CLASS___EAGLContext);
      unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "context", __PAIR64__(a6, v26)));
      v33 = -[EAGLContext initWithAPI:sharegroup:](v31, "initWithAPI:sharegroup:", [v32 API], v28);

      v30 = v33;
      v85 = v28;
      v86 = v30;
      v89 = &v85;
      unsigned int v34 = (id *)sub_576C(a1 + 232, (unint64_t *)&v85, (uint64_t)&unk_237D1, (void **)&v89);
      sub_3D24(v34 + 3, (void **)&v86);
    }

    uint64_t v35 = v30;
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v30, v74);
    glUseProgram(program);
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v80 context]);
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v36);

    uint64_t v37 = sub_2A68(a1);
    if (!(_DWORD)v37)
    {

LABEL_76:
LABEL_77:

      return;
    }

    (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 4800LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v37);
    unint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v80 context]);
    v39 = (char *)[v38 API];

    uint64_t v40 = *(void *)(a1 + 24);
    if (v39 == (_BYTE *)&dword_0 + 3)
    {
      GPUTools::GL::CopyProgramActiveUniforms(v40, 4LL, program, v37, 0LL);
      GPUTools::GL::CopyProgramActiveUniformBlockBindings( *(GPUTools::GL **)(a1 + 24),  (const Dispatcher *)program,  v37,  v41);
    }

    else
    {
      GPUTools::GL::CopyProgramActiveUniforms(v40, 2LL, program, v37, 0LL);
    }

    v30 = v35;
    a6 = (GPUTools::GL *)v76;
  }

  else
  {
    unsigned int v75 = v26;
    v30 = 0LL;
  }

  int v42 = (*(uint64_t (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1144LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2929LL);
  (*(void (**)(void, uint64_t, unsigned __int8 *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 792LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2930LL,  &v84);
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 504LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2929LL);
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 488LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  0LL);
  int v43 = (*(uint64_t (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1144LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2960LL);
  (*(void (**)(void, uint64_t, EAGLContext **))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2968LL,  &v86);
  (*(void (**)(void, uint64_t, void **))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  36005LL,  &v85);
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 504LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2960LL);
  (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 2040LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  0LL);
  (*(void (**)(void, uint64_t, _BYTE *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 792LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  3107LL,  v83);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 392LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  1LL,  1LL,  1LL,  1LL);
  int v77 = (*(uint64_t (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1144LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  3042LL);
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 504LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  3042LL);
  int v44 = (*(uint64_t (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1144LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2884LL);
  (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 504LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2884LL);
  (*(void (**)(void, uint64_t, int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2849LL,  &v82);
  (*(void (**)(void, float))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1240LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  a9);
  if (((_DWORD)a3 - 4) > 2)
  {
    uint64_t v49 = *(void *)(*(void *)(a1 + 24) + 8LL);
    uint64_t v50 = *(void *)(**(void **)(a1 + 24) + 16LL);
    if ((_DWORD)a6)
    {
      if ((int)a8 < 2) {
        (*(void (**)(uint64_t, GPUTools::GL::WireframeRenderer *, void **, GPUTools::GL *, GPUTools::GL::WireframeRenderer *))(v49 + 536))( v50,  a3,  a5,  a6,  a7);
      }
      else {
        (*(void (**)(uint64_t, GPUTools::GL::WireframeRenderer *, void **, GPUTools::GL *, GPUTools::GL::WireframeRenderer *, uint64_t))(v49 + 6104))( v50,  a3,  a5,  a6,  a7,  a8);
      }
    }

    else if ((int)a8 < 2)
    {
      (*(void (**)(uint64_t, GPUTools::GL::WireframeRenderer *, void, void **))(v49 + 520))(v50, a3, a4, a5);
    }

    else
    {
      (*(void (**)(uint64_t, GPUTools::GL::WireframeRenderer *, void, void **, uint64_t))(v49 + 6096))( v50,  a3,  a4,  a5,  a8);
    }

LABEL_65:
    (*(void (**)(void, float))(*(void *)(*(void *)(a1 + 24) + 8LL) + 1240LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  (float)v82);
    if (v44) {
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 576LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2884LL);
    }
    if (v77) {
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 576LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  3042LL);
    }
    (*(void (**)(void, void, void, void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 392LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v83[0],  v83[1],  v83[2],  v83[3]);
    if (v43) {
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 576LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2960LL);
    }
    (*(void (**)(void, uint64_t, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5296LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  1028LL,  v86);
    (*(void (**)(void, uint64_t, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5296LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  1029LL,  v85);
    if (v42) {
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 576LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  2929LL);
    }
    (*(void (**)(void, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 488LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  v84);
    uint64_t v71 = *(void *)(*(void *)(a1 + 24) + 8LL);
    uint64_t v72 = *(void *)(**(void **)(a1 + 24) + 16LL);
    if (program)
    {
      (*(void (**)(uint64_t))(v71 + 4800))(v72);
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v30);
      glUseProgram(0);
      v73 = (void *)objc_claimAutoreleasedReturnValue([v80 context]);
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v73);
    }

    else
    {
      (*(void (**)(uint64_t, void))(v71 + 6576))(v72, v87);
    }

    goto LABEL_76;
  }

  if (!(_DWORD)a6)
  {
    int v81 = 0;
    (*(void (**)(void, uint64_t, int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34965LL,  &v81);
    if (v81) {
      (*(void (**)(void, uint64_t, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5136LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL,  0LL);
    }
    else {
      unsigned int v52 = 5123;
    }
    else {
      int v53 = (GPUTools::GL *)&unk_1401;
    }
    v89 = 0LL;
    if ((_DWORD)a3 == 4)
    {
      unsigned int v54 = GPUTools::GL::dy_type_size(v53, v51);
      uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriList( (GPUTools::GL::WireframeRenderer *)&v89,  (void **)a4,  a5,  v54,  v55);
    }

    else
    {
      unsigned int v63 = GPUTools::GL::dy_type_size(v53, v51);
      if ((_DWORD)a3 == 5) {
        uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip( (GPUTools::GL::WireframeRenderer *)&v89,  (void **)a4,  a5,  v63,  v64);
      }
      else {
        uint64_t LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan( (GPUTools::GL::WireframeRenderer *)&v89,  (void **)a4,  a5,  v63,  v64);
      }
    }

    uint64_t v68 = LineListFromTriList;
    uint64_t v69 = *(void *)(*(void *)(a1 + 24) + 8LL);
    uint64_t v70 = *(void *)(**(void **)(a1 + 24) + 16LL);
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))(v69 + 6104))( v70,  1LL,  v68,  v53,  v89,  a8);
    }
    free(v89);
    if (v81) {
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5136LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL);
    }
    goto LABEL_65;
  }

  int v81 = 0;
  (*(void (**)(void, uint64_t, int *))(*(void *)(*(void *)(a1 + 24) + 8LL) + 832LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34965LL,  &v81);
  int v46 = v43;
  if (!v81)
  {
    uint64_t v48 = a7;
    if (!a7) {
      goto LABEL_57;
    }
LABEL_45:
    int v57 = v48;
    v89 = 0LL;
    if ((_DWORD)a3 == 4)
    {
      unsigned int v58 = GPUTools::GL::dy_type_size(a6, v45);
      uint64_t v60 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(v57, &v89, a5, v58, v75, v59);
    }

    else
    {
      unsigned int v61 = GPUTools::GL::dy_type_size(a6, v45);
      if ((_DWORD)a3 == 5) {
        uint64_t v60 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(v57, &v89, a5, v61, v75, v62);
      }
      else {
        uint64_t v60 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(v57, &v89, a5, v61, v75, v62);
      }
    }

    uint64_t v65 = v60;
    uint64_t v66 = *(void *)(*(void *)(a1 + 24) + 8LL);
    uint64_t v67 = *(void *)(**(void **)(a1 + 24) + 16LL);
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))(v66 + 6104))( v67,  1LL,  v65,  a6,  v89,  a8);
    }
    free(v89);
LABEL_57:
    int v43 = v46;
    if (v81)
    {
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5136LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL);
      (*(void (**)(void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5200LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL);
    }

    goto LABEL_65;
  }

  (*(void (**)(void, uint64_t, uint64_t, void **))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5208LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL,  34660LL,  &v89);
  uint64_t v47 = (*(uint64_t (**)(void, uint64_t, void, void, uint64_t))(*(void *)(*(void *)(a1 + 24) + 8LL)
                                                                            + 6360LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL,  0LL,  (int)v89,  1LL);
  if (v47)
  {
    (*(void (**)(void, uint64_t, void))(*(void *)(*(void *)(a1 + 24) + 8LL) + 5136LL))( *(void *)(**(void **)(a1 + 24) + 16LL),  34963LL,  0LL);
    uint64_t v48 = (GPUTools::GL::WireframeRenderer *)((char *)a7 + v47);
    goto LABEL_45;
  }

  dy_abort("Unable to map element array buffer");
  __break(1u);
}

void sub_3C30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id *sub_3D24(id *location, void **a2)
{
  id v4 = *a2;
  if (*location != v4)
  {
    objc_storeStrong(location, v4);
    uint64_t v5 = *a2;
    *a2 = 0LL;
  }

  return location;
}

void sub_3D6C(uint64_t a1, id **a2, uint64_t a3)
{
  unsigned int v56 = a3;
  uint64_t v6 = (unint64_t *)(*a2)[1];
  ((void (*)(id, uint64_t, uint64_t, int *))a2[1][657])((*a2)[2], a3, 35663LL, &v55);
  if (v55 == 35633)
  {
    ((void (*)(id, uint64_t, uint64_t, int *))a2[1][657])((*a2)[2], a3, 35713LL, &v54);
    if (v54 == 1)
    {
      unsigned int v7 = sub_4258(a2, a3, &v53);
      *(void *)&__int128 v50 = v6;
      uint64_t v8 = sub_56B8((void *)(a1 + 32), (unint64_t *)&v50);
      if (!v8)
      {
        int v9 = sub_29D0((uint64_t)a2, 35632LL, (uint64_t)"void main() { gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0); }", 1);
        int v57 = v6;
        *(void *)&__int128 v50 = &v57;
        id v10 = sub_59F8(a1 + 32, (unint64_t *)&v57, (uint64_t)&unk_237D1, (uint64_t **)&v50);
        unsigned int v11 = v10;
        v12 = (char *)v10[4];
        uint64_t v13 = (uint64_t)(v10 + 5);
        unint64_t v14 = v10[5];
        if ((unint64_t)v12 >= v14)
        {
          int v16 = (char *)v10[3];
          uint64_t v17 = (v12 - v16) >> 2;
          unint64_t v18 = v14 - (void)v16;
          unint64_t v19 = (uint64_t)(v14 - (void)v16) >> 1;
          if (v19 <= v17 + 1) {
            unint64_t v19 = v17 + 1;
          }
          if (v18 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v19;
          }
          if (v20)
          {
            uint64_t v21 = (char *)sub_564C(v13, v20);
            int v16 = (char *)v11[3];
            v12 = (char *)v11[4];
          }

          else
          {
            uint64_t v21 = 0LL;
          }

          id v22 = &v21[4 * v17];
          int v23 = &v21[4 * v20];
          *(_DWORD *)id v22 = v9;
          v15 = v22 + 4;
          while (v12 != v16)
          {
            int v24 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v22 - 1) = v24;
            v22 -= 4;
          }

          v11[3] = v22;
          v11[4] = v15;
          v11[5] = v23;
          if (v16) {
            operator delete(v16);
          }
        }

        else
        {
          *(_DWORD *)v12 = v9;
          v15 = v12 + 4;
        }

        v11[4] = v15;
        if ([**a2 API] == (char *)&dword_0 + 3)
        {
          int v25 = sub_29D0( (uint64_t)a2,  35632LL,  (uint64_t)"#version 300 es\n out lowp vec4 fragColor;\n"
                           "void main() { fragColor = vec4(1.0, 1.0, 1.0, 1.0); }",
                  1);
          int v57 = v6;
          *(void *)&__int128 v50 = &v57;
          BOOL v26 = sub_59F8(a1 + 32, (unint64_t *)&v57, (uint64_t)&unk_237D1, (uint64_t **)&v50);
          int v27 = v26;
          int v28 = (char *)v26[4];
          uint64_t v29 = (uint64_t)(v26 + 5);
          unint64_t v30 = v26[5];
          if ((unint64_t)v28 >= v30)
          {
            unint64_t v32 = (char *)v26[3];
            uint64_t v33 = (v28 - v32) >> 2;
            unint64_t v34 = v30 - (void)v32;
            unint64_t v35 = (uint64_t)(v30 - (void)v32) >> 1;
            if (v35 <= v33 + 1) {
              unint64_t v35 = v33 + 1;
            }
            if (v34 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v36 = v35;
            }
            if (v36)
            {
              uint64_t v37 = (char *)sub_564C(v29, v36);
              unint64_t v32 = (char *)v27[3];
              int v28 = (char *)v27[4];
            }

            else
            {
              uint64_t v37 = 0LL;
            }

            unint64_t v38 = &v37[4 * v33];
            v39 = &v37[4 * v36];
            *(_DWORD *)unint64_t v38 = v25;
            uint64_t v31 = v38 + 4;
            while (v28 != v32)
            {
              int v40 = *((_DWORD *)v28 - 1);
              v28 -= 4;
              *((_DWORD *)v38 - 1) = v40;
              v38 -= 4;
            }

            v27[3] = v38;
            v27[4] = v31;
            v27[5] = v39;
            if (v32) {
              operator delete(v32);
            }
          }

          else
          {
            *(_DWORD *)int v28 = v25;
            uint64_t v31 = v28 + 4;
          }

          v27[4] = v31;
        }

        int v57 = v6;
        *(void *)&__int128 v50 = &v57;
        uint64_t v8 = sub_59F8(a1 + 32, (unint64_t *)&v57, (uint64_t)&unk_237D1, (uint64_t **)&v50);
      }

      unsigned int v41 = *(_DWORD *)(v8[3] + 4LL * v53);
      unsigned int v42 = DYCreatePrivateGLProgram(**a2);
      ((void (*)(id, void, void))a2[1][598])((*a2)[2], v42, v7);
      ((void (*)(id, void, void))a2[1][598])((*a2)[2], v42, v41);
      ((void (*)(id, void))a2[1][591])((*a2)[2], v7);
      int v43 = operator new(0xCuLL);
      unsigned int v44 = v53;
      *int v43 = v42;
      v43[1] = v44;
      v43[2] = 1;
      unsigned int v45 = (void *)(a1 + 152);
      *(void *)&__int128 v50 = v6;
      int v46 = sub_56B8(v45, (unint64_t *)&v50);
      if (v46)
      {
        uint64_t v47 = (uint64_t)(v46 + 3);
        sub_4368((uint64_t)v46, a2, v46 + 3, v56);
        *(void *)&__int128 v50 = &v56;
        sub_5C44(v47, &v56, (uint64_t)&unk_237D1, (_DWORD **)&v50)[3] = v43;
      }

      else
      {
        __int128 v50 = 0u;
        __int128 v51 = 0u;
        int v52 = 1065353216;
        int v57 = (unint64_t *)&v56;
        sub_5C44((uint64_t)&v50, &v56, (uint64_t)&unk_237D1, (_DWORD **)&v57)[3] = v43;
        uint64_t v49 = v6;
        int v57 = (unint64_t *)&v49;
        uint64_t v48 = sub_5E68((uint64_t)v45, (unint64_t *)&v49, (uint64_t)&unk_237D1, &v57);
        if (v48 + 3 != (void *)&v50)
        {
          *((_DWORD *)v48 + 14) = v52;
          sub_60D4(v48 + 3, (uint64_t *)v51, 0LL);
        }

        sub_4AA8((uint64_t)&v50);
      }
    }
  }
}

void sub_41F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_4258(id **a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6 = v13;
  unsigned int v7 = operator new[]((int)v13);
  ((void (*)(id, void, uint64_t, void, void *))a1[1][629])((*a1)[2], a2, v6, 0LL, v7);
  ((void (*)(id, uint64_t, uint64_t, unsigned int *))a1[1][657])((*a1)[2], a2, 35663LL, &v12);
  uint64_t v8 = sub_29D0((uint64_t)a1, v12, (uint64_t)v7, 1);
  uint64_t v9 = v8;
  if (a3)
  {
    int v11 = v8;
    [**a1 getParameter:1710 to:&v11];
    *a3 = v11 == 300;
  }

  operator delete[](v7);
  return v9;
}

void sub_4348(_Unwind_Exception *a1)
{
}

uint64_t *sub_4368(uint64_t a1, void *a2, void *a3, unsigned int a4)
{
  unsigned int v10 = a4;
  uint64_t result = sub_66E4(a3, &v10);
  if (result)
  {
    unsigned int v7 = result;
    uint64_t v8 = (unsigned int *)result[3];
    int v9 = v8[2] - 1;
    v8[2] = v9;
    if (!v9)
    {
      (*(void (**)(void, void))(a2[1] + 4728LL))(*(void *)(*a2 + 16LL), *v8);
      operator delete(v8);
    }

    return (uint64_t *)sub_6798(a3, v7);
  }

  return result;
}

void sub_43EC(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v23 = a3;
  (*(void (**)(void, uint64_t, uint64_t, int *))(a2[1] + 5264LL))(*(void *)(*a2 + 16LL), a3, 35714LL, &v22);
  if (v22)
  {
    unsigned int v21 = sub_46BC(a2, a3, 35633);
    if (v21)
    {
      int v6 = sub_46BC(a2, v23, 35632);
      unsigned int v7 = (unint64_t *)*(id *)(*a2 + 8LL);
      uint64_t v8 = v7;
      if (v6)
      {
        *(void *)&__int128 v18 = v7;
        uint64_t v9 = (uint64_t)sub_56B8((void *)(a1 + 192), (unint64_t *)&v18);
        unsigned int v10 = (void *)v9;
        if (!v9)
        {
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          int v20 = 1065353216;
          uint64_t v17 = v8;
          int v24 = (unint64_t *)&v17;
          int v11 = sub_5E68(a1 + 192, (unint64_t *)&v17, (uint64_t)&unk_237D1, &v24);
          if (v11 + 3 != (void *)&v18)
          {
            *((_DWORD *)v11 + 14) = v20;
            sub_60D4(v11 + 3, (uint64_t *)v19, 0LL);
          }

          uint64_t v17 = v8;
          int v24 = (unint64_t *)&v17;
          unsigned int v10 = sub_5E68(a1 + 192, (unint64_t *)&v17, (uint64_t)&unk_237D1, &v24);
          uint64_t v9 = sub_4AA8((uint64_t)&v18);
        }

        sub_4368(v9, a2, v10 + 3, v23);
        int v24 = v8;
        *(void *)&__int128 v18 = &v24;
        unsigned int v12 = sub_5E68(a1 + 152, (unint64_t *)&v24, (uint64_t)&unk_237D1, (void **)&v18);
        *(void *)&__int128 v18 = &v21;
        uint64_t v13 = sub_5C44((uint64_t)(v12 + 3), &v21, (uint64_t)&unk_237D1, (_DWORD **)&v18)[3];
        ++*(_DWORD *)(v13 + 8);
        *(void *)&__int128 v18 = &v23;
        sub_5C44((uint64_t)(v10 + 3), &v23, (uint64_t)&unk_237D1, (_DWORD **)&v18)[3] = v13;
      }

      else
      {
        int v24 = v7;
        *(void *)&__int128 v18 = &v24;
        unint64_t v14 = sub_5E68(a1 + 152, (unint64_t *)&v24, (uint64_t)&unk_237D1, (void **)&v18);
        *(void *)&__int128 v18 = &v21;
        int v15 = *(_DWORD *)(sub_5C44((uint64_t)(v14 + 3), &v21, (uint64_t)&unk_237D1, (_DWORD **)&v18)[3] + 4LL);
        int v24 = v8;
        *(void *)&__int128 v18 = &v24;
        int v16 = sub_4B64(a1 + 112, (unint64_t *)&v24, (uint64_t)&unk_237D1, (void **)&v18);
        *(void *)&__int128 v18 = &v23;
        *((_DWORD *)sub_5070((uint64_t)(v16 + 3), &v23, (uint64_t)&unk_237D1, (_DWORD **)&v18) + 5) = v15;
      }
    }
  }

void sub_4684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  _Unwind_Resume(a1);
}

uint64_t sub_46BC(void *a1, uint64_t a2, int a3)
{
  int v8 = 2;
  (*(void (**)(void, uint64_t, uint64_t, int *, _DWORD *))(a1[1] + 6072LL))( *(void *)(*a1 + 16LL),  a2,  2LL,  &v8,  v9);
  if (v8 < 1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  while (1)
  {
    (*(void (**)(void, void, uint64_t, int *))(a1[1] + 5256LL))( *(void *)(*a1 + 16LL),  v9[v5],  35663LL,  &v7);
    if (v7 == a3) {
      break;
    }
    if (++v5 >= v8) {
      return 0LL;
    }
  }

  return v9[v5];
}

void sub_47A8(uint64_t a1, id **a2, uint64_t a3, int a4, int a5, const std::string::value_type **a6)
{
  unsigned int v19 = a3;
  if (a4 == 35633)
  {
    LODWORD(v7) = a5;
    ((void (*)(id, uint64_t, uint64_t, int *))a2[1][658])((*a2)[2], a3, 35714LL, &v18);
    if (v18)
    {
      memset(&v17, 0, sizeof(v17));
      if ((int)v7 >= 1)
      {
        uint64_t v7 = v7;
        do
        {
          std::string::append(&v17, *a6++);
          --v7;
        }

        while (v7);
      }

      id v10 = (*a2)[1];
      if ((v17.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int v11 = &v17;
      }
      else {
        int v11 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      unsigned int v12 = sub_29D0((uint64_t)a2, 35633LL, (uint64_t)v11, 0);
      unsigned int v16 = v12;
      [**a2 getParameter:1710 to:&v16];
      ((void (*)(id, void))a2[1][591])((*a2)[2], v12);
      BOOL v13 = v16 == 300;
      id v15 = v10;
      int v20 = (unint64_t *)&v15;
      unint64_t v14 = sub_4B64(a1 + 112, (unint64_t *)&v15, (uint64_t)&unk_237D1, &v20);
      int v20 = (unint64_t *)&v19;
      *((_DWORD *)sub_5070((uint64_t)(v14 + 3), &v19, (uint64_t)&unk_237D1, (_DWORD **)&v20) + 5) = v13;
    }
  }

void sub_4914( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *sub_4948(void *a1, void *a2)
{
  id v3 = a2;
  *a1 = v3;
  a1[1] = 0LL;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 sharegroup]);
  uint64_t v5 = (void *)a1[1];
  a1[1] = v4;

  a1[2] = GLIContextFromEAGLContext(*a1);
  a1[3] = GLCFrontDispatch(*a1);
  a1[4] = GLCBackDispatch(*a1);

  return a1;
}

uint64_t sub_49B8(uint64_t a1)
{
  int v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_49F0(int a1, void *__p)
{
  if (__p)
  {
    int v2 = __p;
    do
    {
      id v3 = (void *)*v2;
      uint64_t v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }

      operator delete(v2);
      int v2 = v3;
    }

    while (v3);
  }

uint64_t sub_4A34(uint64_t a1)
{
  int v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_4A6C(uint64_t a1, void *a2)
{
  if (a2)
  {
    int v2 = a2;
    do
    {
      id v3 = (void *)*v2;
      sub_4AA8((uint64_t)(v2 + 3));
      operator delete(v2);
      int v2 = v3;
    }

    while (v3);
  }

uint64_t sub_4AA8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      int v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

uint64_t sub_4AF0(uint64_t a1)
{
  int v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_4B28(uint64_t a1, id *a2)
{
  if (a2)
  {
    int v2 = a2;
    do
    {
      id v3 = (id *)*v2;

      operator delete(v2);
      int v2 = v3;
    }

    while (v3);
  }

void *sub_4B64(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    id v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      int v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          int v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v13 = a1 + 16;
  unint64_t v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)unint64_t v14 = 0LL;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_4DF8(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  unsigned int v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *unsigned int v21 = v24[0];
  }

  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }

      else
      {
        v22 &= v8 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }

  int v11 = (void *)v24[0];
  v24[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_502C((uint64_t)v24, 0LL);
  return v11;
}

void sub_4DB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_4DD0()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_4DF8(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_4ED4(a1, prime);
  }

void sub_4ED4(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_4DD0();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            void *v7 = *v11;
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    id v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void sub_502C(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_4AA8((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }

void *sub_5070(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    id v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      int v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          int v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  int v11 = operator new(0x18uLL);
  *int v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_4DF8(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  size_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *int v11 = *v20;
LABEL_38:
    *size_t v20 = v11;
    goto LABEL_39;
  }

  *int v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    size_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v11;
}

    DYReserveGLObjects(v6, v9, v7, v8);
    return 0;
  }

  if (v4 > 200)
  {
    switch(v4)
    {
      case 201:
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        unint64_t v7 = *(void *)(v3 + 96);
        unint64_t v8 = **(unsigned int **)(v3 + 72);
        uint8x8_t v9 = 1605LL;
        goto LABEL_39;
      case 203:
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        unint64_t v7 = *(void *)(v3 + 96);
        unint64_t v8 = **(unsigned int **)(v3 + 72);
        uint8x8_t v9 = 1608LL;
        goto LABEL_39;
      case 206:
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        unint64_t v7 = *(void *)(v3 + 96);
        unint64_t v8 = **(unsigned int **)(v3 + 72);
        uint8x8_t v9 = 1606LL;
        goto LABEL_39;
      case 207:
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        unint64_t v7 = *(void *)(v3 + 96);
        unint64_t v8 = **(unsigned int **)(v3 + 72);
        uint8x8_t v9 = 1609LL;
        goto LABEL_39;
      case 208:
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        unint64_t v7 = *(void *)(v3 + 96);
        unint64_t v8 = **(unsigned int **)(v3 + 72);
        uint8x8_t v9 = 1600LL;
        goto LABEL_39;
      default:
        goto LABEL_35;
    }
  }

  if (v4 == 116)
  {
    if ((*(_WORD *)(v3 + 46) & 0x10) == 0)
    {
      DYReserveGLProgram( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx],  **(unsigned int **)(v3 + 24));
      return 0;
    }
  }

  else if (v4 == 117)
  {
    if ((*(_WORD *)(v3 + 46) & 0x10) == 0)
    {
      DYReserveGLShader( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx],  **(unsigned int **)(v3 + 24),  **(unsigned int **)(v3 + 72));
      return 0;
    }
  }

  else if (v4 == 192 {
         && ([*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo] guestAppWasLinkedOnApexOrLater] & 1) == 0)
  }
  {
    id v10 = **(unsigned int **)(v3 + 96);
    if ((v10 & 0xFFFFFFDF) == 0x8D00)
    {
      int v11 = **(unsigned int **)(v3 + 72);
      unint64_t v12 = v3;
      float v13 = **(_DWORD **)(v3 + 144);
      if ((_DWORD)v10 == 36096) {
        float v14 = 36128LL;
      }
      else {
        float v14 = 36096LL;
      }
      LODWORD(v50) = 0;
      BOOL v15 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      unint64_t v16 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int **))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                                 + 5440LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  v11,  v14,  36048LL,  &v50);
      if ((_DWORD)v50 == 36161)
      {
        int v55 = 0;
        (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                                  + 5440LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  v11,  v14,  36049LL,  &v55);
        if (v55 != v13 && v55 != 0)
        {
          int v54 = 0;
          (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                  + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  36007LL,  &v54);
          (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v15] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  36161LL,  v55);
          unsigned int v53 = 0LL;
          (*(void (**)(void, uint64_t, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                   + 5360LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  36161LL,  36162LL,  (char *)&v53 + 4);
          (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                      + 5360LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  36161LL,  36163LL,  &v53);
          (*(void (**)(void, uint64_t, uint64_t, void, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                           + 5352LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  36161LL,  35056LL,  HIDWORD(v53),  v53);
          (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v15]
                                                                            + 5432LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  v11,  v10,  36161LL,  v55);
          (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v15] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v16],  36161LL,  v54);
          return 0;
        }
      }

      id v3 = v12;
    }
  }

  ++*(void *)(a1 + 24);
  return v10;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v11;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v11;
}

  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return v11;
}

void sub_527C(_Unwind_Exception *a1)
{
}

void *sub_5290(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69LL * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1LL);
  }

  unint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0LL;
  }
  uint64_t result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }

      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }

        else
        {
          v10 &= *(void *)&v2 - 1LL;
        }

        if (v10 != v7) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *sub_537C(uint64_t a1, void *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = 0x9DDFEA08EB382D69LL * ((8 * *a2 + 8LL) ^ HIDWORD(*a2));
  unint64_t v8 = 0x9DDFEA08EB382D69LL * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69LL * (v8 ^ (v8 >> 47));
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v4 = 0x9DDFEA08EB382D69LL * (v8 ^ (v8 >> 47));
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
    }

    else
    {
      unint64_t v4 = v9 & (v10 - 1);
    }

    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2) {
            return i;
          }
        }

        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10) {
              v14 %= v10;
            }
          }

          else
          {
            v14 &= v10 - 1;
          }

          if (v14 != v4) {
            break;
          }
        }
      }
    }
  }

  BOOL v15 = (void *)(a1 + 16);
  i = operator new(0x30uLL);
  void *i = 0LL;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0LL;
  i[4] = 0LL;
  i[5] = 0LL;
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1LL;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_4DF8(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v4 = v9 % v10;
      }
      else {
        unint64_t v4 = v9;
      }
    }

    else
    {
      unint64_t v4 = (v10 - 1) & v9;
    }
  }

  uint64_t v22 = *(void *)a1;
  unsigned int v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    void *i = *v23;
LABEL_38:
    *unsigned int v23 = i;
    goto LABEL_39;
  }

  void *i = *v15;
  void *v15 = i;
  *(void *)(v22 + 8 * v4) = v15;
  if (*i)
  {
    unint64_t v24 = *(void *)(*i + 8LL);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10) {
        v24 %= v10;
      }
    }

    else
    {
      v24 &= v10 - 1;
    }

    unsigned int v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_38;
  }

void sub_55E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void sub_5600(uint64_t a1, void *__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    unint64_t v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void *sub_564C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_4DD0();
  }
  return operator new(4 * a2);
}

void sub_5680(uint64_t a1, id *a2)
{
  if (a2)
  {

    operator delete(a2);
  }

void *sub_56B8(void *a1, unint64_t *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (v3 >= *(void *)&v2) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (*(void *)&v2 - 1LL) & v3;
  }

  uint8x8_t v6 = *(void **)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  uint64_t result = (void *)*v6;
  if (*v6)
  {
    do
    {
      unint64_t v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3) {
          return result;
        }
      }

      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(void *)&v2) {
            v8 %= *(void *)&v2;
          }
        }

        else
        {
          v8 &= *(void *)&v2 - 1LL;
        }

        if (v8 != v5) {
          return 0LL;
        }
      }

      uint64_t result = (void *)*result;
    }

    while (result);
  }

  return result;
}

void *sub_576C(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  float v13 = (void *)(a1 + 16);
  i = operator new(0x20uLL);
  void *i = 0LL;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0LL;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1LL;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_4DF8(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v20 = *(void *)a1;
  size_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    *size_t v21 = i;
    goto LABEL_39;
  }

  void *i = *v13;
  void *v13 = i;
  *(void *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }

    else
    {
      v22 &= v8 - 1;
    }

    size_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_5998(_Unwind_Exception *a1)
{
}

void sub_59B4(uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!a2)
  {
    return;
  }

  operator delete(a2);
}

void *sub_59F8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  float v13 = (void *)(a1 + 16);
  i = operator new(0x30uLL);
  void *i = 0LL;
  i[1] = v7;
  uint64_t v14 = **a4;
  i[4] = 0LL;
  i[5] = 0LL;
  i[2] = v14;
  i[3] = 0LL;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_4DF8(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *i = *v22;
LABEL_38:
    *unint64_t v22 = i;
    goto LABEL_39;
  }

  void *i = *v13;
  void *v13 = i;
  *(void *)(v21 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }

    else
    {
      v23 &= v8 - 1;
    }

    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }

void sub_5C28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void *sub_5C44(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          uint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v11 = operator new(0x20uLL);
  *uint64_t v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_4DF8(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  size_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *uint64_t v11 = *v20;
LABEL_38:
    *size_t v20 = v11;
    goto LABEL_39;
  }

  *uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    size_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_5E54(_Unwind_Exception *a1)
{
}

void *sub_5E68(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    unint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      uint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          uint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v13 = a1 + 16;
  float v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)float v14 = 0LL;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_4DF8(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *unint64_t v21 = v24[0];
  }

  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }

      else
      {
        v22 &= v8 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }

  uint64_t v11 = (void *)v24[0];
  v24[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_502C((uint64_t)v24, 0LL);
  return v11;
}

void sub_60BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_60D4(void *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1[1];
  if (!v6) {
    goto LABEL_9;
  }
  for (uint64_t i = 0LL; i != v6; *(void *)(*a1 + 8 * i++) = 0LL)
    ;
  unint64_t v8 = (uint64_t *)a1[2];
  a1[2] = 0LL;
  a1[3] = 0LL;
  if (v8)
  {
    while (a2 != a3)
    {
      unint64_t v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      v8[3] = a2[3];
      unint64_t v10 = (uint64_t *)*v8;
      v8[1] = v9;
      uint64_t v11 = (void *)sub_61E4((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      sub_6338(a1, v8, v11);
      a2 = (uint64_t *)*a2;
      unint64_t v8 = v10;
      if (!v10) {
        goto LABEL_9;
      }
    }

    do
    {
      unint64_t v12 = (uint64_t *)*v8;
      operator delete(v8);
      unint64_t v8 = v12;
    }

    while (v12);
  }

  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_666C(a1, (_OWORD *)a2 + 1);
      a2 = (uint64_t *)*a2;
    }
  }

void sub_61B0(void *a1)
{
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    v1 = v2;
  }

  while (v2);
  __cxa_rethrow();
}

void sub_61D0(_Unwind_Exception *a1)
{
}

uint64_t sub_61E4(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_6420(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }

  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }

  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }

  uint64_t v16 = *(void *)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0LL;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = *(void *)v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = *(void *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = *(void *)(v16 + 8);
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }

    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }

    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && *(_DWORD *)(v16 + 16) == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }

  while (v22 != 1);
  return result;
}

void *sub_6338(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }

  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

    if (v6 != v4) {
      goto LABEL_18;
    }
  }

LABEL_19:
  ++result[3];
  return result;
}

void sub_6420(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_64FC(a1, prime);
  }

void sub_64FC(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_4DD0();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = (unint64_t)v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      for (uint64_t i = *v7; *v7; uint64_t i = *v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }

        else
        {
          v12 &= a2 - 1;
        }

        if (v12 == v8)
        {
          uint64_t v7 = (uint64_t **)i;
        }

        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (uint64_t *)*v13;
            }

            while (v13 && *((_DWORD *)i + 4) == *((_DWORD *)v13 + 4));
            void *v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }

          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = (uint64_t **)i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }

  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

unsigned int *sub_666C(void *a1, _OWORD *a2)
{
  int8x8_t v4 = (unsigned int *)operator new(0x20uLL);
  *((_OWORD *)v4 + 1) = *a2;
  unint64_t v5 = v4[4];
  *(void *)int8x8_t v4 = 0LL;
  *((void *)v4 + 1) = v5;
  uint64_t v6 = (void *)sub_61E4((uint64_t)a1, v5, v4 + 4);
  sub_6338(a1, v4, v6);
  return v4;
}

void sub_66D0(_Unwind_Exception *a1)
{
}

uint64_t *sub_66E4(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }

  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }

  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0LL;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3) {
        return result;
      }
    }

    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }

      else
      {
        v8 &= *(void *)&v2 - 1LL;
      }

      if (v8 != v5) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t sub_6798(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_67D8(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0LL;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *sub_67D8@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }

  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }

  else
  {
    v8 &= *(void *)&v3 - 1LL;
  }

  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }

    else
    {
      v9 &= *(void *)&v3 - 1LL;
    }

    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0LL;
  }

  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }

    else
    {
      v11 &= *(void *)&v3 - 1LL;
    }

    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }

  void *v7 = v10;
  *a2 = 0LL;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_6988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6D88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_6E48( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_6EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7328( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_7358(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_7368(uint64_t a1)
{
}

id sub_7370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _onResourceUpdated:a4 target:a3 dispatcher:a2];
}

void sub_73D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_7484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7698(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_58:
        -[DYEAGLDebugFunctionPlayer _switchToOriginalFramebuffer](self, "_switchToOriginalFramebuffer");
        goto LABEL_59;
      }

      uint64_t v29 = 0LL;
      unint64_t v30 = (unsigned int **)(v27 + 144);
      unint64_t v32 = **(unsigned int **)(v27 + 168);
      unint64_t v34 = *(uint64_t **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 48];
    }

    uint64_t v33 = *v34;
LABEL_47:
    uint64_t v37 = 1LL;
    goto LABEL_48;
  }

  uint64_t v16 = (v15 - 823) > 0x1F || ((1 << (v15 - 55)) & 0xF0784003) == 0;
  if (!v16 || v15 == 384 || v15 == 382) {
    goto LABEL_22;
  }
LABEL_39:
  if (v15 == 93 && !v3)
  {
    unint64_t v35 = *(unsigned int **)(v14 + 72);
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
    sub_4948(v52, v36);

    __int128 v50 = v52;
    __int128 v51 = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
    sub_3D6C((uint64_t)&self->_shaderWireframeRenderer, &v50, *v35);
LABEL_72:

    return;
  }

  if (v15 == 349 && !v3)
  {
    int v43 = *(unsigned int **)(v14 + 72);
    unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
    sub_4948(v52, v44);

    __int128 v50 = v52;
    __int128 v51 = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
    sub_43EC((uint64_t)&self->_shaderWireframeRenderer, &v50, *v43);
    goto LABEL_72;
  }

  if (v15 == 888 && !v3)
  {
    unsigned int v45 = *(int **)(v14 + 72);
    int v46 = *(int **)(v14 + 96);
    uint64_t v47 = *(unsigned int **)(v14 + 24);
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
    sub_4948(v52, v48);

    __int128 v50 = v52;
    __int128 v51 = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
    sub_47A8( (uint64_t)&self->_shaderWireframeRenderer,  &v50,  *v47,  *v45,  *v46,  *(const std::string::value_type ***)(v14 + 120));
    goto LABEL_72;
  }

  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
  -[DYEAGLDebugFunctionPlayer performPostGraphicsFunctionDispatchActions:]( &v49,  "performPostGraphicsFunctionDispatchActions:",  v3);
}

void sub_7C64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
}

void sub_7FE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8D2C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_8E48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___DYGLFunctionPlayer__disp)
                                           + 832LL))(*(void *)(*(void *)(a1 + 32)
                                                               + OBJC_IVAR___DYGLFunctionPlayer__gli_ctx));
}

void sub_98D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9B84( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_9EC4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, void *a25, void *a26)
{
}

void sub_9FF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_A2CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  _Block_object_dispose((const void *)(v19 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_A320(uint64_t a1, uint64_t a2)
{
  id result = [*(id *)(a1 + 32) _isBoundObjectAlive:v4[1] isObjectFunc:*(void *)(*(void *)(*(void *)(a1 + 32) + OBJC_IVAR___DYGLFunctionPlayer__disp) + 1160)];
  return result;
}

void sub_A480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_A58C(uint64_t a1, int a2, char a3)
{
  *(void *)(a1 + 8) = objc_claimAutoreleasedReturnValue( +[CATransaction animationTimingFunction]( &OBJC_CLASS___CATransaction,  "animationTimingFunction"));
  +[CATransaction animationDuration](&OBJC_CLASS___CATransaction, "animationDuration");
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = 0LL;
  *(_BYTE *)(a1 + 32) = +[CATransaction disableActions](&OBJC_CLASS___CATransaction, "disableActions");
  *(_BYTE *)(a1 + 33) = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATransaction completionBlock](&OBJC_CLASS___CATransaction, "completionBlock"));
  id v8 = [v7 copy];
  unint64_t v9 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v8;

  if (a2) {
    +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", 1LL);
  }
  return a1;
}

void sub_A624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_A654(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 33)) {
    +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
  }
  id v2 = *(id *)(a1 + 8);
  +[CATransaction setAnimationTimingFunction:](&OBJC_CLASS___CATransaction, "setAnimationTimingFunction:", v2);

  +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:", *(double *)(a1 + 16));
  +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", *(void *)(a1 + 24));
  +[CATransaction setDisableActions:](&OBJC_CLASS___CATransaction, "setDisableActions:", *(unsigned __int8 *)(a1 + 32));

  return a1;
}

void sub_A6E8(GPUTools::Playback::GL::ContextInfo *a1)
{
  *(void *)a1 = off_24788;
  uint64_t v2 = (uint64_t)a1 + 120;
  sub_4A34((uint64_t)a1 + 200);
  sub_4AA8((uint64_t)a1 + 160);
  sub_4AA8(v2);
  GPUTools::Playback::GL::ContextInfo::~ContextInfo(a1);
}

void sub_A734(GPUTools::Playback::GL::ContextInfo *a1)
{
}

void sub_A898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_AA2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_81:
          dy_abort("unsupported or unknown surface color format: 0x%04X", v20);
          __break(1u);
          return;
        }

        int v27 = (id *)&kEAGLColorFormatSRGBA8;
      }

LABEL_69:
      unsigned int v44 = *v27;
      uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19 != 0));
      unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v65,  kEAGLDrawablePropertyRetainedBacking,  v44,  kEAGLDrawablePropertyColorFormat,  0LL));

      uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      uint64_t v67 = objc_claimAutoreleasedReturnValue([v66 layerForID:v18]);

      if (v67)
      {
        uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        objc_msgSend( v68,  "updateLayer:contentRect:contentsScale:properties:",  v67,  v58,  v23.n64_f64[0],  v24.n64_f64[0],  v25.n64_f64[0],  v26.n64_f64[0],  v21);

        unsigned int v61 = (void *)v67;
      }

      else
      {
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        unsigned int v61 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v69,  "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:",  v18,  v58,  0,  v23.n64_f64[0],  v24.n64_f64[0],  v25.n64_f64[0],  v26.n64_f64[0],  v21));

        if (!v61) {
          __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224DD, 0, "layer");
        }
      }

      uint64_t v70 = sub_56B8((void *)(v8 + 200), &v76);
      if (!v70)
      {
        memset(v74, 0, sizeof(v74));
        unsigned int v75 = 1065353216;
        v78 = &v76;
        uint64_t v71 = sub_D4C0(v8 + 200, &v76, (uint64_t)&unk_237D1, &v78);
        sub_D72C((uint64_t)(v71 + 3), (uint64_t *)v74);
        sub_4AA8((uint64_t)v74);
        *(void *)&v74[0] = &v76;
        uint64_t v70 = sub_D4C0(v8 + 200, &v76, (uint64_t)&unk_237D1, (void **)v74);
      }

      sub_D830((uint64_t)(v70 + 3), &v77, &v77);
LABEL_75:

LABEL_76:
      return;
  }

void sub_B5F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14, uint64_t a15, uint64_t a16, char a17)
{
}

__n64 sub_B748(uint64_t a1, unint64_t a2)
{
  __int16 v2 = *(_WORD *)(a1 + 22);
  if ((v2 & 1) != 0)
  {
    result.n64_f64[0] = 0.0;
  }

  else
  {
    result.n64_f64[0] = 0.0;
    if (a2) {
      return result;
    }
  }

  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      int v4 = *(char *)(*(void *)a1 + a2);
      goto LABEL_12;
    case 2:
      result.n64_u8[0] = *(_BYTE *)(*(void *)a1 + a2);
      goto LABEL_18;
    case 3:
      int v4 = *(__int16 *)(*(void *)a1 + 2 * a2);
LABEL_12:
      result.n64_f64[0] = (double)v4;
      return result;
    case 4:
      result.n64_u16[0] = *(_WORD *)(*(void *)a1 + 2 * a2);
      goto LABEL_18;
    case 5:
      result.n64_f64[0] = (double)*(int *)(*(void *)a1 + 4 * a2);
      if (*(_DWORD *)(a1 + 12) == 19) {
        result.n64_f64[0] = result.n64_f64[0] * 0.0000152587891;
      }
      return result;
    case 6:
      result.n64_u32[0] = *(_DWORD *)(*(void *)a1 + 4 * a2);
      goto LABEL_18;
    case 7:
    case 0xB:
      result.n64_f64[0] = (double)*(uint64_t *)(*(void *)a1 + 8 * a2);
      return result;
    case 8:
    case 0xC:
      result.n64_u64[0] = *(unint64_t *)(*(void *)a1 + 8 * a2);
LABEL_18:
      result.n64_f64[0] = (double)result.n64_u64[0];
      break;
    case 9:
      result.n64_f64[0] = *(float *)(*(void *)a1 + 4 * a2);
      break;
    case 0xA:
      result.n64_u64[0] = *(unint64_t *)(*(void *)a1 + 8 * a2);
      break;
    case 0xD:
      if ((v2 & 0x10) != 0) {
        result.n64_f64[0] = (double)GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)a1);
      }
      break;
    default:
      return result;
  }

  return result;
}

LABEL_35:
  if (!*(_BYTE *)(v5 + 240))
  {
    v52.receiver = self;
    v52.super_class = (Class)&OBJC_CLASS___DYEAGLFunctionPlayer;
    return -[DYEAGLFunctionPlayer shouldExecuteGraphicsFunction](&v52, "shouldExecuteGraphicsFunction");
  }

  if (v4 <= 126)
  {
    if (v4 == 17)
    {
      unsigned int v44 = **(_DWORD **)(v3 + 96);
      if (v44)
      {
        unsigned int v45 = **(_DWORD **)(v3 + 72);
        if (v45 == 36160 || v45 == 36009) {
          *(_DWORD *)(v5 + 112) = v44;
        }
      }
    }

    else if (v4 == 121)
    {
      unint64_t v23 = v3;
      unint64_t v24 = **(unsigned int **)(v3 + 72);
      if ((_DWORD)v24)
      {
        char v25 = *(unsigned int **)(v23 + 96);
        do
        {
          if (*v25 == *(_DWORD *)(v5 + 112)) {
            *(_DWORD *)(v5 + 112) = 0;
          }
          BOOL v26 = sub_66E4((void *)(v5 + 120), v25);
          if (v26) {
            sub_6798((void *)(v5 + 120), v26);
          }
          ++v25;
          --v24;
        }

        while (v24);
      }
    }
  }

  else
  {
    switch(v4)
    {
      case 825:
        if (**(_DWORD **)(v3 + 96) == 35449)
        {
          int v27 = **(_DWORD **)(v3 + 120);
          framebuffer_binding_enum = GPUTools::GL::dy_get_framebuffer_binding_enum( (GPUTools::GL *)**(unsigned int **)(v3 + 72),  a2);
          (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  framebuffer_binding_enum,  &v55);
          __int128 v50 = &v55;
          uint64_t v29 = sub_DB40(v5 + 120, &v55, (uint64_t)&unk_237D1, &v50);
          *((_DWORD *)v29 + 6) = v27;
          if (*((_DWORD *)v29 + 5))
          {
            unint64_t v30 = v29;
            uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( -[DYEAGLFunctionPlayer currentRenderbufferDrawableMap]( self,  "currentRenderbufferDrawableMap"));
            unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *((unsigned int *)v30 + 5)));
            uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:v32]);

            unint64_t v34 = [v33 unsignedLongLongValue];
            unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
            unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 layerForID:v34]);

            -[DYEAGLFunctionPlayer _transformCoreAnimationLayer:rotated:]( self,  "_transformCoreAnimationLayer:rotated:",  v36,  v27 == 35453);
          }
        }

        break;
      case 194:
        uint64_t v37 = (GPUTools::GL *)**(unsigned int **)(v3 + 72);
        unint64_t v38 = **(unsigned int **)(v3 + 120);
        int v55 = **(_DWORD **)(v3 + 144);
        if (sub_66E4((void *)(v5 + 160), &v55))
        {
          int v40 = GPUTools::GL::dy_get_framebuffer_binding_enum(v37, v39);
          int v54 = 0;
          unsigned int v41 = OBJC_IVAR___DYGLFunctionPlayer__disp;
          unsigned int v42 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
          (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  v40,  &v54);
          if (v54)
          {
            __int128 v50 = &v54;
            int v43 = sub_DB40(v5 + 120, &v54, (uint64_t)&unk_237D1, &v50);
            if (!*((_DWORD *)v43 + 5)) {
              -[DYEAGLFunctionPlayer _createIOSurfaceReplacementForFramebuffer:]( self,  "_createIOSurfaceReplacementForFramebuffer:",  (char *)v43 + 20);
            }
            HIDWORD(v53) = 0;
            (*(void (**)(void, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[v41] + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v42],  36007LL,  (char *)&v53 + 4);
            (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v41] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v42],  36161LL,  *((unsigned int *)v43 + 5));
            __int128 v50 = 0LL;
            __int128 v51 = 0LL;
            (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->DYGLFunctionPlayer_opaque[v41]
                                                                        + 5360LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v42],  36161LL,  36162LL,  &v51);
            (*(void (**)(void, uint64_t, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[v41]
                                                                     + 5360LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v42],  36161LL,  36163LL,  (char *)&v51 + 4);
            (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v41] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v42],  36161LL,  HIDWORD(v53));
            (*(void (**)(void))(*(void *)&self->DYGLFunctionPlayer_opaque[v41] + 720LL))(*(void *)&self->DYGLFunctionPlayer_opaque[v42]);
            LODWORD(v48) = 0;
            BYTE5(v47) = *((_DWORD *)v43 + 6) == 35453;
            BYTE4(v47) = 0;
            LODWORD(v47) = -1;
            -[DYEAGLFunctionPlayer drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:]( self,  "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:",  v55,  v38,  v54,  v50,  v51,  0LL,  v47,  v48);
            return 0;
          }
        }

        break;
      case 127:
        uint64_t v19 = v3;
        unint64_t v20 = **(unsigned int **)(v3 + 72);
        if ((_DWORD)v20)
        {
          BOOL v21 = *(unsigned int **)(v19 + 96);
          do
          {
            int v22 = sub_66E4((void *)(v5 + 160), v21);
            if (v22) {
              sub_6798((void *)(v5 + 160), v22);
            }
            ++v21;
            --v20;
          }

          while (v20);
        }

        break;
    }
  }

  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___DYEAGLFunctionPlayer;
  return -[DYEAGLFunctionPlayer shouldExecuteGraphicsFunction](&v49, "shouldExecuteGraphicsFunction");
}

void sub_C060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C51C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18)
{
}

void sub_CFB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, void *a27)
{
  _Unwind_Resume(a1);
}

void sub_D1E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_D2A4(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }

    unint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6) {
              return v10;
            }
          }

          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }

            else
            {
              v11 &= v7 - 1;
            }

            if (v11 != v3) {
              break;
            }
          }

          uint64_t v10 = (void *)*v10;
        }

        while (v10);
      }
    }
  }

  uint64_t v10 = operator new(0x18uLL);
  *uint64_t v10 = 0LL;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_4DF8(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = ((_DWORD)v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *uint64_t v10 = *v19;
LABEL_38:
    *uint64_t v19 = v10;
    goto LABEL_39;
  }

  *uint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_D4AC(_Unwind_Exception *a1)
{
}

void *sub_D4C0(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v13 = a1 + 16;
  BOOL v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)BOOL v14 = 0LL;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_4DF8(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  BOOL v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *BOOL v21 = v24[0];
  }

  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }

      else
      {
        v22 &= v8 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }

  unint64_t v11 = (void *)v24[0];
  v24[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_502C((uint64_t)v24, 0LL);
  return v11;
}

void sub_D714(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_D72C(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0LL;
  uint8x8_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  unint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0LL;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }

    else
    {
      v11 &= v12 - 1;
    }

    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    void *v7 = 0LL;
    v7[1] = 0LL;
  }

void *sub_D7CC(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    __n64 result = (void *)result[2];
    if (result)
    {
      do
      {
        __int16 v2 = (void *)*result;
        operator delete(result);
        __n64 result = v2;
      }

      while (v2);
    }

    v1[2] = 0LL;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0LL;
    }

    v1[3] = 0LL;
  }

  return result;
}

void *sub_D830(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x18uLL);
  void *i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_4DF8(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *unint64_t v19 = i;
    goto LABEL_39;
  }

  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_DA34(_Unwind_Exception *a1)
{
}

unint64_t sub_DA48(uint64_t a1, unint64_t a2)
{
  __int16 v2 = *(_WORD *)(a1 + 22);
  if ((v2 & 1) != 0)
  {
    return 0LL;
  }

  if (a2) {
    return 0LL;
  }
LABEL_5:
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      return *(char *)(*(void *)a1 + a2);
    case 2:
      return *(unsigned __int8 *)(*(void *)a1 + a2);
    case 3:
      return *(__int16 *)(*(void *)a1 + 2 * a2);
    case 4:
      return *(unsigned __int16 *)(*(void *)a1 + 2 * a2);
    case 5:
      int v4 = *(_DWORD *)(a1 + 12);
      unint64_t result = *(int *)(*(void *)a1 + 4 * a2);
      if (v4 != 19) {
        return result;
      }
      double v5 = (double)(int)result * 0.0000152587891;
LABEL_10:
      unint64_t result = (unint64_t)v5;
      break;
    case 6:
      return *(unsigned int *)(*(void *)a1 + 4 * a2);
    case 7:
    case 8:
    case 0xB:
    case 0xC:
      return *(void *)(*(void *)a1 + 8 * a2);
    case 9:
      return (unint64_t)*(float *)(*(void *)a1 + 4 * a2);
    case 0xA:
      double v5 = *(double *)(*(void *)a1 + 8 * a2);
      goto LABEL_10;
    case 0xD:
      if ((v2 & 0x10) == 0) {
        return 0LL;
      }
      return GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)a1);
    default:
      return 0LL;
  }

  return result;
}

void *sub_DB40(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  unint64_t v11 = operator new(0x20uLL);
  *unint64_t v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *(void *)((char *)v11 + 20) = 0x8A7A00000000LL;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_4DF8(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  unint64_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *unint64_t v20 = v11;
    goto LABEL_39;
  }

  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    unint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_DD58(_Unwind_Exception *a1)
{
}

void *sub_DD6C(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }

    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }

        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }

          else
          {
            v11 &= v7 - 1;
          }

          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x18uLL);
  void *i = 0LL;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1LL;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_4DF8(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }

    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }

  uint64_t v18 = *(void *)a1;
  uint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *i = *v19;
LABEL_38:
    *uint64_t v19 = i;
    goto LABEL_39;
  }

  void *i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v20 = *(void *)(*i + 8LL);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }

    else
    {
      v20 &= v7 - 1;
    }

    uint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }

void sub_DF70(_Unwind_Exception *a1)
{
}

uint64_t *sub_DF84(void *a1, unint64_t *a2)
{
  unint64_t result = sub_56B8(a1, a2);
  if (result)
  {
    sub_6798(a1, result);
    return (void *)(&dword_0 + 1);
  }

  return result;
}

void sub_E020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

LABEL_8:
    uint8x8_t v9 = 0LL;
  }

LABEL_11:
  return v9;
}

void sub_E370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E3AC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_120F4((void **)a1, v4);
  }

  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 40 * a2;
  }

void sub_E488( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)&OBJC_CLASS___DYGLShaderProfilerFunctionPlayerSupport;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_E698( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_E724(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) strongPlaybackEngine]);
  [v2 setDelegate:0];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _queryShaderResult]);
  objc_msgSend(*(id *)(a1 + 40), "setResult:");
}

void sub_E788( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_E820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EBD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

LABEL_13:
  float v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  if (![v13 mainExecutionMode] || self->_queryShaderState != 3)
  {

    goto LABEL_21;
  }

  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v15 = [v14 currentExecutionModeFunctionIndex];
  unint64_t v16 = -[NSArray count](self->_functionFlag, "count");

  if (v16 <= v15) {
    goto LABEL_21;
  }
  functionFlag = self->_functionFlag;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( functionFlag,  "objectAtIndexedSubscript:",  [v18 currentExecutionModeFunctionIndex]));
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"flag"]);
  unint64_t v21 = [v20 unsignedIntValue];

  if ((v21 & 1) == 0)
  {
    if ((v21 & 4) == 0) {
      goto LABEL_18;
    }
LABEL_41:
    -[DYGLShaderProfilerFunctionPlayerSupport _replaceColorAttachment](self, "_replaceColorAttachment");
    if ((v21 & 2) == 0) {
      goto LABEL_21;
    }
    goto LABEL_42;
  }

  uint64_t v65 = v4 + 2;
  -[DYGLShaderProfilerFunctionPlayerSupport _saveColorAttachmentFramebuffer:]( self,  "_saveColorAttachmentFramebuffer:",  *((unsigned int *)sub_122C0((uint64_t)&self->_lastUpdatedFramebuffer, v4 + 2, (uint64_t)&unk_237D1, &v65) + 6));
  if ((v21 & 4) != 0) {
    goto LABEL_41;
  }
LABEL_18:
  if ((v21 & 2) == 0) {
    goto LABEL_21;
  }
LABEL_42:
  ((void (*)(id, uint64_t))v6[10])(v8, 0x4000LL);
LABEL_21:
  unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  unint64_t v23 = [v22 isFunctionEnabled];

  if ((v23 & 1) == 0) {
    return 0;
  }
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  char v25 = [v24 mainExecutionMode];

  if ((v25 & 1) == 0) {
    goto LABEL_38;
  }
  BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
  int v27 = [v26 currentExecutionModeFunctionIndex];
  int v28 = -[NSArray count](self->_functionFlag, "count");

  if (v28 <= v27)
  {
LABEL_29:
    unint64_t v32 = *(_DWORD *)v4;
    if (*(int *)v4 <= 822)
    {
    }

    else
    {
      uint64_t v33 = v32 - 823;
      if (v33 > 0x16 || ((1 << v33) & 0x780003) == 0) {
        goto LABEL_38;
      }
    }

    unint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer](self, "strongFunctionPlayer"));
    unint64_t v35 = [v34 currentExecutionModeFunctionIndex];
    unint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[DYGLShaderProfilerFunctionPlayerSupport strongPlaybackEngine](self, "strongPlaybackEngine"));
    uint64_t v37 = [v36 targetFunctionIndex];

    if (v35 < v37) {
      goto LABEL_38;
    }
    return 0;
  }

  unint64_t result = 1;
  switch(self->_queryShaderState)
  {
    case 2:
      if (((*(_DWORD *)v4 - 139) > 7 || ((1 << (*(_BYTE *)v4 + 117)) & 0x91) == 0)
        && (*(_DWORD *)v4 - 823) >= 2)
      {
        return result;
      }

      uint64_t v31 = (void *)objc_opt_new(&OBJC_CLASS___DrawCallInfo, v29);
      -[NSMutableArray addObject:](self->_drawCallInfo, "addObject:", v31);
      self->_drawCallIndex = -[NSMutableArray count](self->_drawCallInfo, "count");

      return 1;
    case 3:
      unint64_t result = 0;
      unint64_t v38 = *(_DWORD *)v4;
      if (*(int *)v4 <= 133)
      {
        unsigned int v41 = (v38 - 24);
        if (((1LL << v41) & 0x4000000000401FLL) != 0) {
          return result;
        }
        if (v41 != 12) {
          goto LABEL_38;
        }
        unsigned int v42 = *(_DWORD *)v4[9];
        if (v42 != 0x4000) {
          ((void (*)(id, void))v6[10])(v8, v42 & 0xFFFFBFFF);
        }
        return 0;
      }

      if (v38 <= 836)
      {
        if ((v38 - 134) <= 0x11)
        {
          v39 = 1 << (v38 + 122);
          if ((v39 & 0x1220) != 0)
          {
LABEL_74:
            unsigned int v45 = self->_functionFlag;
            int v46 = (void *)objc_claimAutoreleasedReturnValue( -[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer]( self,  "strongFunctionPlayer"));
            uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( v45,  "objectAtIndexedSubscript:",  [v46 currentExecutionModeFunctionIndex]));
            uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:@"flag"]);
            uint64_t v49 = [v48 unsignedIntValue];

            unsigned int v64 = v4[2];
            if ((v49 & 0x30) != 0)
            {
              if (!sub_56B8(&self->_drawCallIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v64))
              {
                uint64_t v65 = &v64;
                __int128 v50 = sub_124E0((uint64_t)&self->_drawCallIndexMap, &v64, (uint64_t)&unk_237D1, (uint64_t **)&v65);
                int v52 = v50 + 3;
                __int128 v51 = (void *)v50[3];
                if (v51)
                {
                  v50[4] = v51;
                  operator delete(v51);
                  *int v52 = 0LL;
                  v52[1] = 0LL;
                  v52[2] = 0LL;
                }

                *int v52 = 0LL;
                v52[1] = 0LL;
                v52[2] = 0LL;
              }

              uint64_t v65 = &v64;
              unsigned int v53 = (void **)sub_124E0((uint64_t)&self->_drawCallIndexMap, &v64, (uint64_t)&unk_237D1, (uint64_t **)&v65);
              int v54 = (void *)objc_claimAutoreleasedReturnValue( -[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer]( self,  "strongFunctionPlayer"));
              LODWORD(v65) = [v54 currentExecutionModeFunctionIndex];
              sub_F600(v53 + 3, &v65, &self->_drawCallIndex);
            }

            ++self->_drawCallIndex;
            if ((v49 & 0x10) != 0)
            {
              ((void (*)(id, uint64_t, void, uint64_t, void))v6[336])(v8, 32769LL, 0LL, 32771LL, 0LL);
              ((void (*)(id, float, float, float, float))v6[337])( v8,  (float)self->_drawCallIndex / 255.0,  (float)BYTE1(self->_drawCallIndex) / 255.0,  (float)BYTE2(self->_drawCallIndex) / 255.0,  (float)HIBYTE(self->_drawCallIndex) / 255.0);
            }

            else if ((v49 & 0x20) != 0)
            {
              int v55 = self->_functionFlag;
              unsigned int v56 = (void *)objc_claimAutoreleasedReturnValue( -[DYGLShaderProfilerFunctionPlayerSupport strongFunctionPlayer]( self,  "strongFunctionPlayer"));
              int v57 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( v55,  "objectAtIndexedSubscript:",  [v56 currentExecutionModeFunctionIndex]));
              unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue([v57 objectForKeyedSubscript:@"parameters"]);

              ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v6[336])(v8, 32769LL, 1LL, 32771LL, 1LL);
              BOOL v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"blending draw call scale"]);

              if (v59)
              {
                uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"blending draw call scale"]);
                unsigned int v61 = [v60 unsignedIntValue];

                ((void (*)(id, float, float, float, float))v6[337])( v8,  0.0039216,  1.0 / (float)((float)(1 << v61) * 255.0),  1.0 / (float)((float)(1 << (2 * v61)) * 255.0),  1.0 / (float)((float)(1 << (3 * v61)) * 255.0));
              }

              else
              {
                BOOL v62 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"blending draw call bit start"]);
                unsigned int v63 = [v62 unsignedIntValue];

                ((void (*)(id, float, float, float, float))v6[337])( v8,  (float)(1 << v63) / 255.0,  (float)((unsigned __int16)(1 << v63) >> 8) / 255.0,  (float)((1 << v63) >> 16) / 255.0,  (float)((1 << v63) >> 24) / 255.0);
              }
            }

            else
            {
              ((void (*)(id, void, void, void, void))v6[336])(v8, 0LL, 0LL, 0LL, 0LL);
            }

            return 1;
          }

          if ((v39 & 0x20001) != 0)
          {
            unint64_t result = 0;
            int v40 = *(_DWORD *)v4[9];
            if (v40 == 3024 || v40 == 3042) {
              return result;
            }
            goto LABEL_38;
          }
        }

        goto LABEL_74;
      }

      if ((v38 - 851) < 4)
      {
        int v43 = *(_DWORD *)v4[9];
        return v43 == 34041 || (v43 - 6145) < 2;
      }

      if (v38 == 837) {
        return result;
      }
LABEL_38:
      -[DYGLShaderProfilerFunctionPlayerSupport setShouldReturn:](self, "setShouldReturn:", 0LL);
      return 1;
    case 5:
      if (((*(_DWORD *)v4 - 139) > 7 || ((1 << (*(_BYTE *)v4 + 117)) & 0x91) == 0)
        && (*(_DWORD *)v4 - 823) >= 2)
      {
        return result;
      }

      if (!self->_uscSampling_Enabled)
      {
        -[DYGLShaderProfilerFunctionPlayerSupport _startUSCSampling](self, "_startUSCSampling");
        return 1;
      }

      if (self->_shouldStopUSCSampling && !self->_uscSamplingEnded)
      {
        -[DYGLShaderProfilerFunctionPlayerSupport _endUSCSampling](self, "_endUSCSampling");
        return 1;
      }

      return result;
    case 6:
      return result;
    default:
      goto LABEL_29;
  }

void sub_F550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

_DWORD *sub_F600(void **a1, _DWORD *a2, _DWORD *a3)
{
  unint64_t v8 = (unint64_t)a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  uint8x8_t v9 = *(_DWORD **)(v6 - 8);
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = ((char *)v9 - (_BYTE *)*a1) >> 3;
    unint64_t v12 = v11 + 1;
    uint64_t v13 = v7 - (void)*a1;
    if (v13 >> 2 > v12) {
      unint64_t v12 = v13 >> 2;
    }
    else {
      unint64_t v14 = v12;
    }
    unint64_t v15 = (char *)sub_1272C(v6, v14);
    unint64_t v16 = &v15[8 * v11];
    uint64_t v18 = &v15[8 * v17];
    *(_DWORD *)unint64_t v16 = *a2;
    *((_DWORD *)v16 + 1) = *a3;
    uint64_t v10 = v16 + 8;
    unint64_t v20 = (char *)*a1;
    uint64_t v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        uint64_t v21 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v16 - 1) = v21;
        v16 -= 8;
      }

      while (v19 != v20);
      uint64_t v19 = (char *)*a1;
    }

    *a1 = v16;
    a1[1] = v10;
    a1[2] = v18;
    if (v19) {
      operator delete(v19);
    }
  }

  else
  {
    *uint8x8_t v9 = *a2;
    v9[1] = *a3;
    uint64_t v10 = v9 + 2;
  }

  a1[1] = v10;
  return v10 - 2;
}

void sub_F8A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_FBE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FF58(_Unwind_Exception *a1)
{
}

uint64_t *sub_FF98(uint64_t *result)
{
  if (*((_DWORD *)result + 6))
  {
    unint64_t v1 = 0LL;
    uint64_t v2 = *result;
    uint64_t v3 = result[25];
    uint64_t v4 = result[4];
    uint64_t v5 = result[7];
    do
    {
      uint64_t v6 = 0LL;
      *(void *)(v2 + 8 * sub_59B4(v2, v1) = 0LL;
      *(_DWORD *)(v3 + 4 * sub_59B4(v2, v1) = 0;
      *(void *)(v4 + 8 * sub_59B4(v2, v1) = 0LL;
      *(void *)(v5 + 8 * sub_59B4(v2, v1) = 0LL;
      do
      {
        *(void *)(result[v6 + 10] + 8 * sub_59B4(v2, v1) = 0LL;
        v6 += 3LL;
      }

      while (v6 != 15);
      ++v1;
      unint64_t v7 = *((unsigned int *)result + 6);
    }

    while (v1 < v7);
    int v8 = v7 - 1;
  }

  else
  {
    int v8 = -1;
  }

  *((_DWORD *)result + 56) = 0;
  *((_DWORD *)result + 57) = v8;
  return result;
}

void sub_10114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_102B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1053C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10550(uint64_t a1, void *a2)
{
  int v3 = *(_DWORD *)(a1 + 224);
  unsigned int v4 = *(_DWORD *)(a1 + 24);
  uint64_t v5 = (*(_DWORD *)(a1 + 228) + 1) % v4;
  if (v4 >= v3 + 1) {
    int v6 = v3 + 1;
  }
  else {
    int v6 = *(_DWORD *)(a1 + 24);
  }
  *(_DWORD *)(a1 + 224) = v6;
  *(_DWORD *)(a1 + 228) = v5;
  unint64_t v7 = *(uint64_t **)a1;
  *(void *)(*(void *)a1 + 8LL * v5) = *a2;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 128);
  uint64_t v13 = *(void *)(a1 + 152);
  uint64_t v14 = *(void *)(a1 + 176);
  if (v6 == 1)
  {
    uint64_t v15 = *v7;
    *(void *)(v14 + 8 * v5) = v15;
    *(void *)(v13 + 8 * v5) = v15;
    *(void *)(v12 + 8 * v5) = v15;
    *(void *)(v11 + 8 * v5) = v15;
    *(void *)(v10 + 8 * v5) = v15;
    **(_DWORD **)(a1 + 200) = 0;
    *(void *)(v9 + 8 * v5) = v15;
    *(void *)(v8 + 8 * v5) = v15;
  }

  else
  {
    *(void *)(v8 + 8 * v5) = 0LL;
    unint64_t v16 = *(_DWORD **)(a1 + 200);
    if (v6)
    {
      size_t v17 = 0LL;
      uint64_t v18 = 0LL;
      do
      {
        v16[v17] = v17;
        v18 += v7[v17];
        *(void *)(v8 + 8 * v5) = v18;
        ++v17;
        size_t v19 = *(unsigned int *)(a1 + 224);
      }

      while (v17 < v19);
    }

    else
    {
      size_t v19 = 0LL;
    }

    __compar[0] = _NSConcreteStackBlock;
    __compar[1] = 3221225472LL;
    __compar[2] = sub_12CC4;
    __compar[3] = &unk_247C0;
    __compar[4] = a1;
    qsort_b(v16, v19, 4uLL, __compar);
    uint64_t v20 = *(void *)(v8 + 8 * v5);
    unint64_t v21 = *(unsigned int *)(a1 + 224);
    unint64_t v22 = v21 >> 1;
    if (v20) {
      unint64_t v23 = v20 + (v21 >> 1);
    }
    else {
      unint64_t v23 = -(uint64_t)v22;
    }
    *(void *)(v8 + 8 * v5) = v23 / v21;
    unint64_t v24 = *(unsigned int **)(a1 + 200);
    char v25 = *(uint64_t **)a1;
    *(void *)(v10 + 8 * v5) = *(void *)(*(void *)a1 + 8LL * *v24);
    *(void *)(v14 + 8 * v5) = v25[v24[(v21 - 1)]];
    if ((v21 & 1) != 0) {
      unint64_t v26 = v25[v24[v22]];
    }
    else {
      unint64_t v26 = (unint64_t)(v25[v24[v22]] + v25[v24[(v22 - 1)]]) >> 1;
    }
    *(void *)(v12 + 8 * v5) = v26;
    unint64_t v27 = v21 >> 2;
    unsigned int v28 = ~(v21 >> 2);
    unsigned int v29 = v21 + v28;
    uint64_t v30 = v24[v21 >> 2];
    uint64_t v31 = v25[v30];
    if ((v21 & 3) != 0)
    {
      *(void *)(v11 + 8 * v5) = v31;
      uint64_t v32 = v24[v29];
      unint64_t v33 = v25[v32];
    }

    else
    {
      *(void *)(v11 + 8 * v5) = (unint64_t)(v25[v24[(v27 - 1)]] + v31) >> 1;
      uint64_t v32 = v24[v29];
      unint64_t v33 = (unint64_t)(v25[v24[(v21 - v27)]] + v25[v32]) >> 1;
    }

    *(void *)(v13 + 8 * v5) = v33;
    uint64_t v34 = (v21 & 0xFFFFFFFC) - (v21 & 0x3FFFFFFF) + 4;
    unint64_t v35 = (v25[v32] + v25[v30]) * v34;
    *(void *)(v9 + 8 * v5) = v35;
    if ((int)v27 + 1 < v29)
    {
      unint64_t v36 = &v24[v27 + 1];
      int v37 = 2 * v27 - v21 + 2;
      do
      {
        int v38 = *v36++;
        v35 += 4 * v25[v38];
        *(void *)(v9 + 8 * v5) = v35;
      }

      while (!__CFADD__(v37++, 1));
    }

    *(void *)(v9 + 8 * v5) = v35 / (4 * (v29 + v28) + 2 * (_DWORD)v34);
  }

unint64_t sub_107D4(uint64_t a1, unsigned int a2, double *a3, double *a4)
{
  LODWORD(v4) = *(_DWORD *)(a1 + 224);
  if (!(_DWORD)v4) {
    return v4 & 1;
  }
  if ((_DWORD)v4 == 1)
  {
    uint64_t v5 = (*(_DWORD *)(a1 + 24) + *(_DWORD *)(a1 + 228)) % *(_DWORD *)(a1 + 24);
    unint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8LL * v5);
    if (v4)
    {
      double v6 = (double)(unint64_t)(*(void *)(*(void *)(a1 + 152) + 8 * v5)
                                    - *(void *)(*(void *)(a1 + 104) + 8 * v5))
         / (double)v4;
      *a4 = v6;
      *a3 = v6;
      LOBYTE(v4) = 1;
    }

    return v4 & 1;
  }

  if ((_DWORD)v4)
  {
    unsigned int v7 = *(_DWORD *)(a1 + 228);
    uint64_t v8 = *(void *)(a1 + 56);
    char v9 = 1;
    unsigned int v10 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      unint64_t v11 = *(void *)(v8 + 8LL * v7);
      if (v11)
      {
        double v12 = (double)(unint64_t)(*(void *)(*(void *)(a1 + 152) + 8LL * v7)
                                       - *(void *)(*(void *)(a1 + 104) + 8LL * v7))
            / (double)v11;
        if ((v9 & 1) != 0)
        {
          *a4 = v12;
          uint64_t v13 = a3;
        }

        else
        {
          uint64_t v13 = a3;
          if (v12 >= *a3)
          {
            uint64_t v13 = a4;
            if (v12 <= *a4)
            {
              char v9 = 0;
              goto LABEL_15;
            }
          }
        }

        char v9 = 0;
        double *v13 = v12;
      }

LABEL_15:
      unsigned int v7 = (v7 + v10 - 1) % v10;
      LODWORD(v4) = v4 - 1;
      if (!(_DWORD)v4) {
        goto LABEL_19;
      }
    }
  }

  char v9 = 1;
LABEL_19:
  LOBYTE(v4) = v9 ^ 1;
  return v4 & 1;
}

void sub_10DB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24, void *a25)
{
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_11350( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_116E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_119E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, void *a28, void *a29)
{
  _Unwind_Resume(a1);
}

void sub_11C40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_11DA4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

LABEL_23:
        double v12 = (uint64_t **)*v12;
        if (!v12) {
          goto LABEL_24;
        }
      }

      uint64_t v15 = 36064LL;
      while (1)
      {
        unint64_t v16 = v13[2];
        if (v16 != 5890)
        {
          if (v16 == 36161) {
            ((void (*)(id, uint64_t, uint64_t, uint64_t, void))v6[679])(v8, 36009LL, v15, 36161LL, v13[1]);
          }
          else {
            ((void (*)(id, uint64_t, uint64_t, uint64_t, void))v6[679])(v8, 36009LL, v15, 36161LL, 0LL);
          }
          goto LABEL_20;
        }

        size_t v17 = v13[3];
        if (v17 == 35866 || v17 == 32879)
        {
          size_t v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v6[691];
          uint64_t v20 = v13[1];
          unint64_t v21 = v13[5];
          unint64_t v22 = v13[6];
        }

        else
        {
          size_t v19 = (void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v6[677];
          unint64_t v21 = v13[1];
          uint64_t v20 = v13[4];
          unint64_t v22 = v13[5];
          if (!(_DWORD)v20)
          {
            unint64_t v23 = v8;
            unint64_t v24 = v15;
            uint64_t v20 = 3553LL;
            goto LABEL_19;
          }
        }

        unint64_t v23 = v8;
        unint64_t v24 = v15;
LABEL_19:
        v19(v23, 36009LL, v24, v20, v21, v22);
LABEL_20:
        v13 += 8;
        uint64_t v15 = (v15 + 1);
        if (v13 == v14) {
          goto LABEL_23;
        }
      }
    }

LABEL_24:
    v6[672](v8, 36009LL, (_DWORD *)v27);
    sub_67D8(v26, v25, (uint64_t)v28);
    sub_12F8C((uint64_t)v28, 0LL);
  }

void sub_11FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_120F4(void **a1, unint64_t a2)
{
  double v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  unsigned int v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 40 * ((40 * a2 - 40) / 0x28) + 40;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (_BYTE *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x666666666666666LL) {
      sub_2860();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x333333333333333LL) {
      unint64_t v11 = 0x666666666666666LL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      double v12 = (char *)sub_1227C(v4, v11);
    }
    else {
      double v12 = 0LL;
    }
    uint64_t v14 = &v12[40 * v8];
    uint64_t v15 = &v12[40 * v11];
    size_t v16 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v14, v16);
    size_t v17 = &v14[v16];
    size_t v19 = (char *)*a1;
    uint64_t v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        __int128 v20 = *(_OWORD *)(v18 - 40);
        __int128 v21 = *(_OWORD *)(v18 - 24);
        *((void *)v14 - 1) = *((void *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v21;
        *(_OWORD *)(v14 - 40) = v20;
        v14 -= 40;
        v18 -= 40;
      }

      while (v18 != v19);
      uint64_t v18 = (char *)*a1;
    }

    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18) {
      operator delete(v18);
    }
  }

void *sub_1227C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    sub_4DD0();
  }
  return operator new(40 * a2);
}

void *sub_122C0(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  unint64_t v11 = operator new(0x20uLL);
  *unint64_t v11 = 0LL;
  v11[1] = v7;
  v11[2] = **a4;
  *((_DWORD *)v11 + 6) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1LL;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    sub_4DF8(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v19 = *(void *)a1;
  __int128 v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *unint64_t v11 = *v20;
LABEL_38:
    *__int128 v20 = v11;
    goto LABEL_39;
  }

  *unint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }

    else
    {
      v21 &= v8 - 1;
    }

    __int128 v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }

void sub_124CC(_Unwind_Exception *a1)
{
}

void *sub_124E0(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  float v13 = (void *)(a1 + 16);
  uint64_t i = operator new(0x30uLL);
  void *i = 0LL;
  i[1] = v7;
  uint64_t v14 = **a4;
  i[4] = 0LL;
  i[5] = 0LL;
  i[2] = v14;
  i[3] = 0LL;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_4DF8(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v4);
  if (v22)
  {
    void *i = *v22;
LABEL_38:
    *unint64_t v22 = i;
    goto LABEL_39;
  }

  void *i = *v13;
  void *v13 = i;
  *(void *)(v21 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v23 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8) {
        v23 %= v8;
      }
    }

    else
    {
      v23 &= v8 - 1;
    }

    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }

void sub_12710( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

void *sub_1272C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_4DD0();
  }
  return operator new(8 * a2);
}

void sub_12760(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_127B4(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

void sub_127B4(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      int v3 = (void *)*v2;
      sub_49B8((uint64_t)(v2 + 3));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

void sub_127F0(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    sub_49F0(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0LL;
    }

    *(void *)(a1 + 24) = 0LL;
  }

uint64_t sub_12844(uint64_t a1, unsigned int a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v3 = a1 + 32;
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = a1 + 200;
  *(void *)(a1 + 16) = 0LL;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 24) = a2;
  unint64_t v6 = a2;
  uint64_t v12 = 0LL;
  sub_129B8(a1, a2, &v12);
  unint64_t v7 = *(unsigned int *)(a1 + 24);
  LODWORD(v12) = 0;
  sub_129E8(v5, v7, &v12);
  unint64_t v8 = *(unsigned int *)(a1 + 24);
  uint64_t v12 = 0LL;
  sub_129B8(v3, v8, &v12);
  unint64_t v9 = *(unsigned int *)(a1 + 24);
  uint64_t v12 = 0LL;
  sub_129B8(v4, v9, &v12);
  for (uint64_t i = 80LL; i != 200; i += 24LL)
  {
    uint64_t v12 = 0LL;
    sub_129B8(a1 + i, v6, &v12);
  }

  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 24) - 1;
  return a1;
}

void sub_12938(_Unwind_Exception *exception_object)
{
  unint64_t v6 = *v4;
  if (*v4)
  {
    *(void *)(v1 + 208) = v6;
    operator delete(v6);
  }

  uint64_t v7 = 0LL;
  while (1)
  {
    unint64_t v8 = *(void **)(v1 + v7 + 176);
    if (v8)
    {
      *(void *)(v1 + v7 + 184) = v8;
      operator delete(v8);
    }

    v7 -= 24LL;
    if (v7 == -120)
    {
      unint64_t v9 = *v3;
      if (*v3)
      {
        *(void *)(v1 + 64) = v9;
        operator delete(v9);
      }

      unint64_t v10 = *v2;
      if (*v2)
      {
        *(void *)(v1 + 40) = v10;
        operator delete(v10);
      }

      uint64_t v11 = *(void **)v1;
      if (*(void *)v1)
      {
        *(void *)(v1 + 8) = v11;
        operator delete(v11);
      }

      _Unwind_Resume(exception_object);
    }
  }

void sub_129B8(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    sub_12A18((void **)a1, a2 - v3, a3);
  }

void sub_129E8(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }

  else
  {
    sub_12B28((void **)a1, a2 - v3, a3);
  }

void sub_12A18(void **a1, unint64_t a2, void *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(void **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      BOOL v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8LL;
      }

      while (v16);
      unint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      sub_2860();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      float v15 = (char *)sub_1272C(v6, v14);
    }
    else {
      float v15 = 0LL;
    }
    unint64_t v18 = &v15[8 * v12];
    unint64_t v19 = &v18[8 * a2];
    uint64_t v20 = 8 * a2;
    uint64_t v21 = v18;
    do
    {
      *(void *)uint64_t v21 = *a3;
      v21 += 8;
      v20 -= 8LL;
    }

    while (v20);
    unint64_t v22 = &v15[8 * v14];
    unint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 8)
    {
      uint64_t v25 = *((void *)i - 1);
      *((void *)v18 - 1) = v25;
      v18 -= 8;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void sub_12B28(void **a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      BOOL v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4LL;
      }

      while (v16);
      unint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_2860();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      float v15 = (char *)sub_564C(v6, v14);
    }
    else {
      float v15 = 0LL;
    }
    unint64_t v18 = &v15[4 * v12];
    unint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    uint64_t v21 = v18;
    do
    {
      *(_DWORD *)uint64_t v21 = *a3;
      v21 += 4;
      v20 -= 4LL;
    }

    while (v20);
    unint64_t v22 = &v15[4 * v14];
    unint64_t v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void sub_12C38(int a1, void **__p)
{
  if (__p)
  {
    unint64_t v3 = __p[25];
    if (v3)
    {
      __p[26] = v3;
      operator delete(v3);
    }

    for (uint64_t i = 0LL; i != -15; i -= 3LL)
    {
      uint64_t v5 = __p[i + 22];
      if (v5)
      {
        __p[i + 23] = v5;
        operator delete(v5);
      }
    }

    uint64_t v6 = __p[7];
    if (v6)
    {
      __p[8] = v6;
      operator delete(v6);
    }

    uint64_t v7 = __p[4];
    if (v7)
    {
      __p[5] = v7;
      operator delete(v7);
    }

    unint64_t v8 = *__p;
    if (*__p)
    {
      __p[1] = v8;
      operator delete(v8);
    }

    operator delete(__p);
  }

uint64_t sub_12CC4(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3 = **(void **)(a1 + 32);
  unint64_t v4 = *(void *)(v3 + 8LL * *a2);
  unint64_t v5 = *(void *)(v3 + 8LL * *a3);
  BOOL v6 = v4 >= v5;
  BOOL v7 = v4 > v5;
  if (v6) {
    return v7;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

void *sub_12CEC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_4DD0();
  }
  return operator new(32 * a2);
}

void *sub_12D20(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    uint64_t v10 = *(void **)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = (void *)*v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v13 = a1 + 16;
  unint64_t v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(void *)unint64_t v14 = 0LL;
  *((void *)v14 + 1) = v7;
  *((void *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  char v25 = 1;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    BOOL v17 = 1LL;
    if (v8 >= 3) {
      BOOL v17 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v8);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_4DF8(a1, v20);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *(void *)v24[0] = *v21;
    *uint64_t v21 = v24[0];
  }

  else
  {
    *(void *)v24[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v24[0];
    *(void *)(*(void *)a1 + 8 * v4) = v13;
    if (*(void *)v24[0])
    {
      unint64_t v22 = *(void *)(*(void *)v24[0] + 8LL);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8) {
          v22 %= v8;
        }
      }

      else
      {
        v22 &= v8 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v22) = v24[0];
    }
  }

  unint64_t v11 = (void *)v24[0];
  v24[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_12F8C((uint64_t)v24, 0LL);
  return v11;
}

void sub_12F74(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_12F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_49B8((uint64_t)v2 + 24);
    }
    operator delete(v2);
  }

void sub_12FD0(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *a2 = 0LL;
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  unint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0LL;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }

    else
    {
      v11 &= v12 - 1;
    }

    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    void *v7 = 0LL;
    v7[1] = 0LL;
  }

void *sub_13070(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      unint64_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7) {
              return v11;
            }
          }

          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }

            else
            {
              v12 &= v8 - 1;
            }

            if (v12 != v4) {
              break;
            }
          }

          unint64_t v11 = (void *)*v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v13 = (void *)(a1 + 16);
  unint64_t v11 = operator new(0x30uLL);
  *unint64_t v11 = 0LL;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0LL;
  v11[5] = 0LL;
  v11[3] = 0LL;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1LL;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    sub_4DF8(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = ((_DWORD)v8 - 1) & v7;
    }
  }

  uint64_t v20 = *(void *)a1;
  uint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *unint64_t v11 = *v21;
LABEL_38:
    *uint64_t v21 = v11;
    goto LABEL_39;
  }

  *unint64_t v11 = *v13;
  void *v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }

    else
    {
      v22 &= v8 - 1;
    }

    uint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_132A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

uint64_t *sub_132C4(void *a1, unint64_t *a2)
{
  unint64_t result = sub_56B8(a1, a2);
  if (result)
  {
    sub_132F8(a1, result);
    return (void *)(&dword_0 + 1);
  }

  return result;
}

uint64_t sub_132F8(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_67D8(a1, a2, (uint64_t)&__p);
  uint64_t v3 = __p;
  __p = 0LL;
  if (v3) {
    sub_5600((uint64_t)&v6, v3);
  }
  return v2;
}

uint64_t sub_13340(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_13430(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_134D0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1353C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_13614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_136C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13728(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_137B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13878(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13928( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_13940(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) eaglPlayer]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 contextForContextIdentifier:a2]);

  return v4;
}

void sub_13984(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_createLayerWithID_contentRect_contentsScale_properties_isCoreAnimationSurface_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:");
}

id objc_msgSend_drawTexture_target_framebuffer_bounds_clearBits_modulateColor_enableBlend_rotated_texBlitProgram_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:");
}

id objc_msgSend_wireframeLineWidth(void *a1, const char *a2, ...)
{
  return [a1 wireframeLineWidth];
}