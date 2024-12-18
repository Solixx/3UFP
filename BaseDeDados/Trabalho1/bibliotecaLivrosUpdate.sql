PGDMP  .                 	    {           bibliotecaLivros    16.0    16.0 d    L           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            M           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            N           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            O           1262    16501    bibliotecaLivros    DATABASE     �   CREATE DATABASE "bibliotecaLivros" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Portugal.1252';
 "   DROP DATABASE "bibliotecaLivros";
                postgres    false            �            1259    17101    Compra    TABLE     �   CREATE TABLE public."Compra" (
    "compraID" integer NOT NULL,
    "utilizadorID" integer,
    "planoID" integer,
    preco double precision,
    cartao integer,
    "dataCompra" date
);
    DROP TABLE public."Compra";
       public         heap    postgres    false            �            1259    17100    Compra_compraID_seq    SEQUENCE     �   ALTER TABLE public."Compra" ALTER COLUMN "compraID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Compra_compraID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �            1259    17094    Planos    TABLE     q   CREATE TABLE public."Planos" (
    "planosID" integer NOT NULL,
    preco double precision DEFAULT 0 NOT NULL
);
    DROP TABLE public."Planos";
       public         heap    postgres    false            �            1259    17093    Planos_planosID_seq    SEQUENCE     �   ALTER TABLE public."Planos" ALTER COLUMN "planosID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Planos_planosID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    16991 
   atividades    TABLE     `   CREATE TABLE public.atividades (
    "atividadesID" integer NOT NULL,
    tipo text NOT NULL
);
    DROP TABLE public.atividades;
       public         heap    postgres    false            �            1259    16990    atividades_atividadesID_seq    SEQUENCE     �   ALTER TABLE public.atividades ALTER COLUMN "atividadesID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."atividades_atividadesID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    16999    autor    TABLE     �   CREATE TABLE public.autor (
    "autorID" integer NOT NULL,
    nome text NOT NULL,
    nacionalidade text NOT NULL,
    descricao text NOT NULL,
    fotografia text,
    morada text NOT NULL
);
    DROP TABLE public.autor;
       public         heap    postgres    false            �            1259    17007 
   autorLivro    TABLE     x   CREATE TABLE public."autorLivro" (
    "autorLivroID" integer NOT NULL,
    "autorID" integer,
    "livroID" integer
);
     DROP TABLE public."autorLivro";
       public         heap    postgres    false            �            1259    17006    autorLivro_autorLivroID_seq    SEQUENCE     �   ALTER TABLE public."autorLivro" ALTER COLUMN "autorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autorLivro_autorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    16998    autor_autorID_seq    SEQUENCE     �   ALTER TABLE public.autor ALTER COLUMN "autorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."autor_autorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    17013 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    "categoriaID" integer NOT NULL,
    nome text NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    17012    categoria_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.categoria ALTER COLUMN "categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."categoria_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    17021 
   comentario    TABLE     �   CREATE TABLE public.comentario (
    "comentarioID" integer NOT NULL,
    "utilizadorID" integer,
    "livroID" integer,
    comentaio_data date NOT NULL,
    texto text NOT NULL
);
    DROP TABLE public.comentario;
       public         heap    postgres    false            �            1259    17020    comentario_comentarioID_seq    SEQUENCE     �   ALTER TABLE public.comentario ALTER COLUMN "comentarioID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."comentario_comentarioID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    17029    livro    TABLE     s  CREATE TABLE public.livro (
    "livroID" integer NOT NULL,
    autor integer,
    categoria integer,
    atividades integer,
    titulo text NOT NULL,
    "imgCapa" text NOT NULL,
    descricao text NOT NULL,
    "faixaEtaria" integer NOT NULL,
    paginas integer NOT NULL,
    audio boolean NOT NULL,
    video boolean NOT NULL,
    tipo integer DEFAULT 1 NOT NULL
);
    DROP TABLE public.livro;
       public         heap    postgres    false            �            1259    17076    livro_atividade    TABLE     �   CREATE TABLE public.livro_atividade (
    "livro_atividadeID" integer NOT NULL,
    "livroID" integer,
    "atividadeID" integer
);
 #   DROP TABLE public.livro_atividade;
       public         heap    postgres    false            �            1259    17075 %   livro_atividade_livro_atividadeID_seq    SEQUENCE     �   ALTER TABLE public.livro_atividade ALTER COLUMN "livro_atividadeID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_atividade_livro_atividadeID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    17070    livro_categoria    TABLE     �   CREATE TABLE public.livro_categoria (
    "livro_categoriaID" integer NOT NULL,
    "livroID" integer,
    "categoriaID" integer
);
 #   DROP TABLE public.livro_categoria;
       public         heap    postgres    false            �            1259    17069 %   livro_categoria_livro_categoriaID_seq    SEQUENCE     �   ALTER TABLE public.livro_categoria ALTER COLUMN "livro_categoriaID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_categoria_livro_categoriaID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    17028    livro_livroID_seq    SEQUENCE     �   ALTER TABLE public.livro ALTER COLUMN "livroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."livro_livroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    17038    log    TABLE     �   CREATE TABLE public.log (
    "logID" integer NOT NULL,
    "utilizadorID" integer,
    "livroID" integer,
    log_data date,
    lido boolean,
    favorito boolean,
    percentagem integer,
    comentario_data date,
    comentario_texto text
);
    DROP TABLE public.log;
       public         heap    postgres    false            �            1259    17037    log_logID_seq    SEQUENCE     �   ALTER TABLE public.log ALTER COLUMN "logID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."log_logID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    17046    rating    TABLE     �   CREATE TABLE public.rating (
    "ratingID" integer NOT NULL,
    "livroID" integer,
    "utilizadorID" integer,
    valor integer NOT NULL
);
    DROP TABLE public.rating;
       public         heap    postgres    false            �            1259    17045    rating_ratingID_seq    SEQUENCE     �   ALTER TABLE public.rating ALTER COLUMN "ratingID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."rating_ratingID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    17052 
   utilizador    TABLE     �   CREATE TABLE public.utilizador (
    "utilizadorID" integer NOT NULL,
    nome text NOT NULL,
    "ADM" boolean DEFAULT false NOT NULL,
    "nivelPlano" integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.utilizador;
       public         heap    postgres    false            �            1259    17062    utilizadorLivro    TABLE     �   CREATE TABLE public."utilizadorLivro" (
    "utilizadorLivroID" integer NOT NULL,
    utilizador integer,
    livro integer,
    lido boolean NOT NULL,
    favorito boolean DEFAULT false NOT NULL,
    percentagem integer DEFAULT 0 NOT NULL
);
 %   DROP TABLE public."utilizadorLivro";
       public         heap    postgres    false            �            1259    17061 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE     �   ALTER TABLE public."utilizadorLivro" ALTER COLUMN "utilizadorLivroID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizadorLivro_utilizadorLivroID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    17051    utilizador_utilizadorID_seq    SEQUENCE     �   ALTER TABLE public.utilizador ALTER COLUMN "utilizadorID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_utilizadorID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    17088    utilizador_voucher    TABLE     �   CREATE TABLE public.utilizador_voucher (
    "utilizador_voucherID" integer NOT NULL,
    "utilizadorID" integer,
    "voucherID" integer
);
 &   DROP TABLE public.utilizador_voucher;
       public         heap    postgres    false            �            1259    17087 +   utilizador_voucher_utilizador_voucherID_seq    SEQUENCE       ALTER TABLE public.utilizador_voucher ALTER COLUMN "utilizador_voucherID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."utilizador_voucher_utilizador_voucherID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    17082    voucher    TABLE     X   CREATE TABLE public.voucher (
    "voucherID" integer NOT NULL,
    desconto integer
);
    DROP TABLE public.voucher;
       public         heap    postgres    false            �            1259    17081    voucher_voucherID_seq    SEQUENCE     �   ALTER TABLE public.voucher ALTER COLUMN "voucherID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."voucher_voucherID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            I          0    17101    Compra 
   TABLE DATA           f   COPY public."Compra" ("compraID", "utilizadorID", "planoID", preco, cartao, "dataCompra") FROM stdin;
    public          postgres    false    246   �y       G          0    17094    Planos 
   TABLE DATA           5   COPY public."Planos" ("planosID", preco) FROM stdin;
    public          postgres    false    244    z       +          0    16991 
   atividades 
   TABLE DATA           :   COPY public.atividades ("atividadesID", tipo) FROM stdin;
    public          postgres    false    216   z       -          0    16999    autor 
   TABLE DATA           ^   COPY public.autor ("autorID", nome, nacionalidade, descricao, fotografia, morada) FROM stdin;
    public          postgres    false    218   :z       /          0    17007 
   autorLivro 
   TABLE DATA           L   COPY public."autorLivro" ("autorLivroID", "autorID", "livroID") FROM stdin;
    public          postgres    false    220   Wz       1          0    17013 	   categoria 
   TABLE DATA           8   COPY public.categoria ("categoriaID", nome) FROM stdin;
    public          postgres    false    222   tz       3          0    17021 
   comentario 
   TABLE DATA           f   COPY public.comentario ("comentarioID", "utilizadorID", "livroID", comentaio_data, texto) FROM stdin;
    public          postgres    false    224   �z       5          0    17029    livro 
   TABLE DATA           �   COPY public.livro ("livroID", autor, categoria, atividades, titulo, "imgCapa", descricao, "faixaEtaria", paginas, audio, video, tipo) FROM stdin;
    public          postgres    false    226   �z       A          0    17076    livro_atividade 
   TABLE DATA           X   COPY public.livro_atividade ("livro_atividadeID", "livroID", "atividadeID") FROM stdin;
    public          postgres    false    238   �z       ?          0    17070    livro_categoria 
   TABLE DATA           X   COPY public.livro_categoria ("livro_categoriaID", "livroID", "categoriaID") FROM stdin;
    public          postgres    false    236   �z       7          0    17038    log 
   TABLE DATA           �   COPY public.log ("logID", "utilizadorID", "livroID", log_data, lido, favorito, percentagem, comentario_data, comentario_texto) FROM stdin;
    public          postgres    false    228   {       9          0    17046    rating 
   TABLE DATA           N   COPY public.rating ("ratingID", "livroID", "utilizadorID", valor) FROM stdin;
    public          postgres    false    230   "{       ;          0    17052 
   utilizador 
   TABLE DATA           O   COPY public.utilizador ("utilizadorID", nome, "ADM", "nivelPlano") FROM stdin;
    public          postgres    false    232   ?{       =          0    17062    utilizadorLivro 
   TABLE DATA           p   COPY public."utilizadorLivro" ("utilizadorLivroID", utilizador, livro, lido, favorito, percentagem) FROM stdin;
    public          postgres    false    234   \{       E          0    17088    utilizador_voucher 
   TABLE DATA           a   COPY public.utilizador_voucher ("utilizador_voucherID", "utilizadorID", "voucherID") FROM stdin;
    public          postgres    false    242   y{       C          0    17082    voucher 
   TABLE DATA           8   COPY public.voucher ("voucherID", desconto) FROM stdin;
    public          postgres    false    240   �{       P           0    0    Compra_compraID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Compra_compraID_seq"', 1, false);
          public          postgres    false    245            Q           0    0    Planos_planosID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Planos_planosID_seq"', 1, false);
          public          postgres    false    243            R           0    0    atividades_atividadesID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."atividades_atividadesID_seq"', 1, false);
          public          postgres    false    215            S           0    0    autorLivro_autorLivroID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."autorLivro_autorLivroID_seq"', 1, false);
          public          postgres    false    219            T           0    0    autor_autorID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."autor_autorID_seq"', 1, false);
          public          postgres    false    217            U           0    0    categoria_categoriaID_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public."categoria_categoriaID_seq"', 1, false);
          public          postgres    false    221            V           0    0    comentario_comentarioID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."comentario_comentarioID_seq"', 1, false);
          public          postgres    false    223            W           0    0 %   livro_atividade_livro_atividadeID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."livro_atividade_livro_atividadeID_seq"', 1, false);
          public          postgres    false    237            X           0    0 %   livro_categoria_livro_categoriaID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."livro_categoria_livro_categoriaID_seq"', 1, false);
          public          postgres    false    235            Y           0    0    livro_livroID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."livro_livroID_seq"', 1, false);
          public          postgres    false    225            Z           0    0    log_logID_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."log_logID_seq"', 1, false);
          public          postgres    false    227            [           0    0    rating_ratingID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."rating_ratingID_seq"', 1, false);
          public          postgres    false    229            \           0    0 %   utilizadorLivro_utilizadorLivroID_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public."utilizadorLivro_utilizadorLivroID_seq"', 1, false);
          public          postgres    false    233            ]           0    0    utilizador_utilizadorID_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public."utilizador_utilizadorID_seq"', 1, false);
          public          postgres    false    231            ^           0    0 +   utilizador_voucher_utilizador_voucherID_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public."utilizador_voucher_utilizador_voucherID_seq"', 1, false);
          public          postgres    false    241            _           0    0    voucher_voucherID_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."voucher_voucherID_seq"', 1, false);
          public          postgres    false    239            �           2606    17105    Compra Compra_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT "Compra_pkey" PRIMARY KEY ("compraID");
 @   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT "Compra_pkey";
       public            postgres    false    246            �           2606    17099    Planos Planos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Planos"
    ADD CONSTRAINT "Planos_pkey" PRIMARY KEY ("planosID");
 @   ALTER TABLE ONLY public."Planos" DROP CONSTRAINT "Planos_pkey";
       public            postgres    false    244            l           2606    16997    atividades atividades_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.atividades
    ADD CONSTRAINT atividades_pkey PRIMARY KEY ("atividadesID");
 D   ALTER TABLE ONLY public.atividades DROP CONSTRAINT atividades_pkey;
       public            postgres    false    216            p           2606    17011    autorLivro autorLivro_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "autorLivro_pkey" PRIMARY KEY ("autorLivroID");
 H   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "autorLivro_pkey";
       public            postgres    false    220            n           2606    17005    autor autor_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY ("autorID");
 :   ALTER TABLE ONLY public.autor DROP CONSTRAINT autor_pkey;
       public            postgres    false    218            r           2606    17019    categoria categoria_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY ("categoriaID");
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    222            t           2606    17027    comentario comentario_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY ("comentarioID");
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT comentario_pkey;
       public            postgres    false    224            �           2606    17080 $   livro_atividade livro_atividade_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT livro_atividade_pkey PRIMARY KEY ("livro_atividadeID");
 N   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT livro_atividade_pkey;
       public            postgres    false    238            �           2606    17074 $   livro_categoria livro_categoria_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT livro_categoria_pkey PRIMARY KEY ("livro_categoriaID");
 N   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT livro_categoria_pkey;
       public            postgres    false    236            v           2606    17036    livro livro_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.livro
    ADD CONSTRAINT livro_pkey PRIMARY KEY ("livroID");
 :   ALTER TABLE ONLY public.livro DROP CONSTRAINT livro_pkey;
       public            postgres    false    226            x           2606    17044    log log_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY ("logID");
 6   ALTER TABLE ONLY public.log DROP CONSTRAINT log_pkey;
       public            postgres    false    228            z           2606    17050    rating rating_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY ("ratingID");
 <   ALTER TABLE ONLY public.rating DROP CONSTRAINT rating_pkey;
       public            postgres    false    230            ~           2606    17068 $   utilizadorLivro utilizadorLivro_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "utilizadorLivro_pkey" PRIMARY KEY ("utilizadorLivroID");
 R   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "utilizadorLivro_pkey";
       public            postgres    false    234            |           2606    17060    utilizador utilizador_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.utilizador
    ADD CONSTRAINT utilizador_pkey PRIMARY KEY ("utilizadorID");
 D   ALTER TABLE ONLY public.utilizador DROP CONSTRAINT utilizador_pkey;
       public            postgres    false    232            �           2606    17092 *   utilizador_voucher utilizador_voucher_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT utilizador_voucher_pkey PRIMARY KEY ("utilizador_voucherID");
 T   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT utilizador_voucher_pkey;
       public            postgres    false    242            �           2606    17086    voucher voucher_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_pkey PRIMARY KEY ("voucherID");
 >   ALTER TABLE ONLY public.voucher DROP CONSTRAINT voucher_pkey;
       public            postgres    false    240            �           2606    17106    autorLivro Autores    FK CONSTRAINT     ~   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT "Autores" FOREIGN KEY ("autorID") REFERENCES public.autor("autorID");
 @   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT "Autores";
       public          postgres    false    4718    218    220            �           2606    17126    rating Livro    FK CONSTRAINT     v   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Livro" FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 8   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Livro";
       public          postgres    false    226    230    4726            �           2606    17136    utilizadorLivro Livro    FK CONSTRAINT     }   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Livro" FOREIGN KEY (livro) REFERENCES public.livro("livroID");
 C   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Livro";
       public          postgres    false    4726    226    234            �           2606    17131    rating Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.rating
    ADD CONSTRAINT "Utilizador" FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 =   ALTER TABLE ONLY public.rating DROP CONSTRAINT "Utilizador";
       public          postgres    false    230    232    4732            �           2606    17141    utilizadorLivro Utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."utilizadorLivro"
    ADD CONSTRAINT "Utilizador" FOREIGN KEY (utilizador) REFERENCES public.utilizador("utilizadorID");
 H   ALTER TABLE ONLY public."utilizadorLivro" DROP CONSTRAINT "Utilizador";
       public          postgres    false    232    234    4732            �           2606    17161    livro_atividade atividade_livro    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT atividade_livro FOREIGN KEY ("atividadeID") REFERENCES public.atividades("atividadesID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT atividade_livro;
       public          postgres    false    238    4716    216            �           2606    17151    livro_categoria categoria_livro    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT categoria_livro FOREIGN KEY ("categoriaID") REFERENCES public.categoria("categoriaID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT categoria_livro;
       public          postgres    false    236    4722    222            �           2606    17116    comentario livro    FK CONSTRAINT     x   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT livro FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 :   ALTER TABLE ONLY public.comentario DROP CONSTRAINT livro;
       public          postgres    false    4726    226    224            �           2606    17156    livro_atividade livro_ativiadde    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_atividade
    ADD CONSTRAINT livro_ativiadde FOREIGN KEY ("livroID") REFERENCES public.livro("livroID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_atividade DROP CONSTRAINT livro_ativiadde;
       public          postgres    false    4726    226    238            �           2606    17146    livro_categoria livro_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.livro_categoria
    ADD CONSTRAINT livro_categoria FOREIGN KEY ("livroID") REFERENCES public.livro("livroID") NOT VALID;
 I   ALTER TABLE ONLY public.livro_categoria DROP CONSTRAINT livro_categoria;
       public          postgres    false    226    4726    236            �           2606    17111    autorLivro livros    FK CONSTRAINT     {   ALTER TABLE ONLY public."autorLivro"
    ADD CONSTRAINT livros FOREIGN KEY ("livroID") REFERENCES public.livro("livroID");
 =   ALTER TABLE ONLY public."autorLivro" DROP CONSTRAINT livros;
       public          postgres    false    220    4726    226            �           2606    17181    Compra plano_utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT plano_utilizador FOREIGN KEY ("planoID") REFERENCES public."Planos"("planosID") NOT VALID;
 C   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT plano_utilizador;
       public          postgres    false    4744    244    246            �           2606    17121    comentario utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT utilizador FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID");
 ?   ALTER TABLE ONLY public.comentario DROP CONSTRAINT utilizador;
       public          postgres    false    224    232    4732            �           2606    17176    Compra utilizador_plano    FK CONSTRAINT     �   ALTER TABLE ONLY public."Compra"
    ADD CONSTRAINT utilizador_plano FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID") NOT VALID;
 C   ALTER TABLE ONLY public."Compra" DROP CONSTRAINT utilizador_plano;
       public          postgres    false    4732    246    232            �           2606    17166 %   utilizador_voucher utilizador_voucher    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT utilizador_voucher FOREIGN KEY ("utilizadorID") REFERENCES public.utilizador("utilizadorID") NOT VALID;
 O   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT utilizador_voucher;
       public          postgres    false    4732    242    232            �           2606    17171 %   utilizador_voucher voucher_utilizador    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilizador_voucher
    ADD CONSTRAINT voucher_utilizador FOREIGN KEY ("voucherID") REFERENCES public.voucher("voucherID") NOT VALID;
 O   ALTER TABLE ONLY public.utilizador_voucher DROP CONSTRAINT voucher_utilizador;
       public          postgres    false    4740    242    240            I      x������ � �      G      x������ � �      +      x������ � �      -      x������ � �      /      x������ � �      1      x������ � �      3      x������ � �      5      x������ � �      A      x������ � �      ?      x������ � �      7      x������ � �      9      x������ � �      ;      x������ � �      =      x������ � �      E      x������ � �      C      x������ � �     